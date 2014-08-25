{
SynWrite text finder/replacer class
Original code was by EControl Ltd.
Modified heavily by Alexey (SynWrite)
Modified 2014-02-02 by Zvezdan Dimitrijevic to allow use of TPerlRegEx instead of TecRegExpr
}
unit unSearch;

interface

uses
  Classes, Types,
  Controls, Forms, StdCtrls,
//ZD start
  //{$UnDef PERLRE}
  // Define FWDMATCH for forward searches with single Match, it is faster but cannot be canceled until it finishes
  //{$define FWDMATCH}
{$ifdef PERLRE}
  PerlRegEx,
{$else}
  ecZRegExpr,
{$endif}
  ecSyntMemo, ecStrUtils;
//ZD end

type
  TSearchOption = (
    ftCaseSens,
    ftWholeWords,
    ftBackward,       //else Forward
    ftSelectedText,   //else All file
    ftEntireScope,    //else From caret
    ftRegex,          //use regular expressions
    ftRegex_s,        //regex: dot matches newline
    //ftRegex_m,        //regex: ^ and $ matches lines
    ftPromtOnReplace,
    ftWrapSearch,
    ftSkipCollapsed
    );
  TSearchOptions = set of TSearchOption;

  TSearchTokens = (
    tokensAll,
    tokensCmt,
    tokensStr,
    tokensCmtStr,
    tokensExceptCmtStr
    );

  TOnFindProgress = procedure(CurPos, MaxPos: Integer) of object;
  TOnFindEvent = procedure(Sender: TObject;
    StartPos, EndPos: integer;
    var Accept: Boolean) of object;
  TOnFindContinue = procedure(Sender: TObject; var ACanContinue: boolean) of object;

function IsRegexValid(const Str: string): boolean;

type
  TSynFinder = class(TComponent)
  private
    FFlags: TSearchOptions;
    FTokens: TSearchTokens;
    FFindText: WideString;
    FControl: TCustomSyntaxMemo;
  {$ifdef PERLRE} //ZD
    FRegExpr: TPerlRegEx; //ZD
  {$else} //ZD
    FRegExpr: TecRegExpr;
  {$endif} //ZD
    FOnFind: TOnFindEvent;
    FOnCanAccept: TOnFindEvent;
    FOnProgress: TOnFindProgress;
    FOnContinue: TOnFindContinue;
    FLastSearchPos: integer;
    procedure SetControl(Value: TCustomSyntaxMemo);
    function CanAccept(StrtPos, EndPos: integer): Boolean;
    function CanContinue: boolean;
  protected
    function MatchAtPos(const Text: WideString; var StrtPos, mLen: integer): Boolean; //ZD
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function Find(const Text: WideString; var StrtPos, EndPos: integer; ToBack: Boolean): Boolean;
    property OnFind: TOnFindEvent read FOnFind write FOnFind;
    property OnCanAccept: TOnFindEvent read FOnCanAccept write FOnCanAccept;
    property OnProgress: TOnFindProgress read FOnProgress write FOnProgress;
    property OnContinue: TOnFindContinue read FOnContinue write FOnContinue;
  published
    property FindText: WideString read FFindText write FFindText;
    property Flags: TSearchOptions read FFlags write FFlags;
    property Tokens: TSearchTokens read FTokens write FTokens;
    property Control: TCustomSyntaxMemo read FControl write SetControl;
  end;

  TSynFinderReplacer = class(TSynFinder)
  private
    FReplaceText: WideString;
    FSelectResult: Boolean;
    FOnNotFound: TNotifyEvent;
    FOnAfterExecute: TNotifyEvent;
    FOnBeforeExecute: TNotifyEvent;
    FMatches: integer;
    FMatchLen: integer;
    FSkipInit: boolean;
    FCfmAll: boolean;
    FCfmReset: boolean;
    procedure FixTextEOL;
    procedure DoBeforeExec;
    procedure DoAfterExec;
    procedure DoNotFound;
  protected
    procedure ShowRes(Pos, Count: integer; ToBack: Boolean);
    //DoSearch calls Search
    function Search(StrtPos, EndPos: integer; ToBack, ToAll, Replace, CntOnly: boolean): Boolean; virtual;
    function DoSearch(ToAll, ToBack, FromCur: Boolean; Replace: Boolean=False; CntOnly: Boolean=False): Boolean;
    function DoConfirmReplace(APos, ALen: integer; ToBack, ToAll: boolean): TModalResult;
    function StrReplaceWith: WideString;
    procedure CenterPos;
  public
    constructor Create(AOwner: TComponent); override;
    function FindFirst: Boolean;
    function FindAgain: Boolean;
    function FindNext: Boolean;
    function FindPrev: Boolean;
    function FindAll_(Cnt: boolean): boolean;
    function FindAll: Boolean;
    function CountAll: boolean;
    function ReplaceAll: Boolean;
    function ReplaceAgain: boolean;
    function IsSpecialCase1: boolean;
    function IsSpecialCase2: boolean;
  published
    property SelectResult: Boolean read FSelectResult write FSelectResult default False;
    property OnNotFound: TNotifyEvent read FOnNotFound write FOnNotFound;
    property OnAfterExecute: TNotifyEvent read FOnAfterExecute write FOnAfterExecute;
    property OnBeforeExecute: TNotifyEvent read FOnBeforeExecute write FOnBeforeExecute;
    property ReplaceText: WideString read FReplaceText write FReplaceText;
    property CfmReset: boolean read FCfmReset write FCfmReset;
    property Matches: integer read FMatches write FMatches;
    property MatchLen: integer read FMatchLen;
    property SkipInit: boolean read FSkipInit write FSkipInit;
  end;

