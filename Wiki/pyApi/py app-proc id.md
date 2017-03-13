Possible values of id in `app_proc(id, text="")`:

Clipboard
=========

* PROC_GET_CLIP: Returns clipboard text, limited by length `int(text)`. Pass empty string or '0' to not limit.
* PROC_SET_CLIP: Copies text to clipboard.

Hotkeys
=======

* PROC_REPORT_KEYS: Creates HTML report with editor key-mapping, `text` is filename.
* PROC_GET_ESCAPE: Gets state of Esc-key-pressed flag (bool). Flag is set on each Esc press since app start.
* PROC_SET_ESCAPE: Sets state of Esc-key-pressed flag. Text must be "0"/"1" for bool values.
* PROC_GET_KEYSTATE: Gets state of pressed special keys (str). String has "c" for Ctrl pressed, "a" for Alt, "s" for Shift.
* PROC_HOTKEY_INT_TO_STR: Converts given int hotkey to string. Gets empty str for unknown code.
* PROC_HOTKEY_STR_TO_INT: Converts given string hotkey to int. Gets 0 for incorrect string. Example: converts "ctrl+shift+v" to "24662", which is then converted to "Shift+Ctrl+V". 

Plugins calls
=============

* PROC_GET_COMMAND: Returns property of internal command with index `int(text)`. Returns tuple `(command_int, category_name, command_name, hotkey_str_1, hotkey_str_2)` or `None` of index not correct (call it from 0 until you get None).

Misc
====

* PROC_LOCK_STATUS: Disables updating of status-bar first field (to speed-up text processing).    
* PROC_UNLOCK_STATUS: Enables updating of status-bar first field.
* PROC_SOUND: Plays sound file `text` in wav format. Pass empty string to stop currently played sound. Returns bool: filename exists or empty.
* PROC_COLOR_PICKER: Shows color-picker dialog. Pass initial color value as `str(color_value)`. Returns int color value or -1 if dialog cancelled.
* PROC_ADD_GUTTER_ICON: Adds icon to gutter imagelist. Returns icon index, or `None` if cannot add. You can pass index to `Editor.set_bk`; imagelist is one for all editors. Pass to `text` bmp filename, size must be 16x16, 8bit color, transparent color is color of left-bottom pixel. 
* PROC_ADD_RECENT_COLOR: Adds color code to "Recent colors" menu (menu item at right side of main menu). Pass code as `str(color_code)`.
