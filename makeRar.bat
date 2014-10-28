@echo off
set a=D:\SynWrite.rar
copy /b Syn.dklang Readme\

del %a%
del Readme\Src*.rar
rem Src.rar
start /min /wait winrar a Readme\Src.rar *.pas *.dpr *.dfm *.res Setup\setup*.* make*.bat zip*.bat Res\*
start /min /wait winrar a -ep Readme\Src.rar D:\SynLite\ATTabs\ATTabs.pas D:\SynLite\ATGroups\ATGroups.pas
rem SrcTests.rar
start /min /wait winrar a -r -x*.dll -x*.exe -x*.~* -x*.dcu -x*.dof -x*.drc -x*.map -x*.mes -x*.rar Readme\SrcTests.rar Tests\*
rem SrcPlugins.rar
start /min /wait winrar a -r -x*.dll -x*.exe -x*.~* -x*.dcu -x*.dof -x*.drc -x*.map -x*.mes -x*.rar -x*.ddp Readme\SrcPlugins.rar D:\SynPlugins
start /min /wait winrar d -r Readme\SrcPlugins.rar *git\*

rem SynWrite.rar
start /min /wait winrar a %a% *.wlx *.inf Syn.exe SynHelper.exe LexLib.lxl Enc.cfg Lexers.cfg Tidy.cfg HL\* Readme\* Lang\* Data\autocomplete\* Data\colors\* Data\newdoc\* Data\outpresets\* Data\clips\* Data\skins\* Data\conv\* Data\icons\* Tools\* Dictionaries\* Plugins\Explorer\* Plugins\SynFTP\* SynPlugins.sample.ini *.dll python3*.* *.manifest DLLs\* Py\sw*.py
start /min /wait winrar a %a% Data\snippets\Std.C Data\snippets\Std.Pascal Data\snippets\Std.Python Data\snippets\Std.Java Data\snippets\Std.Php Py\syn_plugin_manager\*.py Py\syn_plugin_manager\*.lng
