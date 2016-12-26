{
  An application can be notified of changes in the data stored in the 
  Windows clipboard by registering itself as a Clipboard Viewer. 
  Clipboard viewers use two API calls and several messages to communicate 
  with the Clipboard viewer chain. SetClipboardViewer adds a window to the 
  beginning of the chain and returns a handle to the next viewer in the chain. 
  ChangeClipboardChain removes a window from the chain. When a clipboard change occurs, 
  the first window in the clipboard viewer chain is notified via the WM_DrawClipboard 
  message and must pass the message on to the next window. To do this, our application 
  must store the next window along in the chain to forward messages to and also respond 
  to the WM_ChangeCBChain message which is sent whenever any other clipboard viewer on 
  the system is added or removed to ensure the next window along is valid. 
} 
unit Unit1; 
interface 
uses 
  Windows, Messages, Forms, Classes, Controls, StdCtrls, TntStdCtrls;
type 
  TFormClip = class(TForm)
    ListClip: TTntListBox;
    procedure FormCreate(Sender : TObject);
    procedure FormDestroy(Sender : TObject);
  private
    FNextClipboardViewer: HWND;
    procedure Set_;
    procedure Unset;
    procedure WMChangeCBChain(var Msg : TWMChangeCBChain); message WM_CHANGECBCHAIN;
    procedure WMDrawClipboard(var Msg : TWMDrawClipboard); message WM_DRAWCLIPBOARD;
  end;

var 
  FormClip : TFormClip;
implementation

uses Clipbrd, TntClipbrd;
{$R *.DFM}

procedure TFormClip.FormCreate(Sender : TObject);
begin 
  { Initialize variable }
  FNextClipboardViewer := 0;
  Set_;
end;

procedure TFormClip.Set_;
begin 
  if FNextClipboardViewer <> 0 then 
    MessageBox(0, 'This window is already registered!', nil, 0) 
  else 
    { Add to clipboard chain } 
    FNextClipboardViewer := SetClipboardViewer(Handle);
end;

procedure TFormClip.Unset;
begin
  { Remove from clipboard chain }
  ChangeClipboardChain(Handle, FNextClipboardViewer);
  FNextClipboardViewer := 0;
end;

procedure TFormClip.WMChangeCBChain(var Msg : TWMChangeCBChain);
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

procedure TFormClip.WMDrawClipboard(var Msg : TWMDrawClipboard);
var
  S: Widestring;
  n: Integer;
begin
  inherited;
  { Clipboard content has changed }
  try
    if Clipboard.HasFormat(CF_TEXT) then
    begin
      S:= TntClipboard.AsWideText;
      n:= ListClip.Items.IndexOf(S);
      if n >= 0 then
        ListClip.Items.Delete(n);
      ListClip.Items.Insert(0, S);
    end;
    //MessageBox(0, 'Clipboard content has changed!', 'Clipboard Viewer', MB_ICONINFORMATION);
  finally
    { Inform the next window in the clipboard viewer chain }
    SendMessage(FNextClipboardViewer, WM_DRAWCLIPBOARD, 0, 0);
  end;
end;

procedure TFormClip.FormDestroy(Sender : TObject);
begin 
  if FNextClipboardViewer <> 0 then
  begin
    { Remove from clipboard chain }
    ChangeClipboardChain(Handle, FNextClipboardViewer);
    FNextClipboardViewer := 0;
  end;
end;
 
end. 
