{$define GotoWork} //work-around for Goto command
{
Multi-carets and multi-selections for EControl Syntax Editor SDK
(c) A. Torgashin, www.uvviewsoft.com

How to use unit:
add this unit to "uses" of your form, in "interface" part, after ecSyntMemo item.
This will replace ecSyntMemo.TSyntaxMemo with this TSyntaxMemo
(it's descendant of usual TSyntaxMemo).

Usage in app:
- Ctrl+click to add multi-caret w/o selection
- Ctrl+drag to add multi-caret with selection
- click then Ctrl+Shift+click to set multi-carets aligned in column
- Ctrl+click a caret to remove it

Additional properties:
- CaretsEnabled
- CaretsCount
- CaretsGutterBand
- CaretsGutterColor
- CaretsColorIndicator
Additional methods:
- AddCaret
- GetCaret
- GetCaretSel
- SetCaret
- SetCaretSel
- RemoveCarets
Additional ExecCommand commands:
  smCaretsRemoveLeaveFirst    
  smCaretsRemoveLeaveLast
  smCaretsFromSelLeft
  smCaretsFromSelRight
  smCaretsFromSelClear
  smCaretsFromMarksLeft
  smCaretsFromMarksRight
  smCaretsFromMarksClear
  smCaretsUpLine
  smCaretsDownLine
  smCaretsUpPage
  smCaretsDownPage
  smCaretsUpToEnd
  smCaretsDownToEnd

Note:
event handler OnBeforeLineDraw is set by this class, I didn't need it in app,
it's OK for me.
}

unit ATSyntMemo;

interface

uses
  Classes, Types, Graphics,
  Controls, ExtCtrls,
  TntClasses,
  ecSyntMemo;

//global options for all editors
var
  opSeparateCopiedLines: boolean = false;
  opShowCurrentColumn: boolean = false;

type
  TCaretsColorIndicator = (cciNone, cciLineBg, cciGutterBg);
  TCaretsColumnSelectionType = (ccsSelEmpty, ccsSelToLeft, ccsSelToRight);
  TIntRec2 = record N1, N2: Integer end;

type
  TOnCtrlClick = procedure(Sender: TObject; const Pnt: TPoint; var Handled: boolean) of object;

type
  TSyntaxMemo = class(ecSyntMemo.TSyntaxMemo)
  private
    FCaretsEnabled: boolean;
    FCaretsSelEnabled: boolean;
    FCaretsColorIndicator: TCaretsColorIndicator;
    FCaretsTimer: TTimer;
    FCarets: TList;
    FCaretsCoord: TList;
    FCaretsSel: TList;
    FCaretsGutterBand: Integer;
    FCaretsGutterColor: TColor;
    FTextExt: TSize;
    FPrevReplaceMode: boolean;
    FPrevDrawFocus,
    FPrevDrawLine: boolean;
    FPrevSaved: boolean;
    FListDups: TList;
    FListUndo: TList;
    FListOffsets: TList;
    FListClip: TTntStringList;
    FStaticDraw: boolean;
    FOnCtrlClick: TOnCtrlClick;
    FMouseDownPoint: TPoint;
    FMouseDownCaret: Integer;
    FMouseDblTick: DWORD;
    FMouseDblPoint: TPoint;

    procedure EditorZoom(Sender: TObject);
    procedure SetStaticDraw;
    procedure SetBlinkingDraw;
    procedure SetCaretsEnabled(Val: boolean);
    procedure DoUpdateCaretPos(N: Integer);
    procedure DoUpdateLastCaret;
    procedure CaretTimerTimer(Sender: TObject);
    procedure DoUpdateCarets;
    procedure DoUpdateCaretsSelections;
    procedure EdGetGutterBandColor(Sender: TObject;
      NBand, NLine: Integer; var NColor: TColor);
    function IsDuplicateCaret(Cmd, NCaret: Integer): boolean;
    function IsCaretOnLine(NLine: Integer): boolean;
    function IsCaretAt(const P: TPoint): boolean;
    procedure DoCaretsCommand(Cmd: Integer; Data: Pointer);
    procedure DoRemoveDupCarets;
    procedure DoRemoveCaretIndex(N: Integer);
    function DoRemoveCaret(const P: TPoint): boolean;
    function SEol(SoftBreak: boolean): Widestring;
    function GetIndent(StartLine: integer; LessThan: integer): integer;
    function GetSmartPos(x, Line: integer): integer;
    procedure DoShiftCarets(const PFrom: TPoint; NShiftX, NShiftY: Integer);
    procedure DoKeepCaretInText(var P: TPoint);
    procedure DoSortCarets;
    procedure DoCalculateDupCarets(L: TList);
    procedure SetCaret(N: Integer; const P: TPoint);
    function GetCaretCoord(N: Integer): TPoint;
    procedure SetCaretCoord(N: Integer; const P: TPoint);
    procedure SetCaretSel(N, Value: Integer);
    procedure GetDrawCoord(var ACaretSize: TSize; var AClientRect: TRect);
    procedure DoDrawCarets;
    procedure DoSaveBaseEditor;
    procedure DoInitBaseEditor;
    procedure DoRestoreBaseEditor;
    procedure EdBeforeLineDraw(Sender: TObject; Rect: TRect; Line: Integer);
    procedure DoRemoveCaretsUndo(N: Integer);
    procedure DoClearCaretsUndo;
    procedure DoAddCaretsUndo;
    procedure DoCaretsUndo;
    procedure DoCaretsFromSel(ALeftSide, AClearSel: boolean);
    procedure DoCaretsFromMarks(ALeftSide, AClear: boolean);
    procedure DoCaretsExtend(ToUp: boolean; NLines: Integer);
    procedure DoAddCaretInt(P: TPoint; NSelCount: Integer = 0);
    function IsCtrlClickHandled(const P: TPoint): boolean;
    function CanSetCarets: boolean;
    function GetColMarkersString: string;
    procedure SetColMarkersString(const S: string);
    procedure DoCalculateOffsets;
    procedure DoCalculateSelections(AMoveDown: boolean);
    function DoCalculateSelectionText(i: Integer): Widestring;
    procedure DoResetSelections;
    function IsSelectionExist: boolean;
    function IsSelectionOverlap(Index1, Index2: Integer; var MergedRange: TIntRec2): boolean;
    function GetCaretSelRange(Index: Integer): TIntRec2;
    function GetSelCountForUsualCaret: Integer;
  protected
    procedure DoScroll; override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure Paint; override;
  public
    MarkersLen: TList; //length of ins-points, which are marked with Markers
    ColMarkers: array[0..14] of integer;
    BracketsHilited: boolean;
    UserTag: Widestring;
    function IsTabstopMode: boolean;
    procedure DoJumpToNextTabstop;
    property ColMarkersString: string read GetColMarkersString write SetColMarkersString;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure AddCaret(const P: TPoint; ASelCount: Integer = 0; AddDefaultPos: boolean = true);
    procedure AddCaretsColumn(const PntFrom, PntTo: TPoint; ASelType: TCaretsColumnSelectionType);
    function GetCaret(N: Integer): TPoint;
    function GetCaretSel(N: Integer): Integer;
    procedure RemoveCarets(LeaveFirst: boolean = true);
    function CaretsCount: Integer;
    procedure CaretsProps(var NTop, NBottom: integer);
    property CaretsEnabled: boolean read FCaretsEnabled write SetCaretsEnabled;
    property CaretsSelEnabled: boolean read FCaretsSelEnabled write FCaretsSelEnabled;
    property CaretsColorIndicator: TCaretsColorIndicator read FCaretsColorIndicator write FCaretsColorIndicator;
    property CaretsGutterBand: Integer read FCaretsGutterBand write FCaretsGutterBand;
    property CaretsGutterColor: TColor read FCaretsGutterColor write FCaretsGutterColor;
    procedure ExecCommand(Command: integer; Data: Pointer = nil); override;
    procedure DoShowInfo;
    procedure DoUpdateMargins;
    property OnCtrlClick: TOnCtrlClick read FOnCtrlClick write FOnCtrlClick;
  end;

const
  smCaretsRemoveLeaveFirst    = 2000;
  smCaretsRemoveLeaveLast     = 2001;

  smCaretsFromSelLeft         = 2002;
  smCaretsFromSelRight        = 2003;
  smCaretsFromSelClear        = 2004;

  smCaretsFromMarksLeft       = 2005;
  smCaretsFromMarksRight      = 2006;
  smCaretsFromMarksClear      = 2007;

  smCaretsUpLine              = 2008;
  smCaretsDownLine            = 2009;
  smCaretsUpPage              = 2010;
  smCaretsDownPage            = 2011;
  smCaretsUpToEnd             = 2012;
  smCaretsDownToEnd           = 2013;

implementation

uses
  Windows, SysUtils, StrUtils,
  Forms, Dialogs,
  Math,
  TntClipbrd,
  ecEmbObj,
  ecStrUtils,
  ecCmdConst, ecLists;

function IsCommandMoveSelections(N: Integer): boolean;
begin
  Result:= (N>smSelection) and (N<smSelection+100);
end;

function IsCommandMoveSelectionsDown(N: Integer): boolean;
begin
  Result:=
    (N=smSelRight) or (N=smSelDown) or (N=smSelWordRight) or
    (N=smSelLineEnd) or (N=smSelPageDown) or (N=smSelPageRight) or
    (N=smSelPageBottom) or (N=smSelEditorBottom) or (N=smSelLastLetter);
end;

function IsCommandHandleSelections(N: Integer): boolean;
begin
  Result:=
    (N=smCopy) or (N=smCut) or (N=smPaste) or (N=smDeleteChar) or
    (N=smChar) or (N=smString);
end;

//SGetItem is also present in ATxSProc, but it's nice not to use ATxSProc,
//to distribute unit
function SGetItem(var S: string; const Sep: Char = ','): string;
var
  i: integer;
begin
  i:= Pos(Sep, S);
  if i = 0 then i:= MaxInt;
  Result:= Copy(S, 1, i-1);
  Delete(S, 1, i);
end;

function SLineWidth(const S: Widestring): Integer;
var
  n: Integer;
begin
  n:= Pos(#13, S);
  if n=0 then
    Result:= Length(S)
  else
    Result:= n-1;
end;

function SLineHeight(const S: Widestring): Integer;
var
  i: Integer;
begin
  Result:= 1;
  for i:= 1 to Length(S) do
    if s[i]=#13 then
      Inc(Result);
end;

{ TSyntaxMemo }

constructor TSyntaxMemo.Create(AOwner: TComponent);
begin
  inherited;

  FillChar(ColMarkers, SizeOf(ColMarkers), 0);
  MarkersLen:= TList.Create;
  
  FCarets:= TList.Create;
  FCaretsCoord:= TList.Create;
  FCaretsSel:= TList.Create;
  FListDups:= TList.Create;
  FListUndo:= TList.Create;
  FListOffsets:= TList.Create;
  FListClip:= TTntStringList.Create;

  FCaretsTimer:= TTimer.Create(Self);
  FCaretsTimer.Enabled:= false;
  FCaretsTimer.Interval:= GetCaretBlinkTime;
  FCaretsTimer.OnTimer:= CaretTimerTimer;

  FCaretsEnabled:= true;
  FCaretsSelEnabled:= true;
  FCaretsColorIndicator:= cciGutterBg;
  FCaretsGutterBand:= 0;
  FCaretsGutterColor:= clLtGray;
  FOnCtrlClick:= nil;

  FMouseDownPoint:= Point(-1, -1);
  FMouseDownCaret:= -1;
  FMouseDblTick:= 0;
  FMouseDblPoint:= Point(-1, -1);

  OnGetGutterBandColor:= EdGetGutterBandColor;
  OnBeforeLineDraw:= EdBeforeLineDraw;
end;

destructor TSyntaxMemo.Destroy;
begin
  FreeAndNil(MarkersLen);

  FreeAndNil(FListDups);
  DoClearCaretsUndo;
  FreeAndNil(FListUndo);
  FreeAndNil(FListOffsets);
  FreeAndNil(FListClip);

  FreeAndNil(FCaretsTimer);
  FreeAndNil(FCarets);
  FreeAndNil(FCaretsCoord);
  FreeAndNil(FCaretsSel);
  inherited;
end;

(*
procedure TSyntaxMemo.DoBlinkCarets;
var
  i: Integer;
  P: TPoint;
  R, RClient, R2: TRect;
  NSize: TSize;
begin
  GetDrawCoord(NSize, RClient);

  for i:= 0 to CaretsCount-1 do
  begin
    P:= GetCaretCoord(i);
    R:= Rect(
      P.X,
      P.Y,
      P.X + NSize.cx,
      P.Y + NSize.cy);

    if IntersectRect(R2, R, RClient) then
      InvertRect(Canvas.Handle, R);
  end;
end;
*)

procedure TSyntaxMemo.DoUpdateCaretPos(N: Integer);
var
  P: TPoint;
begin
  if (N>=0) {and (N<CaretsCount)} then
  begin
    P:= GetCaret(N);
    P:= CaretToMouse(P.X, P.Y);
    SetCaretCoord(N, P);
  end;
end;

procedure TSyntaxMemo.DoShowInfo;
var
  i: Integer;
  s: string;
  P: TPoint;
begin
  s:= '';
  for i:= 0 to CaretsCount-1 do
  begin
    P:= GetCaret(i);
    s:= s+Format('%d) %d:%d  ', [i+1, P.X+1, P.Y+1]);
  end;
  Application.MainForm.Caption:= s;
end;

procedure TSyntaxMemo.DoUpdateCarets;
var
  i: Integer;
begin
  if CaretsCount>0 then
  begin
    FTextExt:= DefTextExt;

    for i:= 0 to CaretsCount-1 do
      DoUpdateCaretPos(i);

    DoRemoveDupCarets;
    DoUpdateCaretsSelections;

    //DoShowInfo; //debug
  end;
end;

procedure TSyntaxMemo.DoUpdateCaretsSelections;
var
  i, NSel, NPos: Integer;
  Pos: TPoint;
begin
  //clear SelAttributes
  TecEmbeddedObjects(TextSource).ClearFormatting;

  if CaretsCount>0 then
  begin
    for i:= 0 to CaretsCount-1 do
    begin
      Pos:= GetCaret(i);
      NSel:= GetCaretSel(i);
      if NSel<>0 then
      begin
        NPos:= CaretPosToStrPos(Pos);

        IntSetSelection(Min(NPos, NPos+NSel), Abs(NSel), false{redraw});
        //SetSelection(Min(NPos, NPos+NSel), Abs(NSel));

        //add SelAttributes
        SelAttributes.BgColor:= DefaultStyles.SelectioMark.BgColor;
        SelAttributes.Color:= DefaultStyles.SelectioMark.Font.Color;
      end;
    end;
    ResetSelection;
  end;
end;

procedure TSyntaxMemo.DoUpdateLastCaret;
var
  N: Integer;
begin
  FTextExt:= DefTextExt;
  N:= CaretsCount;
  if N>0 then
    DoUpdateCaretPos(N-1);
  DoRemoveDupCarets;
end;

procedure TSyntaxMemo.CaretTimerTimer(Sender: TObject);
begin
  if not Focused and not (eoShowCaretWhenUnfocused in OptionsEx) then
    Exit;

  if FPrevReplaceMode<>ReplaceMode then
    Invalidate;
  FPrevReplaceMode:= ReplaceMode;

  DoDrawCarets;
end;

procedure TSyntaxMemo.DoAddCaretInt(P: TPoint; NSelCount: Integer);
begin
  DoKeepCaretInText(P);

  FCarets.Add(Pointer(P.X));
  FCarets.Add(Pointer(P.Y));
  FCaretsCoord.Add(nil);
  FCaretsCoord.Add(nil);

  if FCaretsSelEnabled then
    FCaretsSel.Add(Pointer(NSelCount))
  else
    FCaretsSel.Add(nil);
end;

function TSyntaxMemo.CanSetCarets: boolean;
begin
  Result:= FCaretsEnabled and (TextLength>0) and not ReadOnly;
end;

function TSyntaxMemo.GetSelCountForUsualCaret: Integer;
var
  NCaretPos: Integer;
begin
  Result:= 0;
  if SelLength>0 then
  begin
    NCaretPos:= CaretStrPos;
    //check that single selection is "near" usual caret
    //(may be not so for "Preserve selection" opt)
    if (NCaretPos=SelStart) or (NCaretPos=SelStart+SelLength) then
    begin
      if SelStart<NCaretPos then
        Result:= -SelLength
      else
        Result:= SelLength;
    end;
  end;  
end;

procedure TSyntaxMemo.AddCaret(const P: TPoint;
  ASelCount: Integer = 0;
  AddDefaultPos: boolean = true);
begin
  if not CanSetCarets then Exit;
  DoInitBaseEditor;
  SetStaticDraw;

  if (CaretsCount=0) and AddDefaultPos then
  begin
    DoAddCaretInt(CaretPos, GetSelCountForUsualCaret);
    DoUpdateLastCaret;
  end;

  DoAddCaretInt(P, ASelCount);
  DoUpdateLastCaret;
  DoUpdateCaretsSelections;

  InvalidateGutter;
  SetBlinkingDraw;
end;


procedure TSyntaxMemo.DoSaveBaseEditor;
begin
  FPrevDrawFocus:= soDrawCurLineFocus in Options;
  FPrevDrawLine:= DefaultStyles.CurrentLine.Enabled;
end;

procedure TSyntaxMemo.DoInitBaseEditor;
begin
  if not FPrevSaved then
  begin
    FPrevSaved:= true;
    DoSaveBaseEditor;
  end;

  Caret.Visible:= false;
  Options:= Options - [soDrawCurLineFocus];
  DefaultStyles.CurrentLine.Enabled:= false;

  OnZoom:= EditorZoom;
end;

procedure TSyntaxMemo.DoRestoreBaseEditor;
begin
  if FPrevDrawFocus then
    Options:= Options + [soDrawCurLineFocus]
  else
    Options:= Options - [soDrawCurLineFocus];

  DefaultStyles.CurrentLine.Enabled:= FPrevDrawLine;

  Caret.Visible:= true;
end;

function TSyntaxMemo.CaretsCount: Integer;
begin
  Result:= FCarets.Count div 2;
  //Assert(FCarets.Count=FCaretsCoord.Count);
end;

procedure TSyntaxMemo.RemoveCarets(LeaveFirst: boolean = true);
begin
  if CaretsCount>0 then
  begin
    FCaretsTimer.Enabled:= false;

    DoSortCarets;
    if LeaveFirst then
      CaretPos:= GetCaret(0)
    else
      CaretPos:= GetCaret(CaretsCount-1);

    FCarets.Clear;
    FCaretsCoord.Clear;
    FCaretsSel.Clear;

    DoUpdateCaretsSelections;
    DoRestoreBaseEditor;

    Invalidate;
    Change;
  end;
end;

procedure TSyntaxMemo.DoScroll;
begin
  inherited;
  DoUpdateCarets;
end;

procedure TSyntaxMemo.EdGetGutterBandColor(Sender: TObject;
  NBand, NLine: Integer; var NColor: TColor);
begin
  NColor:= clNone;
  if (CaretsColorIndicator = cciGutterBg) and
    (NBand = FCaretsGutterBand) then
    {
    if CaretsCount=0 then
    begin
      if CaretPos.Y=NLine then
        NColor:= FCaretsGutterColor;
    end
    else
    }
    if IsCaretOnLine(NLine) then
      NColor:= FCaretsGutterColor;
end;

function TSyntaxMemo.IsCaretAt(const P: TPoint): boolean;
var
  i: Integer;
begin
  Result:= false;
  for i:= 0 to CaretsCount-1 do
    if PointsEqual(P, GetCaret(i)) then
    begin
      Result:= true;
      Break
    end;
end;

function TSyntaxMemo.IsCaretOnLine(NLine: Integer): boolean;
var
  i, NCarets: Integer;
begin
  Result:= false;
  NCarets:= CaretsCount;

  if NCarets<=1 then
    Result:= NLine=CurrentLine
  else
  for i:= 0 to NCarets-1 do
    if GetCaret(i).Y=NLine then
    begin
      Result:= true;
      Break
    end;
end;

procedure TSyntaxMemo.ExecCommand(Command: integer; Data: Pointer = nil);
var
  Ok: boolean;
begin
  //handle carets-specific commands first
  Ok:= false;
  case Command of
    smCaretsRemoveLeaveFirst:
      begin
        RemoveCarets(true);
        Ok:= true;
      end;
    smCaretsRemoveLeaveLast:
      begin
        RemoveCarets(false);
        Ok:= true;
      end;
    smCaretsFromSelLeft:
      begin
        DoCaretsFromSel(true, false);
        Ok:= true;
      end;
    smCaretsFromSelRight:
      begin
        DoCaretsFromSel(false, false);
        Ok:= true;
      end;
    smCaretsFromSelClear:
      begin
        DoCaretsFromSel(true, true);
        Ok:= true;
      end;
    smCaretsFromMarksLeft:
      begin
        DoCaretsFromMarks(true, false);
        Ok:= true;
      end;
    smCaretsFromMarksRight:
      begin
        DoCaretsFromMarks(false, false);
        Ok:= true;
      end;
    smCaretsFromMarksClear:
      begin
        DoCaretsFromMarks(true, true);
        Ok:= true;
      end;
    smCaretsUpLine:
      begin
        DoCaretsExtend(true, 1);
        Ok:= true;
      end;
    smCaretsDownLine:
      begin
        DoCaretsExtend(false, 1);
        Ok:= true;
      end;
    smCaretsUpPage:
      begin
        DoCaretsExtend(true, VisibleLines);
        Ok:= true;
      end;
    smCaretsDownPage:
      begin
        DoCaretsExtend(false, VisibleLines);
        Ok:= true;
      end;
    smCaretsUpToEnd:
      begin
        DoCaretsExtend(true, Lines.Count);
        Ok:= true;
      end;
    smCaretsDownToEnd:
      begin
        DoCaretsExtend(false, Lines.Count);
        Ok:= true;
      end;
  end;

  if Ok then
  begin
    //allow to record to macro
    if Assigned(OnExecuteCommand) then
      OnExecuteCommand(Self, Command, Data, Ok);
    Exit
  end;
  
  {$ifdef GotoWork}
  //workaround: commands 17 and 117 recorded swapped:
  //click records 117 and Shift+click records 17
  case Command of
    smGotoXY: Inc(Command, smSelection);
    smGotoXY+smSelection: Dec(Command, smSelection);
  end;  
  {$endif}

  //handle all commands here
  if CaretsCount=0 then
    inherited
  else  
  if IsTabstopMode and (Command=smTab) then
    inherited
  else
    case Command of
      smLeft,
      smRight,
      smUp,
      smDown,
      smWordLeft,
      smWordRight,
      smLineStart,
      smLineEnd,
      smFirstLetter,
      smLastLetter,
      smChar,
      smString,
      smTab,
      smTabChar,
      smDeleteChar,
      smDeleteLastChar,
      smDeleteWord,
      smDeleteLastWord,
      smDeleteBOL,
      smDeleteEOL,
      smDeleteLine,
      smLineBreak,
      smLineBreakSoft,
      smInsertLine,
      smBlockIndent,
      smBlockUnindent,
      smCopy,
      smCut,
      smPaste,
      smUndo:
        DoCaretsCommand(Command, Data);

      smSelection+1..smSelection+100: //Shift+arrows
        DoCaretsCommand(Command, Data);

      smColSelection+1..smColSelection+100, //Shift+Alt+arrows
      smSelectAll:
        begin
          RemoveCarets;
          inherited;
        end;

      else
        inherited;
    end;
end;

function TSyntaxMemo.IsDuplicateCaret(Cmd, NCaret: Integer): boolean;
begin
  case Cmd of
    smDeleteLine,
    smCopy,
    smCut,
    smBlockIndent,
    smBlockUnindent:
      Result:= FListDups.IndexOf(Pointer(NCaret))>=0;
    else
      Result:= false;
  end;
end;


const
  cShiftToHome = -(MaxInt div 2);

procedure TSyntaxMemo.DoCaretsCommand(Cmd: Integer; Data: Pointer);
var
  NShiftX,
  NShiftY: Integer;
  //-----------------------------
  procedure DoDelLine(const P: TPoint);
  var
    NPos: Integer;
  begin
    NPos:= CaretPosToStrPos(Point(0, P.Y));
    if ReplaceText(NPos, Lines.LineSpace(P.Y), '') then
      NShiftY:= NShiftY-1;
  end;
  //-----------------------------
  procedure DoBackspace(var P: TPoint);
  var
    Len: Integer;
  begin
    //padding with spaces, for virtual caret pos
    Len:= Lines.LineLength(P.Y);
    if (P.X>Len) and not (soKeepCaretInText in Options) then
      ReplaceText(CaretPosToStrPos(Point(Len, P.Y)), 0, StringOfChar(' ', P.X - Len));

    if P.X>0 then
    begin
      Dec(P.X);
      if ReplaceText(CaretPosToStrPos(P), 1, '') then
        NShiftX:= -1;
    end
    else
    if P.Y>0 then
    begin
      Dec(P.Y);
      P.X:= Lines.LineLength(P.Y);
      if ReplaceText(CaretPosToStrPos(P),
        {Lines.LineSpace(PCur.Y)-Lines.LineLength(PCur.Y)}Length(Lines.LineEndStr(P.Y)), '') then
      begin
        NShiftX:= 1;
        NShiftY:= -1;
      end;
    end;
  end;
  //-----------------------------
  procedure DoInputText(const S: Widestring; var P: TPoint);
  var
    Len, RepLen: Integer;
  begin
    //padding with spaces, for virtual caret pos
    Len:= Lines.LineLength(P.Y);
    if (P.X>Len) and not (soKeepCaretInText in Options) then
      ReplaceText(CaretPosToStrPos(Point(Len, P.Y)), 0, StringOfChar(' ', P.X - Len));

    //calc replace-length
    RepLen:= IfThen(ReplaceMode, Min(Length(S), Max(0, Len-P.X)), 0);

    if ReplaceText(CaretPosToStrPos(P), RepLen, S) then
    begin
      Len:= SLineWidth(S);
      Inc(P.X, Len);

      NShiftX:= NShiftX + IfThen(ReplaceMode, 0, Len);
      NShiftY:= NShiftY + SLineHeight(S)-1;
    end;
  end;
  //-----------------------------
  procedure DoClearSelectionText(var Pnt: TPoint; NCaret: Integer);
  var
    NOffset, NSel: Integer;
    Str: Widestring;
  begin
    NSel:= GetCaretSel(NCaret);
    if NSel<>0 then
    begin
      NOffset:= CaretPosToStrPos(Pnt);
      NOffset:= Min(NOffset, NOffset+NSel);
      Str:= Lines.SubString(NOffset+1, Abs(NSel));
      ReplaceText(NOffset, Abs(NSel), '');

      Pnt:= StrPosToCaretPos(NOffset);
      SetCaretSel(NCaret, 0);

      NShiftX:= NShiftX - SLineWidth(Str);
      NShiftY:= NShiftY - SLineHeight(Str)+1;
    end;
  end;
  //-----------------------------
var
  PCur, PFrom: TPoint;
  i, N, N2: Integer;
  ch: WideChar;
  S: Widestring;
  bFlag, bHasSelection, bListClipMatch: boolean;
begin
  SetStaticDraw;

  DoSortCarets;
  DoCalculateDupCarets(FListDups);

  //calculate origin offsets for Shift+arrows
  if IsCommandMoveSelections(Cmd) then
    DoCalculateOffsets
  else
  if not IsCommandHandleSelections(Cmd) then
    DoResetSelections;

  {
  s:= '';
  for i:=0 to FListdups.Count-1 do
    s:=s+Inttostr(Integer(FListdups[i]))+' ';
  showmessage(s);
  exit;
  }

  //need to save undo
  //for all text-changing commands from ExecCommand
  case Cmd of
    smChar,
    smString,
    smTab,
    smTabChar,
    smDeleteChar,
    smDeleteLastChar,
    smDeleteWord,
    smDeleteLastWord,
    smDeleteBOL,
    smDeleteEOL,
    smDeleteLine,
    smLineBreak,
    smLineBreakSoft,
    smInsertLine,
    smBlockIndent,
    smBlockUnindent,
    smCut,
    smPaste:
      DoAddCaretsUndo;
  end;

  FListClip.Clear;
  bListClipMatch:= false;

  case Cmd of
    smCopy,
    smCut:
      begin
        //need to clear clipboard
        TntClipboard.Clear;
      end;  
    smPaste:
      begin
        //save clipboard text as stringlist for pasting
        FListClip.Text:= TntClipboard.AsWideText;
        bListClipMatch:= FListClip.Count = CaretsCount;
        if not bListClipMatch then
          FListClip.Clear;
      end;
  end;

  BeginUpdate;
  try
    bHasSelection:= IsSelectionExist;
    for i:= CaretsCount-1 downto 0 do
      //discard "duplicate carets" (N carets on same line), for clipboard commands
      if bHasSelection or not IsDuplicateCaret(Cmd, i) then
      begin
        PCur:= GetCaret(i);
        PFrom:= PCur;
        NShiftX:= 0;
        NShiftY:= 0;

        case Cmd of
          smCopy,
          smCut:
            try
              //copy/cut work differently for two cases:
              //a) if selections exist: copy/cut only selections
              //   (skipping empty carets)
              //b) if no selections exist: copy/cut entire lines with carets
              //   (once per each line: this's handled above by "IsDuplicateCaret")
              if not bHasSelection then
              begin
                TntClipboard.AsWideText:=
                  Lines[PCur.Y] + sLineBreak +
                  IfThen(opSeparateCopiedLines, sLineBreak) +
                  TntClipboard.AsWideText;
                if Cmd=smCut then
                  DoDelLine(PCur);
              end
              else
              begin
                S:= DoCalculateSelectionText(i);
                if S<>'' then
                begin
                  TntClipboard.AsWideText:=
                    S + sLineBreak + TntClipboard.AsWideText;
                  if Cmd=smCut then
                    DoClearSelectionText(PCur, i);
                end;
              end;
            except
            end;

          smPaste:
            try
              DoClearSelectionText(PCur, i);
              if not bListClipMatch then
                S:= TntClipboard.AsWideText
              else
              begin
                if (i>=0) and (i<FListClip.Count) then
                  S:= FListClip[i]
                else
                  S:= '??';  
              end;
              DoInputText(S, PCur);
            except
            end;

          smBlockIndent,
          smBlockUnindent:
            begin
              if not ReadOnly then
              begin
                N:= IfThen(Cmd=smBlockIndent, BlockIndent, -BlockIndent);
                IndentLines(PCur.Y, PCur.Y, N, 0, true);
                Inc(PCur.X, N);
                if PCur.X<0 then PCur.X:= 0;
                NShiftX:= N;
              end;
            end;

          smDeleteLine:
            DoDelLine(PCur);

          smDeleteWord:
            begin
              N:= CaretPosToStrPos(PCur);
              N2:= DoWordJumpPos(N, true);
              if ReplaceText(N, N2-N, '') then
                NShiftX:= -(N2-N);
            end;

          smDeleteLastWord:
            begin
              N:= CaretPosToStrPos(PCur);
              N2:= DoWordJumpPos(N, false);
              if ReplaceText(N2, N-N2, '') then
              begin
                NShiftX:= -(N-N2);
                PCur:= StrPosToCaretPos(N2);
              end;
            end;

          smDeleteBOL:
            begin
              N2:= CaretPosToStrPos(Point(0, PCur.Y));
              if ReplaceText(N2, Min(Lines.LineLength(PCur.Y), PCur.X), '') then
                PCur:= StrPosToCaretPos(N2);
            end;
          smDeleteEOL:
            begin
              N:= CaretPosToStrPos(PCur);
              if PCur.X < Lines.LineLength(PCur.Y) then
                ReplaceText(N, Lines.LineLength(PCur.Y) - PCur.X, '');
            end;

          smLineBreakSoft,
          smLineBreak:
            begin
              N:= IfThen(soAutoIndentMode in Options,
                GetIndent(PCur.Y, LinesPosToLog(PCur).X + 1), 0);
              S:= GetIndentString(N, false);
              N:= Length(S); //indent size
              S:= SEol(Cmd=smLineBreakSoft) + S; //CR + indent
              if ReplaceText(CaretPosToStrPos(PCur), 0, S) then
              begin
                Inc(PCur.Y);
                PCur.X:= N; //indent size
                NShiftY:= 1;
                NShiftX:= cShiftToHome - N;
              end;
            end;

          smInsertLine:
            begin
              S:= SEol(false);
              if ReplaceText(CaretPosToStrPos(PCur), 0, S) then
              begin
                NShiftY:= 1;
                NShiftX:= cShiftToHome;
              end;
            end;

          smDeleteChar:
            begin
              //"delete" works differently for two cases:
              //a) if selections exist: clears all selections,
              //b) if no selections exist: deletes 1 char at each caret
              if not bHasSelection then
              begin
                if PCur.X<Lines.LineLength(PCur.Y) then
                  bFlag:= ReplaceText(CaretPosToStrPos(PCur), 1, '')
                else
                  bFlag:= ReplaceText(CaretPosToStrPos(PCur), Length(Lines.LineEndStr(PCur.Y)), '');
                if bFlag then
                  NShiftX:= -1;
              end
              else
              begin
                DoClearSelectionText(PCur, i);
              end;
            end;

          smDeleteLastChar:
            begin
              DoBackSpace(PCur);
            end;

          smChar:
            begin
              DoClearSelectionText(PCur, i);
              ch:= PWChar(Data)^;
              if ch>=' ' then
                DoInputText(ch, PCur);
            end;
            
          smString:
            begin
              DoClearSelectionText(PCur, i);
              S:= PWChar(Data);
              DoInputText(S, PCur);
            end;

          smTab:
            begin
              case TabMode of
                tmSpaces,
                tmSmartTab:
                 begin
                   N:= LinesPosToLog(PCur).X;
                   if TabMode = tmSpaces then
                     N2:= TabList.NextTab(N, False)
                   else
                     N2:= GetSmartPos(N, PCur.Y);
                   DoInputText(StringOfChar(' ', N2-N), PCur)
                 end;
                tmTabChar:
                  DoInputText(#9, PCur);
              end;
            end;
          smTabChar:
            DoInputText(#9, PCur);

          smLeft,
          smSelLeft:
            begin
              if {not (soKeepCaretInText in Options) or} (PCur.X > 0) then
                PCur:= SkipHidden(PCur.X - 1, PCur.Y, False)
              else
              if PCur.Y > 0 then
                PCur:= SkipHidden(Lines.LineLength(PCur.Y - 1), PCur.Y - 1, False);
            end;

          smRight,
          smSelRight:
            begin
              if not (soKeepCaretInText in Options) or (PCur.X < Lines.LineLength(PCur.Y)) then
                PCur:= SkipHidden(PCur.X + 1, PCur.Y, True)
              else
              if PCur.Y < Lines.Count - 1 then
                PCur:= SkipHidden(0, PCur.Y + 1, True);
            end;

          smUp,
          smSelUp:
            begin
              if PCur.Y>0 then
                Dec(PCur.Y);
              DoKeepCaretInText(PCur);
            end;

          smDown,
          smSelDown:
            begin
              if PCur.Y<Lines.Count-1 then
                Inc(PCur.Y);
              DoKeepCaretInText(PCur);
            end;

          smWordLeft,
          smWordRight,
          smSelWordLeft,
          smSelWordRight:
            begin
              PCur:= StrPosToCaretPos(DoWordJumpPos(CaretPosToStrPos(PCur),
                Cmd in [smWordRight, smSelWordRight]));
            end;

          smLineStart,
          smFirstLetter,
          smSelLineStart,
          smSelFirstLetter:
            begin
              PCur.X:= 0;
            end;

          smLineEnd,
          smLastLetter,
          smSelLineEnd,
          smSelLastLetter:
            begin
              //End key should toggle position: line end <--> last non-space char
              if PCur.X = Lines.LineLength(PCur.Y) then
              begin
                while (PCur.X>0) and (Lines[PCur.Y][PCur.X]=' ') do
                  Dec(PCur.X);
              end
              else
                PCur.X:= Lines.LineLength(PCur.Y);
            end;
        end;

        DoShiftCarets(PFrom, NShiftX, NShiftY);
        SetCaret(i, PCur);
      end;
  finally
    EndUpdate;
  end;


  //scroll editor if carets moved up/down
  case Cmd of
    smUp,
    smSelUp:
      begin
        //scroll 1 line up, and only if needed
        if GetCaret(0).Y <= TopLine then
          ExecCommand(smScrollUp);
      end;

    smDown,
    smSelDown:
      begin
        //scroll 1 line down, only if needed
        if GetCaret(CaretsCount-1).Y >= TopLine + VisibleLines - 2 then
          ExecCommand(smScrollDown);
      end;

    {
    smLeft,
    smWordLeft,
    smDeleteLastChar:
      //scroll to 1st caret
      CaretPos:= GetCaret(0);

    smWordRight,
    smChar,
    smPaste,
    smInsertLine:
      //scroll to last caret
      CaretPos:= GetCaret(CaretsCount-1);
    }
  end;

  //handle undo here
  case Cmd of
    smUndo:
    begin
      Undo;
      DoCaretsUndo;
    end;
  end;

  //calculate selections for Shift+arrows
  if IsCommandMoveSelections(Cmd) then
    DoCalculateSelections(IsCommandMoveSelectionsDown(Cmd));

  FListClip.Clear;

  DoUpdateCarets;
  SetBlinkingDraw;
  Change;
end;


procedure TSyntaxMemo.DoResetSelections;
var
  i: Integer;
begin
  for i:= 0 to FCaretsSel.Count-1 do
    FCaretsSel[i]:= nil;
end;

function TSyntaxMemo.IsSelectionExist: boolean;
var
  i: Integer;
begin
  Result:= false;
  for i:= 0 to FCaretsSel.Count-1 do
    if FCaretsSel[i]<>nil then
    begin
      Result:= true;
      Exit
    end;  
end;

function TSyntaxMemo.DoCalculateSelectionText(i: Integer): Widestring;
var
  NOffset, NSel: Integer;
  Pnt: TPoint;
begin
  Result:= '';
  Pnt:= GetCaret(i);
  NSel:= GetCaretSel(i);
  if NSel<>0 then
  begin
    NOffset:= CaretPosToStrPos(Pnt);
    NOffset:= Min(NOffset, NOffset+NSel);
    Result:= Lines.SubString(NOffset+1, Abs(NSel));
  end;
end;

procedure TSyntaxMemo.DoCalculateOffsets;
var
  i, NOffset: Integer;
  Pnt: TPoint;
begin
  FListOffsets.Clear;
  for i:= 0 to CaretsCount-1 do
  begin
    Pnt:= GetCaret(i);
    NOffset:= CaretPosToStrPos(Pnt) + GetCaretSel(i);
    FListOffsets.Add(Pointer(NOffset));
  end;
end;

function TSyntaxMemo.GetCaretSelRange(Index: Integer): TIntRec2;
var
  Pos, Sel: Integer;
begin
  Pos:= CaretPosToStrPos(GetCaret(Index));
  Sel:= GetCaretSel(Index);
  Result.N1:= Min(Pos, Pos+Sel);
  Result.N2:= Max(Pos, Pos+Sel);
end;

function TSyntaxMemo.IsSelectionOverlap(
  Index1, Index2: Integer; var MergedRange: TIntRec2): boolean;
var
  Range1, Range2: TIntRec2;
begin
  Range1:= GetCaretSelRange(Index1);
  Range2:= GetCaretSelRange(Index2);
  Result:= not ((Range1.N1>Range2.N2) or (Range2.N1>Range1.N2));
  if Result then
  begin
    MergedRange.N1:= Min(Range1.N1, Range2.N1);
    MergedRange.N2:= Max(Range1.N2, Range2.N2);
  end
  else
  begin
    MergedRange.N1:= 0;
    MergedRange.N2:= 0;
  end;  
end;

procedure TSyntaxMemo.DoCalculateSelections(AMoveDown: boolean);
var
  NOffset, NOffsetNew: Integer;
  i, j, MergedStart, MergedSel: Integer;
  Pnt: TPoint;
  Range: TIntRec2;
begin
  for i:= 0 to CaretsCount-1 do
  begin
    Pnt:= GetCaret(i);
    NOffset:= Integer(FListOffsets[i]);
    NOffsetNew:= CaretPosToStrPos(Pnt);
    SetCaretSel(i, NOffset-NOffsetNew);
  end;

  //check overlaps of selections, merge them if so
  for i:= CaretsCount-1 downto 1 do
    for j:= i-1 downto 0 do
      if IsSelectionOverlap(i, j, Range) then
      begin
        //calc merged range
        if AMoveDown then
        begin
          MergedStart:= Range.N2;
          MergedSel:= Range.N1-Range.N2;
        end
        else
        begin
          MergedStart:= Range.N1;
          MergedSel:= Range.N2-Range.N1;
        end;

        //update coords of j-th caret
        SetCaret(j, StrPosToCaretPos(MergedStart));
        SetCaretSel(j, MergedSel);

        //remove merged i-th caret
        DoRemoveCaretIndex(i);
        Break
      end;

  if CaretsCount<=1 then
    RemoveCarets;    
end;

procedure TSyntaxMemo.DoRemoveDupCarets;
var
  i, j: Integer;
begin
  if CaretsCount>1 then
  begin
    for i:= CaretsCount-1 downto 1 do
      for j:= i-1 downto 0 do
        if PointsEqual(GetCaret(i), GetCaret(j)) then
        begin
          //correct index of mouse-down caret here
          if FMouseDownCaret=i then
            FMouseDownCaret:= j;
            
          DoRemoveCaretIndex(i);
          Break;
        end;

    //last caret deleted? cancel mode.
    if CaretsCount=1 then
    begin
      CaretPos:= GetCaret(0);
      RemoveCarets;
    end;
  end;
end;

function TSyntaxMemo.GetCaret(N: Integer): TPoint;
begin
  Result:= Point(
    Integer(FCarets[N*2]),
    Integer(FCarets[N*2+1]));
end;

function TSyntaxMemo.GetCaretSel(N: Integer): Integer;
begin
  if (N>=0) and (N<FCaretsSel.Count) then
    Result:= Integer(FCaretsSel[N])
  else
    Result:= 0;  
end;

procedure TSyntaxMemo.SetCaret(N: Integer; const P: TPoint);
begin
  FCarets[N*2]:= Pointer(P.X);
  FCarets[N*2+1]:= Pointer(P.Y);
end;

function TSyntaxMemo.GetCaretCoord(N: Integer): TPoint;
begin
  Result:= Point(
    Integer(FCaretsCoord[N*2]),
    Integer(FCaretsCoord[N*2+1]));
end;

procedure TSyntaxMemo.SetCaretCoord(N: Integer; const P: TPoint);
begin
  FCaretsCoord[N*2]:= Pointer(P.X);
  FCaretsCoord[N*2+1]:= Pointer(P.Y);
end;

procedure TSyntaxMemo.SetCaretSel(N, Value: Integer);
begin
  if FCaretsSelEnabled then
    if (N>=0) and (N<FCaretsSel.Count) then
      FCaretsSel[N]:= Pointer(Value);
end;


procedure TSyntaxMemo.MouseDown(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
var
  PTo, PEnd: TPoint;
  PDefCaret: TPoint;
  bDoubleClick: boolean;
  nStart, nEnd: Integer;
begin
  FMouseDownPoint:= Point(-1, -1);
  FMouseDownCaret:= -1;

  if CanSetCarets then
  begin
    PDefCaret:= CaretPos;
    PTo:= MouseToCaret(X, Y);

    //detect double-click
    bDoubleClick:=
      ((GetTickCount-FMouseDblTick) <= GetDoubleClickTime) and
      PointsEqual(PTo, FMouseDblPoint);
    if bDoubleClick then
    begin
      FMouseDblTick:= 0;
      FMouseDblPoint:= Point(-1, -1);
    end
    else
    begin
      FMouseDblTick:= GetTickCount;
      FMouseDblPoint:= PTo;
    end;

    if (ssCtrl in Shift) and not (ssAlt in Shift) then
    begin
      //Ctrl+Shift+click - make carets column
      if (ssShift in Shift) then
      begin
        AddCaretsColumn(PDefCaret, PTo, ccsSelEmpty);
      end
      else
      //main form handled Ctrl+click (e.g. URL)
      if IsCtrlClickHandled(PTo) then
        inherited
      else
      //Ctrl+doubleclick - make word selection
      if bDoubleClick then
      begin
        WordRangeAtPos(PTo, nStart, nEnd);
        if nEnd-nStart>0 then
        begin
          PEnd:= StrPosToCaretPos(nEnd);
          AddCaret(PEnd, nStart-nEnd);
          CaretPos:= PEnd;
          FMouseDownPoint:= PEnd;
          FMouseDownCaret:= CaretsCount-1;
          DoRemoveCaret(PTo);
        end;
      end
      else
      //Ctrl+click - add or remove caret
      if not DoRemoveCaret(PTo) then
      begin
        AddCaret(PTo);
        CaretPos:= PTo;
        FMouseDownPoint:= PTo;
        FMouseDownCaret:= CaretsCount-1;
      end;
    end
    else
    begin
      if CaretsCount>0 then
      begin
        RemoveCarets;
        CaretPos:= PTo;
      end
      else
        inherited;
    end;
  end
  else
    inherited;
end;

function TSyntaxMemo.SEol(SoftBreak: boolean): Widestring;
begin
  case Lines.TextFormat of
    tfCR: Result:= #$D;
    tfNL: Result:= #$A;
    else if SoftBreak then
         Result:= #$A
       else
         Result:= #$D#$A;
  end;
end;

//from ecSyntmemo
function TSyntaxMemo.GetIndent(StartLine: integer; LessThan: integer): integer;
var i, ind: integer;
begin
  if Lines.Count > 0 then
  for i := StartLine downto 0 do
   begin
    ind := StringIndent(Lines[i]);
    if (ind <> -1) and (ind < LessThan) then
     begin
      Result := ind;
      Exit;
     end;
   end;
   Result := 0;
end;

procedure TSyntaxMemo.DoShiftCarets(const PFrom: TPoint;
  NShiftX, NShiftY: Integer);
var
  i: Integer;
  P: TPoint;
begin
  for i:= 0 to CaretsCount-1 do
  begin
    P:= GetCaret(i);
    //use NShiftX only for same line
    if (P.Y=PFrom.Y) and (P.X>PFrom.X) then
    begin
      if NShiftX <= cShiftToHome then
        P.X:= Abs(NShiftX - cShiftToHome)
      else
        Inc(P.X, NShiftX);
      //no need?
      //Inc(P.Y, NShiftY);  
    end
    else
    //use NShiftY only for lines below
    if (P.Y>PFrom.Y) then
    begin
      Inc(P.Y, NShiftY);
    end;

    DoKeepCaretInText(P);
    SetCaret(i, P);
  end;
end;

procedure TSyntaxMemo.DoKeepCaretInText(var P: TPoint);
var
  Len: Integer;
begin
  if (soKeepCaretInText in Options) then
  begin
    Len:= Lines.LineLength(P.Y);
    if P.X>Len then
      P.X:= Len;
  end;
end;

  //from ecSyntmemo
  function TSyntaxMemo.GetSmartPos(x, Line: integer): integer;
  var x1, i: integer;
      s: ecString;
  begin
    while Line > 0 do
     begin
      Dec(Line);
      x1 := LogToLinesPos(Point(x, Line)).X + 2;
      s := Lines[Line];
      for i := x1 to Length(s) do
       if (Ord(s[i - 1]) <= $20) and (Ord(s[i]) > $20) then
        begin
         Result := LinesPosToLog(Point(i - 1, Line)).X;
         Exit;
        end;
     end;
    Result := TabList.NextTab(x, False);
  end;


procedure TSyntaxMemo.MouseMove(Shift: TShiftState; X, Y: Integer);
var
  Pnt: TPoint;
  NSel: Integer;
begin
  inherited;

  //if we drag mouse, then update position and selection for last caret
  if (ssLeft in Shift) then
    if FMouseDownCaret>=0 then
    begin
      Pnt:= MouseToCaret(X, Y);
      NSel:= CaretPosToStrPos(Pnt) - CaretPosToStrPos(FMouseDownPoint);

      if CaretsCount>0 then
      begin
        if FMouseDownCaret<CaretsCount then
        begin
          SetCaret(FMouseDownCaret, Pnt);
          SetCaretSel(FMouseDownCaret, -NSel);
        end
        else
          MessageBeep(mb_iconerror);  

        //do careful redraw and remove dup carets
        SetStaticDraw;
        try
          DoUpdateCarets; //includes DoRemoveDupCarets
          Change; //maybe dup removed, update statusbar
        finally
          SetBlinkingDraw;
        end;  
      end;
    end;

  //remove carets as Ctrl+Alt+drag can be used to select lines
  if HaveSelection then
    RemoveCarets;
end;

procedure TSyntaxMemo.AddCaretsColumn(const PntFrom, PntTo: TPoint;
  ASelType: TCaretsColumnSelectionType);
var
  i, NLine1, NLine2, NCol1, NCol2, NCol, NSelCount: Integer;
  PntCurr: TPoint;
begin
  if not CanSetCarets then Exit;
  ResetSelection;
  RemoveCarets;

  DoInitBaseEditor;
  SetStaticDraw;

  NLine1:= Min(PntFrom.Y, PntTo.Y);
  NLine2:= Max(PntFrom.Y, PntTo.Y);

  NCol1:= LinesPosToLog(PntFrom).X;
  NCol2:= LinesPosToLog(PntTo).X;
  NCol:= IfThen(ASelType<>ccsSelToRight, NCol1, NCol2);

  case ASelType of
    ccsSelToLeft: NSelCount:= (NCol2-NCol1) * 1;
    ccsSelToRight: NSelCount:= (NCol2-NCol1) * -1;
    else NSelCount:= 0;
  end;

  for i:= NLine1 to NLine2 do
  begin
    PntCurr:= LogToLinesPos(Point(NCol, i));
    DoAddCaretInt(PntCurr, NSelCount);
  end;

  DoUpdateCarets;
  CaretPos:= PntTo;

  InvalidateGutter;
  SetBlinkingDraw;
  Change;
end;

procedure TSyntaxMemo.SetCaretsEnabled(Val: boolean);
begin
  FCaretsEnabled:= Val;
  if not Val then
    RemoveCarets;
end;

procedure TSyntaxMemo.DoSortCarets;
var
  ListStr: TStringList;
  ListPos: TList;
  ListSel: TList;
  i, N, NSel: Integer;
  P: TPoint;
begin
  ListStr:= TStringList.Create;
  ListPos:= TList.Create;
  ListSel:= TList.Create;

  try
    for i:= 0 to CaretsCount-1 do
    begin
      P:= GetCaret(i);
      ListStr.AddObject(Format('%10.10d %10.10d', [P.Y, P.X]), Pointer(i));
    end;
    ListStr.Sort;

    ListPos.Clear;
    ListSel.Clear;
    for i:= 0 to ListStr.Count-1 do
    begin
      N:= Integer(ListStr.Objects[i]);
      P:= GetCaret(N);
      NSel:= GetCaretSel(N);
      ListPos.Add(Pointer(P.X));
      ListPos.Add(Pointer(P.Y));
      ListSel.Add(Pointer(NSel));
    end;

    FCarets.Assign(ListPos);
    FCaretsSel.Assign(ListSel);
  finally
    FreeAndNil(ListSel);
    FreeAndNil(ListPos);
    FreeAndNil(ListStr);
  end;
end;

procedure TSyntaxMemo.DoCalculateDupCarets(L: TList);
var
  i, Y1, Y2: Integer;
begin
  if not Assigned(L) then
    raise Exception.Create('List nil');
  L.Clear;
  for i:= 0 to Pred(CaretsCount-1) do
  begin
    Y1:= GetCaret(i).Y;
    Y2:= GetCaret(i+1).Y;
    if (Y1=Y2) and (L.IndexOf(Pointer(i+1))<0) then
      L.Add(Pointer(i+1));
  end;
end;

procedure TSyntaxMemo.DoRemoveCaretIndex(N: Integer);
begin
  FCarets.Delete(N*2+1);
  FCarets.Delete(N*2);
  FCaretsCoord.Delete(N*2+1);
  FCaretsCoord.Delete(N*2);
  FCaretsSel.Delete(N);
end;

function TSyntaxMemo.DoRemoveCaret(const P: TPoint): boolean;
var
  i: Integer;
begin
  Result:= false;
  for i:= CaretsCount-1 downto 0 do
    if PointsEqual(P, GetCaret(i)) then
    begin
      DoRemoveCaretIndex(i);
      if CaretsCount=0 then
        RemoveCarets
      else
      begin
        DoUpdateCaretsSelections;
        Invalidate;
      end;
      Result:= true;
      Change;
      Break;
    end;

  if Result then
    if CaretsCount=1 then
    begin
      CaretPos:= GetCaret(0);
      RemoveCarets;
    end;
end;

procedure TSyntaxMemo.GetDrawCoord(var ACaretSize: TSize; var AClientRect: TRect);
var
  NWidth: Integer;
begin
  NWidth:= IfThen(Caret.Insert.Width<0, Abs(Caret.Insert.Width), FTextExt.cx * Caret.Insert.Width div 100);
  ACaretSize.cx:= IfThen(ReplaceMode, FTextExt.cx, NWidth);
  ACaretSize.cy:= IfThen(ReplaceMode, FTextExt.cy + LineSpacing, (FTextExt.cy + LineSpacing) * Caret.Insert.Height div 100);

  AClientRect:= ClientRect;
  Inc(AClientRect.Left, Gutter.Width);
end;

procedure TSyntaxMemo.DoDrawCarets;
var
  i: Integer;
  P: TPoint;
  R, R2, RClient: TRect;
  NSize: TSize;
begin
  if CaretsCount<2 then Exit;
  GetDrawCoord(NSize, RClient);

  for i:= 0 to CaretsCount-1 do
  begin
    P:= GetCaret(i);
    //if (Line>=0) and (P.Y<>Line) then
    //  Continue;

    P:= GetCaretCoord(i);
    Inc(P.Y, FTextExt.cy + LineSpacing);
    R:= Rect(
      P.X,
      P.Y - NSize.cy,
      P.X + NSize.cx,
      P.Y);

    if IntersectRect(R2, R, RClient) then
      InvertRect(Canvas.Handle, R);
  end;
end;

procedure TSyntaxMemo.SetStaticDraw;
begin
  FStaticDraw:= true;
  FCaretsTimer.Enabled:= false;
  Invalidate;
end;

procedure TSyntaxMemo.SetBlinkingDraw;
begin
  FStaticDraw:= false;
  FCaretsTimer.Enabled:= true;
end;

procedure TSyntaxMemo.Paint;
begin
  inherited;

  if Focused or (eoShowCaretWhenUnfocused in OptionsEx) then
    DoDrawCarets;
end;

procedure TSyntaxMemo.EdBeforeLineDraw(Sender: TObject; Rect: TRect; Line: Integer);
var
  NColor: TColor;
begin
  NColor:= DefaultStyles.CurrentLine.BgColor;
  if (CaretsColorIndicator = cciLineBg) and
    (NColor <> clNone) and
    (CaretsCount > 0) then
  begin
    //fix rect to hilite it fully
    Inc(Rect.Bottom, LineSpacing);
    
    if IsCaretOnLine(Line) then
    begin
      Canvas.Brush.Color:= NColor;
      Canvas.Pen.Color:= NColor;
      Canvas.Rectangle(Rect);
    end;
  end;
end;


procedure TSyntaxMemo.DoRemoveCaretsUndo(N: Integer);
begin
  if (N>=0) and (N<FListUndo.Count) then
  begin
    TObject(FListUndo[N]).Free;
    FListUndo.Delete(N);
  end;
end;

procedure TSyntaxMemo.DoClearCaretsUndo;
var
  i: Integer;
begin
  for i:= FListUndo.Count-1 downto 0 do
    DoRemoveCaretsUndo(i);
end;

procedure TSyntaxMemo.DoAddCaretsUndo;
var
  L: TList;
begin
  L:= TList.Create;
  L.Assign(FCarets);
  FListUndo.Add(L);

  //need more precise calculation of undo count,
  //not simple FListUndo.Count
  if UndoLimit>0 then
    while FListUndo.Count>UndoLimit do
      DoRemoveCaretsUndo(0);
end;

procedure TSyntaxMemo.DoCaretsUndo;
var
  n, i: Integer;
begin
  n:= FListUndo.Count;
  if n>0 then
  begin
    FCarets.Assign(FListUndo[n-1]);
    DoRemoveCaretsUndo(n-1);

    FCaretsCoord.Clear;
    for i:= 1 to FCarets.Count do
      FCaretsCoord.Add(nil);
  end;
end;

procedure TSyntaxMemo.DoCaretsFromSel(ALeftSide, AClearSel: boolean);
var
  NCol, NColLeft, NColRight,
  NTop, NBottom, i: Integer;
  NSelType: TCaretsColumnSelectionType;
begin
  if not CanSetCarets then Exit;

  if ALeftSide then
    NSelType:= ccsSelToLeft
  else
    NSelType:= ccsSelToRight;

  if HaveSelection then
    if (SelectMode=msColumn) then
    begin
      NColLeft:= LogToLinesPos(Point(SelRect.Left, SelRect.Top)).X; //consider Tabs
      NColRight:= LogToLinesPos(Point(SelRect.Right, SelRect.Top)).X; //consider Tabs

      NTop:= SelRect.Top;
      NBottom:= SelRect.Bottom;

      if AClearSel then
        ClearSelection;

      AddCaretsColumn(
        Point(NColLeft, NTop),
        Point(IfThen(AClearSel, NColLeft, NColRight), NBottom),
        NSelType);
    end
    else
    begin
      GetSelectedLines(NTop, NBottom);

      //special case, seltext in 1 line
      if NTop=NBottom then
      begin
        if ALeftSide then
          i:= SelStart
        else
          i:= SelStart+SelLength;

        if AClearSel then
          ClearSelection
        else
          ResetSelection;
        CaretStrPos:= i;
      end
      else
      //several lines selected
      begin
        NCol:= 0;
        if not ALeftSide then
          for i:= NTop to NBottom do
            NCol:= Max(NCol, Lines.LineLength(i));

        if AClearSel then
        begin
          BeginUpdate;
          for i:= NTop to NBottom do
            ReplaceText(CaretPosToStrPos(Point(0, i)), Lines.LineLength(i), '');
          EndUpdate;
        end;

        AddCaretsColumn(Point(NCol, NTop), Point(NCol, NBottom), NSelType);
      end;
    end;
end;

procedure TSyntaxMemo.DoCaretsExtend(ToUp: boolean; NLines: Integer);
var
  P: TPoint;
  i, j, NCount: Integer;
begin
  SetStaticDraw;

  //handle no carets case
  if CaretsCount=0 then
    AddCaret(CaretPos, 0, false);
  NCount:= Lines.Count;

  for i:= 0 to CaretsCount-1 do
  begin
    P:= GetCaret(i);
    for j:= 1 to NLines do
    begin
      if ToUp then Dec(P.Y) else Inc(P.Y);
      if (P.Y>=0) and (P.Y<NCount) then
        if not IsCaretAt(P) then
          DoAddCaretInt(P);
    end;
  end;

  DoUpdateCarets;
  SetBlinkingDraw;
  Change;
end;

function TSyntaxMemo.IsCtrlClickHandled(const P: TPoint): boolean;
begin
  Result:= false;
  if Assigned(FOnCtrlClick) then
    FOnCtrlClick(Self, P, Result);
end;

procedure TSyntaxMemo.DoCaretsFromMarks(ALeftSide, AClear: boolean);
var
  i, NStart, NEnd, NCaret, NSize: Integer;
begin
  if SearchMarks.Count=0 then Exit;

  //single search mark
  if SearchMarks.Count=1 then
  begin
    NStart:= SearchMarks[0].StartPos;
    NSize:= SearchMarks[0].Size;

    ResetSelection;
    RemoveCarets;

    if AClear then
    begin
      CaretStrPos:= NStart;
      ReplaceText(NStart, NSize, '');
    end
    else
    if ALeftSide then
    begin
      CaretStrPos:= NStart;
      SetSelection(NStart, NSize, true);
    end
    else
      SetSelection(NStart, NSize);

    ResetSearchMarks;
    Exit
  end;

  //multi search marks
  RemoveCarets;
  if not CanSetCarets then Exit;
  if SearchMarks.Count<2 then Exit;

  DoInitBaseEditor;
  SetStaticDraw;

  BeginUpdate;
  try
    if SearchMarks.Count>0 then
      NCaret:= SearchMarks[0].StartPos
    else
      NCaret:= CaretStrPos;

    for i:= SearchMarks.Count-1 downto 0 do
      with SearchMarks[i] do
      begin
        NStart:= StartPos;
        NEnd:= EndPos;
        NSize:= Size;

        if AClear then
        begin
          ReplaceText(NStart, NSize, '');
          DoAddCaretInt(StrPosToCaretPos(NStart));
        end
        else
        if ALeftSide then
          DoAddCaretInt(StrPosToCaretPos(NStart), NSize)
        else
          DoAddCaretInt(StrPosToCaretPos(NEnd), -NSize);

        if AClear then
          DoShiftCarets(StrPosToCaretPos(NStart), -NSize, 0);
      end;

    CaretStrPos:= NCaret;
    ResetSelection;
    ResetSearchMarks;
  finally
    EndUpdate;
  end;

  DoUpdateCarets;

  InvalidateGutter;
  SetBlinkingDraw;
  Change;
end;

procedure TSyntaxMemo.CaretsProps(var NTop, NBottom: integer);
var
  i: Integer;
  P: TPoint;
  Cnt: Integer;
begin
  Cnt:= CaretsCount;
  if Cnt=0 then Exit;

  P:= GetCaret(0);
  NTop:= P.Y;
  NBottom:= P.Y;

  for i:= 1 to CaretsCount-1 do
  begin
    P:= GetCaret(i);
    if P.Y < NTop then
      NTop:= P.Y;
    if P.Y > NBottom then
      NBottom:= P.Y;
  end;
end;

procedure TSyntaxMemo.DoUpdateMargins;
const
  cFixedMargins = 2; //one RightMargin, one caret-margin
var
  i, NCount: Integer;
begin
  NCount:= cFixedMargins + High(ColMarkers) + 1;
  while TextMargins.Count < NCount do
    TextMargins.Add;

  //line for caret-pos
  with TextMargins[1] do
  begin
    Visible:= opShowCurrentColumn;
    AllowDrag:= false;
    if Visible then
      Position:= LinesPosToLog(CaretPos).X;
    Pen.Color:= RightMarginColor;
  end;

  //lines for column-markers
  for i:= Low(ColMarkers) to High(ColMarkers) do
    with TextMargins[i+cFixedMargins] do
    begin
      Visible:= ColMarkers[i]>0;
      Position:= ColMarkers[i];
      Pen.Color:= RightMarginColor;
    end;
end;

function TSyntaxMemo.GetColMarkersString: string;
var
  i: integer;
begin
  Result:= '';
  for i:= Low(Colmarkers) to High(Colmarkers) do
    if Colmarkers[i]>0 then
      Result:= Result + IntToStr(Colmarkers[i]) + ' ';
  Result:= Trim(Result);
end;

procedure TSyntaxMemo.SetColMarkersString(const S: string);
var
  SItems, SItem: string;
  N, Index: Integer;
begin
  FillChar(ColMarkers, SizeOf(ColMarkers), 0);
  Index:= Low(ColMarkers);
  SItems:= S;
  repeat
    SItem:= SGetItem(SItems, ' ');
    if SItem='' then Exit;
    N:= StrToIntDef(SItem, 0);
    if N>0 then
    begin
      if Index>= High(ColMarkers) then Exit;
      ColMarkers[Index]:= N;
      Inc(Index);
    end;
  until false;
end;

procedure TSyntaxMemo.EditorZoom(Sender: TObject);
begin
  DoUpdateCarets;
end;

procedure TSyntaxMemo.DoJumpToNextTabstop;
var
  NPos, NLength, NTabstopIndex: Integer;
  bMirrorFound: boolean;
  i: Integer;
begin
  if IsTabstopMode then
  begin
    //MarkersLen[i] contain two values: (Length + TabstopIndex shl 16)
    //so LoWord(Integer(MarkersLen[i])) is length,
    //   HiWord(Integer(MarkersLen[i])) is tabstop index
    i:= Integer(MarkersLen.Last);
    NTabstopIndex:= HiWord(i);
    NLength:= LoWord(i);
    NPos:= TMarker(Markers.Last).Position; //don't use TMarker.CaretPos (incorrect)

    //process base tabstop
    CollectMarker;
    MarkersLen.Delete(MarkersLen.Count-1);

    RemoveCarets();

    //select from caret to the left side, don't move caret
    //this isn't ok:
    //  SetSelection(NPos-NLength, NLength, true);
    CaretStrPos:= NPos-NLength;
    SetSelection(CaretStrPos, 0);
    for i:= 1 to NLength do
      ExecCommand(smSelRight);

    //process mirror tabstops
    repeat
      bMirrorFound:= false;
      for i:= MarkersLen.Count-1 downto 0 do
        if HiWord(Integer(MarkersLen[i])) = NTabstopIndex then
        begin
          //add first caret for this tabstop
          if CaretsCount=0 then
            AddCaret(
              StrPosToCaretPos(NPos),
              -NLength,
              false);

          //add carets for mirrors
          AddCaret(
            StrPosToCaretPos(TMarker(Markers[i]).Position),
            -LoWord(Integer(MarkersLen[i])),
            false);

          Markers.Delete(i);
          MarkersLen.Delete(i);

          bMirrorFound:= true;
          Break;
        end;
      if not bMirrorFound then Break;
    until false;

    //update statusbar
    SelectionChanged;
  end;
end;

function TSyntaxMemo.IsTabstopMode: boolean;
begin
  Result:=
    (Markers.Count>0) and
    (MarkersLen.Count>0);
end;

end.
