unit ATxLoremIpsum;

interface

function SLoremIpsum(
  ACount: integer;
  AIsPara: boolean;
  AIsHtmlTag: boolean): string;

implementation

uses
  SysUtils,
  PythonEngine;

function SLoremIpsum(
  ACount: integer;
  AIsPara: boolean;
  AIsHtmlTag: boolean): string;
const
  cBool: array[boolean] of string = ('False', 'True');
var
  SCmd1, SCmd2: string;
begin
  SCmd1:= 'import sw_lorem';
  SCmd2:= Format(
    'sw_lorem.gettext(%d, %s, %s)',
    [ACount, cBool[AIsPara], cBool[AIsHtmlTag]]);

  try
    GetPythonEngine.ExecString(SCmd1);
    Result:= GetPythonEngine.EvalStringAsStr(SCmd2);
  except
    Result:= '';
  end;
end;

end.
