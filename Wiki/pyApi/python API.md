This page describes API for SynWrite plugins written in Python.  
Currently the following plugin types are supported:

Plugin type | Meaning
------------|--------
Command plugins | Activated by user when calling menu item in "Tools -- Plugins" menu.
Event plugins | Activated by SynWrite when some event occurs in editor, e.g. "text changed" or "file saved".
Auto-completion plugins | Special case of event plugins. Activated by "Auto-completion popup" command (Ctrl+Space hotkey) or "Function hint" command (Ctrl+Shift+Space hotkey).
Goto-definition plugins | Special case of event plugins. Activated by "Go to definition" menu item from editor context menu.

Method name in Python class should be:

Plugin type | Method name
------------|------------
Command plugins | Name `run` or any other.
Event plugins | See [py event names].

You can find list of API functions at [python API functions].
You can find changes-log of API at [python API changes].
