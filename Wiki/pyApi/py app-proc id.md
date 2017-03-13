Possible values of id in `app_proc(id, text="")`:

Clipboard
=========

* PROC_GET_CLIP: Returns clipboard text, limited by length `int(text)`. Pass empty string or '0' to not limit.
* PROC_SET_CLIP: Copies text to clipboard.

Hotkeys
=======

* PROC_GET_ESCAPE: Gets state of Esc-key-pressed flag (bool). Flag is set on each Esc press since app start.
* PROC_SET_ESCAPE: Sets state of Esc-key-pressed flag. Text must be "0"/"1" for bool values.
* PROC_GET_KEYSTATE: Gets state of pressed special keys (str). String has "c" for Ctrl pressed, "a" for Alt, "s" for Shift.
* PROC_HOTKEY_INT_TO_STR: Converts given int hotkey to string. Gets empty str for unknown code.
* PROC_HOTKEY_STR_TO_INT: Converts given string hotkey to int. Gets 0 for incorrect string. Example: converts "ctrl+shift+v" to "24662", which is then converted to "Shift+Ctrl+V". 

Keymapping
==========

* PROC_GET_COMMAND: Gets item from keymapping, with index `int(text)`. Gets tuple `(int_command, str_category, str_name, str_hotkey1, str_hotkey2)` or None if index not correct. To enumarate all items, call it from "0" until you get None. Plugin items have category "Plugin".
* PROC_KEYMAP: Gets keymapping. It's list of dicts:
    * for usual commands: example: `{'type': 'cmd', 'command': 700, 'category': 'File', 'name': 'New file', 'hotkey1': 'Ctrl+N', 'hotkey1init': 'Ctrl+N', 'hotkey2': 'Shift+Ctrl+Alt+N', 'hotkey2init': ''}`
    * for plugins: example: `{'type': 'py', 'module': 'syn_lint', 'method': 'run', 'name': 'SynLint', 'hotkey1': 'Ctrl+L * L', 'hotkey2': ''}`

Misc
====

* PROC_LOCK_STATUS: Disables updating of status-bar first field (to speed-up text processing).    
* PROC_UNLOCK_STATUS: Enables updating of status-bar first field.
* PROC_ADD_GUTTER_ICON: Adds icon to gutter imagelist. Returns icon index, or `None` if cannot add. You can pass index to `Editor.set_bk`; imagelist is one for all editors. Pass to `text` bmp filename, size must be 16x16, 8bit color, transparent color is color of left-bottom pixel. 
* PROC_ADD_RECENT_COLOR: Adds color code to "Recent colors" menu (menu item at right side of main menu). Pass code as `str(color_code)`.
* PROC_SOUND: Plays sound file `text` in wav format. Pass empty string to stop currently played sound. Returns bool: filename exists or empty.
