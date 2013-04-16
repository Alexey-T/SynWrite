unit ATxWdx;

interface

function SGetWdxField(
  const fPlugin: string;
  const fFile: WideString;
  const fDefIni: string;
  fShowText: boolean; //show fulltext in List
  nField: integer //field num to get, or -1
  ): string;


implementation

uses
  Windows, SysUtils, ContPlug;

type
  TContentPluginUnloading = procedure; stdcall;
  TContentGetDetectString = procedure(Str: PAnsiChar; MaxLen: integer); stdcall;
  TContentGetSupportedField = function(FieldIndex: integer; FieldName: pAnsiChar;
    Units: pAnsiChar; maxlen: integer): integer; stdcall;
  TContentGetValue = function(FileName: pAnsiChar; FieldIndex, UnitIndex: integer;
    FieldValue: pbyte; maxlen, flags: integer): integer; stdcall;
  TContentGetValueW = function(FileName: pWideChar; FieldIndex, UnitIndex: integer;
    FieldValue: pbyte; maxlen, flags: integer): integer; stdcall;
  TContentSetDefaultParams = procedure(dps: pContentDefaultParamStruct); stdcall;

procedure Msg(const s: string);
begin
  MessageBox(0, PChar(s), 'SynWrite image-tag reader', MB_OK or MB_ICONERROR or mb_taskmodal);
end;

function WdxFieldType(n: integer): string;
begin
  case n of
    ft_numeric_32:       Result:= 'ft_numeric_32';
    ft_numeric_64:       Result:= 'ft_numeric_64';
    ft_numeric_floating: Result:= 'ft_numeric_floating';
    ft_date:             Result:= 'ft_date';
    ft_time:             Result:= 'ft_time';
    ft_datetime:         Result:= 'ft_datetime';
    ft_boolean:          Result:= 'ft_boolean';
    ft_multiplechoice:   Result:= 'ft_multiplechoice';
    ft_string:           Result:= 'ft_string';
    ft_stringw:          Result:= 'ft_stringw';
    ft_fulltext:         Result:= 'ft_fulltext';
    ft_nosuchfield:      Result:= 'ft_nosuchfield';
    ft_fileerror:        Result:= 'ft_fileerror';
    ft_fieldempty:       Result:= 'ft_fieldempty';
    ft_delayed:          Result:= 'ft_delayed';
    ft_ondemand:         Result:= 'ft_ondemand';
    else Result:= '?';
  end;
end;

//-----------------------------------------------
const
  cTextSize = 64 * 1024; //MaxInt for all text
  cTextNone = '(Click)';
  cBufSize = 4 * 1024;
  cFields = 200;

var
  fieldsNum: integer;
  fields: array[0 .. Pred(cFields)] of record
    fName, fUnits: string;
    fType: integer;
  end;

function SCharCount(const s: string; ch: char): integer;
var
  i: integer;
begin
  Result:= 0;
  for i:= 1 to Length(s) do
    if s[i]=ch then Inc(Result);
end;

function SGetUnit(var sUnits: string): string;
var
  k: integer;
begin
  k:= Pos('|', sUnits);
  if k=0 then k:= MaxInt;
  Result:= Copy(sUnits, 1, k-1);
  Delete(sUnits, 1, k);
end;

function SGetWdxField(
  const fPlugin: string;
  const fFile: WideString;
  const fDefIni: string;
  fShowText: boolean;
  nField: integer): string;
var
  hLib: THandle;
  ProcDS: TContentGetDetectString;
  ProcGetSup: TContentGetSupportedField;
  ProcGetVal: TContentGetValue;
  ProcGetValW: TContentGetValueW;
  ProcSetDef: TContentSetDefaultParams;
  ProcU: TContentPluginUnloading;
  dps: TContentDefaultParamStruct;
  buf1, buf2: array[0 .. Pred(cBufSize)] of AnsiChar;
  fnval: integer absolute buf1;
  fnval64: Int64 absolute buf1;
  ffval: Double absolute buf1;
  fdate: TDateFormat absolute buf1;
  ftime: TTimeFormat absolute buf1;
  ffiletime: TFileTime absolute buf1;
  ltime: TFileTime;
  stime: TSystemTime;
  sVal: WideString;
  sUnits, sUnit: string;
  nUnits, nUnit: integer;
  res, n: integer;
  offset: integer;
