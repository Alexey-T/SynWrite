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
`get_text_all()` | Returns entire editor text. (Line ends are as is). 
`get_text_sel()` | Returns selected text block (or empty string if nothing selected). 
`get_text_line(num)` | Returns line with index `num` (0-based), or current line if `num = -1`. 
`get_text_len()` | Returns length of entire editor text. 
`get_text_substr(start, len)` | Returns substring of entire editor text, from absolute offset `start` (0-based), with length `len`. 
`get_line_count()` | Returns number of lines in entire text. 
`get_line_prop(num)` | Returns for line with index `num` properties 2-tuple: (<line length without EOL chars>, <line length including EOL chars>). You can pass int value `-1` for current line.
`set_text_all(text)` | Sets entire editor text to given string value. 
`set_text_line(num, text)` | Sets line with index `num` to given string value (without line ends). 
`replace(start, len, text)` | Replaces text at any position: from absolute offset, with given length, to new string value. 
`insert(text)` | Inserts string, at caret position. 
`insert_snippet(text, sel='', fname='')` | Inserts snippet text, at caret position. `text` is snippet text (tabstops allowed). `sel` is value for `${sel}` macro. `fname` is value for `${fname}` macro (path/ext are ignored).
(deprecated) `get_indent(x, y)` | Returns string of spaces/tabs, which is correct indentation string for given (x, y) coords. (Tab chars are used only when needed.)
`get_word(x, y)` | Returns properties of a word at given (x, y) coords, as 3-tuple: `(offset, len, text)`.

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
`get_enc()` | Returns encoding: int, one of `EDENC_nnnn` or positive value equals to some OS codepage (e.g. 1250).
`set_enc()` | Sets encoding. Note that both main editor and its brother editor will change encoding; encoding changes in-memory only. 

Methods, search-marks | Description
--------------------- | -----------------
`marks(id, npos, nlen, ntag)` | Performs action on search-marks. See [py marks id].
(deprecated) `get_marks()` | Gets search-marks. List of 2-tuples `(npos, nlen)`, or None. 
(deprecated) `add_mark(npos, nlen)` | Adds search-mark with given position/len. Pass `npos=-1` to remove all marks.

Methods, bookmarks | Description
------------------ | -----------------
`bookmarks(id, pos, tag, icon=-1, color=-1, hint='')` | Performs action on bookmarks. See [py bookmarks id].
(deprecated) `get_bk(id)` | Gets list of bookmarks. See [py bookmark id]. 
(deprecated) `set_bk(id, pos, icon=-1, color=-1, hint='')` | Sets/deletes bookmarks. See [py bookmark id]. 

Params: 

* `pos` is absolute offset (for set_bk: set `pos=-1` for numbered bookmark to clear it).
* `icon` can be used for unnumbered bookmarks, any `GUTTER_nnnn` constant.
* `color` can be used for unnumbered bookmarks, it's int RGB color of bookmarked line.
* `hint` is tooltip string for bookmark icon; hint beginning with `"!"` char disables saving of bookmark in program history.

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
