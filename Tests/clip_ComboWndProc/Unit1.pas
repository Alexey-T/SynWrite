unit Unit1;

interface 

uses 
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
   Dialogs, StdCtrls; 

type 
   TCombobox = class( stdctrls.tcombobox)
   public
     FFEdit: TEdit; 
   protected 
     procedure ComboWndProc(var Message: TMessage; ComboWnd: HWnd;
       ComboProc: Pointer); override;
   end;

   TForm1 = class(TForm) 
     ComboBox1: TComboBox; 
     Memo1: TMemo;
    Edit1: TEdit;
    procedure FormCreate(Sender: TObject);
   private 
     { Private declarations } 
   public 
     { Public declarations } 
   end; 

var 
   Form1: TForm1; 

implementation 

{$R *.dfm} 

{ TCombobox } 

Procedure Report( const S: String ); 
 begin 
   form1.memo1.lines.add( S ); 
 end; 

procedure TCombobox.ComboWndProc(var Message: TMessage; ComboWnd: HWnd;
   ComboProc: Pointer); 
 begin
   Assert(Assigned(FFEdit));
   case message.Msg of
     WM_PASTE:
     begin
       SelText:= FFEdit.Text;
       message.Result:= 1;
     end;
     else
       inherited;
   end;
 end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Combobox1.FFEdit:= Edit1;
end;

end.