begin
  hLib:= LoadLibrary(PChar(fPlugin));
  if hLib=0 then Exit;

  @ProcDS:= GetProcAddress(hLib, 'ContentGetDetectString');
  if @ProcDS<>nil then
    begin
    FillChar(buf1, SizeOf(buf1), 0);
    ProcDS(buf1, SizeOf(buf1));
    end;

  @ProcSetDef:= GetProcAddress(hLib, 'ContentSetDefaultParams');
  if @ProcSetDef<>nil then
    begin
    FillChar(dps, SizeOf(dps), 0);
    dps.Size:= SizeOf(dps);
    dps.PluginInterfaceVersionLow:= 20;
    dps.PluginInterfaceVersionHi:= 1;
    lstrcpyA(dps.DefaultIniName, PAnsiChar(AnsiString(fDefIni)));
    ProcSetDef(@dps);
    end;

  @ProcGetSup:= GetProcAddress(hLib, 'ContentGetSupportedField');
  if @ProcGetSup=nil then begin FreeLibrary(hLib); Exit end;

  @ProcGetVal:= GetProcAddress(hLib, 'ContentGetValue');
  @ProcGetValW:= GetProcAddress(hLib, 'ContentGetValueW');
  if @ProcGetVal=nil then begin FreeLibrary(hLib); Exit end;

  @ProcU:= GetProcAddress(hLib, 'ContentPluginUnloading');

  try
    Result:= '';
    fieldsNum:= -1;
    repeat
      if fieldsNum>=High(fields) then Break;
      Inc(fieldsNum);

      try
        FillChar(buf1, SizeOf(buf1), 0);
        FillChar(buf2, SizeOf(buf2), 0);
        res:= ProcGetSup(fieldsNum, buf1, buf2, SizeOf(buf1));
      except
        res:= ft_nomorefields;
        Msg('Exception in ContentGetSupportedField');
      end;

      if res=ft_nomorefields then Break;
      fields[fieldsNum].fName:= buf1;
      fields[fieldsNum].fUnits:= buf2;
      fields[fieldsNum].fType:= res;
    until false;

    for n:= 0 to fieldsNum-1 do
     with fields[n] do
      begin
      if (nField >= 0) and (n <> nField) then
        Continue;

      sUnits:= fUnits;
      if fType=ft_multiplechoice
        then nUnits:= 1
        else nUnits:= SCharCount(sUnits, '|')+1;

      for nUnit:= 0 to nUnits-1 do
        begin
        if nUnits=1
          then sUnit:= ''
          else sUnit:= SGetUnit(sUnits);

        if fType=ft_fulltext
          then //----------------------------
            if not fShowText then
              sVal:= cTextNone
            else
              begin
              sVal:= '';
              offset:= 0;
              //read fulltext
              repeat
                try
                  FillChar(buf1, SizeOf(buf1), 0);
                  if @ProcGetValW <> nil then
                    res:= ProcGetValW(PWideChar(WideString(fFile)), n, offset, @buf1, SizeOf(buf1), 0)
                  else
                    res:= ProcGetVal(PAnsiChar(AnsiString(fFile)), n, offset, @buf1, SizeOf(buf1), 0);
                except
                  res:= ft_fileerror;
                  Msg('Exception in ContentGetValue');
                end;

                if res<>ft_fulltext then Break;
                if Length(string(buf1))=0 then Break;
                sVal:= sVal + string(buf1);

                Inc(offset, Length(string(buf1)));
                if offset>=Pred(cTextSize) then Break;
              until false;

              //close fulltext buffer
              try
                if @ProcGetValW <> nil then
                  ProcGetValW(PWideChar(WideString(fFile)), n, -1, @buf1, SizeOf(buf1), 0)
                else
                  ProcGetVal(PAnsiChar(AnsiString(fFile)), n, -1, @buf1, SizeOf(buf1), 0);
              except
                Msg('Exception in ContentGetValue');
              end;

              if res=ft_fileerror then
                sVal:= WdxFieldType(res);
              end

               //if fType=ft_fulltext
          else //----------------------------
            begin
            //read field
            FillChar(buf1, SizeOf(buf1), 0);
            try
              if @ProcGetValW <> nil then
                res:= ProcGetValW(PWideChar(WideString(fFile)), n, nUnit, @buf1, SizeOf(buf1), 0)
              else
                res:= ProcGetVal(PAnsiChar(AnsiString(fFile)), n, nUnit, @buf1, SizeOf(buf1), 0);
            except
              res:= ft_fileerror;
              Msg('Exception in ContentGetValue');
            end;

            case res of
              ft_numeric_32,
              ft_numeric_64,
              ft_numeric_floating,
              ft_date,
              ft_time,
              ft_datetime,
              ft_boolean,
              ft_string,
              ft_stringw,
              ft_multiplechoice: fType:= res;
            end;

            case res of
              ft_fieldempty:          sVal:= '';
              ft_numeric_32:          sVal:= IntToStr(fnval);
              ft_numeric_64:          sVal:= IntToStr(fnval64);
              ft_numeric_floating:    sVal:= FloatToStr(ffval);
              ft_date:                sVal:= Format('%2.2d.%2.2d.%4.4d', [fdate.wDay, fdate.wMonth, fdate.wYear]);
              ft_time:                sVal:= Format('%2.2d:%2.2d:%2.2d', [ftime.wHour, ftime.wMinute, ftime.wSecond]);

              ft_datetime:            begin
                                      FileTimeToLocalFileTime(ffiletime, ltime);
                                      FileTimeToSystemTime(ltime, stime);
                                      sVal:= Format('%2.2d.%2.2d.%4.4d %2.2d:%2.2d:%2.2d',
                                              [stime.wDay, stime.wMonth, stime.wYear,
                                               stime.wHour, stime.wMinute, stime.wSecond]);
                                      end;

              ft_boolean:             if fnval=0 then sVal:= 'False' else sVal:= 'True';
              ft_string,
              ft_multiplechoice:      sVal:= AnsiString(PAnsiChar(@buf1));
              ft_stringw:             sVal:= WideString(PWideChar(@buf1));
              else sVal:= WdxFieldType(res);
            end;
          end; //if fType=ft_fulltext

          Result:= sVal;
        end; //for nUnit
      end; //for n
  finally
    if @ProcU<>nil then
      try
        ProcU;
      except
        Msg('Exception in ContentPluginUnloading');
      end;
    Sleep(100);
    FreeLibrary(hLib);
  end;
end;

end.
