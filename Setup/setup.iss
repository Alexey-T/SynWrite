[Setup]
AppName=SynWrite
AppVersion=6.15.1940
AppPublisher=UVViewSoft
AppPublisherURL=http://uvviewsoft.com
AppSupportURL=http://uvviewsoft.com
DefaultDirName=C:\SynWrite
DefaultGroupName=SynWrite
DisableProgramGroupPage=yes
OutputDir=D:\
OutputBaseFilename=SynWrite
SetupIconFile=setup.ico
Compression=lzma
SolidCompression=yes
AppMutex=UVViewSoft.SynWrite
;PrivilegesRequired=none
PrivilegesRequired=lowest

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"
;Name: "german"; MessagesFile: "compiler:Languages\German.isl"
;Name: "russian"; MessagesFile: "compiler:Languages\Russian.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"
Name: "portable"; Description: "Make folder portable"; Flags: unchecked

[Files]
Source: "Portable.ini"; DestDir: "{app}"; Tasks: "portable"
Source: "..\Syn.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\SynHelper.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\LexLib.lxl"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\Enc.cfg"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\Lexers.cfg"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\Lang\*"; DestDir: "{app}\Lang"; Flags: ignoreversion
Source: "..\Readme\*"; DestDir: "{app}\Readme"; Flags: ignoreversion

Source: "..\DLLs\*"; DestDir: "{app}\DLLs"; Flags: ignoreversion
Source: "..\Py\sw*.py"; DestDir: "{app}\Py"; Flags: ignoreversion
Source: "..\python*.zip"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\*.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\*.manifest"; DestDir: "{app}"; Flags: ignoreversion

Source: "..\Py\syn_plugin_manager\*.py"; DestDir: "{app}\Py\syn_plugin_manager";
Source: "..\Py\syn_plugin_manager\*.lng"; DestDir: "{app}\Py\syn_plugin_manager";
Source: "..\Py\syn_plugin_manager\*.inf"; DestDir: "{app}\Py\syn_plugin_manager";

Source: "..\Data\autocomplete\*"; DestDir: "{app}\Data\autocomplete";
Source: "..\Data\colors\*"; 	  DestDir: "{app}\Data\colors";
Source: "..\Data\newdoc\*";       DestDir: "{app}\Data\newdoc";
Source: "..\Data\skins\*";        DestDir: "{app}\Data\skins";
Source: "..\Data\icons\*";        DestDir: "{app}\Data\icons";
Source: "..\Data\conv\*";         DestDir: "{app}\Data\conv";
Source: "..\Data\outpresets\*";   DestDir: "{app}\Data\outpresets";
Source: "..\Data\htmltidy\*";     DestDir: "{app}\Data\htmltidy";
Source: "..\Data\websearch\*";    DestDir: "{app}\Data\websearch";

Source: "..\Data\clips\Arrows\*";                     DestDir: "{app}\Data\clips\Arrows";                    
Source: "..\Data\clips\Currency symbols\*";           DestDir: "{app}\Data\clips\Currency symbols";          
Source: "..\Data\clips\Greek alphabet (lower)\*";     DestDir: "{app}\Data\clips\Greek alphabet (lower)";    
Source: "..\Data\clips\Greek alphabet (upper)\*";     DestDir: "{app}\Data\clips\Greek alphabet (upper)";    
Source: "..\Data\clips\HTML - Arrows\*";              DestDir: "{app}\Data\clips\HTML - Arrows";             
Source: "..\Data\clips\HTML - Color names\*";         DestDir: "{app}\Data\clips\HTML - Color names";        
Source: "..\Data\clips\HTML - Color names+values\*";  DestDir: "{app}\Data\clips\HTML - Color names+values"; 
Source: "..\Data\clips\HTML - Letters\*";             DestDir: "{app}\Data\clips\HTML - Letters";            
Source: "..\Data\clips\HTML - Math symbols\*";        DestDir: "{app}\Data\clips\HTML - Math symbols";       
Source: "..\Data\clips\HTML - Special characters\*";  DestDir: "{app}\Data\clips\HTML - Special characters"; 
Source: "..\Data\clips\Math symbols\*";               DestDir: "{app}\Data\clips\Math symbols";              
Source: "..\Data\clips\Quote selection\*";            DestDir: "{app}\Data\clips\Quote selection";           
Source: "..\Data\clips\Special characters\*";         DestDir: "{app}\Data\clips\Special characters";        

Source: "..\Data\snippets\Std.C\*";      DestDir: "{app}\Data\snippets\Std.C";      
Source: "..\Data\snippets\Std.Pascal\*"; DestDir: "{app}\Data\snippets\Std.Pascal"; 
Source: "..\Data\snippets\Std.Php\*";    DestDir: "{app}\Data\snippets\Std.Php";    

Source: "..\Tools\*"; DestDir: "{app}\Tools"; 
Source: "..\Dictionaries\*"; DestDir: "{app}\Dictionaries"; 

Source: "..\SynPlugins.sample.ini"; DestDir: "{app}"; 
Source: "..\Plugins\Explorer\*"; DestDir: "{app}\Plugins\Explorer"; 
Source: "..\Plugins\SynFTP\*"; DestDir: "{app}\Plugins\SynFTP"; 

[Icons]
Name: "{group}\SynWrite"; Filename: "{app}\Syn.exe"
Name: "{group}\SynWrite Help"; Filename: "{app}\Readme\SynWrite.chm"
Name: "{group}\{cm:UninstallProgram,SynWrite}"; Filename: "{uninstallexe}"
Name: "{commondesktop}\SynWrite"; Filename: "{app}\Syn.exe"; Tasks: desktopicon

[UninstallDelete]
Type: files; Name: "{app}\Syn*.ini"
Type: files; Name: "{app}\Portable.ini"

;[Registry]
;Root: HKCR; Subkey: "*\shell\SynWrite"; Flags: uninsdeletekey
;Root: HKCR; Subkey: "*\shell\SynWrite\command"; Flags: uninsdeletekey
;Root: HKCR; Subkey: "*\shell\SynWrite\command"; ValueType: string; ValueName: ""; ValueData: """{app}\Syn.exe"" ""%1"""
