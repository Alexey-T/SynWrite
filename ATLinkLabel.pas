{
Copyright (C) Alexey Torgashin, uvviewsoft.com
License: MPL 2.0 or LGPL
}

unit ATLinkLabel;

interface

uses
  Classes, SysUtils, Graphics, Controls, StdCtrls,
  Windows, ShellApi;

type
  { TLinkLabel }

  TLinkLabel = class(TLabel)
  private
    FLink: string;
    FColorLinkNormal: TColor;
    FColorLinkMouseover: TColor;
    procedure SetLink(AValue: string);
    procedure MouseEnter(Sender: TObject);
    procedure MouseLeave(Sender: TObject);
  public
    constructor Create(AOwner: TComponent); override;
  protected
    procedure Click; override;
  published
    property Link: string read FLink write SetLink;
    property ColorLinkNormal: TColor read FColorLinkNormal write FColorLinkNormal;
    property ColorLinkMouseover: TColor read FColorLinkMouseover write FColorLinkMouseover;
  end;

implementation

constructor TLinkLabel.Create(AOwner: TComponent);
begin
  inherited;
  Cursor:= crHandPoint;
  ShowHint:= true;
  ColorLinkNormal:= clBlue;
  ColorLinkMouseover:= clRed;
  Font.Color:= ColorLinkNormal;
  OnMouseEnter:= MouseEnter;
  OnMouseLeave:= MouseLeave;
end;

procedure TLinkLabel.SetLink(AValue: string);
begin
  if FLink=AValue then Exit;
  FLink:= AValue;
  Hint:= AValue;
end;

procedure TLinkLabel.Click;
begin
  if Link<>'' then
    ShellExecute(0, 'open', PChar(Link), nil, nil, SW_SHOWNORMAL);
end;

procedure TLinkLabel.MouseEnter;
begin
  Font.Color:= ColorLinkMouseover;
  Font.Style:= Font.Style+[fsUnderline];
end;

procedure TLinkLabel.MouseLeave;
begin
  Font.Color:= ColorLinkNormal;
  Font.Style:= Font.Style-[fsUnderline];
end;

end.

