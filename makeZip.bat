@echo off
set a=D:\SynWrite.zip
copy /b Syn.dklang Readme\

del %a%
del Readme\Src*.zip
rem Src.zip
start /min /wait winrar a Readme\Src.zip *.pas *.dpr *.dfm *.res Setup\setup*.* make*.bat zip*.bat
start /min /wait winrar a -r Readme\Src.zip Res CFree\ATGroups\*.pas
rem SrcTests.zip
start /min /wait winrar a -r -x*.dll -x*.exe -x*.~* -x*.dcu -x*.dof -x*.drc -x*.map -x*.mes -x*.rar Readme\SrcTests.zip Tests\*

rem SynWrite.zip
start /min /wait winrar a %a% *.wlx *.inf Syn.exe SynHelper.exe LexLib.lxl Settings\Enc.cfg Settings\Lexers.cfg HL\* Readme\* Lang\* Data\autocomplete\* Data\colors\* Data\newdoc\* Data\outpresets\* Data\skins\* Data\conv\* Data\icons\* Data\htmltidy\* Data\websearch\* Tools\* Dictionaries\* Plugins\SynFTP\* *.dll python3*.* *.manifest DLLs\* Py\sw*.py 
start /min /wait winrar a %a% Data\snippets\Std.C Data\snippets\Std.Pascal Data\snippets\Std.Php 
start /min /wait winrar a %a% "Data\clips\Arrows" "Data\clips\Currency symbols" "Data\clips\Greek alphabet (lower)" "Data\clips\Greek alphabet (upper)" "Data\clips\HTML - Arrows" "Data\clips\HTML - Color names" "Data\clips\HTML - Color names+values" "Data\clips\HTML - Letters" "Data\clips\HTML - Math symbols" "Data\clips\HTML - Special characters" "Data\clips\Math symbols" "Data\clips\Special characters" "Data\clips\Quote selection" 
start /min /wait winrar a -r -x*.pyc %a% Py\syn_plugin_manager Py\syn_color_picker Py\syn_html_tidy Py\syn_make_plugin
