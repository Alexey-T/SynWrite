(**
===============================================================================================
Name    : Main
===============================================================================================
Project : "Tar Explorer"
===============================================================================================
Subject : Main Window
===============================================================================================
Date        Author Changes
-----------------------------------------------------------------------------------------------
2001-04-28  HeySt  First publication
*)

unit Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, ImgList, ComCtrls, ToolWin, ActnList,
  LibTar;

type
  TFrmMain = class(TForm)
    ToolBar: TToolBar;
    ToolButton1: TToolButton;
    IglToolBar: TImageList;
    MnuMain: TMainMenu;
    MnuFile: TMenuItem;
    Open1: TMenuItem;
    N1: TMenuItem;
    MnuExit: TMenuItem;
    LvwFiles: TListView;
    StatusBar: TStatusBar;
    ActionList: TActionList;
    ActFileOpen: TAction;
    ActExit: TAction;
    DlgOpenTar: TOpenDialog;
    DlgSave: TSaveDialog;
    ActExtract: TAction;
    ToolButton2: TToolButton;
    ExtractFile1: TMenuItem;
    procedure ActExitExecute(Sender: TObject);
    procedure ActFileOpenExecute(Sender: TObject);
    procedure ActExtractExecute(Sender: TObject);
  private
  public
  end;

var
  FrmMain: TFrmMain;

(*
===============================================================================================
IMPLEMENTATION
===============================================================================================
*)

IMPLEMENTATION

{$R *.DFM}

procedure TFrmMain.ActExitExecute(Sender: TObject);
begin
  Close
end;

procedure TFrmMain.ActFileOpenExecute(Sender: TObject);
VAR
  TA         : TTarArchive;
  Item       : TListItem;
  DirRec     : TTarDirRec;
  Pos, Size  : INT64;
  Bytes      : INT64;
begin
  IF NOT DlgOpenTar.Execute THEN EXIT;

  LvwFiles.Items.BeginUpdate;
  TRY
    LvwFiles.Items.Clear;
    TA := TTarArchive.Create (DlgOpenTar.Filename);
    TRY
      TA.Reset;
      Bytes := 0;
      WHILE TA.FindNext (DirRec) DO BEGIN
        Item := LvwFiles.Items.Add;
        Item.Caption := string (DirRec.Name);
        Item.SubItems.Add (IntToStr (DirRec.Size));
        Item.SubItems.Add (FormatDateTime (ShortDateFormat + ' HH:NN:SS', DirRec.DateTime));
        Item.SubItems.Add (PermissionString (DirRec.Permissions) + ' ' + FILETYPE_NAME [DirRec.FileType]);
        Item.SubItems.Add (IntToStr (DirRec.UID)+'-'+string (DirRec.UserName) + ' / ' +
                           IntToStr (DirRec.GID)+'-'+string (DirRec.GroupName));
        Item.SubItems.Add (string (DirRec.LinkName));
        Item.Data := POINTER (DirRec.FilePos);
        TA.GetFilePos (Pos, Size);
        StatusBar.Panels[0].Text := IntToStr (Pos * 100 DIV Size) + ' %';
        StatusBar.Refresh;
        Bytes := Bytes + DirRec.Size;
        IF GetAsyncKeyState (vk_Escape) AND $8000 <> 0 THEN BREAK;
        END;
    FINALLY
      TA.Free;
      END;
  FINALLY
    LvwFiles.Items.EndUpdate;
    END;
  StatusBar.Panels[0].Text := IntToStr (LvwFiles.Items.Count) + ' Files';
  StatusBar.Panels[1].Text := IntToStr (Bytes) + ' Bytes';
end;

procedure TFrmMain.ActExtractExecute(Sender: TObject);
VAR
  Item      : TListItem;
  Filename  : STRING;
  LastSlash : PChar;
  TA        : TTarArchive;
  DirRec    : TTarDirRec;
begin
  Item := LvwFiles.Selected;
  IF Item = NIL THEN EXIT;
  Filename := Item.Caption;
  LastSlash := StrRScan (PChar (Filename), '/');
  IF LastSlash <> NIL THEN
    Filename := String (LastSlash+1);
  DlgSave.DefaultExt := Copy (ExtractFileExt (Filename), 2, MaxInt);
  DlgSave.Filename := Filename;
  IF NOT DlgSave.Execute THEN EXIT;

  TA := TTarArchive.Create (DlgOpenTar.Filename);
  TRY
    TA.Reset;
    TA.SetFilePos (INTEGER (Item.Data));
    TA.FindNext (DirRec);
    IF string (DirRec.Name) <> Item.Caption THEN BEGIN
      ShowMessage ('Filename mismatch. I''ll better not save this file.');
      EXIT;
      END;
    Screen.Cursor := crHourGlass;
    TRY
      TA.ReadFile (DlgSave.Filename);
    FINALLY
      Screen.Cursor := crDefault;
      END;
  FINALLY
    TA.Free;
    END;
end;

end.
