Function | Description
---------|------------
`msg_box(id, text)` | Shows message-box or plays sound signal. Possible values if `id` are listed at [py msgbox id].
`msg_status(text)` | Shows text in program status-bar. (Show delay is not configurable). 
`dlg_input(text, deftext, ini_fn='', ini_section='')` | Shows dialog for entering single string. `text` is prompt text, `deftext` is default input text, `ini_fn` is ini filename (without path) which holds input history (or empty string if history not needed), `ini_section` is section name in ini file (or empty string if history not needed). Returns entered string, or `None` if dialog cancelled.
`dlg_input_memo(caption, label, deftext)` | Shows dialog for entering multi-line text. Returns entered string, or `None` if dialog cancelled.
`dlg_input_ex(number, caption, label1, text1='', ..., label10='', text10='')` | Shows dialog to input several strings at once. `number` is number of input fields, from 1 to 10. `labelN` is prompt above N-th input feild. `textN` is default string in N-th input field. Returns list of 10 strings entered, or `None` if dialog cancelled.
`dlg_menu(id, caption, text, focused=0)` | Shows menu dialog. Possible values of `id` and function details are listed at [py menu id]. Returns index of selected item (0-based), or `None` if menu cancelled. Param focused is index of initial selected item.
`dlg_snippet(name, alias, lexers, text)` | Shows dialog to edit snippet properties. Returns 4-tuple of string, or `None` if dialog cancelled.
`dlg_checklist(caption, columns, items, size_x, size_y)` | Shows dialog with ListView with checkmarks. Returns list of bool: checked states of lines, or empty list if dialog cancelled. `caption` is dialog caption. `columns` is "\n"-separated column items, each item is "\t"-separated: title and `str(column_width)`, where `column_width` can be missed or zero for autosize. `items` is "\n"-separated dialog lines, each line is "\t"-separated column strings. 1st column can begin with `"*"` to check this line. `size_x`, `size_y` are dialog sizes.
`dlg_file(is_open, filename, folder, filters)` | Shows "Open file" or "Save file as" dialog. Returns filename or `None` if cancelled. `is_open` is bool: Open or Save dialog, `filename` is initial filename (can be empty and without path), `folder` is initial folder (can be empty), `filters` is file-masks string (can be empty). If filename is "*", multi-selection is enabled and result is list of str, not str.  
`dlg_folder(caption, folder)` | Shows "Select folder" dialog. Returns folder path or `None` if cancelled. `caption` is prompt text (can be empty), `folder` is initial folder (can be empty).
`dlg_custom(caption, size_x, size_y, text, focused=-1)` | Shows user-made dialog. Info http://wiki.freepascal.org/CudaText_API#dlg_custom , about 90% is working here. No support for Togglebox, Checkgroup.

File filter
-----------

Example string for `dlg_file` filters is:
 
    Help files|*.chm|Batch files|*.bat;*.cmd|
    
(vertical line separates filters and caption/mask in each filter).
