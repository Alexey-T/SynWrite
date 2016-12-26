{$APPTYPE CONSOLE}
program CalcText;

uses
  IniFile,
  StrUtils,
  SysUtils,
  Math;

var
  FmtS: integer = 9;
  Fmt1: integer = 22;
  Fmt2: integer = 4;
  ShowSum, ShowMin, ShowMax, ShowAvg, ShowValList, ShowValCount,
  ShowCap: boolean;

  procedure ReadOptions;
  var
    s: string;
  begin
    IniFilename:= ExtractFilePath(ParamStr(0))+'CalcText.ini';
    s:= GetIniKey('Opt', 'DecimalSeparator', '.');
    if s<>'' then DecimalSeparator:= s[1];
    Fmt1:= GetIniKey('Opt', 'DigitsTotal', 22);
    Fmt2:= GetIniKey('Opt', 'DigitsFraction', 4);

    ShowSum:= Boolean(GetIniKey('Opt', 'ShowSum', 1));
    ShowMin:= Boolean(GetIniKey('Opt', 'ShowMin', 1));
    ShowMax:= Boolean(GetIniKey('Opt', 'ShowMax', 1));
    ShowAvg:= Boolean(GetIniKey('Opt', 'ShowAvg', 1));
    ShowValList:= Boolean(GetIniKey('Opt', 'ShowValueList', 1));
    ShowValCount:= Boolean(GetIniKey('Opt', 'ShowValueCount', 1));
    ShowCap:= Boolean(GetIniKey('Opt', 'ShowCaptions', 1));
  end;

  procedure Calc(const fn: string);
  var
    NLines: Integer;
    N, NSum, NMin, NMax: Currency;
    f: TextFile;
    s: string;
  begin
    AssignFile(f, fn);
    {$I-}
    Reset(f);
    {$I+}
    if IOResult<>0 then Exit;

    NLines:= 0;
    NSum:= 0;
    NMin:= 1e14; //max Currency
    NMax:= -1e14;
    N:= 0;

    if ShowValList then
      Write(IfThen(ShowCap, 'Values: '));
    while not Eof(f) do
    begin
      Readln(f, s);
      s:= Trim(s);
      if s='' then Continue;
      try
        N:= StrToCurr(s);
      except
        if ShowValList then
          Write('(invalid '+s+') ');
        Continue;
      end;

      if ShowValList then
        Write(s, ' ');
      Inc(NLines);
      NSum:= NSum + N;
      if N<NMin then NMin:= N;
      if N>NMax then NMax:= N;
    end;
    CloseFile(f);

    if ShowValList then
      Writeln;
    if ShowValCount then
      Writeln(IfThen(ShowCap, 'Count: '), NLines);
    if ShowValList or ShowValCount then
      Writeln;

    if NLines>0 then
    begin
      if ShowMin then
        Writeln(IfThen(ShowCap, 'Minimal: '):IfThen(ShowCap, FmtS), NMin:Fmt1:Fmt2);
      if ShowMax then
        Writeln(IfThen(ShowCap, 'Maximal: '):IfThen(ShowCap, FmtS), NMax:Fmt1:Fmt2);
      if ShowAvg then
        Writeln(IfThen(ShowCap, 'Average: '):IfThen(ShowCap, FmtS), (NSum/NLines):Fmt1:Fmt2);
      if ShowSum then
        Writeln(IfThen(ShowCap, 'Sum: '):IfThen(ShowCap, FmtS), NSum:Fmt1:Fmt2);
    end;
  end;

var
  fn: string;
begin
  if ParamCount=0 then
  begin
    Writeln('Program calculates sum/ min value/ max value/ average value, for a text file with float numbers.');
    Writeln('(c) Alexey Torgashin, uvviewsoft.com');
    Writeln('Usage:');
    Writeln('  CalcText.exe <input_filename>');
    Exit
  end;

  fn:= ParamStr(1);
  if not FileExists(fn) then
  begin
    Writeln(Format('File "%s" not found', [fn]));
    Exit
  end;

  //read options
  ReadOptions;

  //do work
  Calc(fn);
end.
