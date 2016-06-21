This page describes API for SynWrite plugins written in Python.  
The following plugin types are supported:

* Command plugins: Activated by user when calling menu items in "Plugins" menu.
* Event plugins: Activated by SynWrite when some event occurs in editor, e.g. "text changed" or "file saved".
* Auto-completion plugins: Special case of event plugins. Activated by "Auto-completion popup" command (Ctrl+Space hotkey) or "Function hint" command (Ctrl+Shift+Space hotkey).
* Goto-definition plugins: Special case of event plugins. Activated by "Go to definition" menu item from editor context menu.

Method name in "Command" class should be:

* Command plugins: "run" or other.
* Event plugins: one of [py event names].

Funcs
=====

* [python API functions]
* [python API changes]
