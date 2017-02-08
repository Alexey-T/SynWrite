Modules
-------

- `sw_api`: Built-in module (no file for it).
- `sw`: Implements all functions, constants and objects listed below. (Module file is in the "Py" subfolder).
- `sw_cmd`: Lists editor command ids.
- `sw_keys`: Lists int key codes.

Global functions
----------------

Dialog functions | Description
-----------------|------------
`msg_box(id, text)` | Shows message box. See [py msgbox id].
`msg_box(text, flags)` | Shows message box, new version, from CudaText. Documented at http://wiki.freepascal.org/CudaText_API#msg_box
`msg_status(text)` | Shows text in program status-bar. (Show delay is not configurable). 
`dlg_input(text, deftext, ini_fn='', ini_section='')` | Shows dialog for entering single string. `text` is prompt text, `deftext` is default input text, `ini_fn` is ini filename (without path) which holds input history (or empty string if history not needed), `ini_section` is section name in ini file (or empty string if history not needed). Returns entered string, or `None` if dialog cancelled.
`dlg_input_memo(caption, label, deftext)` | Shows dialog for entering multi-line text. Returns entered string, or `None` if dialog cancelled.
`dlg_input_ex(number, caption, label1, text1='', ..., label10='', text10='')` | Shows dialog to input several strings at once. `number` is number of input fields, from 1 to 10. `labelN` is prompt above N-th input feild. `textN` is default string in N-th input field. Returns list of 10 strings entered, or `None` if dialog cancelled.
`dlg_menu(id, caption, text, focused=0)` | Shows menu dialog. Possible values of `id` and function details are listed at [py menu id]. Returns index of selected item (0-based), or `None` if menu cancelled. Param focused is index of initial selected item.
`dlg_snippet(name, alias, lexers, text)` | Shows dialog to edit snippet properties. Returns 4-tuple of string, or `None` if dialog cancelled.
`dlg_file(is_open, filename, folder, filters)` | Shows "Open file" or "Save file as" dialog. Returns filename or `None` if cancelled. `is_open` is bool: Open or Save dialog, `filename` is initial filename (can be empty and without path), `folder` is initial folder (can be empty), `filters` is file-masks string (can be empty). If filename is `"*"`, multi-selection is enabled and result is list of str, not str. Example string for filters: `"Help files|*.chm|Batch files|*.bat;*.cmd|"`. Vertical line separates filters and caption/mask in each filter.
`dlg_folder(caption, folder)` | Shows "Select folder" dialog. Returns folder path or `None` if cancelled. `caption` is prompt text (can be empty), `folder` is initial folder (can be empty).
`dlg_custom(caption, size_x, size_y, text, focused=-1)` | Shows user-made dialog. Info http://wiki.freepascal.org/CudaText_API#dlg_custom . Code is 90% ported from CudaText. Not supported types: "checkbutton", "checkgroup", "image".

More functions | Description
---------------|------------
`app_version()` | Returns SynWrite program version string. 
`app_api_version()` | Returns SynWrite API version string: `major + '.' + minor + '.' + build`. 
`app_exe_dir()` | Returns folder path of SynWrite program.
`app_ini_dir()` | Returns folder path of SynWrite configuration files.
`app_log(id, text)` | Controls contents of log-panels and console-panel. Possible values of `id` are listed at [py log id].
`app_proc(id, text='')` | Performs some application-level action. Possible values of `id` are listed at [py app-proc id].
`ini_read(filename, section, key, value)` | Reads a string from ini-file. Filename should be without path (folder of program ini-files is used then). Recommended filename prefix is `"syn_"`. Default value passed as `value`. 
`ini_write(filename, section, key, value)` | Writes a string to ini-file. Same syntax as with `ini_read`. 
`file_open(filename, params='')` | Opens editor-tab for given file name. It activates already opened editor-tabs. Pass empty string for empty tab. `params` is optional: if it contains "/s", then installation of zip-filename will be silent. Returns bool: `filename` is empty or exists.
`file_save()` | Saves current editor-tab (shows "Save as" dialog for unnamed tab).
`file_get_name(id)` | Returns misc filename. Possible values of `id` are listed at [py filename id]. For incorrect `id` value, `None` is returned. To enumerate all editor-tabs, start with `id = 0`, and increase it until you get `None`.
`text_local(id, filename)` | Returns single string, from localization lang-file. Lang-files of your plugin must have names, described in [Plugins translation]. `id` is string identifier, `filename` is full path of any file in the same folder and lang-file - usually pass here `__file__` variable.
`text_convert(text, filename, back=False)` | Returns string converted using text-converter file (see help topic about text converters). Returns `None` if converter file is not found.
`regex_parse(regex, text)` | Parses string using regex, into 8 substrings, each substring is found by regex group (regex groups are defined as usual, by round brackets). Returns substrings as 8-tuple.
`get_app_prop(id, value='')` | Returns some application-level property. Possible values of `id` are listed at [py app-property id].
`set_app_prop(id, value)` | Sets some application-level property. Possible values of `id` are listed at [py app-property id].
`lexer_proc(id, text)` | Performs lexers-related action. Possible values of `id` are listed at [py lexer-proc id].
`timer_proc(id, callback, interval)` | Performs action on timers. Documented at http://wiki.freepascal.org/CudaText_API#timer_proc
`ed_handles()` | Returns range object with all tabs editor handles. Pass all these handles to `Editor` constructor, to get editor objects. Here is example which prints all tabs contents: `for h in ed_handles(): print('---'); print(Editor(h).get_text_all());`