implementation

uses
  Windows, SysUtils,
  Dialogs, //TntDialogs,
  DKLang,
  ATxFProc,
  ATxSProc,
  cStrings, //Fundamentals
  unProc,
  unProcEditor;

{ TSynFinder }

//ZD start
function TSynFinder.MatchAtPos(const Text: WideString; var StrtPos, mLen: integer): Boolean;
var
  nFlags, nLen: integer;
begin
  if Assigned(FOnProgress) then
    FOnProgress(StrtPos, Length(Text));

  if ftRegex in Flags then
  begin
  {$ifdef PERLRE}
    FRegExpr.Start := StrtPos;
    Result := FRegExpr.MatchAgain;
    if Result then begin
      StrtPos := FRegExpr.MatchedOffset;
      mLen:= FRegExpr.MatchedLength;
    end;
  {$else}
    mLen:= StrtPos;
    Result:= FRegExpr.Match(Text, mLen);
    if Result then
      mLen:= mLen - StrtPos;
  {$endif}
  end
  else
  begin
    nLen:= Length(FFindText);
//ZD end
    if ftCaseSens in Flags then
      nFlags:= 0
    else
      nFlags:= NORM_IGNORECASE;
    if StrtPos > Length(Text) then
    begin
      Result:= False;
      Exit;
    end;

    Result:= CompareStringW(LOCALE_SYSTEM_DEFAULT, nFlags,
              @Text[StrtPos], nLen,
              PWideChar(FFindText), nLen) = 2;
    if Result then mLen:= nLen;

    //check "Whole words" only for non-regex search
    if Result and (ftWholeWords in Flags) then
      Result:= ((StrtPos <= 1) or not IsWordChar(Text[StrtPos - 1]) or not IsWordChar(Text[StrtPos])) and
                ((StrtPos + nLen > Length(Text)) or not IsWordChar(Text[StrtPos + nLen]) or not IsWordChar(Text[StrtPos + nLen-1]));
  end;
end;


function TSynFinder.Find(const Text: WideString; var StrtPos, EndPos: integer; ToBack: Boolean): Boolean;
var
  i, S, L: integer; //ZD
begin
  Result:= false;
  L:= Length(Text);

  if L = 0 then
  begin
    StrtPos:= 1;
    EndPos:= 1;
  end
  else
  begin
    if (EndPos < 1) or (EndPos > L) then EndPos:= L;
    if StrtPos < 1 then StrtPos:= 1 else
     if StrtPos > L then StrtPos:= L;
  end;

  if ftRegex in Flags then
    begin
