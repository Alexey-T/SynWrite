Plugin files structure
======================

Binary plugins need separate folders inside "Plugins" subfolder of SynWrite folder.
Example of folder structure:

    Plugins\Explorer\
    Plugins\Explorer\Explorer.dll
    Plugins\SynFTP\
    Plugins\SynFTP\SynFTP.dll

Python plugins need separate folders inside "Py" subfolder of SynWrite folder.
Example of folder structure:

    Py\syn_my_sample\
    Py\syn_my_sample\__init__.py
    Py\syn_my_other\
    Py\syn_my_other\__init__.py
    Py\syn_my_other\helper_lib.py

SynPlugins.ini
==============

All plugins (binary, Python) need to be registered in SynPlugins.ini file, which is in Settings subfolder of SynWrite folder.
Example of this file:

    [Panels]
    Explorer=Explorer\Explorer.dll
    FTP_Fake=FtpFake\FtpFake.dll
     
    [FindID]
    TestPas=FindIDPas\FindIDPas.dll;Pascal,Pascal Script;
     
    [Complete]
    TestPas=Fake\Fake.dll;Pascal,Pascal Script;
     
    [Events]
    TestPy=py:syn_test;on_save,on_change;Text files;

Sections in SynPlugins.ini
==========================

* Commands: lists Command plugins, with their parameters, separated with ";".
* Events: lists Event plugins, with their parameters, separated with ";". 
* Panels: lists Panel plugins.
* Complete: lists binary auto-completion plugins, with their lexers list. Filename should be in form "FolderName\FileName.dll".
* FindID: lists binary goto-definition plugins, with their lexers list. Filename should be in form "FolderName\FileName.dll".

Command plugins
===============

For Command plugins, values separated with ";" are:

* module - for binary plugins it's "FolderName\FileName.dll", for Python plugins it's prefix "py:" plus Python module name.
* method - for binary plugins it's string passed to plugin, for Python plugins it's name of class method (usually "run").
* lexers list (optional, comma-separated).

Example of "Commands" section which lists both bynary and Python plugins:

    [Commands]
    MyCmd=MyCmd\MyCmd.dll;Cmd_a;C,C++
    MyMenu\MyNextCmd=MyNext\MyNext.dll;Cmd_b;Pascal,Pascal Script
    MyPyCmd=py:syn_my_command;run;Text files
    MyPyMenu\MyPyNext=py:syn_my_next;run;

Event plugins
=============

For Event plugins, values separated with ";" are:

* module - for Python plugins it's prefix "py:" plus Python module name.
* events list - for Python plugins it's comma-separated list of supported event names, which are listed at [py event names].
* lexers list (optional, comma-separated).
