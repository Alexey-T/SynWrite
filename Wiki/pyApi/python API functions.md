Modules
-------

Module | Description
-------|------------
`sw_api` | Built-in module. (No file for it).
`sw` | Implements all functions, constants and objects listed below. (Module file is in the "Py" subfolder).
`sw_cmd` | Lists editor command ids.
`sw_keys` | Lists input key codes.

Editor class
------------

To access editor-related functionality, use objects of type `Editor`: `ed` or other objects:

Object | Description
-------|------------
`ed`        | Currently active editor.
`ed_bro`    | Brother editor in the same tab as current editor (visible only when tab is splitted).
`ed_op`     | Primary editor in the opposite view.
`ed_op_bro` | Secondary editor is the opposite view (visible only when tab is splitted).

All `Editor` methods are listed at [py Editor class].

Functions
---------

See topics:

* [py functions dialog]
* [py functions misc]