//ZD start
    {$ifdef PERLRE}
      case FControl.Lines.TextFormat of
      tfCR:
        FRegExpr.State := [preNewlineCR];
      tfNL:
        FRegExpr.State := [preNewlineLF];
      else
        FRegExpr.State := [preNewlineCRLF];
      end;
      FRegExpr.State := FRegExpr.State - [preNotEmpty];

      if (ftCaseSens in Flags) then
        FRegExpr.Options := FRegExpr.Options - [preCaseLess]
      else
        FRegExpr.Options := FRegExpr.Options + [preCaseLess];
      if (ftRegex_s in Flags) then
        FRegExpr.Options := FRegExpr.Options + [preSingleLine]
      else
        FRegExpr.Options := FRegExpr.Options - [preSingleLine];
      {if (ftRegex_m in Flags) then
        FRegExpr.Options := FRegExpr.Options + [preMultiLine]
      else
        FRegExpr.Options := FRegExpr.Options - [preMultiLine];}
    {$ifdef FWDMATCH}
      if not ToBack then
        FRegExpr.Options := FRegExpr.Options - [preAnchored]
      else
    {$endif FWDMATCH}
        FRegExpr.Options := FRegExpr.Options + [preAnchored];
      FRegExpr.RegEx := FFindText;
      FRegExpr.Subject := Text;
    {$else PERLRE}
      FRegExpr.Expression:= FFindText;
      FRegExpr.ModifierI:= not (ftCaseSens in Flags);
      //FRegExpr.ModifierM:= ftRegex_m in Flags; //not visible option in dialog
      FRegExpr.ModifierS:= ftRegex_s in Flags;
    {$endif PERLRE}
//ZD end
   end
   else
   begin
     L:= Length(FFindText);
     if EndPos - StrtPos + 1 < L then Exit;
     if L > 1 then
       Dec(EndPos, L - 1);
   end;

  if ToBack then
  begin
    for i:= EndPos downto StrtPos do
    begin
      if not CanContinue then
        Exit;
      if StopFind then
        Exit;
      S := i; //ZD
      if MatchAtPos(Text, S, L) and //ZD
         ((L > 0) or (i < EndPos) or (FLastSearchPos <> EndPos)) then
      begin
        Result:= true;
        StrtPos:= S; //ZD
        EndPos:= S + L; //ZD
        FLastSearchPos:= EndPos;
        Exit;
      end;
    end
  end
  else
//ZD start
{$ifdef PERLRE}
{$ifdef FWDMATCH}
  if ftRegex in Flags then begin
    FRegExpr.Stop := EndPos;
    if StrtPos = 1 then
      Result := FRegExpr.Match
    else begin
      FRegExpr.Start := StrtPos;
      Result := FRegExpr.MatchAgain;
    end;
    if Result then begin
      StrtPos := FRegExpr.MatchedOffset;
      EndPos:= StrtPos + FRegExpr.MatchedLength;
      FLastSearchPos:= StrtPos;
    end;
  end
  else
{$endif FWDMATCH}
{$endif PERLRE}
    for i:= StrtPos to EndPos do
    begin
      if not CanContinue then
        Exit;
      if StopFind then
        Exit;
    // Next PERLRE lines allow $ to match at the end of string.
    {$ifdef PERLRE}
    {$ifndef FWDMATCH}
      if (ftRegex in Flags) and (i = EndPos) then begin
        FRegExpr.Options := FRegExpr.Options - [preAnchored];
        FRegExpr.Stop := EndPos;
        if StrtPos = 1 then
          Result := FRegExpr.Match
        else begin
          FRegExpr.Start := EndPos;
          Result := FRegExpr.MatchAgain;
        end;
        if Result then begin
          StrtPos := FRegExpr.MatchedOffset;
          EndPos:= StrtPos + FRegExpr.MatchedLength;
          FLastSearchPos:= StrtPos;
        end;
      end else
    {$endif FWDMATCH}
    {$endif PERLRE}
    // End of PERLRE lines that allow $ to match at the end of string.
    // You could remove this block if you don't want such behavior.
      begin
        S := i;
        if MatchAtPos(Text, S, L) and
           ((L > 0) or (i > StrtPos) or (StrtPos <> FLastSearchPos)) then
        begin
          Result:= true;
          StrtPos:= S;
          EndPos:= S + L;
          FLastSearchPos:= StrtPos;
          Exit;
        end;
