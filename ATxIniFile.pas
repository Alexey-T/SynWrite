{
TMemIniFileEx is a helper class that:
 - Inherits from TMemIniFile
 - Removes double-quotes from strings on reading
 - Should NOT be used for saving
}

unit ATxIniFile;

interface

uses
  IniFiles;

type
  TMemIniFileEx = class(TMemIniFile)
  public
    procedure WriteString(const Section, Ident, Value: string); override;
    procedure DeleteKey(const Section, Ident: string); override;
    function ReadString(const Section, Ident, Default: string): string; override;
  end;


implementation

const
  cQuote = '"';

function SQuoted(const S: string): boolean;
begin
  Result := (Length(S) >= 2) and
    (S[1] = cQuote) and (S[Length(S)] = cQuote);
end;

procedure SQuoteIfNeeded(var S: string);
const
  cChars = [cQuote, ' ', #9];
begin
  if (S <> '') then
    if (S[1] in cChars) or (S[Length(S)] in cChars) then
      S := cQuote + S + cQuote;
end;

procedure TMemIniFileEx.WriteString(const Section, Ident, Value: string);
begin
  Assert(False, 'TMemIniFileEx.WriteString should not be used');
end;

procedure TMemIniFileEx.DeleteKey(const Section, Ident: string);
begin
  Assert(False, 'TMemIniFileEx.DeleteKey should not be used');
end;

function TMemIniFileEx.ReadString(const Section, Ident, Default: string): string;
begin
  Result := inherited ReadString(Section, Ident, Default);
  if SQuoted(Result) then
    Result := Copy(Result, 2, Length(Result) - 2);
end;


end.