Editor class
------------

To access editor-related functionality, use objects of type `Editor`:

- `ed`: Currently active editor.
- `ed_bro`: Brother editor in the same tab as current editor (visible only when tab is splitted).
- `ed_op`: Primary editor in the opposite view.
- `ed_op_bro`: Secondary editor is the opposite view (visible only when tab is splitted).

Class `Editor` contains methods listed below.

Methods, carets | Description
--------------- | -----------------
`get_caret_xy()` | Returns caret phisical coords (x, y) as 2-tuple. (Where x is column index, y is line index, all 0-based.)
`get_caret_pos()` | Returns caret absolute offset (0-based).
`set_caret_xy(x, y)` | Sets caret phisical coords (x, y).
`set_caret_pos(pos)` | Sets caret absolute offset.
`get_carets()` | Returns list of multi-carets positions and selections. It's `None` or non-empty list of int triples: `[[x0, y0, len0], [x1, y1, len1], ...]`. `lenN` is selection length for N-th caret: negative for selection to the beginning, positive for selection to the end, or 0.  
`add_caret_xy(x, y, len=0)` | Adds multi-caret at phisical coords (x, y) with given selection length (positive, negative, or 0). Pass `x=-1` to remove multi-carets and leave usual caret.
`xy_pos(x, y)` | Converts text phisical coords (x, y) to absolute offset.
`pos_xy(pos)` | Converts text absolute offset to phisical coords (x, y) 2-tuple.  
`xy_log(x, y)` | Converts text phisical coords (x, y) to logical coords (x, y) 2-tuple. Logical coords consider tab-characters size, while phisical do not.
`log_xy(x, y)` | Converts text logical coords (x, y) to phisical coords (x, y) 2-tuple. 

Methods, selections | Description
------------------- | -----------------
`get_sel_mode()` | Returns current selection mode: one of values `SEL_NORMAL`, `SEL_COLUMN`, `SEL_LINES`.
`get_sel_lines()` | Returns indexes of first and last lines with selection, as 2-tuple `(line_start, line_end)`. Can be used for all selection modes, and even when nothing is selected.
`get_sel()` | Returns selection position for "normal" mode: selection absolute offset and selection length, as 2-tuple. 
`get_sel_rect()` | Returns selection coords for "column" mode: (x1, y1, x2, y2), as 4-tuple. 
`set_sel(start, len, nomove=False)` | Sets selection in "normal" mode, to given absolute offset and length. If optional parameter `nomove` is True, caret won't move after selection change.
`set_sel_rect(x1, y1, x2, y2)` | Sets selection in "column" mode, to given coord rectangle. 

Methods, text handling | Description
---------------------- | -----------------
`get_text_all()` | Returns entire editor text (EOLs are as preserved). 
`get_text_sel()` | Returns selected text block (or empty string if nothing selected). 
`get_text_line(num)` | Returns line with given index (0-based). 
`get_text_len()` | Returns length of entire editor text. 
`get_text_substr(start, len)` | Returns substring of entire editor text, from absolute offset `start` (0-based), with length `len`. 
`get_line_count()` | Returns number of lines in entire text. 
`get_line_prop(num)` | Returns for line with given index 2-tuple: `(line_length_without_EOL_chars, line_length_including_EOL_chars)`.
`set_text_all(text)` | Sets entire editor text to given value.
`set_text_line(num, text)` | Sets line with given index to given string (without EOLs). Use -1 to add new line. 
`replace(start, len, text)` | Replaces text at any position: from absolute offset, with given length, to new text. 
`insert(text)` | Inserts text (can be multi-line, with any EOLs), at caret position. 
`insert_snippet(text, sel='', fname='')` | Inserts snippet text, at caret position. `text` is snippet text (tabstops allowed). `sel` is value for `${sel}` macro. `fname` is value for `${fname}` macro (path/ext are ignored).
`get_word(x, y)` | Returns properties of a word at given coords, as 3-tuple: `(offset, len, text)`.