//ZD end
      end;
    end;
end;

procedure TSynFinder.SetControl(Value: TCustomSyntaxMemo);
begin
  if FControl <> Value then
    begin
      if Assigned(FControl) then
        FControl.RemoveClient(Self);
      FControl:= Value;
      if Assigned(FControl) then
        FControl.AddClient(Self);
    end;
end;

constructor TSynFinder.Create(AOwner: TComponent);
begin
  inherited;
//ZD start
{$ifdef PERLRE}
  FRegExpr := TPerlRegEx.Create;
  FRegExpr.State := [preNewlineCRLF];
  FRegExpr.Options := [preMultiLine];
  //FRegExpr.Options := FRegExpr.Options + [preExtended]; //to handle spaces in regex
  // I don't think this is a good idea to filter out spaces in regex by default.
  // If someone realy want to write comments inside of regex, one could add (?x) on its begin
  {$else}
  FRegExpr:= TecRegExpr.Create;
  FRegExpr.ModifierX:= False; //to handle spaces in regex
{$endif}
//ZD end
  FLastSearchPos:= -1;
  FTokens:= tokensAll;
end;

destructor TSynFinder.Destroy;
begin
  FreeAndNil(FRegExpr);
  inherited;
end;

procedure TSynFinder.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited;
  if (AComponent = FControl) and (Operation = opRemove) then
    FControl:= nil;
end;

function TSynFinder.CanAccept(StrtPos, EndPos: integer): Boolean;
begin
  Result:= True;

  if Assigned(FOnCanAccept) then
  begin
    FOnCanAccept(Self, StrtPos, EndPos, Result);
    if not Result then Exit;
  end;

  if Assigned(FOnFind) then
  begin
    FOnFind(Self, StrtPos, EndPos, Result);
    if not Result then Exit;
  end;  
end;

function TSynFinder.CanContinue: boolean;
begin
  Result:= true;
  if Assigned(FOnContinue) then
    FOnContinue(Self, Result);
end;

{TSyntFindReplace}

function TSynFinderReplacer.Search(StrtPos, EndPos: integer;
  ToBack, ToAll, Replace, CntOnly: boolean): Boolean;
var
  st, en, RepLen, ACfm: integer;
  s: WideString;
begin
  Result:= (FFindText <> '') and Assigned(FControl);
  if not Result then Exit;

  FixFPU; //to prevent "Floating point error"
  FixTextEOL; //adapt EOL chars in FindText/ReplaceText to Control

  FMatches:= 0;
  FMatchLen:= 0;
  if FCfmReset then
    FCfmAll:= false;

  if Replace then
    FControl.BeginUpdate;
  StopFind:= false;

 try
  repeat
     st:= StrtPos;
     en:= EndPos;

     {FControl.EndUpdate();
     showmessage(format('%d %d', [st, en]));
     FControl.BeginUpdate;}
     if (st > en) or
       not Find(FControl.Lines.FText, st, en, ToBack) then
       Break;

     RepLen:= en - st;
     if CanAccept(st, en) then
     begin
       Inc(FMatches);
       FMatchLen:= RepLen;
       if not Replace then
       //show find result
       begin
         if not CntOnly then
           ShowRes(st - 1, FMatchLen, ToBack)
       end
       else
       //show replace result
       begin
         ACfm:= DoConfirmReplace(st - 1, FMatchLen, ToBack, ToAll);
         case ACfm of
           mrOk,
           mrYes,
           mrYesToAll:
           begin
             S:= StrReplaceWith;
             FControl.ReplaceText(st - 1, FMatchLen, S);
             RepLen:= Length(S);
             Inc(EndPos, RepLen - FMatchLen); //text may become longer

             if not ToAll then
               ShowRes(st - 1, RepLen, ToBack);

             //workaround for replacing regex ".*?" with some string
             if (not ToBack) and (ftRegex in FFlags) then
               if (FMatchLen=0) then
                 Inc(RepLen);
           end;
           mrNo,
           mrCancel:
             RepLen:= 1;
           mrNoToAll:
             Break;
         end;//case
       end;
       if not ToAll and (FMatches > 0) then
         Break;
     end;

     if ToBack then
     begin
       if EndPos > st - 1 then EndPos:= st - 1  //at: -1
       else Dec(EndPos);
     end
     else
     begin
       StrtPos:= st + RepLen;

     {$ifndef PERLRE} //ZD
       //workaround for inf-looping on replacing regex '$':
       if IsSpecialCase1 then
         case FControl.Lines.TextFormat of
           tfCR_NL: Inc(StrtPos, 2);
           else Inc(StrtPos);
         end
       else
       //workaround for replacing regex "^www" with empty sting:
       if IsSpecialCase2 then
         Inc(StrtPos);
     {$endif} //ZD
     end;
  until False;

  Result:= FMatches > 0;
 finally
  if Replace then FControl.EndUpdate;
  if Result then FControl.Invalidate;
 end; 
