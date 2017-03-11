Install.inf
===========
Add-ons for SynWrite can be installed automatically. You should pack files into ZIP archive and place text file "install.inf" into archive root. Then user should open zip in SynWrite, and program will suggest auto-installation of this package.

Example of install.inf for SynJedi plugin:

    [info]
    title=SynJedi
    type=plugin
    subdir=SynJedi
       
    [ini]
    section=Complete
    id=SynJedi
    file=SynJedi.dll
    params=Python;
	
Example for Python command plugin (lexers C/C++ specified):

    [info]
    title=My Sample
    type=py-plugin
    subdir=syn_my_sample
      
    [ini]
    section=Commands
    id=My Sample
    params=run;C,C++
    hotkey=Alt+C

Section "info"
--------------

* title: Official title (without ending dot).
* type: One of fixed strings:
    * "plugin" for binary plugins
    * "py-plugin" for Python plugins
    * "template" for any files for "Data" folder
    * "lexer" for lexers and autocomplete files
    * "root-addon" for any files for SynWrite installation folder
* desc: One-line description, more informative than title (optional).
* subdir: Only for plugins and data files (ignored for root-addons and lexers). Name of subfolder, into which all package files are unpacked. For Python plugins, this is Python module name (e.g. syn_my_name). For data files, this name is one of standard names, which you see inside SynWrite "Data" folder ("conv", "colors", etc). This value must be valid folder name without slashes.

Sections "iniN"
---------------
This describes section "ini" and sections "ini1" to "ini400".
Sections can be with gaps, e.g. only 1, 10, 20, 40.
Sections needed only for plugins and have such fields:

* section: Section name for SynPlugins.ini file. Can be one of: 
    * Commands
    * Events
    * Panels
    * Complete
    * FindID

* id: Text before "=" char for "SynPlugins.ini" file. For command plugins: if it is "Submenu\ItemName", then menu item in submenu will appear. To specify separators in submenu (don't use them in root menu), write them like this: 
    * 1st separator with id "Submenu\\-1" with params "nnn" (any string)
    * 2nd separator with id "Submenu\\-2" with params "nnn", etc.

* file: Only for binary plugins: DLL file name of plugin (without path).
* params: Additional string, which is appended to the line of "SynPlugins.ini" file. It's one or more parameters, separated with ";". 
    * For command plugins: "method_name;lexers_list" (list is comma-separated)
    * For event plugins: "events_list;lexers_list" (event names are from: [py event names])
    * For auto-completion/ find-id plugins: lexers_list 
    * For panel plugins: empty

* hotkey: Hotkey for command plugin item (optional). Example of simple values: "Alt+A", "Ctrl+Shift+F1", example of combo keys: "Ctrl+Shift+A * Ctrl+B * Ctrl+C". If lexers list (in params=) empty, then hotkey saves to file SynHotkeys.ini. If lexers list not empty, then hotkey saves to each "SynHotkeys lexer nnnn.ini" for all mentioned lexers.

Sections "lexerN"
-----------------
If type is "lexer", then instead of sections "iniN" you must use sections "lexer1" to "lexer120". These sections list lexers and/or autocomplete files (*.acp) present in package. First section must be for main lexer, others for sublexers of main lexer. Keys in sections:

* file: Lexer base filename w/o extension, e.g. "MyName". You must supply file "MyName.lcf" and/or file "MyName.acp" in package root (both are optional) for each lexer section.
* link1: Name of 1st linked sublexer (e.g. if lexer has sublexers C and C++, then 1st linked name is "C", 2nd "C++")
* link2: Name of 2nd linked sublexer
* link3: etc
