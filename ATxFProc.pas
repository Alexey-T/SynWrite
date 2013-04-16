unit ATxFProc;

interface

uses
  Windows, Classes, TntClasses;

type
  TExecCode = (exOk, exCannotRun, exExcept);

var
  StopFind: boolean = false; //FFindToList stops when true
  opBeep: boolean = true; //Allow beeps
  opUtf8BufferSizeKb: integer = 32;

function FormatSize(const Size: Int64; Bytes: boolean): string;
function FormatFileTime(const ft: TFileTime): string;
function FormatFileTimeAlt(const ft: TFileTime): string;
function FormatFileTimeFmt(const ft: TFileTime; const Fmt: string): string;

procedure MsgBeep(Err: boolean = false);

function FReadString(const fn: string): string;
function FFindInSubdirs(const sname, sdir: Widestring; var fn: Widestring): boolean;
function FAppDataPath: string;
function FExecProcess(const CmdLine, CurrentDir: Widestring; ShowCmd: integer; DoWait: boolean): TExecCode;
procedure FReadSection(const fn, sec: string; L: TStringList);
procedure FFindToList(List: TTntStringList;
  const SDir, SMask: Widestring; ASubDir: boolean;
  ANoRO: boolean;
  ANoHidFiles: boolean;
  ANoHidFolders: boolean);
function IsFilenameFixed(const fn: Widestring): Boolean;
function IsFileExist(const FileName: WideString; var IsDir: Boolean): Boolean; overload;
function IsFileExist(const FileName: WideString): Boolean; overload;
function IsFileOrDirExist(const FileName: WideString): Boolean;
function IsDirExist(const DirName: WideString): Boolean;
function IsFileAccessed(const FileName: WideString): Boolean;
function IsFileWritable(const FileName: WideString): boolean;

function FFileOpen(const FileName: WideString): THandle;
function FFileCopy(const OldName, NewName: WideString): Boolean;
function FFileMove(const OldName, NewName: WideString): Boolean;
function FGetFileSize(const FileName: WideString): Int64; overload;
function FGetFileSize(Handle: THandle): Int64; overload;
function FGetFileInfo(const FileName: WideString; var Size: Int64; var Time: TFileTime): Boolean;
function FGetShortName(const FileName: WideString): WideString;
function FGetFullPathName(const FileName: WideString): WideString;

type
  PInt64Rec = ^TInt64Rec;
  TInt64Rec = packed record
    Lo, Hi: DWORD;
  end;

function FExecuteGetCode(const fn, params: Widestring;
  ShowCmd: integer; fWait: boolean; var ExitCode: Cardinal): boolean;
function FOpenURL(const URL: WideString; hWnd: THandle): Boolean;
function FExecute(const Command, Params, Dir: WideString; hWnd: THandle): Boolean;
function FCreateDir(const FileName: WideString): Boolean;

function IsFileXmlUTF8(const fn: WideString): boolean;
function IsFileUTF8NoBOM(const fn: WideString): boolean;
function IsFileUnicode(h: THandle): Boolean;
function IsFileUTF8(h: THandle): Boolean;
function IsFileRTF(h: THandle): Boolean;
function IsFileWeb(h: THandle): Boolean;
procedure IsFileRTFAndUTF8(const AFileName: WideString; var IsRTF, IsUTF8: Boolean);
function IsFileText(h: THandle; BufSizeKb: DWORD; DetectOEM: Boolean; var IsOEM: Boolean): Boolean; overload;
function IsFileText(const fn: WideString): boolean; overload;
function IsFileUnicodeNoBOM(const fn: Widestring; var IsBE: boolean): boolean; overload;
function IsFileWithBOM(const fn: Widestring): boolean;

//Convertion of Unicode filename to ANSI one:
//1. Trying to simply convert Unicode string_ to ANSI
//2. If not successfull, trying to get short name, it's always ANSI
//3. If not successfull, function returns empty string_ (fails)
function FFileNameWideToAnsi(const FileName: WideString): AnsiString;

function FFindFirstFile(const DirName, Mask: WideString): WideString;
function FDelete(const FileName: WideString): Boolean;
function FDeleteToRecycle(Handle: THandle; const FileName: WideString; ToRecycle: Boolean = True): Boolean;
procedure FShowProperties(const fn: WideString; hWnd: THandle);


implementation

uses
  SysUtils, StrUtils,
  ShellAPI,
  SHFolder,
  TntSysUtils, Forms,
  ATxUTF8Detect;

function IsFilenameFixed(const fn: Widestring): Boolean;
var
  Dir: Widestring;
