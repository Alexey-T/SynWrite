Possible values of `get_prop(id, value='')` id and their results.  
If `value` is not mentioned for id, skip this parameter.

Id | Read/ Write/ Event | Meaning
---|--------------------|--------
`PROP_NUMS` | RWE | bool: line numbers are shown.
`PROP_EOL` | R | string: end-of-line chars (length 1 or 2).
`PROP_WRAP` | RWE | bool: word-wrap is on.
`PROP_RO` | RWE | bool: read-only mode.
`PROP_MARGIN` | RW | int: right-margin position.
`PROP_FOLDING` | RWE | bool: code-folding enabled.
`PROP_TAB_SPACES` | RW | bool: tab-char shown as spaces.
`PROP_TAB_SIZE` | RW | int: tab-char size.
`PROP_COL_MARKERS` | RW | string: column-markers list, space-separated, unsorted.
`PROP_TEXT_EXTENT` | R | 2-tuple: average character size on canvas (x, y).
`PROP_ZOOM` | RW | int: current zoom value in percents.
`PROP_INSERT` | RW | bool: insert-mode is on (otherwise replace-mode is on).
`PROP_MODIFIED` | R | bool: editor text is modified (after last save).
`PROP_VIS_LINES` | R | int: number of visible lines (not considering word-wrap).
`PROP_VIS_COLS` | R | int: number of visible columns.
`PROP_LEFT`, `PROP_COLUMN_LEFT` | RW | int: horizontal scroll value (index of left visible column).
`PROP_TOP`, `PROP_LINE_TOP` | RW | int: vertical scroll value (index of top visible line).
`PROP_BOTTOM`, `PROP_LINE_BOTTOM` | R | int: index of line visible at bottom of editor (considering word-wrap).
`PROP_RULER` | RWE | bool: horizontal ruler is visible.
`PROP_LEXER_FILE` | RW | string: lexer name for entire file (empty string: no lexer used).
`PROP_LEXER_CARET` | R | string: lexer name for current caret position (note that lexers may have sublexers, like CSS in HTML).
`PROP_LEXER_POS` | R | string: lexer name for absolute offset, given by string `value`.
`PROP_TOKEN_TYPE` | R | string: token type at absolute offset, given by string `value`. Returns 'c' for comment, 's' for string, empty string otherwise. 
`PROP_COLOR` | RW | int: some color property, given by string `value`. When getting, pass `value = color_id`. When setting, pass `value = color_id + ',' + str(color_value)`. `color_id` must be one of `PROP_COLOR_nnnn` string constants. 
`PROP_NON_PRINTED`         | RW | bool: non-printable chars: enabled flag.
`PROP_NON_PRINTED_SPACES`  | RW | bool: non-printable spaces/tabs shown.
`PROP_NON_PRINTED_ENDS`    | RW | bool: non-printable line-ends shown.
`PROP_NON_PRINTED_ENDS_EX` | RW | bool: non-printable detailed line-ends shown.
`PROP_TAG` | RW | str: plugin-defined string (initially empty). It's not the same as `Editor._my_tag`, which is different for different Editor objects, this flag is different for different Delphi objects (one Delphi object can have 2 or more Python objects).
`PROP_LINE_STATE` | R | int: state of line with specified index (0-based), one of `LINESTATE_nnnnn` consts.
`PROP_KEEP_TRAIL_BLANKS` | RW | bool: flag "Keep trailing spaces on file saving".
`PROP_KEEP_CARET_IN_TEXT` | RW | bool: flag "Keep caret position in text" (don't allow caret beyond end of line).  
`PROP_AUTO_INDENT` | RW | bool: flag "Auto-indent mode" (make indent after pressing Enter on indented line).         
`PROP_LAST_LINE_SHOW` | RW | bool: flag "Allow scrolling to last line" (last line shows on top/bottom of control). 
`PROP_TAB_FILL` | RW | bool: flag "Optimal fill indent using Tab chars".    
`PROP_WRAP_AT_MARGIN` | RW | bool: flag "Word-wrap at right margin" (instead of wrap at editor edge).      
`PROP_INDEX_GROUP` | R | int: index of group with editor's tab, 0-based.
`PROP_INDEX_TAB` | R | int: index of editor's tab in group, 0-based.
`PROP_TAB_TITLE` | R | str: title of tab, useful for untitled tabs.
`PROP_TAB_COLOR` | RW | int: color of tab containing editor; COLOR_NONE if not set.
`PROP_TAB_ID` | R | int: unique tab's identifier (one number for main/secondary editors in tab), it is not changed when tab is moved.

Notes
-----

1) Param `value` is string, use `str()` if needed to pass int value, example:

    pos = ed.get_caret_pos()
    style = ed.get_prop(PROP_TOKEN_TYPE, str(pos))

2) "E" table mark means that `on_state` event is fired for this id.
