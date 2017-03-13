Possible values of `dlg_menu(id, caption, text)` id:

* MENU_SIMPLE: Single-height menu dialog. 
* MENU_DOUBLE: Double-height menu dialog.
* MENU_STD: Standard Windows menu.

Passed strings
--------------
* Parameter `text` is menu items, `"\n"`-separated string.
* Each menu item string can be tab-separated: `caption + chr(9) + description`. For `MENU_SIMPLE` and `MENU_STD`, description is shown in the same line right-aligned; for `MENU_DOUBLE`, description is shown below the item caption. 

Items for Windows menu
----------------------
* If item is one char `"-"`, separator will be shown.  
* If item begins with `"?"` or `"!"` char, "radio checkmark" or "usual checkmark" will be shown.  
* If item begins with `"*"` char, it will be disabled.  
* Hotkeys must be preceded with `"&"` char.
