unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  ad3LiveAutospell,
  ad3SpellBase, ad3Spell, ad3LiveBase,
  ad3SpellLanguages,
  Dialogs;

type
  TForm1 = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FSpell: TAddictAutoLiveSpell;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
var syndir, sinidir: string;
begin
  sinidir:= 'c:\utils\';
  syndir:= ExtractFilePath(Application.ExeName);

  FSpell:= TAddictAutoLiveSpell.Create(Self);
  with FSpell do
  begin
    ConfigDefaultMain.Add('American.adm');
    ConfigDictionaryDir.Clear;
    ConfigDictionaryDir.Add(ExtractFileDir(SIniDir));
    ConfigDictionaryDir.Add(SynDir + 'Dictionaries');
    ConfigFilename:= SIniDir + 'SynSpell.ini';
    ConfigStorage:= csFile;
    SuggestionsLearningDict:= SIniDir + 'SynSpellLearn.adl';
    {
    OnPopupCreateMenu:= SpellPopupCreateMenu;
    OnPopupAddMenuItem:= SpellPopupAddMenuItem;
    OnPopupDoMenu:= SpellPopupDoMenu;
    }
    UILanguage:= ltRussian;
  end;
end;

end.
 