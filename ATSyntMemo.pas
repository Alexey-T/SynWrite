{$define GotoWork}
{
Multi-carets memo add-on for EControl Syntax Editor SDK
(c) A. Torgashin, www.uvviewsoft.com

How to use unit:
add this unit to "uses" of your form, in "interface" part, after ecSyntMemo item.
This will replace ecSyntMemo.TSyntaxMemo with this TSyntaxMemo
(it's descendant of usual TSyntaxMemo).

Usage in app:
- Ctrl+click to set additional carets
- click then Ctrl+Shift+click to set carets aligned in column
- Ctrl+click a caret to remove it

Additional properties:
- CaretsEnabled
- CaretsCount
- CaretsGutterBand
- CaretsGutterColor
- CaretsColorIndicator
Additional methods:
- AddCaret
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
  ecSyntMemo;

var
  opSeparateCopiedLines: boolean = false;

type
  TCaretsColorIndicator = (cciNone, cciLineBg, cciGutterBg);

type
  TOnCtrlClick = procedure(Sender: TObject; const Pnt: TPoint; var Handled: boolean) of object;

type
  TSyntaxMemo = class(ecSyntMemo.TSyntaxMemo)
  private
    FCaretsEnabled: boolean;
    FCaretsColorIndicator: TCaretsColorIndicator;
    FCaretsTimer: TTimer;
    FCarets: TList;
    FCaretsCoord: TList;
    FCaretsGutterBand: Integer;
    FCaretsGutterColor: TColor;
    FTextExt: TSize;
    FDefaultCaret: TPoint;
    FPrevReplaceMode: boolean;
    FPrevDrawFocus,
    FPrevDrawLine: boolean;
    FPrevSaved: boolean;
    FListDups: TList;
    FListUndo: TList;
    FStaticDraw: boolean;
    FOnCtrlClick: TOnCtrlClick;
    procedure SetStaticDraw;
    procedure SetBlinkingDraw;
    procedure SetCaretsEnabled(Val: boolean);
    procedure DoUpdateCaretPos(N: Integer);
    procedure DoUpdateLastCaret;
    procedure CaretTimerTimer(Sender: TObject);
    procedure DoUpdateCarets;
    procedure EdGetGutterBandColor(Sender: TObject; NBand: Integer; NLine: Integer; var NColor: TColor);
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
    procedure DoListDupLines(L: TList);
    function GetCaret(N: Integer): TPoint;
    procedure SetCaret(N: Integer; const P: TPoint);
    function GetCaretCoord(N: Integer): TPoint;
    procedure SetCaretCoord(N: Integer; const P: TPoint);
    procedure GetDrawCoord(var NSize: TSize; var RClient: TRect);
    procedure DoDrawCarets;
    procedure DoSaveBaseEditor;
    procedure DoInitBaseEditor;
    procedure DoRestoreBaseEditor;
    procedure EdBeforeLineDraw(Sender: TObject; Rect: TRect; Line: Integer);
    procedure DoRemoveCaretsUndo(N: Integer);
    procedure DoClearCaretsUndo;
    procedure DoAddCaretsUndo;
    procedure DoCaretsUndo;
    procedure DoCaretsFromSel(ALeft, AClearSel: boolean);
    procedure DoCaretsFromMarks(ALeft, AClear: boolean);
    procedure DoCaretsExtend(ToUp: boolean; NLines: Integer);
    procedure DoAddCaretInt(P: TPoint);
    function IsCtrlClickHandled(const P: TPoint): boolean;
    function CanSetCarets: boolean;
  protected
    procedure DoScroll; override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure Paint; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure AddCaret(const P: TPoint; AddDefaultPos: boolean = true);
    procedure AddCaretsColumn(const PFrom, PTo: TPoint);
    procedure RemoveCarets(LeaveFirst: boolean = true);
    function CaretsCount: Integer;
    procedure CaretsProps(var NTop, NBottom: integer);
    property CaretsEnabled: boolean read FCaretsEnabled write SetCaretsEnabled;
    property CaretsColorIndicator: TCaretsColorIndicator read FCaretsColorIndicator write FCaretsColorIndicator;
    property CaretsGutterBand: Integer read FCaretsGutterBand write FCaretsGutterBand;
    property CaretsGutterColor: TColor read FCaretsGutterColor write FCaretsGutterColor;
    procedure ExecCommand(Command: integer; Data: Pointer = nil); override;
    procedure DoShowInfo;
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
  ecStrUtils,
  ecCmdConst;

function SLineWidth(const S: Widestring): Integer;
var n: Integer;
begin
  n:= Pos(#13, S);
  if n=0 then
    Result:= Length(S)
  else
    Result:= n-1;  
end;

function SLineHeight(const S: Widestring): Integer;
var i: Integer;
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

  FCarets:= TList.Create;
  FCaretsCoord:= TList.Create;
  FListDups:= TList.Create;
  FListUndo:= TList.Create;

  FCaretsTimer:= TTimer.Create(Self);
  FCaretsTimer.Enabled:= false;
  FCaretsTimer.Interval:= GetCaretBlinkTime;
  FCaretsTimer.OnTimer:= CaretTimerTimer;

  FCaretsEnabled:= true;
  FCaretsColorIndicator:= cciGutterBg;
  FCaretsGutterBand:= 0;
  FCaretsGutterColor:= clLtGray;
  FOnCtrlClick:= nil;
  
  OnGetGutterBandColor:= EdGetGutterBandColor;
  OnBeforeLineDraw:= EdBeforeLineDraw;
end;

destructor TSyntaxMemo.Destroy;
begin
  FreeAndNil(FListDups);
  DoClearCaretsUndo;
  FreeAndNil(FListUndo);

  FreeAndNil(FCaretsTimer);
  FreeAndNil(FCarets);
  FreeAndNil(FCaretsCoord);
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
    //DoShowInfo; //debug
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

procedure TSyntaxMemo.DoAddCaretInt(P: TPoint);
begin
  DoKeepCaretInText(P);

  FCarets.Add(Pointer(P.X));
  FCarets.Add(Pointer(P.Y));
  FCaretsCoord.Add(nil);
  FCaretsCoord.Add(nil);
end;

function TSyntaxMemo.CanSetCarets: boolean;
begin
  Result:= (TextLength>0) and FCaretsEnabled and not ReadOnly;
end;

procedure TSyntaxMemo.AddCaret(const P: TPoint; AddDefaultPos: boolean = true);
begin
  if not CanSetCarets then Exit;
  DoInitBaseEditor;
  SetStaticDraw;

  if (CaretsCount=0) and AddDefaultPos then
  begin
    DoAddCaretInt(FDefaultCaret);
    DoUpdateLastCaret;
  end;

  DoAddCaretInt(P);
  DoUpdateLastCaret;

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

procedure TSyntaxMemo.EdGetGutterBandColor(Sender: TObject; NBand,
  NLine: Integer; var NColor: TColor);
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
  i: Integer;
begin
  Result:= false;
  for i:= 0 to CaretsCount-1 do
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
        DoCaretsExtend(true, ClientHeight div DefLineHeight);
        Ok:= true;
      end;
    smCaretsDownPage:
      begin
        DoCaretsExtend(false, ClientHeight div DefLineHeight);
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

      100..300, //Shift+arrows /Alt+arrows
      smSelectAll:
        begin
          RemoveCarets;
          inherited;
        end;

      else
        inherited;
    end;
end;

const
  cShiftToHome = -(MaxInt div 2);

procedure TSyntaxMemo.DoCaretsCommand(Cmd: Integer; Data: Pointer);
var
  NShiftX,
  NShiftY: Integer;

  procedure DoDelLine(const P: TPoint);
  var
    N: Integer;
  begin
    N:= CaretPosToStrPos(Point(0, P.Y));
    if ReplaceText(N, Lines.LineSpace(P.Y), '') then
      NShiftY:= -1;
  end;

  procedure DoInputText(const S: Widestring; var P: TPoint);
  var
    Len, RepLen: Integer;
  begin
    Len:= Lines.LineLength(P.Y);
    if (P.X>Len) and not (soKeepCaretInText in Options) then
      ReplaceText(CaretPosToStrPos(Point(Len, P.Y)), 0, StringOfChar(' ', P.X - Len));
    RepLen:= IfThen(ReplaceMode, Min(Length(S), Max(0, Len-P.X)), 0);

    if ReplaceText(CaretPosToStrPos(P), RepLen, S) then
    begin
      Len:= SLineWidth(S);
      Inc(P.X, Len);
      NShiftX:= IfThen(ReplaceMode, 0, Len);
      NShiftY:= SLineHeight(S)-1;
    end;
  end;

  function NeedToSkip(NCaret: Integer): boolean;
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

var
  P, PFrom: TPoint;
  i, N, N2: Integer;
  ch: WideChar;
  S: Widestring;
  b: boolean;
begin
  SetStaticDraw;

  DoSortCarets;
  DoListDupLines(FListDups);

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

  //need to clear Clipboard?
  case Cmd of
    smCopy,
    smCut:
      TntClipboard.Clear;
  end;

  BeginUpdate;
  for i:= CaretsCount-1 downto 0 do
  if not NeedToSkip(i) then
  begin
    P:= GetCaret(i);
    PFrom:= P;
    NShiftX:= 0;
    NShiftY:= 0;

    case Cmd of
      smCopy,
      smCut:
        try
          TntClipboard.AsWideText:=
            Lines[P.Y] + sLineBreak +
            IfThen(opSeparateCopiedLines, sLineBreak) +
            TntClipboard.AsWideText;
          if Cmd=smCut then
            DoDelLine(P);
        except
        end;

      smPaste:
        try
          S:= TntClipboard.AsWideText;
          DoInputText(S, P);
        except
        end;

      smBlockIndent,
      smBlockUnindent:
        begin
          if not ReadOnly then
          begin
            N:= IfThen(Cmd=smBlockIndent, BlockIndent, -BlockIndent);
            IndentLines(P.Y, P.Y, N, 0, true);
            Inc(P.X, N);
            if P.X<0 then P.X:= 0;
            NShiftX:= N;
          end;
        end;

      smDeleteLine:
        DoDelLine(P);

      smDeleteWord:
        begin
          N:= CaretPosToStrPos(P);
          N2:= DoWordJumpPos(N, true);
          if ReplaceText(N, N2-N, '') then
            NShiftX:= -(N2-N);
        end;

      smDeleteLastWord:
        begin
          N:= CaretPosToStrPos(P);
          N2:= DoWordJumpPos(N, false);
          if ReplaceText(N2, N-N2, '') then
          begin
            NShiftX:= -(N-N2);
            P:= StrPosToCaretPos(N2);
          end;
        end;

      smDeleteBOL:
        begin
          N2:= CaretPosToStrPos(Point(0, P.Y));
          if ReplaceText(N2, Min(Lines.LineLength(P.Y), P.X), '') then
            P:= StrPosToCaretPos(N2);
        end;
      smDeleteEOL:
        begin
          N:= CaretPosToStrPos(P);
          if P.X < Lines.LineLength(P.Y) then
            ReplaceText(N, Lines.LineLength(P.Y) - P.X, '');
        end;

      smLineBreakSoft,
      smLineBreak:
        begin
          N:= IfThen(soAutoIndentMode in Options,
            GetIndent(P.Y, LinesPosToLog(P).X + 1), 0);
          S:= SEol(Cmd=smLineBreakSoft) + StringOfChar(' ', N);
          if ReplaceText(CaretPosToStrPos(P), 0, S) then
          begin
            Inc(P.Y);
            P.X:= N;
            NShiftY:= 1;
            NShiftX:= cShiftToHome - N;
          end;
        end;

      smInsertLine:
        begin
          S:= SEol(false);
          if ReplaceText(CaretPosToStrPos(P), 0, S) then
          begin
            NShiftY:= 1;
            NShiftX:= cShiftToHome;
          end;  
        end;

      smDeleteChar:
        begin
          if P.X<Lines.LineLength(P.Y) then
            b:= ReplaceText(CaretPosToStrPos(P), 1, '')
          else
            b:= ReplaceText(CaretPosToStrPos(P), {Lines.LineSpace(P.Y)-Lines.LineLength(P.Y)}Length(Lines.LineEndStr(P.Y)), '');
          if b then
            NShiftX:= -1;  
        end;

      smDeleteLastChar:
        begin
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
            if ReplaceText(CaretPosToStrPos(P), {Lines.LineSpace(P.Y)-Lines.LineLength(P.Y)}Length(Lines.LineEndStr(P.Y)), '') then
            begin
              NShiftX:= 1;
              NShiftY:= -1;
            end;
          end;
        end;

      smChar:
        begin
          ch:= PWChar(Data)^;
          if ch>=' ' then
            DoInputText(ch, P);
        end;
      smString:
        begin
          S:= PWChar(Data);
          DoInputText(S, P);
        end;

      smTab:
        begin
          case TabMode of
            tmSpaces,
            tmSmartTab:
             begin
               N:= LinesPosToLog(P).X;
               if TabMode = tmSpaces then
                 N2:= TabList.NextTab(N, False)
               else
                 N2:= GetSmartPos(N, P.Y);
               DoInputText(StringOfChar(' ', N2-N), P)
             end;
            tmTabChar:
              DoInputText(#9, P);
          end;
        end;
      smTabChar:
        DoInputText(#9, P);

      smLeft:
        begin
          if {not (soKeepCaretInText in Options) or} (P.X > 0) then
            P:= SkipHidden(P.X - 1, P.Y, False)
          else
          if P.Y > 0 then
            P:= SkipHidden(Lines.LineLength(P.Y - 1), P.Y - 1, False);
        end;

      smRight:
        begin
          if not (soKeepCaretInText in Options) or (P.X < Lines.LineLength(P.Y)) then
            P:= SkipHidden(P.X + 1, P.Y, True)
          else
          if P.Y < Lines.Count - 1 then
            P:= SkipHidden(0, P.Y + 1, True);
        end;

      smUp:
        begin
          if P.Y>0 then 
            Dec(P.Y);
          DoKeepCaretInText(P);
        end;

      smDown:
        begin
          if P.Y<Lines.Count-1 then
            Inc(P.Y);
          DoKeepCaretInText(P);
        end;

      smWordLeft,
      smWordRight:
        begin
          P:= StrPosToCaretPos(DoWordJumpPos(CaretPosToStrPos(P), Cmd=smWordRight));
        end;

      smLineStart,
      smFirstLetter:
        begin
          P.X:= 0;
        end;

      smLineEnd,
      smLastLetter:
        begin
          P.X:= Lines.LineLength(P.Y);
        end;
    end;

    DoShiftCarets(PFrom, NShiftX, NShiftY);
    SetCaret(i, P);
  end;
  EndUpdate;

  //scroll editor if carets moved up/down
  case Cmd of
    smUp:
      begin
        //scroll 1 line up, and only if needed
        if GetCaret(0).Y <= TopLine then
          ExecCommand(smScrollUp);
      end;
    smDown:
      begin
        //scroll 1 line down, only if needed
        if GetCaret(CaretsCount-1).Y >= TopLine + ClientHeight div DefLineHeight - 2 then
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

  DoUpdateCarets;
  SetBlinkingDraw;
  Change;
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


procedure TSyntaxMemo.MouseDown(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
var
  PTo: TPoint;
begin
  if CanSetCarets then
  begin
    FDefaultCaret:= CaretPos;
    PTo:= MouseToCaret(X, Y);

    if (ssCtrl in Shift) and not (ssAlt in Shift) then
    begin
      if (ssShift in Shift) then
      begin
        AddCaretsColumn(FDefaultCaret, PTo);
      end
      else
      if IsCtrlClickHandled(PTo) then
        inherited
      else
      if not DoRemoveCaret(PTo) then
      begin
        AddCaret(PTo);
        CaretPos:= PTo;
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
begin
  inherited;

  //remove carets as Ctrl+Alt+drag can be used to select lines
  if HaveSelection then
    RemoveCarets;
end;

procedure TSyntaxMemo.AddCaretsColumn(const PFrom, PTo: TPoint);
var
  i, N1, N2: Integer;
begin
  if not CanSetCarets then Exit;
  ResetSelection;
  RemoveCarets;

  DoInitBaseEditor;
  SetStaticDraw;

  N1:= Min(PFrom.Y, PTo.Y);
  N2:= Max(PFrom.Y, PTo.Y);
  for i:= N1 to N2 do
    DoAddCaretInt(Point(PFrom.X, i));

  DoUpdateCarets;
  CaretPos:= PTo;

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
  LS: TStringList;
  LNew: TList;
  i, N: Integer;
  P: TPoint;
begin
  LS:= TStringList.Create;
  LNew:= TList.Create;
  try
    for i:= 0 to CaretsCount-1 do
    begin
      P:= GetCaret(i);
      LS.AddObject(Format('%10.10d %10.10d', [P.Y, P.X]), Pointer(i));
    end;
    LS.Sort;

    LNew.Clear;
    for i:= 0 to LS.Count-1 do
    begin
      N:= Integer(LS.Objects[i]);
      P:= GetCaret(N);
      LNew.Add(Pointer(P.X));
      LNew.Add(Pointer(P.Y));
    end;

    FCarets.Assign(LNew);
  finally
    FreeAndNil(LNew);
    FreeAndNil(LS);
  end;
end;

procedure TSyntaxMemo.DoListDupLines(L: TList);
var
  i, Y1, Y2: Integer;
begin
  Assert(Assigned(L));
  L.Clear;
  for i:= 0 to Pred(CaretsCount-1) do
  begin
    Y1:= GetCaret(i).Y;
    Y2:= GetCaret(i+1).Y;
    if (Y1=Y2) and (L.IndexOf(Pointer(Y1))<0) then
      L.Add(Pointer(i+1));
  end;
end;

procedure TSyntaxMemo.DoRemoveCaretIndex(N: Integer);
begin
  FCarets.Delete(N*2+1);
  FCarets.Delete(N*2);
  FCaretsCoord.Delete(N*2+1);
  FCaretsCoord.Delete(N*2);
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
        Invalidate;
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

procedure TSyntaxMemo.GetDrawCoord(var NSize: TSize; var RClient: TRect);
const
  cDefCaretWidth = 2;
var
  NDefWidth: Integer;
begin
  NDefWidth:= IfThen(Caret.Insert.Width<0, cDefCaretWidth, FTextExt.cx * Caret.Insert.Width div 100);
  NSize.cx:= IfThen(ReplaceMode, FTextExt.cx, NDefWidth);
  NSize.cy:= IfThen(ReplaceMode, FTextExt.cy + LineSpacing, (FTextExt.cy + LineSpacing) * Caret.Insert.Height div 100);

  RClient:= ClientRect;
  Inc(RClient.Left, Gutter.Width);
end;

procedure TSyntaxMemo.DoDrawCarets;
var
  i: Integer;
  P: TPoint;
  R, R2, RClient: TRect;
  NSize: TSize;
begin
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

  if not Focused and not (eoShowCaretWhenUnfocused in OptionsEx) then
    Exit;
  
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

procedure TSyntaxMemo.DoCaretsFromSel(ALeft, AClearSel: boolean);
var
  NCol, NTop, NBottom, i: Integer;
begin
  if not CanSetCarets then Exit;
  if HaveSelection then
    if (SelectMode=msColumn) then
    begin
      NCol:= IfThen(ALeft, SelRect.Left, SelRect.Right); //logical X
      NCol:= LogToLinesPos(Point(NCol, SelRect.Top)).X; //consider Tabs
      NTop:= SelRect.Top;
      NBottom:= SelRect.Bottom;

      if AClearSel then
        ClearSelection;

      AddCaretsColumn(Point(NCol, NTop), Point(NCol, NBottom));
    end
    else
    begin
      GetSelectedLines(NTop, NBottom);

      //special case, seltext in 1 line
      if NTop=NBottom then
      begin
        if ALeft then
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
        if not ALeft then
          for i:= NTop to NBottom do
            NCol:= Max(NCol, Lines.LineLength(i));

        if AClearSel then
        begin
          BeginUpdate;
          for i:= NTop to NBottom do
            ReplaceText(CaretPosToStrPos(Point(0, i)), Lines.LineLength(i), '');
          EndUpdate;
        end;

        AddCaretsColumn(Point(NCol, NTop), Point(NCol, NBottom));
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
    AddCaret(CaretPos, false);
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

procedure TSyntaxMemo.DoCaretsFromMarks(ALeft, AClear: boolean);
var
  i, NStart, NEnd, NCaret, NSize: Integer;
begin
  if not CanSetCarets then Exit;
  ResetSelection;
  if SearchMarks.Count=0 then Exit;
  RemoveCarets;

  DoInitBaseEditor;
  SetStaticDraw;

  BeginUpdate;
  NCaret:= SearchMarks[0].StartPos;
  for i:= SearchMarks.Count-1 downto 0 do
    with SearchMarks[i] do
    begin
      NStart:= StartPos;
      NEnd:= EndPos;
      NSize:= Size;

      if AClear then
        ReplaceText(NStart, NSize, '');

      if ALeft then
        DoAddCaretInt(StrPosToCaretPos(NStart))
      else
        DoAddCaretInt(StrPosToCaretPos(NEnd));

      if AClear then
        DoShiftCarets(StrPosToCaretPos(NStart), -NSize, 0);
    end;
  CaretStrPos:= NCaret;
  EndUpdate;

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

end.
