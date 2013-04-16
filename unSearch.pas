{///////////////////////////////////////////////////////////////////////////////
  Text Finder class
  Original code was by: EControl Ltd., Zaharov Michael
  Modified by: Alexey T.
///////////////////////////////////////////////////////////////////////////////}
{$I ecSyntEdit.INC}
unit unSearch;

interface

uses
  Classes, Types,
  Controls, Forms, StdCtrls,
  ecZRegExpr, ecSyntMemo, ecStrUtils;

type
  TSearchOption = (
    ftCaseSensitive,
    ftWholeWordOnly,
    ftBackward,       //else Forward
    ftSelectedText,   //else All file
    ftEntireScope,    //else From cursor
    ftRegularExpr,    //use regular expressions
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

  TTextFinder = class(TComponent)
  private
    FFlags: TSearchOptions;
    FTokens: TSearchTokens;
    FFindText: WideString;
    FControl: TCustomSyntaxMemo;
    FRegExpr: TecRegExpr;
    FOnFind: TOnFindEvent;
    FOnCanAccept: TOnFindEvent;
    FOnProgress: TOnFindProgress;
    FOnContinue: TOnFindContinue;
    FLastSearchPos: integer;
    procedure SetControl(Value: TCustomSyntaxMemo);
    function CanAccept(StrtPos, EndPos: integer): Boolean;
    function CanContinue: boolean;
  protected
    function MatchAtPos(const Text: WideString; StrtPos: integer; var mLen: integer): Boolean;
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

  TSynFindReplace = class(TTextFinder)
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
    function RepCfm(APos, ALen: integer; ToBack, ToAll: boolean): TModalResult;
    function SRepl: WideString;
    procedure CenterPos;
  public
    constructor Create(AOwner: TComponent); override;
    function FindAgain: Boolean;
    function FindNext: Boolean;
    function FindPrev: Boolean;
    function FindAll_(Cnt: boolean): boolean;
    function FindAll: Boolean;
    function CountAll: boolean;
    function ReplaceAll: Boolean;
    function ReplaceAgain: boolean;
    function IsEOLReplaced: boolean;
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
  Dialogs, TntDialogs,
  DKLang,
  ATxFProc,
  ATxSProc,
  cStrings, //Fundamentals
  unProc;

{ TTextFinder }

function TTextFinder.MatchAtPos(const Text: WideString; StrtPos: integer; var mLen: integer): Boolean;
var cmp_fl, L2: integer;
begin
  if Assigned(FOnProgress) then
    FOnProgress(StrtPos, Length(Text));

  L2:= Length(FFindText);
  if ftRegularExpr in Flags then
  begin
    mLen:= StrtPos;
    Result:= FRegExpr.Match(Text, mLen);
    if Result then
      mLen:= mLen - StrtPos;
  end
  else
  begin
    if ftCaseSensitive in Flags then cmp_fl:= 0
                                else cmp_fl:= NORM_IGNORECASE;
    if StrtPos > Length(Text) then
    begin
      Result:= False;
      Exit;
    end;

    Result:= CompareStringW(LOCALE_SYSTEM_DEFAULT, cmp_fl,
              @Text[StrtPos], L2,
              PWideChar(FFindText), L2) = 2;
    if Result then mLen:= L2;
  end;

  if Result and (ftWholeWordOnly in Flags) then
    Result:= ((StrtPos <= 1) or not IsWordChar(Text[StrtPos - 1]) or not IsWordChar(Text[StrtPos])) and
              ((StrtPos + L2 > Length(Text)) or not IsWordChar(Text[StrtPos + L2]) or not IsWordChar(Text[StrtPos + L2-1]));
end;


function TTextFinder.Find(const Text: WideString; var StrtPos, EndPos: integer; ToBack: Boolean): Boolean;
var
  i, L: integer;
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

  if ftRegularExpr in Flags then
   begin
     FRegExpr.Expression:= FFindText;
     FRegExpr.ModifierI:= not (ftCaseSensitive in Flags);
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
      if MatchAtPos(Text, i, L) and
         ((L > 0) or (i < EndPos) or (FLastSearchPos <> EndPos)) then
      begin
        Result:= true;
        StrtPos:= i;
        EndPos:= i + L;
        FLastSearchPos:= EndPos;
        Exit;
      end;
    end
  end
  else
    for i:= StrtPos to EndPos do
    begin
      if not CanContinue then
        Exit;
      if StopFind then
        Exit;
      if MatchAtPos(Text, i, L) and
         ((L > 0) or (i > StrtPos) or (StrtPos <> FLastSearchPos)) then
      begin
        Result:= true;
        StrtPos:= i;
        EndPos:= i + L;
        FLastSearchPos:= StrtPos;
        Exit;
      end;
    end;
end;

procedure TTextFinder.SetControl(Value: TCustomSyntaxMemo);
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

constructor TTextFinder.Create(AOwner: TComponent);
begin
  inherited;
  FRegExpr:= TecRegExpr.Create;
  FRegExpr.ModifierX:= False; //to handle spaces in regex
  FLastSearchPos:= -1;
  FTokens:= tokensAll;
end;

destructor TTextFinder.Destroy;
begin
  FreeAndNil(FRegExpr);
  inherited;
end;

procedure TTextFinder.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited;
  if (AComponent = FControl) and (Operation = opRemove) then
    FControl:= nil;
end;

function TTextFinder.CanAccept(StrtPos, EndPos: integer): Boolean;
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

function TTextFinder.CanContinue: boolean;
begin
  Result:= true;
  if Assigned(FOnContinue) then
    FOnContinue(Self, Result);
end;

{TSyntFindReplace}

function TSynFindReplace.Search(StrtPos, EndPos: integer;
  ToBack, ToAll, Replace, CntOnly: boolean): Boolean;
var
  st, en, N, RepLen, ACfm: integer;
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

  repeat
     st:= StrtPos;
     en:= EndPos;

     {FControl.EndUpdate();
     showmessage(format('%d %d', [st, en]));
     FControl.BeginUpdate;}
     if (st > en) or
       not Find(FControl.Lines.FText, st, en, ToBack) then
       Break;

     N:= en - st;
     RepLen:= N;
     if CanAccept(st, en) then
     begin
       Inc(FMatches);
       FMatchLen:= N;
       if not Replace then
       begin
         //show find result
         if not CntOnly then
           ShowRes(st - 1, N, ToBack)
       end
       else
       //show replace result
       begin
         ACfm:= RepCfm(st - 1, N, ToBack, ToAll);
         case ACfm of
           mrYes, mrAll:
           begin
             S:= SRepl;
             FControl.ReplaceText(st - 1, N, S);
             RepLen:= Length(S);
             Inc(EndPos, RepLen - N); //text may become longer
             if not ToAll then
               ShowRes(st - 1, RepLen, ToBack);
           end;
           mrNo:
             RepLen:= 1;
           mrCancel:
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
       //Workaround for hang on replacing regex '$':
       if (ftRegularExpr in FFlags) and IsEOLReplaced then
         case FControl.Lines.TextFormat of
           tfCR_NL: Inc(StrtPos, 2);
           else Inc(StrtPos);
         end;
     end;
  until False;

  Result:= FMatches > 0;
  if Replace then FControl.EndUpdate;
  if Result then FControl.Invalidate;
end;

function TSynFindReplace.DoSearch(
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
    not (ftRegularExpr in Flags) and
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
      ftCaseSensitive in Flags,
      ftWholeWordOnly in Flags,
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

procedure TSynFindReplace.ShowRes(Pos, Count: integer; ToBack: Boolean);
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

procedure TSynFindReplace.DoBeforeExec;
begin
  if Assigned(FOnBeforeExecute) then
    FOnBeforeExecute(Self);
end;

procedure TSynFindReplace.DoAfterExec;
begin
  if Assigned(FOnAfterExecute) then
    FOnAfterExecute(Self);
end;

procedure TSynFindReplace.DoNotFound;
begin
  if Assigned(FOnNotFound) then
    FOnNotFound(Self);
end;

function TSynFindReplace.FindAgain: Boolean;
var st, len: integer;
begin
  DoBeforeExec;
  Assert(Assigned(FControl));
  st:= FControl.SelStart;
  len:= FControl.SelLength;
  Result:= DoSearch(False, ftBackward in Flags, not (ftEntireScope in Flags));
  if Result and (len>0) and (FControl.SelStart=st) and (FControl.SelLength=len) then
    Result:= DoSearch(False, ftBackward in Flags, not (ftEntireScope in Flags));
end;

function TSynFindReplace.FindNext: Boolean;
var st, len: integer;
begin
  DoBeforeExec;
  Assert(Assigned(FControl));
  st:= FControl.SelStart;
  len:= FControl.SelLength;
  Result:= DoSearch(False, False, True);
  if Result and (len>0) and (FControl.SelStart=st) and (FControl.SelLength=len) then
    Result:= DoSearch(False, False, True); //skip the string found by FindPrev
end;

function TSynFindReplace.FindPrev: Boolean;
var st, len: integer;
begin
  DoBeforeExec;
  Assert(Assigned(FControl));
  st:= FControl.SelStart;
  len:= FControl.SelLength;
  Result:= DoSearch(False, True, True);
  if Result and (len>0) and (FControl.SelStart=st) and (FControl.SelLength=len) then
    Result:= DoSearch(False, True, True);
end;

function TSynFindReplace.FindAll_(Cnt: boolean): Boolean;
begin
  Result:= DoSearch(True, False, not (ftEntireScope in Flags), False, Cnt);
end;

function TSynFindReplace.FindAll: Boolean;
begin
  Result:= FindAll_(False);
end;

function TSynFindReplace.CountAll: Boolean;
begin
  Result:= FindAll_(True);
end;

function TSynFindReplace.ReplaceAll: Boolean;
begin
  Result:= DoSearch(True, ftBackward in Flags, not (ftEntireScope in Flags), True);
end;

function TSynFindReplace.ReplaceAgain: Boolean;
begin
  Result:= DoSearch(False, ftBackward in Flags, not (ftEntireScope in Flags), True);
end;

function TSynFindReplace.SRepl: WideString;
begin
  if (ftRegularExpr in FFlags) then
    Result:= FRegExpr.Substitute(FControl.Lines.FText, FReplaceText)
  else
    Result:= FReplaceText;
end;

function TSynFindReplace.RepCfm;
var b: TMsgDlgButtons;
begin
  if not (ftPromtOnReplace in FFlags) then
    begin Result:= mrAll; Exit end;
  if FCfmAll then
    begin Result:= mrAll; Exit end;
  with FControl do
  begin
    EndUpdate;
    if ToBack then
      CaretPos:= StrPosToCaretPos(APos)
    else
      CaretPos:= StrPosToCaretPos(APos + ALen);
    CenterPos;

    b:= [mbYes, mbNo];
    if ToAll then b:= b+ [mbCancel, mbAll];

    SetSearchMark(APos, ALen);
    Result:= WideMessageDlg(DKLangConstW('Re'), mtConfirmation, b, -1);
    ResetSearchMarks;
    BeginUpdate;
  end;
  FCfmAll:= Result = mrAll;
end;

procedure TSynFindReplace.CenterPos;
begin
  CenterMemoPos(FControl, false{GotoMode});
end;

constructor TSynFindReplace.Create(AOwner: TComponent);
begin
  inherited;
  FCfmReset:= true;
  FCfmAll:= false;
end;

function TSynFindReplace.IsEOLReplaced: boolean;
begin
  Result:=
    (ftRegularExpr in FFlags) and
    (FFindText<>'') and
    (FFindText[Length(FFindText)] = '$');
end;

function SFixEOL(const S: Widestring; Ed: TCustomSyntaxMemo): Widestring;
const
  cc: Widestring = #1;
var
  SEnd: Widestring;
begin
  Result:= S;
  if (Pos(#13, S)=0) and (Pos(#10, S)=0) then Exit;

  SReplaceAllW(Result, #13#10, cc);
  SReplaceAllW(Result, #13, cc);
  SReplaceAllW(Result, #10, cc);

  case Ed.Lines.TextFormat of
    tfCR: SEnd:= #13;
    tfNL: SEnd:= #10;
    else SEnd:= #13#10;
  end;
  SReplaceAllW(Result, cc, SEnd);
end;

procedure TSynFindReplace.FixTextEOL;
begin
  if Assigned(FControl) then
  begin
    if FFindText<>'' then
      FFindText:= SFixEOL(FFindText, FControl);
    if FReplaceText<>'' then
      FReplaceText:= SFixEOL(FReplaceText, FControl);
  end;  
end;


end.

