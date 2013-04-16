unit unClip;

interface 

uses
  Windows, Messages, Forms, Classes, Controls, StdCtrls, TntStdCtrls,
  TntClasses;

type 
  TfmClip = class(TForm)
    ListClip: TTntListBox;
    procedure FormCreate(Sender : TObject);
    procedure FormDestroy(Sender : TObject);
    procedure FormShow(Sender: TObject);
    procedure ListClipDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FNextClipboardViewer: HWND;
    FItems: TTntStringList;
    procedure Unset;
  protected
    procedure WMChangeCBChain(var Msg : TWMChangeCBChain); message WM_CHANGECBCHAIN;
    procedure WMDrawClipboard(var Msg : TWMDrawClipboard); message WM_DRAWCLIPBOARD;
  public
    FColorSel,
    FColorSelBk: integer;
    procedure Set_;
    procedure Clear;
    function ItemAt(n: Integer): Widestring;
  end;

//var
//  fmClip : TfmClip;

implementation

uses Clipbrd, TntClipbrd,
  SysUtils,
  Graphics, ATxSProc, ecStrUtils;
{$R *.DFM}

procedure TfmClip.FormCreate(Sender : TObject);
begin 
  { Initialize variable }
  FNextClipboardViewer:= 0;
  //Props
  FItems:= TTntStringList.Create;
  FColorSel:= clHighlightText;
  FColorSelBk:= clHighlight;
end;

procedure TfmClip.Set_;
begin 
  if FNextClipboardViewer <> 0 then 
    MessageBox(0, 'Clipboard window is already registered!', 'SynWrite', 0) 
  else 
    { Add to clipboard chain }
    FNextClipboardViewer := SetClipboardViewer(Handle);
end;

procedure TfmClip.Unset;
begin
  if FNextClipboardViewer <> 0 then
  begin
    { Remove from clipboard chain }
    ChangeClipboardChain(Handle, FNextClipboardViewer);
    FNextClipboardViewer := 0;
  end;
end;

procedure TfmClip.WMChangeCBChain(var Msg : TWMChangeCBChain);
begin
  inherited; 
  { mark message as done } 
  Msg.Result := 0; 
  { the chain has changed } 
  if Msg.Remove = FNextClipboardViewer then 
    { The next window in the clipboard viewer chain had been removed. We recreate it. } 
    FNextClipboardViewer := Msg.Next 
  else 
    { Inform the next window in the clipboard viewer chain } 
    SendMessage(FNextClipboardViewer, WM_CHANGECBCHAIN, Msg.Remove, Msg.Next); 
end;

procedure TfmClip.WMDrawClipboard(var Msg : TWMDrawClipboard);
var
  S: Widestring;
  n: Integer;
begin
  inherited;
  { Clipboard content has changed }
  try
    if Clipboard.HasFormat(CF_TEXT) then
    begin
      try
        S:= TntClipboard.AsWideText;
      except
        Exit
      end;
          
      n:= FItems.IndexOf(S);
      if n >= 0 then
        FItems.Delete(n);
      FItems.Insert(0, S);

      with ListClip do
      begin
        Items.Clear;
        for n:= 0 to FItems.Count-1 do
        begin
          S:= FItems[n];
          if Length(S) > 200 then
            S:= Copy(S, 1, 200) + '...';
          Items.Add(S);
        end;
      end;
    end;
    //MessageBox(0, 'Clipboard content has changed!', 'Clipboard Viewer', MB_ICONINFORMATION);
  finally
    { Inform the next window in the clipboard viewer chain }
    SendMessage(FNextClipboardViewer, WM_DRAWCLIPBOARD, 0, 0);
  end;
end;

procedure TfmClip.FormDestroy(Sender : TObject);
begin
  FreeAndNil(FItems);
end;
 
procedure TfmClip.FormShow(Sender: TObject);
begin
//
end;

procedure TfmClip.ListClipDrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
var c: TColor;
  S, SS:Widestring;
  n:Integer;
begin
  with TTntListbox(Control) do
  begin
    if odSelected in State then
      Canvas.Brush.Color:= FColorSelBk
    else
      Canvas.Brush.Color:= Color;
    Canvas.FillRect(Rect);

    if odSelected in State then
      c:= FColorSel
    else
      c:= Font.Color;

    S:= Items[Index];
    Delete(S, 400, MaxInt);
    SReplaceAllW(S, #13#10, #13);
    SReplaceAllW(S, #10, #13);
    SReplaceAllW(S, #9, ' ');
    SS:= S;

    repeat
      n:= Pos(#13, S);
      if n>0 then
      begin
        SS:= Copy(S, 1, n-1);
        Canvas.Font.Color:= c;
        Inc(Rect.Left, 2);
        ecTextOut(Canvas, rect.left, rect.top, SS);
        Inc(Rect.Left, ecTextExtent(Canvas, SS).cx);
        Canvas.Font.Color:= clBlue;
        ecTextOut(Canvas, rect.left, rect.top, '/');
        Inc(Rect.Left, ecTextExtent(Canvas, '/').cx);
        Delete(S, 1, n);
      end
      else
      begin
        SS:= S;
        Canvas.Font.Color:= c;
        Inc(Rect.Left, 2);
        ecTextOut(Canvas, rect.left, rect.top, SS);
        Break
      end;
    until False;  
  end;
end;

procedure TfmClip.Clear;
begin
  FItems.Clear;
  ListClip.Items.Clear;
  ListClip.Hint:= '';
end;

function TfmClip.ItemAt(n: Integer): Widestring;
begin
  if (n >= 0) and (n < FItems.Count) then
    Result:= FItems[n]
  else
    Result:= '';
end;

procedure TfmClip.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Unset;
  Action:= caFree;
  //Messagebeep(0);
end;

end.
