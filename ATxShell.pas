unit ATxShell;

interface

function ApplyShellExtension(en: boolean): boolean;
function IsShellExtensionEnabled: boolean;

function ApplyFileAssoc(const ext: string; en: boolean): boolean;
function IsFileAssocEnabled(const ext: string): boolean;

implementation

uses
  SysUtils, Windows,
  ATxRegistry, Registry;

const
  RegKey0 = '*\shell\SynWrite';
  RegKey1 = RegKey0 + '\command';

  RegKeyAppName = 'SynWrite';
  RegKeyAppOpen = RegKeyAppName + '\Shell\Open\Command';
  RegKeyBak = 'SynWrite_bak';

function ShellValue: WideString;
begin
  Result:= '"' + ParamStr(0) + '" "%1"';
end;

function ApplyShellExtension(en: boolean): boolean;
begin
  if en then
    begin
    Result:=
      SetRegKeyStr(HKEY_CLASSES_ROOT, RegKey1, '', ShellValue);
    end
  else
    begin
    Result:=
      (RegDeleteKey(HKEY_CLASSES_ROOT, RegKey1) = ERROR_SUCCESS) and
      (RegDeleteKey(HKEY_CLASSES_ROOT, RegKey0) = ERROR_SUCCESS);
    end;
end;

function IsShellExtensionEnabled: boolean;
begin
  Result:=
    UpperCase(GetRegKeyStr(HKEY_CLASSES_ROOT, RegKey1, '', '')) = UpperCase(ShellValue);
end;

function ApplyFileAssoc(const ext: string; en: boolean): boolean;
var
  bak, NewDoc: Widestring;
begin
  if en then
  begin
    //backup
    bak:= GetRegKeyStr(HKEY_CLASSES_ROOT, '.'+ext, '', '');
    if bak<>'' then
      SetRegKeyStr(HKEY_CLASSES_ROOT, '.'+ext, RegKeyBak, bak);

    //set "HKEY_CLASSES_ROOT\.txt\@" to "SynWrite"
    //also set "HKEY_CLASSES_ROOT\SynWrite\@" to "Text Document"
    NewDoc:= GetRegKeyStr(HKEY_CLASSES_ROOT, 'txtfile', '', 'Text Document');
    Result:=
      SetRegKeyStr(HKEY_CLASSES_ROOT, '.'+ext, '', RegKeyAppName) and
      SetRegKeyStr(HKEY_CLASSES_ROOT, RegKeyAppName, '', NewDoc) and
      SetRegKeyStr(HKEY_CLASSES_ROOT, RegKeyAppOpen, '', ShellValue);
  end
  else
  begin
    //To restore, set "HKEY_CLASSES_ROOT\.txt\@" to "txtfile"
    with TRegistry.Create do
    try
      RootKey:= HKEY_CLASSES_ROOT;
      Result:= OpenKey('.'+ext, False);
      if not Result then Exit;
      try
        bak:= ReadString(RegKeyBak);
      except
        bak:= '';
      end;
      //if bak='' then
      //  bak:= ext + 'file';
      try
        if bak<>'' then
          WriteString('', bak)
        else
          DeleteValue('');  
        DeleteValue(RegKeyBak);
      except
        Result:= false;
      end;
    finally
      Free;
    end;
  end;  
end;

function IsFileAssocEnabled(const ext: string): boolean;
begin
  Result:=
    (GetRegKeyStr(HKEY_CLASSES_ROOT, '.'+ext, '', '') = RegKeyAppName) and
    (UpperCase(GetRegKeyStr(HKEY_CLASSES_ROOT, RegKeyAppOpen, '', '')) = UpperCase(ShellValue));
end;

end.
