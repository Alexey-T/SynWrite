unit unGlobData;

interface

uses
  SysUtils, Classes,
  ExtCtrls,
  Dialogs,
  IniFiles,
  TntClasses,
  ATxFProc,
  ATxSProc,
  ecSyntAnal;

const
  cSynVersion = '6.32.2530';
  cSynApiVersion = '1.0.160';

var
  SynModuleFilename: string;
  SynExe: boolean;
  SynDir: string;
  SynIniDir: string;
  SynDirForHelpFiles: string;
  SynLexerDir: string;
  SynCommandlineSessionFN: string;
  SynCommandlineProjectFN: string;
  SyntaxManager: TSyntaxManager = nil;

type
  TSynDataSubdirId = (
    cSynDataAutocomp,
    cSynDataClips,
    cSynDataColors,
    cSynDataConv,
    cSynDataIcons,
    cSynDataOutPresets,
    cSynDataSkins,
    cSynDataSnippets,
    cSynDataLexerLib
    );
const
  cSynDataSubdirNames: array[TSynDataSubdirId] of string = (
    'autocomplete',
    'clips',
    'colors',
    'conv',
    'icons',
    'outpresets',
    'skins',
    'snippets',
    'lexlib'
    );


procedure LoadLexerLib;
function FAppDataPath: string;

function SynDataSubdir(Id: TSynDataSubdirId): string;
function SynPluginIni(const SCaption: string): string;
function SynIni: string;
function SynToolbarsIni: string;
function SynStylesIni: string;
function SynHistoryIni: string;
function SynHistoryStatesIni: string;
function SynFoldStatesIni: string;
function SynMacrosIni: string;
function SynHideIni: string;
function SynPluginsIni: string;
function SynConverterFilename(const Name: string): string;
function SynSkinsDir: string;
function SynSnippetsDir: string;
function SynIconsDir: string;
function SynPyDir: string;
function SynSkinFilename(const Name: string): string;
function SynClipsDir: string;

function IsLexerListed(const Lexer, List: string): boolean;
function IsLexerHTML(const s: string): boolean;
function IsLexerPHP(const s: string): boolean;
function IsLexerPas(const s: string): boolean;
function IsLexerCSS(const s: string; CanBeLess: boolean = true): boolean;
function IsLexerJS(const s: string): boolean;
function IsLexerXML(const s: string): boolean;
function IsLexerWithTags(const s: string): boolean;
function IsLexerWithImages(const s: string): boolean;
function IsLexerIni(const s: string): boolean;
function IsLexerNFO(const s: string): boolean;
function IsLexerMake(const s: string): boolean;
function IsLexerProp(const s: string): boolean;
function IsLexerWithColors(const s: string): boolean;

const
  cLexerCss = 'CSS';
  cLexerCssList = 'LESS,SASS,SCSS,Sass,Stylus';
  cLexerIni = 'Ini files';
  cLexerXML = 'XML';
  cLexerJS = 'JavaScript';
  cLexerNfo = 'NFO files';
  cLexerMake = 'Make files';
  cLexerProperties = 'Properties';

const
  cSynColorSwatchExt = 'synw-colorstring';
  cSynSnippetExt = 'synw-snippet';
  cSynSessionExt = 'synw-session';

const
  cLister_itm_wrap    = $FFFC;
  cLister_itm_percent = $FFFE;

type
  TSynPyEvent = (
    cSynEventOnOpen,
    cSynEventOnSaveAfter,
    cSynEventOnSaveBefore,
    cSynEventOnKey,
    cSynEventOnChange,
    cSynEventOnChangeSlow,
    cSynEventOnSelect,
    cSynEventOnCaretMove,
    cSynEventOnClick,
    cSynEventOnClickDbl,
    cSynEventOnNumber,
    cSynEventOnState,
    cSynEventOnFocus,
    cSynEventOnLexer,
    cSynEventOnComplete,
    cSynEventOnFuncHint,
    cSynEventOnGotoDef,
    cSynEventOnConsole,
    cSynEventOnPanelLog,
    cSynEventOnCompare
    );
  TSynPyEvents = set of TSynPyEvent;

const
  cSynPyEvent: array[TSynPyEvent] of string = (
    'on_open',
    'on_save',
    'on_save_pre',
    'on_key',
    'on_change',
    'on_change_slow',
    'on_select',
    'on_caret_move',
    'on_click',
    'on_click_dbl',
    'on_num',
    'on_state',
    'on_focus',
    'on_lexer',
    'on_complete',
    'on_func_hint',
    'on_goto_def',
    'on_console',
    'on_panel_log',
    'on_compare'
    );

type
  TSynAddonType = (
    cAddonTypeNone,
    cAddonTypeBinPlugin,
    cAddonTypePyPlugin,
    cAddonTypeData,
    cAddonTypeLexer,
    cAddonTypeRoot
    );
const
  cSynAddonType: array[TSynAddonType] of string = (
    '',
    'plugin',
    'py-plugin',
    'template',
    'lexer',
    'root-addon'
    );


implementation


procedure LoadLexerLib;
var
  dir, fn, lexname: string;
  L: TTntStringList;
  an: TSyntAnalyzer;
  ini: TIniFile;
  i, j: integer;
