unit unSaveLex;

interface

uses
  Classes, ecSyntAnal;

procedure SaveLexerStylesToFile(f: TSyntAnalyzer; const fn: string);
procedure LoadLexerStylesFromFile(f: TSyntAnalyzer; const fn: string);

implementation

uses SysUtils, Graphics, IniFiles,
  ecStrUtils, ATxSProc, ATxIniFile;

function FormatFlagsToStr(const f: TFormatFlags): string;
begin
  Result:= '';
  if ffBold in f then Result:= Result+'b';
  if ffItalic in f then Result:= Result+'i';
  if ffUnderline in f then Result:= Result+'u';
  if ffStrikeOut in f then Result:= Result+'s';
  if ffReadOnly in f then Result:= Result+'r';
  if ffHidden in f then Result:= Result+'h';
  if ffFontName in f then Result:= Result+'N';
  if ffFontSize in f then Result:= Result+'S';
  if ffFontCharset in f then Result:= Result+'C';
  if ffVertAlign in f then Result:= Result+'v';
end;

function StrToFormatFlags(const s: string): TFormatFlags;
var i:Integer;
begin
  Result:= [];
  for i:= 1 to Length(s) do
    case s[i] of
      'b': Include(Result, ffBold);
      'i': Include(Result, ffItalic);
      'u': Include(Result, ffUnderline);
      's': Include(Result, ffStrikeOut);
      'r': Include(Result, ffReadOnly);
      'h': Include(Result, ffHidden);
      'N': Include(Result, ffFontName);
      'S': Include(Result, ffFontSize);
      'C': Include(Result, ffFontCharset);
      'v': Include(Result, ffVertAlign);
    end;  
end;

function FontStylesToStr(const f: TFontStyles): string;
begin
  Result:= '';
  if fsBold in f then Result:= Result+'b';
  if fsItalic in f then Result:= Result+'i';
  if fsUnderline in f then Result:= Result+'u';
  if fsStrikeout in f then Result:= Result+'s';
end;

function StrToFontStyles(const s: string): TFontStyles;
var i:Integer;
begin
  Result:= [];
  for i:= 1 to Length(s) do
    case s[i] of
      'b': Include(Result, fsBold);
      'i': Include(Result, fsItalic);
      'u': Include(Result, fsUnderline);
      's': Include(Result, fsStrikeout);
    end;
end;

procedure SaveLexerStylesToFile(f: TSyntAnalyzer; const fn: string);
var
  i: Integer;
  s, si, sd: string;
begin
  s:= f.LexerName;
  with TIniFile.Create(fn) do
  try
    EraseSection(s);
    WriteString(s, 'Ext', f.Extentions);
    WriteInteger(s, 'Num', f.Formats.Count);
    for i:= 0 to f.Formats.Count-1 do
     with f.Formats[i] do
     begin
      si:= IntToStr(i);
      WriteString(s, si+'_Name', '"'+DisplayName+'"');
      WriteString(s, si+'_FontName', Font.Name);
      WriteInteger(s, si+'_FontSize', Font.Size);
      WriteString(s, si+'_FontColor', ColorToString(Font.Color));
      WriteString(s, si+'_FontStyles', FontStylesToStr(Font.Style));
      WriteString(s, si+'_BgColor', ColorToString(BgColor));

      WriteString(s, si+'_BorderColorBottom', ColorToString(BorderColorBottom));
      WriteString(s, si+'_BorderColorLeft', ColorToString(BorderColorLeft));
      WriteString(s, si+'_BorderColorRight', ColorToString(BorderColorRight));
      WriteString(s, si+'_BorderColorTop', ColorToString(BorderColorTop));

      WriteInteger(s, si+'_BorderTypeBottom', Integer(BorderTypeBottom));
      WriteInteger(s, si+'_BorderTypeLeft', Integer(BorderTypeLeft));
      WriteInteger(s, si+'_BorderTypeRight', Integer(BorderTypeRight));
      WriteInteger(s, si+'_BorderTypeTop', Integer(BorderTypeTop));

      WriteInteger(s, si+'_ChangeCase', Integer(ChangeCase));
      WriteString(s, si+'_FormatFlags', FormatFlagsToStr(FormatFlags));
      WriteInteger(s, si+'_FormatType', Integer(FormatType));
      WriteBool(s, si+'_Hidden', Hidden);
      WriteBool(s, si+'_MultiLineBorder', MultiLineBorder);
      WriteBool(s, si+'_ReadOnly', ReadOnly);
      WriteInteger(s, si+'_VertAlignment', Integer(VertAlignment));
    end;

    WriteInteger(s, 'TpNum', f.CodeTemplates.Count);
    for i:= 0 to f.CodeTemplates.Count-1 do
      with f.CodeTemplates[i] do
      begin
        si:= 'Tp'+IntToStr(i);
        WriteString(s, si+'_Name', '"'+Name+'"');
        WriteString(s, si+'_Desc', '"'+Description+'"');
        WriteBool(s, si+'_Adv', Advanced);
        sd:= Code.Text;
        SReplaceAll(sd, sLineBreak, '<SW_EOL>');
        WriteString(s, si+'_Code', '"'+sd+'"');
      end;
  finally
    Free
  end;    
