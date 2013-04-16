//{$define debug}
unit ATxLoremIpsum;

interface

uses
  Classes;

{
List must be in form:

xxxx xxxxx xxxxxxxxx.
xxxxx xxxx xxxxx.
<empty line>
xxxxxx xxxx xxxxxxx.
xxxx xxxxxx xxx.
xxxxx xxxx.
<empty line>
xxxx xxxxx xxxx.
xxxxxx xxxxxx.
<empty line at end not needed>
}
type
  TLoremMode = (swSent, swPara{, swWords});

function SLoremIpsum(List: TStringList; AMode: TLoremMode;
  ACount: integer; AHtmlTag: boolean; const AEol: string): string;

implementation

uses
  SysUtils;

    {
function SGetWord(var s: string): string;
var
  i: Integer;
begin
end;
}

function SLoremIpsum(List: TStringList; AMode: TLoremMode; ACount: integer; AHtmlTag: boolean; const AEol: string): string;
  function ParaAdd(const s: string): string;
  begin
    if AHtmlTag then
      Result:= '<p>'+Trim(s)+'</p>'+AEol
    else
      Result:= Trim(s)+AEol+AEol;
  end;
var
  i, k, NTotal: Integer;
  s, sList: string;
begin
  if (List=nil) or (List.Count=0) then
    raise Exception.Create('Lorem list nil');
  if (ACount<=0) then
    raise Exception.Create('Lorem count<1');  

  Result:= '';
  NTotal:= List.Count;
  //ensure last line empty
  if List[NTotal-1]<>'' then
    List.Add('');
  
  case AMode of
    {
    swWords:
    begin
    end;
    }

    swSent:
    begin
      k:= 0;
      for i:= 0 to MaxInt div 2 do
      begin
        sList:= List[i mod NTotal];
        if sList='' then Continue;
        Result:= Result+sList+' ';
        Inc(k);
        if k>=ACount then Break;
      end;
      Result:= Trim(Result);
    end;

    swPara:
    begin
      k:= 0;
      s:= '';
      for i:= 0 to MaxInt div 2 do
      begin
        sList:= List[i mod NTotal];
        if sList='' then
        begin
          Result:= Result+ParaAdd(s);
          s:= '';
          Inc(k);
          if k>=ACount then Break;
        end
        else
          s:= s+sList+' ';
      end;
    end;
  end;
end;

end.