Methods, scrolling | Description
------------------ | -----------------
`get_top()` | Returns int index of top visible line (vertical scroll position). 
`get_left()` | Returns int index of left visible column (horizontal scroll position). 
`set_top(num)` | Sets index of top visible line (vertical scroll position). 
`set_left(num)` | Sets index of left visible column (horizontal scroll position). 

Methods, other | Description
-------------- | -----------------
`get_filename()` | Returns file-name of editor, or empty str.
`get_prop(id, value='')` | Returns some editor property. Possible `id` values are listed at [py property id]. `value` is optional string parameter.  
`set_prop(id, value)` | Sets some editor property. `value` is string, use "0" and "1" for bool values, use `str()` for int values. Possible `id` values are listed at [py property id].  
`get_split()` | Returns split properties of editor tab as 2-tuple: `(horizontal, percent_value)`, where value is in range 0..100.
`set_split(horz, value)` | Sets split properties of editor tab. `horz` is bool: perform horizontal split. `value` is int in range 0..100: specifies split percent position, 0 means unsplit.
`get_sync_ranges()` | Returns list of sync-editing ranges in editor. It's `None` or non-empty list of int pairs: `[[start0, len0], [start1, len1], ...]`.
`add_sync_range(start, len)` | Adds sync-editing range with given absolute offset and length. Pass `start=-1` to remove all ranges.
`get_alerts()` | Returns bool flag for "alerts": are confirmation message-boxes enabled for "Close tab" command.
`set_alerts(value)` | Sets bool flag for "alerts".
`get_staple(x, y)` | Returns range of block-staple (indentation guide) for text position `(x, y)`. It's `None` if no staple at this position, or 2-tuple: `(range_offset_start, range_offset_end)`.

Methods, marks | Description
-------------- | -----------------
`bookmarks(id, pos, tag, icon=-1, color=-1, hint='')` | Performs action on bookmarks. See [py bookmarks id]. 
`marks(id, npos, nlen, ntag)` | Performs action on search-marks. See [py marks id].

Methods, color-attribs | Description
---------------------- | -----------------
`set_attr(id, color)` | Changes user text-attrib of selection (only single selection). Pass to `id` constants `ATTRIB_nnnn`, `color` is to set font or bg color.
`get_attr()` | Returns list of user text-attrib ranges. Each list item is range info, 5-list: `[range_start, range_end, color_font, color_bg, styles]`. Styles is str with chars: 'b' for bold, 'i' for italic, 'u' for underline, 's' for strikeout. Colors are `COLOR_NONE` if they are not set.

Methods, misc | Description
------------- | -----------------
`lock()` | Increases lock-counter, so editor window will not redraw ifself if counter is non-zero. Each `lock` call must be coupled with `unlock` call later in your code.
`unlock()` | Decreases lock-counter. If counter becomes zero, editor window will be redrawn.
`focus()` | Focuses editor control.
`complete(text, len, show_menu=True)` | Shows completion menu at caret position. The meaning of parameters (`text` is string, `len` is int, optional `show_menu` is bool) is the same as for [cActionSuggestCompletion] binary API action. Returns bool: are parameters correct. Note: must be called for active editor only.
`find(action, opt, tokens, sfind, sreplace)` | Performs find or replace command. `action` is one of `FIND_ACTION_nnnn` constants. `opt` is search options, sum of `FIND_OP_nnnn` constants. `tokens` is syntax-aware option, one of `TOKENS_nnnn` constants. `sfind` and `sreplace` are search-to and replace-with text. Returns number of found matches or `-1` if error occured.
`cmd(id, text='')` | Performs any editor command: `id` is int constant from `sw_cmd` module, `text` is string value. Use text only for few commands: `cmd_Char`, `cmd_String`, `cmd_FindCommand`.
