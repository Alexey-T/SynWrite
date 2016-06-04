Plugins and add-ons for SynWrite can be installed automatically. You should pack files into RAR or ZIP archive and place text file "install.inf" into archive root. Then user should open your rar/zip archive in SynWrite, and program will suggest auto-installation of this archive.

An example of file "install.inf" for SynJedi plugin:

    [info]
    title=SynJedi
    type=plugin
    subdir=SynJedi

    [ini]
    section=Complete
    id=SynJedi
    file=SynJedi.dll
    params=Python;
	
An example for Python command plugin (lexers C and C++ specified, hotkey Alt+R specified):

    [info]
    title=My Sample
    type=py-plugin
    subdir=syn_my_sample

    [ini]
    section=Commands
    id=My Sample
    params=run;C,C++;Alt+R;

Section "info"
--------------

Id | Meaning
---|--------
title | Official title. (Without ending dot.)
type | One of strings: "plugin" for binary plugins, "py-plugin" for Python plugins, "template" for data files to be copied into "Template" folder, "root-addon" for any files to be copied into SynWrite installation folder, "lexer" for lexers and autocomplete files.
desc | One-line description of add-on, more informative than title. (Optional. Without ending dot.)
subdir | Only for plugins and data files (ignored for root-addons and lexers). Name of subfolder, into which all package files are unpacked. For plugins, this name often equals to plugin name. For data files, this name is one of standard names, which you see inside SynWrite "Template" folder ("conv", "colors", etc). This value must be valid folder name without slashes.

Section "ini"
-------------
Section's needed only for plugins and should have such fields:

Id | Meaning
---|--------
section | Section name for "SynPlugins.ini" file. It can be one of: "Panels", "Complete", "FindID", "Commands", "Events".
id | Text before "=" char for "SynPlugins.ini" file. For command plugins: if it is "Submenu\ItemName", then menu item in submenu will appear. To specify separators in submenu (don't use them in root menu), write them like this: 1st separator with id "Submenu\\-1" with params "nnn" (any string), 2nd separator with id "Submenu\\-2" with params "nnn", etc.
file | Only for binary plugins: DLL file name of plugin (without path).
params | Additional string, which is appended to the line of "SynPlugins.ini" file. It's one or more plugin parameters, separated with ";". For panel plugins it's empty; for auto-completion and find-id plugins it's comma-separated lexers list; for command plugins see [Plugins manual installation] for details.

Sections "iniN"
---------------
If plugin needs more than one line in "SynPlugins.ini", add more sections: besides section "ini" add sections from "ini1" up to "ini400". Sections can be with gaps, e.g. only 1, 10, 20, 40.

Sections "lexerN"
-----------------
If type is "lexer", then instead of sections "iniN" you must use sections "lexer1" to "lexer120". These sections list lexers and/or autocomplete files (*.acp) present in package. Allowed keys:

Id | Meaning
---|--------
file | Lexer base filename w/o extension (e.g. "MyName"). You must supply file "MyName.lcf" and/or file "MyName.acp" in package root (both are optional) for each lexer section.
link1 | Name of 1st linked lexer (e.g. if your lexer has sublexers C and C++, then 1st linked name is "C", 2nd "C++")
link2 | Name of 2nd linked lexer
link3 | Name of 3rd linked lexer
link4 | Name of 4th linked lexer
link5 | Name of 5th linked lexer