end;

function TSynFinderReplacer.DoSearch(
  ToAll, ToBack, FromCur: Boolean;
  Replace: Boolean = False;
  CntOnly: boolean = false): Boolean;
var
  StrtPos, EndPos,
  StrtPos2, EndPos2: integer;
  IsSel, IsSelColumn, IsWrap, AddLock, UseFundamentals: boolean;
  CntPrev, i: integer;
  ASelRect: TRect;
  S: Widestring;
begin
  Result:= False;
  FMatches:= 0;
  DoBeforeExec;

  if FFindText = '' then Exit;
  FSelectResult:= not ToAll;

  IsSel:= (ftSelectedText in Flags);
  IsSelColumn:= IsSel and (FControl.SelectMode=msColumn);
  FromCur:= FromCur and not IsSel;
  IsWrap:= (ftWrapSearch in Flags) and FromCur;

  if IsSelColumn then
    ASelRect:= FControl.SelRect
  else
    ASelRect:= Rect(0, 0, 0, 0);

  UseFundamentals:=
    ToAll and
    Replace and
    not CntOnly and
    not ToBack and
    not IsSel and
    not (ftRegex in Flags) and
    not (ftPromtOnReplace in Flags) and
    not IsWrap;

  //AddLock is workaround for issue:
  //wrapped replace causes need of 2 undos (for both searches)
  AddLock:= Replace and ToAll and (IsWrap or IsSelColumn) and not (ftPromtOnReplace in Flags);

  StrtPos2:= 0;
  EndPos2:= 0;

  if IsSel and (FControl.SelLength > 0) then
  begin
    StrtPos:= FControl.SelStart + 1;
    EndPos:= FControl.SelStart + FControl.SelLength;
  end
  else
  begin
    StrtPos:= 1;
    EndPos:= FControl.Lines.TextLength;
  end;

  if FromCur then
    if ToBack then
    begin
      EndPos:= FControl.CaretStrPos;
      StrtPos2:= EndPos + 1;
      EndPos2:= FControl.Lines.TextLength;
    end
    else
    begin
      StrtPos:= FControl.CaretStrPos + 1;
      StrtPos2:= 1;
      EndPos2:= StrtPos - 1;
    end;

  if UseFundamentals then
  begin
    cStrings.FundFinder:= Self; //set Fundamentals callback
    S:= cStrings.StrReplaceW(FFindText, FReplaceText, FControl.Text,
      ftCaseSens in Flags,
      ftWholeWords in Flags,
      StrtPos,
      FMatches);
    Result:= FMatches > 0;
    if Result then
      FControl.ReplaceText(0, FControl.TextLength, S);
    Exit
  end;

  if IsSel and not CntOnly then
    FControl.ResetSelection;

  //additional BeginUpdate needed for column blocks  
  if AddLock then
    FControl.BeginUpdate;

  try
    if IsSelColumn then
    begin
      //A) special search/replace for column blocks:
      //do replace for each line of SelRect.
      CntPrev:= 0;
      //ops, DRY principle
      if not ToBack then
        for i:= ASelRect.Top to ASelRect.Bottom do
        begin
          StrtPos:= FControl.CaretPosToStrPos(FControl.LogToLinesPos(Point(ASelRect.Left, i))) + 1;
          EndPos:= FControl.CaretPosToStrPos(FControl.LogToLinesPos(Point(ASelRect.Right, i)));
          ////Msg('"'+Copy(FControl.Text, StrtPos, EndPos-StrtPos+1)+'"');//////////
          Search(StrtPos, EndPos, ToBack, ToAll, Replace, CntOnly);
          Inc(CntPrev, FMatches);
          if (FMatches>0) and not ToAll then Break;
        end
      else
        for i:= ASelRect.Bottom downto ASelRect.Top do
        begin
          StrtPos:= FControl.CaretPosToStrPos(FControl.LogToLinesPos(Point(ASelRect.Left, i))) + 1;
          EndPos:= FControl.CaretPosToStrPos(FControl.LogToLinesPos(Point(ASelRect.Right, i)));
          Search(StrtPos, EndPos, ToBack, ToAll, Replace, CntOnly);
          Inc(CntPrev, FMatches);
          if (FMatches>0) and not ToAll then Break;
        end;
      FMatches:= CntPrev;
      Result:= FMatches>0;
    end
    else
    begin
      //B) normal search or replace (in selection or not)
      Result:= Search(StrtPos, EndPos, ToBack, ToAll, Replace, CntOnly);
      CntPrev:= FMatches;
      //wrap search if needed
      if IsWrap and
        ((not Result) or ToAll) and
        (StrtPos2 > 0) and
        (EndPos2 >= StrtPos2) then
      begin
        Search(StrtPos2, EndPos2, ToBack, ToAll, Replace, CntOnly);
        Inc(FMatches, CntPrev);
        Result:= FMatches>0;
      end;
    end;  
  finally
    if AddLock then
      FControl.EndUpdate;
  end;    

  if not Result then
    DoNotFound;
  DoAfterExec;
