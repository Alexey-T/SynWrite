unit unProc;

interface

uses graphics;

function WideMinimizeName(const s:widestring; c:tcanvas; n:integer): widestring;

implementation

uses Filectrl;

function WideMinimizeName(const s:widestring; c:tcanvas; n:integer): widestring;
begin
  result:= MinimizeName(s, c, n);
end;
end.