begin
  Result := false;
  if Pos(':\', fn) = 2 then
  begin
    Dir:= Copy(fn, 1, 3);
    if Win32Platform = VER_PLATFORM_WIN32_NT then
      Result:= GetDriveTypeW(PWChar(Dir)) = DRIVE_FIXED
    else
      Result:= GetDriveTypeA(PAnsiChar(AnsiString(Dir))) = DRIVE_FIXED
  end;
end;

function IsFileExist(const FileName: WideString; var IsDir: Boolean): Boolean; overload;
var
  h: THandle;
  fdA: TWin32FindDataA;
  fdW: TWin32FindDataW;
begin
  IsDir := False;
  if Win32Platform = VER_PLATFORM_WIN32_NT then
  begin
    h := FindFirstFileW(PWideChar(FileName), fdW);
    Result := h <> INVALID_HANDLE_VALUE;
    if Result then
    begin
      IsDir := (fdW.dwFileAttributes and FILE_ATTRIBUTE_DIRECTORY) <> 0;
      Windows.FindClose(h);
    end;
  end
  else
  begin
    h := FindFirstFileA(PAnsiChar(AnsiString(FileName)), fdA);
    Result := h <> INVALID_HANDLE_VALUE;
    if Result then
    begin
      IsDir := (fdA.dwFileAttributes and FILE_ATTRIBUTE_DIRECTORY) <> 0;
      Windows.FindClose(h);
    end;
  end;
end;

function IsFileExist(const FileName: WideString): Boolean; overload;
var
  IsDir: Boolean;
begin
  Result := IsFileExist(FileName, IsDir) and (not IsDir);
end;

function IsFileOrDirExist(const FileName: WideString): Boolean;
var
  IsDir: Boolean;
begin
  Result := IsFileExist(FileName, IsDir);
end;

function SDelLastSlashW(const S: WideString): WideString;
begin
  Result := S;
  if (Result <> '') and (Result[Length(Result)] = '\') then
    SetLength(Result, Length(Result) - 1);
end;

function IsDirRoot(const s: Widestring): boolean;
begin
  Result :=
    ((Length(s) = 3) and (Copy(s, 2, 2) = ':\')) or
    ((Length(s) = 2) and (s[2] = ':'));
end;

function IsDirExist(const DirName: WideString): Boolean; overload;
var
  IsDir: Boolean;
begin
  Result :=
    (IsFileExist(SDelLastSlashW(DirName), IsDir) and IsDir) or
    (IsDirRoot(DirName));
end;

function FFileOpen(const FileName: WideString): THandle;
begin
  if Win32Platform = VER_PLATFORM_WIN32_NT then
    Result := CreateFileW(PWideChar(FileName),
              GENERIC_READ,
              FILE_SHARE_READ or FILE_SHARE_WRITE or FILE_SHARE_DELETE,
              nil, OPEN_EXISTING, 0, 0)
  else
    Result := CreateFileA(PAnsiChar(AnsiString(FileName)),
              GENERIC_READ,
              FILE_SHARE_READ or FILE_SHARE_WRITE, //FILE_SHARE_DELETE not supported under Win9x
              nil, OPEN_EXISTING, 0, 0);
end;

function FFileCopy(const OldName, NewName: WideString): Boolean;
begin
  if Win32Platform = VER_PLATFORM_WIN32_NT then
    Result := CopyFileW(PWideChar(OldName), PWideChar(NewName), False)
  else
    Result := CopyFileA(PAnsiChar(AnsiString(OldName)), PAnsiChar(AnsiString(NewName)), False);
end;

function FFileMove(const OldName, NewName: WideString): Boolean;
begin
  if Win32Platform = VER_PLATFORM_WIN32_NT then
    Result:= MoveFileW(PWideChar(OldName), PWideChar(NewName))
  else
    Result:= MoveFileA(PAnsiChar(AnsiString(OldName)), PAnsiChar(AnsiString(NewName)));
end;


function IsFileAccessed(const FileName: WideString): Boolean;
var
  h: THandle;
begin
  h := FFileOpen(FileName);
  Result := h <> INVALID_HANDLE_VALUE;
  if Result then CloseHandle(h);
end;

function FGetFileSize(const FileName: WideString): Int64; overload;
var
  h: THandle;
  fdA: TWin32FindDataA;
  fdW: TWin32FindDataW;
  SizeRec: TInt64Rec absolute Result;
begin
  Result := -1;
  if Win32Platform = VER_PLATFORM_WIN32_NT then
  begin
    h := FindFirstFileW(PWideChar(FileName), fdW);
    if h <> INVALID_HANDLE_VALUE then
    begin
      SizeRec.Hi := fdW.nFileSizeHigh;
      SizeRec.Lo := fdW.nFileSizeLow;
      Windows.FindClose(h);
    end;
  end
  else
  begin
    h := FindFirstFileA(PAnsiChar(AnsiString(FileName)), fdA);
    if h <> INVALID_HANDLE_VALUE then
    begin
      SizeRec.Hi := fdA.nFileSizeHigh;
      SizeRec.Lo := fdA.nFileSizeLow;
      Windows.FindClose(h);
    end;
  end;
end;

function FGetFileSize(Handle: THandle): Int64; overload;
var
  Size: Int64;
  SizeRec: TInt64Rec absolute Size;
begin
  SizeRec.Lo := GetFileSize(Handle, @SizeRec.Hi);
  if (SizeRec.Lo = $FFFFFFFF) and (GetLastError <> NO_ERROR) then
    Result := -1
  else
    Result := Size;
end;

function FGetFileInfo(const FileName: WideString; var Size: Int64; var Time: TFileTime): Boolean;
var
  h: THandle;
  fdA: TWin32FindDataA;
  fdW: TWin32FindDataW;
  SizeRec: TInt64Rec absolute Size;
begin
  Result := False;

  Size := 0;
  FillChar(Time, SizeOf(Time), 0);

  if Win32Platform = VER_PLATFORM_WIN32_NT then
    begin
    h := FindFirstFileW(PWideChar(FileName), fdW);
    if h <> INVALID_HANDLE_VALUE then
      begin
      Result := True;
      //Attr := fdW.dwFileAttributes;
      SizeRec.Hi := fdW.nFileSizeHigh;
      SizeRec.Lo := fdW.nFileSizeLow;
      Time := fdW.ftLastWriteTime;
      Windows.FindClose(h);
      end;
    end
  else
    begin
    h := FindFirstFileA(PAnsiChar(AnsiString(FileName)), fdA);
    if h <> INVALID_HANDLE_VALUE then
      begin
      Result := True;
      //Attr := fdA.dwFileAttributes;
      SizeRec.Hi := fdA.nFileSizeHigh;
      SizeRec.Lo := fdA.nFileSizeLow;
      Time := fdA.ftLastWriteTime;
      Windows.FindClose(h);
      end;
    end;
end;


function FGetShortName(const FileName: WideString): WideString;
var
  bufA: array[0..MAX_PATH - 1] of AnsiChar;
  bufW: array[0..MAX_PATH - 1] of WideChar;
  resA: AnsiString;
begin
  if Win32Platform = VER_PLATFORM_WIN32_NT then
  begin
    FillChar(bufW, SizeOf(bufW), 0);
    SetString(Result, bufW, GetShortPathNameW(PWideChar(FileName), bufW, SizeOf(bufW) div 2));
  end
  else
  begin
    FillChar(bufA, SizeOf(bufA), 0);
    SetString(resA, bufA, GetShortPathNameA(PAnsiChar(AnsiString(FileName)), bufA, SizeOf(bufA)));
    Result := resA;
  end;
end;


function FOpenURL(const URL: WideString; hWnd: THandle): Boolean;
begin
  if Win32Platform = VER_PLATFORM_WIN32_NT then
    Result := ShellExecuteW(hWnd, 'open', PWideChar(URL), nil, nil, SW_SHOW) > 32
  else
    Result := ShellExecuteA(hWnd, 'open', PAnsiChar(AnsiString(URL)), nil, nil, SW_SHOW) > 32;
end;

function FExecProcess(const CmdLine, CurrentDir: Widestring; ShowCmd: integer; DoWait: boolean): TExecCode;
var
  pi: TProcessInformation;
  si: TStartupInfo;
  code: DWord;
begin
  FillChar(pi, SizeOf(pi), 0);
  FillChar(si, SizeOf(si), 0);
  si.cb:= SizeOf(si);
  si.dwFlags:= STARTF_USESHOWWINDOW;
  si.wShowWindow:= ShowCmd;

  if not CreateProcessW(nil, PWChar(CmdLine), nil, nil, false, 0,
    nil, PWChar(CurrentDir), si, pi) then
    Result:= exCannotRun
  else
    begin
    if DoWait then WaitForSingleObject(pi.hProcess, INFINITE);
    if GetExitCodeProcess(pi.hProcess, code) and
      (code >= $C0000000) and (code <= $C000010E) then
      Result:= exExcept
    else
      Result:= exOk;
    CloseHandle(pi.hThread);
    CloseHandle(pi.hProcess);
    end;
end;

function FExecute(const Command, Params, Dir: WideString; hWnd: THandle): Boolean;
begin
  if Win32Platform = VER_PLATFORM_WIN32_NT then
    Result := ShellExecuteW(hWnd, 'open', PWChar(Command), PWChar(Params), PWChar(Dir), SW_SHOW) > 32
  else
    Result := ShellExecuteA(hWnd, 'open', PAnsiChar(AnsiString(Command)), PAnsiChar(AnsiString(Params)), PAnsiChar(AnsiString(Dir)), SW_SHOW) > 32;
end;

function FCreateDir(const FileName: WideString): Boolean;
begin
  if Win32Platform = VER_PLATFORM_WIN32_NT then
    Result := CreateDirectoryW(PWideChar(FileName), nil)
  else
    Result := CreateDirectoryA(PAnsiChar(AnsiString(FileName)), nil);
end;


function IsFileUnicode(h: THandle): Boolean;
var
  Buffer: Word;
  BytesRead: DWORD;
begin
  Buffer := 0;
  SetFilePointer(h, 0, nil, FILE_BEGIN);
  Result :=
    ReadFile(h, Buffer, SizeOf(Buffer), BytesRead, nil) and
    (BytesRead >= SizeOf(Buffer)) and
    ((Buffer = $FEFF) or (Buffer = $FFFE));
end;

function IsFileUnicodeNoBOM(h: THandle; var IsBE: boolean): Boolean; overload;
var
  Buffer: packed array[0..1, 0..1] of byte;
  BytesRead: DWORD;
begin
  FillChar(Buffer, SizeOf(Buffer), 0);
  SetFilePointer(h, 0, nil, FILE_BEGIN);
  Result :=
    ReadFile(h, Buffer, SizeOf(Buffer), BytesRead, nil) and
    (BytesRead >= SizeOf(Buffer)) and
    ( ((Buffer[0, 0] = 0) and (Buffer[1, 0] = 0)) or
      ((Buffer[0, 1] = 0) and (Buffer[1, 1] = 0)) );
  if Result then
    IsBE := ((Buffer[0, 0] = 0) and (Buffer[1, 0] = 0));
end;

function IsFileUTF8(h: THandle): Boolean;
var
  Buffer: packed array[0..2] of byte;
  BytesRead: DWORD;
begin
  FillChar(Buffer, SizeOf(Buffer), 0);
  SetFilePointer(h, 0, nil, FILE_BEGIN);
  Result :=
    ReadFile(h, Buffer, SizeOf(Buffer), BytesRead, nil) and
    (BytesRead >= 3) and
    ((Buffer[0] = $EF) and (Buffer[1] = $BB) and (Buffer[2] = $BF));
end;

function IsFileUTF8NoBOM_(h: THandle): Boolean;
const
  cMax = 10*1024; //max buffer 10Mb
var
  Buffer: PAnsiChar;
  BufSize, BytesRead: DWORD;
begin
  Result := False;
  if opUtf8BufferSizeKb < 1 then opUtf8BufferSizeKb := 1;
  if opUtf8BufferSizeKb > cMax then opUtf8BufferSizeKb := cMax;
  BufSize := opUtf8BufferSizeKb * 1024;
  GetMem(Buffer, BufSize);
  try
    FillChar(Buffer^, BufSize, 0);
    SetFilePointer(h, 0, nil, FILE_BEGIN);
    if not ReadFile(h, Buffer^, Pred(BufSize), BytesRead, nil) then Exit;
    Result := IsBufferUtf8(Buffer, True{PartialAllowed});
  finally
    FreeMem(Buffer);
  end;
end;


function IsFileRTF(h: THandle): Boolean;
const
  Sign = '{\rtf';
  SignLen = Length(Sign);
var
  Buffer: packed array[0 .. SignLen] of AnsiChar; //Sign + #0
  BytesRead: DWORD;
begin
  FillChar(Buffer, SizeOf(Buffer), 0);
  SetFilePointer(h, 0, nil, FILE_BEGIN);
  {$WARNINGS OFF}
  Result :=
    ReadFile(h, Buffer, SignLen, BytesRead, nil) and
    (BytesRead >= SignLen) and
    (Buffer = Sign);
  {$WARNINGS ON}
end;

function IsFileWeb(h: THandle): Boolean;
const
  Sign = '<?xml';
  SignLen = Length(Sign);
var
  Buffer: packed array[0 .. SignLen] of AnsiChar; //Sign + #0
  BytesRead: DWORD;
begin
  FillChar(Buffer, SizeOf(Buffer), 0);
  SetFilePointer(h, 0, nil, FILE_BEGIN);
  {$WARNINGS OFF}
  Result :=
    ReadFile(h, Buffer, SignLen, BytesRead, nil) and
    (BytesRead >= SignLen) and
    (Buffer = Sign);
  {$WARNINGS ON}
end;


procedure IsFileRTFAndUTF8(const AFileName: WideString; var IsRTF, IsUTF8: Boolean);
var
  h: THandle;
begin
  IsRTF := False;
  IsUTF8 := False;

  h := FFileOpen(AFileName);
  if h <> INVALID_HANDLE_VALUE then
    try
      IsRTF := IsFileRTF(h);
      IsUTF8 := IsFileUTF8(h);
    finally
      CloseHandle(h);
    end;
end;


type
  TFreqTable = array[$80 .. $FF] of Integer;

function IsFileText(h: THandle; BufSizeKb: DWORD; DetectOEM: Boolean; var IsOEM: Boolean): Boolean;
var
  Buffer: PAnsiChar;
  BufSize, BytesRead, i: DWORD;
  n: Integer;
  Table: TFreqTable;
  TableSize: Integer;
begin
  Result := False;
  IsOEM := False;

  if BufSizeKb = 0 then Exit;
  Buffer := nil;
  BufSize := BufSizeKb * 1024;

  //Init freq table
  TableSize := 0;
  FillChar(Table, SizeOf(Table), 0);

  try
    GetMem(Buffer, BufSize);
    FillChar(Buffer^, BufSize, 0);
    SetFilePointer(h, 0, nil, FILE_BEGIN);

    if ReadFile(h, Buffer^, BufSize, BytesRead, nil) then
      if BytesRead > 0 then
      begin
        Result := True;
        for i := 0 to BytesRead - 1 do
        begin
          n := Ord(Buffer[i]);

          //If control chars present, then non-text
          if (n < 32) and (n <> 09) and (n <> 13) and (n <> 10) then
            begin Result := False; Break end;

          //Calculate freq table
          if DetectOEM then
            if (n >= Low(Table)) and (n <= High(Table)) then
            begin
              Inc(TableSize);
              Inc(Table[n]);
            end;
        end;
      end;

    //Analize table
    if DetectOEM then
      if Result and (TableSize > 0) then
        for i := Low(Table) to High(Table) do
        begin
          Table[i] := Table[i] * 100 div TableSize;
          if ((i >= $B0) and (i <= $DF)) or (i = $FF) or (i = $A9) then
            if Table[i] >= 18 then
              begin IsOEM := True; Break end;
        end;

  finally
    if Assigned(Buffer) then
      FreeMem(Buffer);
  end;
end;


procedure SAddSlash(var S: AnsiString);
begin
  if (S <> '') and (S[Length(S)] <> '\') then
    S := S + '\';
end;

function FFileNameWideToAnsi(const FileName: WideString): AnsiString;
begin
  if IsDirExist(FileName) then
  begin
    Result := FileName;
    //Convert to short form only "pure Unicode" names:
    if FileName <> WideString(AnsiString(FileName)) then
    begin
      Result := FGetShortName(FileName);
      if not IsDirExist(Result) then
        Result := '';
    end;
    //Add trailing slash, Lister plugins expect it:
    SAddSlash(Result);
  end
  else
  begin
    Result := FileName;
    //Convert to short form only "pure Unicode" names:
    if FileName <> WideString(AnsiString(FileName)) then
    begin
      Result := FGetShortName(FileName);
      if not IsFileAccessed(Result) then
        Result := '';
    end;
  end;
end;


function FFindFirstFile(const DirName, Mask: WideString): WideString;
var
  h: THandle;
  fdA: TWin32FindDataA;
  fdW: TWin32FindDataW;
  IsDir: Boolean;
begin
  Result := '';
  h := INVALID_HANDLE_VALUE;
  try
    if Win32Platform = VER_PLATFORM_WIN32_NT then
    begin
      h := FindFirstFileW(PWideChar(DirName + '\' + Mask), fdW);
      if h <> INVALID_HANDLE_VALUE then
        repeat
          IsDir := (fdW.dwFileAttributes and FILE_ATTRIBUTE_DIRECTORY) <> 0;
          if not IsDir then
          begin
            Result := DirName + '\' + fdW.cFileName;
            Exit
          end;
        until not FindNextFileW(h, fdW);
    end
    else
    begin
      h := FindFirstFileA(PAnsiChar(AnsiString(DirName+'\'+Mask)), fdA);
      if h <> INVALID_HANDLE_VALUE then
        repeat
          IsDir := (fdA.dwFileAttributes and FILE_ATTRIBUTE_DIRECTORY) <> 0;
          if not IsDir then
          begin
            Result := DirName + '\' + fdA.cFileName;
            Exit
          end;
        until not FindNextFileA(h, fdA);
    end;
  finally
    Windows.FindClose(h);
  end;
end;


function FDeleteToRecycleA(Handle: THandle; const FileName: AnsiString; ToRecycle: Boolean): Boolean;
var
  op: TSHFileOpStructA;
  sFrom: AnsiString;
begin
  sFrom := FileName + #0#0;
  FillChar(op, SizeOf(op), 0);
  op.Wnd := Handle;
  op.wFunc := FO_DELETE;
  op.pFrom := PAnsiChar(sFrom);
  op.fFlags := FOF_NOCONFIRMATION;
  if ToRecycle then
    op.fFlags := op.fFlags or FOF_ALLOWUNDO;
  Result := SHFileOperationA(op) = 0;
end;

function FDeleteToRecycleW(Handle: THandle; const FileName: WideString; ToRecycle: Boolean): Boolean;
var
  op: TSHFileOpStructW;
  sFrom: WideString;
begin
  sFrom := FileName + #0#0;
  FillChar(op, SizeOf(op), 0);
  op.Wnd := Handle;
  op.wFunc := FO_DELETE;
  op.pFrom := PWideChar(sFrom);
  op.fFlags := FOF_NOCONFIRMATION;
  if ToRecycle then
    op.fFlags := op.fFlags or FOF_ALLOWUNDO;
  Result := SHFileOperationW(op) = 0;
end;

function FDeleteToRecycle(Handle: THandle; const FileName: WideString; ToRecycle: Boolean = True): Boolean;
begin
  if Win32Platform = VER_PLATFORM_WIN32_NT then
    Result := FDeleteToRecycleW(Handle, FileName, ToRecycle)
  else
    Result := FDeleteToRecycleA(Handle, FileName, ToRecycle);
end;

function FDelete(const FileName: WideString): Boolean;
begin
  if Win32Platform = VER_PLATFORM_WIN32_NT then
    Result := DeleteFileW(PWideChar(FileName))
  else
    Result := DeleteFileA(PAnsiChar(AnsiString(FileName)));
end;


function FGetFullPathName(const FileName: WideString): WideString;
var
  bufA: array[0 .. MAX_PATH - 1] of AnsiChar;
  bufW: array[0 .. MAX_PATH - 1] of WideChar;
  partA: PAnsiChar;
  partW: PWideChar;
begin
  Result := '';
  if FileName <> '' then //Result for empty string_ should be empty string_!
    if Win32Platform = VER_PLATFORM_WIN32_NT then
    begin
      if GetFullPathNameW(PWideChar(FileName), SizeOf(bufW) div 2, bufW, partW) <> 0 then
        Result := bufW;
    end
    else
    begin
      if GetFullPathNameA(PAnsiChar(AnsiString(FileName)), SizeOf(bufA), bufA, partA) <> 0 then
        Result := AnsiString(bufA);
    end;
end;


procedure FShowPropertiesA(const fn: AnsiString; hWnd: THandle);
var
  sei: TShellExecuteInfoA;
begin
  FillChar(sei, SizeOf(sei), 0);
  sei.cbSize := SizeOf(sei);
  sei.wnd := hWnd;
  sei.lpFile := PAnsiChar(fn);
  sei.lpVerb := 'properties';
  sei.fMask := SEE_MASK_INVOKEIDLIST;
  ShellExecuteExA(@sei);
end;

procedure FShowPropertiesW(const fn: WideString; hWnd: THandle);
var
  sei: TShellExecuteInfoW;
begin
  FillChar(sei, SizeOf(sei), 0);
  sei.cbSize := SizeOf(sei);
  sei.wnd := hWnd;
  sei.lpFile := PWChar(fn);
  sei.lpVerb := 'properties';
  sei.fMask := SEE_MASK_INVOKEIDLIST;
  ShellExecuteExW(@sei);
end;

procedure FShowProperties(const fn: WideString; hWnd: THandle);
begin
  if Win32Platform = VER_PLATFORM_WIN32_NT then
    FShowPropertiesW(fn, hWnd)
  else
    FShowPropertiesA(AnsiString(fn), hWnd);
end;

function IsFileWritable(const FileName: WideString): boolean;
var h: THandle;
begin
  if Win32Platform = VER_PLATFORM_WIN32_NT then
    h := CreateFileW(PWideChar(FileName),
              GENERIC_WRITE,
              FILE_SHARE_READ or FILE_SHARE_WRITE or FILE_SHARE_DELETE,
              nil, OPEN_EXISTING, 0, 0)
  else
    h := CreateFileA(PAnsiChar(AnsiString(FileName)),
              GENERIC_WRITE,
              FILE_SHARE_READ or FILE_SHARE_WRITE, //FILE_SHARE_DELETE not supported under Win9x
              nil, OPEN_EXISTING, 0, 0);
  Result := h <> invalid_handle_value;
  if Result then CloseHandle(h);
end;


  function SGetMask(var S: WideString): WideString;
  var
    i: integer;
  begin
    S:= Trim(S);
    if (Length(S)>=3) and (S[1]='"') then
    begin
      i:= PosEx('"', S, 2);
      if i=0 then i:= MaxInt;
      Result:= Copy(S, 2, i-2);
      Delete(S, 1, i);
    end
    else
    begin
      i:= Pos(WideString(' '), S);
      if i=0 then i:= MaxInt;
      Result:= Copy(S, 1, i-1);
      Delete(S, 1, i);
    end;
  end;

//SMask: space separated masks
procedure FFindToList(List: TTntStringList;
  const SDir, SMask: Widestring; ASubDir: boolean;
  ANoRO: boolean;
  ANoHidFiles: boolean;
  ANoHidFolders: boolean);
var
  f: TSearchRecW;
  s, msk: WideString;
  a: integer;
begin
  Application.ProcessMessages;
  if StopFind then Exit;

  s:= SMask;
  repeat
    msk:= SGetMask(s);
    if msk='' then Break;

    a:= faArchive;
    if not ANoHidFiles then Inc(a, faHidden or faSysFile);
    //R/O inclusion to parameter doesn't work

    if WideFindFirst(SDir+'\'+msk, a, F) = 0 then
    begin
      repeat
        //handle R/o here
        if ANoRO and ((F.Attr and faReadOnly) <> 0) then
          Continue;
        if List.IndexOf(SDir+'\'+F.Name) < 0 then
          List.AddObject(SDir+'\'+F.Name, Pointer(DWORD(F.Size)));
      until WideFindNext(F) <> 0;
      WideFindClose(F);
    end;
  until False;

  //see dirs
  a:= faArchive or faDirectory or faReadOnly;
  if not ANoHidFolders then Inc(a, faHidden or faSysFile);

  if ASubDir then
  if WideFindFirst(SDir+'\*.*', a, F) = 0 then
  begin
    repeat
      if (F.Name<>'.') and (F.Name<>'..') and IsDirExist(SDir+'\'+F.Name) then
      begin
        //Messagebox(0, PChar(string(SDir+'\'+F.Name)), '', 0);
        FFindToList(List, SDir+'\'+F.Name, SMask, ASubDir,
          ANoRO, ANoHidFiles, ANoHidFolders);
      end;
    until WideFindNext(F) <> 0;
    WideFindClose(F);
  end;
end;


//----
function SDeleteFrom(const s, sfrom: string): string;
var
  i: integer;
begin
  i:= Pos(sfrom, s);
  if i=0
    then Result:= s
    else Result:= Copy(s, 1, i-1);
end;

function SDeleteTo(const s, sto: string): string;
var
  i: integer;
begin
  Result:= s;
  i:= Pos(sto, s);
  if i>0 then Delete(Result, 1, i+Length(sto)-1);
end;

function SBetween(const s, s1, s2: string): string;
var
  n1, n2: integer;
begin
  Result:= '';
  n1:= Pos(s1, s);                     if n1=0 then Exit;
  n2:= Pos(s2, Copy(s, n1+1, MaxInt)); if n2=0 then Exit;
  Result:= Copy(s, n1+Length(s1), n2-Length(s1));
end;

//-----------------------------------------
// <?xml version="1.0" encoding="UTF-8" ?>
function SEncodedUTF8(s: string): boolean;
var
  tagStart: string;
begin
  Result:= false;
  tagStart:= '<?xml ';
  if Pos(tagStart, s)>0 then
    begin
    s:= SDeleteTo(s, tagStart);
    s:= SDeleteFrom(s, '?>');
    if Pos('encoding=', s)=0 then Exit;
    s:= SDeleteTo(s, 'encoding=');
    s:= SBetween(s, '"', '"');
    Result:= UpperCase(s) = 'UTF-8';
    end;
end;

function IsFileXmlUTF8(const fn: WideString): boolean;
var
  h: THandle;
  Buffer: packed array[0..100] of AnsiChar;
  BytesRead: DWORD;
begin
  Result := False;
  h := FFileOpen(fn);
  if h <> INVALID_HANDLE_VALUE then
  try
    if IsFileUTF8(h) then Exit; //BOM at start
    FillChar(Buffer, SizeOf(Buffer), 0);
    SetFilePointer(h, 0, nil, FILE_BEGIN);
    Result :=
      ReadFile(h, Buffer, SizeOf(Buffer)-1{!}, BytesRead, nil) and
      SEncodedUTF8(string(Buffer));
  finally
    CloseHandle(h);
  end;
end;

function IsFileUTF8NoBOM(const fn: WideString): boolean;
var
  h: THandle;
begin
  Result := False;
  h := FFileOpen(fn);
  if h <> INVALID_HANDLE_VALUE then
  try
    Result :=
      not IsFileUTF8(h) and
      IsFileUTF8NoBOM_(h);
  finally
    CloseHandle(h);
  end;
end;

function IsFileText(const fn: WideString): boolean; overload;
var
  h: THandle;
  b, ext_txt: Boolean;
begin
  Result := False;
  h := FFileOpen(fn);
  ext_txt := LowerCase(ExtractFileExt(fn)) = '.txt';
  if h <> INVALID_HANDLE_VALUE then
    try
      Result :=
        (FGetFileSize(h) = 0) or
        IsFileUTF8(h) or
        IsFileUnicode(h) or
        (IsFileUnicodeNoBOM(h, b) and ext_txt) or
        (IsFileText(h, 1, False, b) and not IsFileRTF(h));
    finally
      CloseHandle(h);
    end;
end;

function IsFileUnicodeNoBOM(const fn: Widestring; var IsBE: boolean): boolean; overload;
var
  h: THandle;
begin
  Result := False;
  h := FFileOpen(fn);
  if h <> INVALID_HANDLE_VALUE then
    try
      Result := IsFileUnicodeNoBOM(h, IsBE);
    finally
      CloseHandle(h);
    end;
end;

function IsFileWithBOM(const fn: Widestring): boolean;
var
  h: THandle;
begin
  Result := False;
  h := FFileOpen(fn);
  if h <> INVALID_HANDLE_VALUE then
    try
      Result :=
        IsFileUnicode(h) or
        IsFileUTF8(h);
    finally
      CloseHandle(h);
    end;
end;

procedure FReadSection(const fn, sec: string; L: TStringList);
var f: TextFile;
  s: string;
  d: boolean;
begin
  AssignFile(f, fn);
  {$I-}
  Reset(f);
  if IOResult<>0 then Exit;
  d:= false;
  while not Eof(f) do
  begin
    Readln(f, s);
    if s='' then Continue;
    if s= '['+sec+']' then begin d:= true; Continue end;
    if s[1]='[' then begin d:= false; Continue end;
    if d then L.Add(s);
  end;
  CloseFile(f);
end;

//http://www.delphi.int.ru/articles/41/
function GetSpecialFolderPath(folder : integer) : string;
const
  SHGFP_TYPE_CURRENT = 0;
var
  path: array[0..MAX_PATH] of char;
begin
  if SUCCEEDED(SHGetFolderPath(0, folder, 0, SHGFP_TYPE_CURRENT, @path[0])) then
    Result := path
  else
    Result := '';
end;

function FAppDataPath: string;
begin
  Result:= GetSpecialFolderPath(CSIDL_APPDATA) + '\';
end;

procedure MsgBeep(Err: boolean = false);
begin
  if opBeep then
    if Err then
      MessageBeep(mb_iconerror)
    else
      MessageBeep(mb_iconwarning);
end;

//----------------------------------------
function FFindInSubdirs(const sname, sdir: Widestring; var fn: Widestring): boolean;
var
  h: THandle;
  fd: TWin32FindDataW;
begin
  if not IsDirExist(sdir) then
    begin Result:= false; Exit end;

  h:= FindFirstFileW(PWChar(sdir+'\'+sname), fd);
  Result:= h<>INVALID_HANDLE_VALUE;
  if Result then
  begin
    fn:= sdir+'\'+fd.cFileName;
    Windows.FindClose(h);
    Exit
  end;

  h:= FindFirstFileW(PWChar(sdir+'\*.*'), fd);
  if h=INVALID_HANDLE_VALUE then Exit;

  repeat
    if ((fd.dwFileAttributes and FILE_ATTRIBUTE_DIRECTORY)<>0) and
      (fd.cFileName[0]<>'.') then
        begin
        Result:= FFindInSubdirs(sname, sdir+'\'+fd.cFileName, fn);
        if Result then Break;
        end;
  until not FindNextFileW(h, fd);

  Windows.FindClose(h);
end;

function FReadString(const fn: string): string;
var
  f: TextFile;
begin
  Result:= '';
  AssignFile(f, fn);
  {$I-}
  Reset(f);
  {$I+}
  if IOResult<>0 then Exit;
  Readln(f, Result);
  CloseFile(f);
end;


procedure WideCutFirstDirectory(var S: WideString);
var
  Root: Boolean;
  P: Integer;
begin
  if S = '\' then
    S := ''
  else
  begin
    if S[1] = '\' then
    begin
      Root := True;
      Delete(S, 1, 1);
    end
    else
      Root := False;
    if S[1] = '.' then
      Delete(S, 1, 4);
    P := Pos('\',S);
    if P <> 0 then
    begin
      Delete(S, 1, P);
      S := '...\' + S;
    end
    else
      S := '';
    if Root then
      S := '\' + S;
  end;
end;

//-------------------------------------------------
function FormatSize(const Size: Int64; Bytes: boolean): string;
  function Kb: Int64;
  begin
    if Bytes then Result:= 1024 else Result:= 1000;
  end;
  function Mb: Int64;
  begin
    Result:= Kb*Kb;
  end;
  function Gb: Int64;
  begin
    Result:= Kb*Kb*Kb;
  end;
begin
  if Size >= Gb then
    Result:= Format('%d (%.2f G)', [Size, Size/Gb])
  else
  if Size >= Mb then
    Result:= Format('%d (%.2f M)', [Size, Size/Mb])
  else
  if Size >= Kb then
    Result:= Format('%d (%.2f K)', [Size, Size/Kb])
  else
    Result:= Format('%d', [Size]);
end;

function FormatFileTime(const ft: TFileTime): string;
var
  lt: TFileTime;
  st: TSystemTime;
  Date, Time: string;
begin
  Result:= '';
  if FileTimeToLocalFileTime(ft, lt) and FileTimeToSystemTime(lt, st) then
  begin
    Date:= Format('%2.2d%s%2.2d%s%d',
      [st.wDay, DateSeparator, st.wMonth, DateSeparator, st.wYear]);

    Time:= Format('%2.2d%s%2.2d%s%2.2d',
      [st.wHour, TimeSeparator, st.wMinute, TimeSeparator, st.wSecond]);

    Result:= Date + ' ' + Time;
  end;
end;

//uses short date/time formats: 01.30.12 12:20
function FormatFileTimeAlt(const ft: TFileTime): string;
var
  lt: TFileTime;
  st: TSystemTime;
  Date, Time: string;
begin
  Result:= '';
  if FileTimeToLocalFileTime(ft, lt) and FileTimeToSystemTime(lt, st) then
  begin
    Date:= Format('%2.2d%s%2.2d%s%2.2d',
      [st.wDay, DateSeparator, st.wMonth, DateSeparator, st.wYear mod 100]);

    Time:= Format('%2.2d%s%2.2d',
      [st.wHour, TimeSeparator, st.wMinute]);

    Result:= Date + ' ' + Time;
  end;
end;

function FormatFileTimeFmt(const ft: TFileTime; const Fmt: string): string;
var
  lt: TFileTime;
  st: TSystemTime;
  time: Longint;
  dt: TDateTime;
begin
  Result:= '';
  if FileTimeToLocalFileTime(ft, lt) and
    FileTimeToDosDateTime(lt, LongRec(time).Hi, LongRec(time).Lo) then
  begin
    dt:= FileDateToDateTime(time);
    Result:= FormatDateTime(Fmt, dt);
  end;
end;


function FExecuteGetCode(const fn, params: Widestring;
  ShowCmd: integer; fWait: boolean; var ExitCode: Cardinal): boolean;
var
  pi: TProcessInformation;
  si: TStartupInfo;
begin
  ExitCode:= Cardinal(-1);

  FillChar(pi, SizeOf(pi), 0);
  FillChar(si, SizeOf(si), 0);
  si.cb:= SizeOf(si);
  si.dwFlags:= STARTF_USESHOWWINDOW;
  si.wShowWindow:= ShowCmd;

  Result:= CreateProcessW(
    nil,
    PWChar('"'+fn+'" '+params),
    nil, nil, false, 0,
    nil, nil, si, pi);
  if Result then
    begin
    if fWait then
      WaitForSingleObject(pi.hProcess, INFINITE);
    GetExitCodeProcess(pi.hProcess, ExitCode);
    CloseHandle(pi.hThread);
    CloseHandle(pi.hProcess);
    end;
end;


end.