end;

procedure TSynFinderReplacer.ShowRes(Pos, Count: integer; ToBack: Boolean);
var
  NPos: Integer;
  P: TPoint;
begin
  with FControl do
    if FSelectResult then
    begin
      if ToBack then
        NPos:= Pos
      else
        NPos:= Pos + Count;
      P:= StrPosToCaretPos(NPos);
      
      EditorUncollapseLine(FControl, P.Y);
      CaretPos:= P;

      SelectMode:= msNone;
      SetSelection(Pos, Count);

      CenterPos;
      Exclude(FFlags, ftSelectedText);
      //if not Focused then SetFocus;
    end
    else
      SetSearchMark(Pos, Count, true);
end;

procedure TSynFinderReplacer.DoBeforeExec;
begin
  if Assigned(FOnBeforeExecute) then
    FOnBeforeExecute(Self);
end;

procedure TSynFinderReplacer.DoAfterExec;
begin
  if Assigned(FOnAfterExecute) then
    FOnAfterExecute(Self);
end;

procedure TSynFinderReplacer.DoNotFound;
begin
  if Assigned(FOnNotFound) then
    FOnNotFound(Self);
end;

function TSynFinderReplacer.FindAgain: Boolean;
var
  st, len: integer;
begin
  DoBeforeExec;
  Assert(Assigned(FControl));
  st:= FControl.SelStart;
  len:= FControl.SelLength;
  Result:= DoSearch(False, ftBackward in Flags, not (ftEntireScope in Flags));
  if Result and (len>0) and (FControl.SelStart=st) and (FControl.SelLength=len) then
    Result:= DoSearch(False, ftBackward in Flags, not (ftEntireScope in Flags));
end;

function TSynFinderReplacer.FindNext: Boolean;
var
  st, len: integer;
begin
  DoBeforeExec;
  Assert(Assigned(FControl));
  st:= FControl.SelStart;
  len:= FControl.SelLength;
  Result:= DoSearch(False, False, True);
  if Result and (len>0) and (FControl.SelStart=st) and (FControl.SelLength=len) then
    Result:= DoSearch(False, False, True); //skip the string found by FindPrev
end;

function TSynFinderReplacer.FindPrev: Boolean;
var
  st, len: integer;
begin
  DoBeforeExec;
  Assert(Assigned(FControl));
  st:= FControl.SelStart;
  len:= FControl.SelLength;
  Result:= DoSearch(False, True, True);
  if Result and (len>0) and (FControl.SelStart=st) and (FControl.SelLength=len) then
    Result:= DoSearch(False, True, True);
end;

function TSynFinderReplacer.FindFirst: Boolean;
begin
  DoBeforeExec;
  Assert(Assigned(FControl));
  Result:= DoSearch(False, False, False);