begin
  //dont load again (if Lister plg called before)
  if SyntaxManager.AnalyzerCount>0 then Exit;
  SyntaxManager.Clear;

  //load .lcf files to lib
  dir:= SynDataSubdir(cSynDataLexerLib);
  L:= TTntStringList.Create;
  try
    FFindToList(L, dir, '*.lcf', '', false, False, false, false);
    L.Sort;

    if L.Count=0 then
    begin
      //DoHint('Cannot find lexer files (data\lexlib\*.lcf)');
      exit
    end;

    for i:= 0 to L.Count-1 do
    begin
      an:= SyntaxManager.AddAnalyzer;
      an.LoadFromFile(L[i]);
    end;
  finally
    FreeAndNil(L);
  end;

  //correct sublexer links
  for i:= 0 to SyntaxManager.AnalyzerCount-1 do
  begin
    an:= SyntaxManager.Analyzers[i];
    fn:= dir+'\'+an.LexerName+'.cuda-lexmap';
    if FileExists(fn) then
    begin
      ini:= TIniFile.Create(fn);
      try
        for j:= 0 to an.SubAnalyzers.Count-1 do
        begin
          lexname:= ini.ReadString('ref', IntToStr(j), '');
          if lexname<>'' then
            an.SubAnalyzers[j].SyntAnalyzer:= SyntaxManager.FindAnalyzer(lexname);
        end;
      finally
        FreeAndNil(ini);
      end;
    end;
  end;
end;


function FAppDataPath: string;
begin
  Result:= SExpandVars('%AppData%\');
end;

function SynDataSubdir(Id: TSynDataSubdirId): string;
begin
  Result:= SynDir + 'Data\' + cSynDataSubdirNames[Id];
end;

function SynPluginIni(const SCaption: string): string;
begin
  Result:= SynIniDir + 'SynPlugin' + SCaption + '.ini';
end;

function SynIni: string;
begin
  Result:= SynIniDir + 'Syn.ini';
end;

function SynToolbarsIni: string;
begin
  Result:= SynIniDir + 'SynToolbars.ini';
end;

function SynStylesIni: string;
begin
  Result:= SynIniDir + 'SynStyles.ini';
end;

function SynHistoryIni: string;
begin
  Result:= SynIniDir + 'SynHistory.ini';
end;

function SynHistoryStatesIni: string;
begin
  Result:= SynIniDir + 'SynHistoryStates.ini';
end;

function SynFoldStatesIni: string;
begin
  Result:= SynIniDir + 'SynFoldStates.ini';
end;

function SynMacrosIni: string;
begin
  Result:= SynIniDir + 'SynMacros.ini';
end;

function SynHideIni: string;
begin
  Result:= SynIniDir + 'SynHide.ini';
end;

function SynPluginsIni: string;
begin
  Result:= SynIniDir + 'SynPlugins.ini';
end;

function SynConverterFilename(const Name: string): string;
begin
  Result:= SynDataSubdir(cSynDataConv) + '\' + Name + '.txt';
end;

function SynSkinsDir: string;
begin
  Result:= SynDataSubdir(cSynDataSkins);
end;

function SynSnippetsDir: string;
begin
  Result:= SynDataSubdir(cSynDataSnippets);
end;

function SynIconsDir: string;
begin
  Result:= SynDataSubdir(cSynDataIcons);
end;

function SynPyDir: string;
begin
  Result:= SynDir + 'Py';
end;

function SynSkinFilename(const Name: string): string;
begin
  Result:= SynSkinsDir + '\' + Copy(Name, 2, MaxInt) + '.skn';
end;

function SynClipsDir: string;
begin
  Result:= SynDataSubdir(cSynDataClips);
end;


function IsLexerListed(const Lexer, List: string): boolean;
begin
  Result:= IsStringListed(LowerCase(Lexer), LowerCase(List));
end;

function IsLexerHTML(const s: string): boolean;
begin
  Result:= Pos('HTML', s)>0;
end;

function IsLexerPHP(const s: string): boolean;
begin
  Result:= Pos('PHP', s)>0;
end;

function IsLexerPas(const s: string): boolean;
begin
  Result:= Pos('Pascal', s)>0;
end;

function IsLexerCSS(const s: string; CanBeLess: boolean = true): boolean;
begin
  Result:= (s=cLexerCss) or
    (CanBeLess and IsLexerListed(s, cLexerCssList));
end;

function IsLexerJS(const s: string): boolean;
begin
  Result:= s=cLexerJS;
end;

function IsLexerXML(const s: string): boolean;
begin
  Result:= s=cLexerXML;
end;

function IsLexerWithTags(const s: string): boolean;
begin
  Result:= IsLexerHTML(s) or IsLexerXML(s);
end;

function IsLexerWithImages(const s: string): boolean;
begin
  Result:= IsLexerHTML(s) or IsLexerCSS(s);
end;

function IsLexerIni(const s: string): boolean;
begin
  Result:= s=cLexerIni;
end;

function IsLexerNFO(const s: string): boolean;
begin
  Result:= s=cLexerNfo;
end;

function IsLexerMake(const s: string): boolean;
begin
  Result:= s=cLexerMake;
end;

function IsLexerProp(const s: string): boolean;
begin
  Result:= s=cLexerProperties;
end;

function IsLexerWithColors(const s: string): boolean;
begin
  Result:=
    IsLexerCSS(s) or
    IsLexerHTML(s) or
    IsLexerJS(s) or
    IsLexerPHP(s) or
    IsLexerProp(s) or
    IsLexerIni(s);
end;


var
  DummyComponent: TComponent;
  
{ TColorBox }

initialization

  SynModuleFilename:= GetModuleName(HInstance);
  SynExe:= LowerCase(ExtractFileExt(SynModuleFilename))='.exe';
  SynDir:= ExtractFilePath(SynModuleFilename);
  SynIniDir:= SynDir + 'Settings\';
  SynDirForHelpFiles:= SynDir + 'Readme';
  SynLexerDir:= SynDataSubdir(cSynDataLexerLib);

  DummyComponent:= TComponent.Create(nil);
  SyntaxManager:= TSyntaxManager.Create(DummyComponent);

finalization

  FreeAndNil(SyntaxManager);
  FreeAndNil(DummyComponent);

end.