end;


procedure LoadLexerStylesFromFile(f: TSyntAnalyzer; const fn: string);
var
  i, j, n:Integer;
  s, si, sd: string;
  fm: TSyntaxFormat;
  tp: TCodeTemplate;
begin
  if f=nil then Exit;
  s:= f.LexerName;
  fm:= TSyntaxFormat.Create(nil);
  with TMemIniFileEx.Create(fn) do //NOTE: TMemIniFileEx to avoid max line length 2047
  try
    f.Extentions:= ReadString(s, 'Ext', f.Extentions);
    for i:= 0 to ReadInteger(s, 'Num', 0)-1 do
    begin
      si:= IntToStr(i);
      fm.DisplayName:= ReadString(s, si+'_Name', '');
      fm.Font.Name:= ReadString(s, si+'_FontName', '');
      fm.Font.Size:= ReadInteger(s, si+'_FontSize', 10);
      fm.Font.Color:= StringToColor(ReadString(s, si+'_FontColor', ''));
      fm.Font.Style:= StrToFontStyles(ReadString(s, si+'_FontStyles', ''));
      fm.BgColor:= StringToColor(ReadString(s, si+'_BgColor', ''));

      fm.BorderColorBottom:= StringToColor(ReadString(s, si+'_BorderColorBottom', ''));
      fm.BorderColorLeft:= StringToColor(ReadString(s, si+'_BorderColorLeft', ''));
      fm.BorderColorRight:= StringToColor(ReadString(s, si+'_BorderColorRight', ''));
      fm.BorderColorTop:= StringToColor(ReadString(s, si+'_BorderColorTop', ''));

      fm.BorderTypeBottom:= TBorderLineType(ReadInteger(s, si+'_BorderTypeBottom', 0));
      fm.BorderTypeLeft:= TBorderLineType(ReadInteger(s, si+'_BorderTypeLeft', 0));
      fm.BorderTypeRight:= TBorderLineType(ReadInteger(s, si+'_BorderTypeRight', 0));
      fm.BorderTypeTop:= TBorderLineType(ReadInteger(s, si+'_BorderTypeTop', 0));

      fm.ChangeCase:= TChangeCase(ReadInteger(s, si+'_ChangeCase', 0));
      fm.FormatFlags:= StrToFormatFlags(ReadString(s, si+'_FormatFlags', ''));
      fm.FormatType:= TFormatType(ReadInteger(s, si+'_FormatType', 0));
      fm.Hidden:= ReadBool(s, si+'_Hidden', false);
      fm.MultiLineBorder:= ReadBool(s, si+'_MultiLineBorder', false);
      fm.ReadOnly:= ReadBool(s, si+'_ReadOnly', false);
      fm.VertAlignment:= TVertAlignment(ReadInteger(s, si+'_VertAlignment', 0));

      //Apply fm to matched style
      for j:= 0 to f.Formats.Count-1 do
        if f.Formats[j].DisplayName = fm.DisplayName then
        begin
          f.Formats[j].Assign(fm);
          Break
        end;
    end;

    n:= ReadInteger(s, 'TpNum', 0);
    if n>0 then
    begin
      f.CodeTemplates.Clear;
      for i:= 0 to n-1 do
      begin
        si:= 'Tp'+IntToStr(i);
        tp:= f.CodeTemplates.Add;
        tp.Name:= ReadString(s, si+'_Name', '');
        tp.Description:= ReadString(s, si+'_Desc', '');
        tp.Advanced:= ReadBool(s, si+'_Adv', false);
        sd:= ReadString(s, si+'_Code', '');
        SReplaceAll(sd, '<SW_EOL>', sLineBreak);
        tp.Code.SetText(PWideChar(WideString(sd)));
      end;
    end;
  finally
    Free;
    fm.Free;
  end;
end;


end.