end;


function TSynFinderReplacer.FindAll_(Cnt: boolean): Boolean;
begin
  Result:= DoSearch(True, False, not (ftEntireScope in Flags), False, Cnt);
end;

function TSynFinderReplacer.FindAll: Boolean;
begin
  Result:= FindAll_(False);
end;

function TSynFinderReplacer.CountAll: Boolean;
begin
  Result:= FindAll_(True);
end;

function TSynFinderReplacer.ReplaceAll: Boolean;
begin
  Result:= DoSearch(True, ftBackward in Flags, not (ftEntireScope in Flags), True);
end;

function TSynFinderReplacer.ReplaceAgain: Boolean;
begin
  Result:= DoSearch(False, ftBackward in Flags, not (ftEntireScope in Flags), True);
end;

function TSynFinderReplacer.StrReplaceWith: WideString;
begin
  if (ftRegex in FFlags) then
//ZD start
  {$ifdef PERLRE}
    begin
      FRegExpr.Replacement := FReplaceText;
      Result := FRegExpr.ComputeReplacement;
    end
  {$else}
    Result:= FRegExpr.Substitute(FControl.Lines.FText, FReplaceText)
  {$endIf}
//ZD end
  else
    Result:= FReplaceText;
end;

function TSynFinderReplacer.DoConfirmReplace(APos, ALen: integer; ToBack, ToAll: boolean): TModalResult;
begin
  if not (ftPromtOnReplace in FFlags) then
    begin Result:= mrYesToAll; Exit end;
  if FCfmAll then
    begin Result:= mrYesToAll; Exit end;
  with FControl do
  begin
    EndUpdate; //unlock to show replace position with dialog
    try
      if ToBack then
        CaretPos:= StrPosToCaretPos(APos)
      else
        CaretPos:= StrPosToCaretPos(APos + ALen);
      CenterPos;

      SetSearchMark(APos, ALen); //show for dialog
      Result:= MsgConfirmOkCancelForAll(
        DKLangConstW('MRepMatch'),
        '',
        DKLangConstW('MRepAllNext'),
        ToAll,
        Handle);
    finally
      ResetSearchMarks;
      BeginUpdate; //lock again to speedup
    end;
  end;
  FCfmAll:= Result = mrYesToAll;
end;

procedure TSynFinderReplacer.CenterPos;
begin
  EditorCenterPos(FControl, false{GotoMode}, opSrOffsetY);
end;

constructor TSynFinderReplacer.Create(AOwner: TComponent);
begin
  inherited;
  FCfmReset:= true;
  FCfmAll:= false;
end;

function SFixEOL(const S: Widestring; Ed: TCustomSyntaxMemo): Widestring;
const
  cc: Widestring = #1;
begin
  Result:= S;
  if (Pos(#13, S)=0) and (Pos(#10, S)=0) then Exit;

  SReplaceAllEols(Result, cc);
  SReplaceAllW(Result, cc, EditorEol(Ed));
end;

procedure TSynFinderReplacer.FixTextEOL;
begin
  if Assigned(FControl) then
  begin
    if FFindText<>'' then
      FFindText:= SFixEOL(FFindText, FControl);
    if FReplaceText<>'' then
      FReplaceText:= SFixEOL(FReplaceText, FControl);
  end;
end;

function TSynFinderReplacer.IsSpecialCase1: boolean;
begin
  Result:=
    (ftRegex in FFlags) and
    (FFindText<>'') and
    (FFindText[Length(FFindText)] = '$');
end;

function TSynFinderReplacer.IsSpecialCase2: boolean;
begin
  Result:=
    (ftRegex in FFlags) and
    (FFindText<>'') and
    (FFindText[1] = '^') and
    (FReplaceText = '');
end;

{$ifdef PERLRE}
function IsRegexValid(const Str: string): boolean;
var
  Re: TPerlRegEx;
begin
  Re:= TPerlRegEx.Create;
  try
    Re.RegEx:= Str;
    Re.Compile;
    Result:= true;
  except
    Result:= false;
  end;
end;
{$else}
function IsRegexValid(const Str: string): boolean;
begin
  Result:= true;
end;
{$endif}

end.

