Possible values of id in `get_prop(id, value='') / set_prop(id, value)`.  

* PROP_NUMS: (read/write/event): bool: line numbers are shown.
* PROP_EOL: (read): string: end-of-line chars (length 1 or 2).
* PROP_WRAP: (read/write/event): bool: word-wrap is on.
* PROP_RO: (read/write/event): bool: read-only mode.
* PROP_MARGIN: (read/write): int: right-margin position.
* PROP_FOLDING: (read/write/event): bool: code-folding enabled.
* PROP_TAB_SPACES: (read/write): bool: tab-char shown as spaces.
* PROP_TAB_SIZE: (read/write): int: tab-char size.
* PROP_COL_MARKERS: (read/write): string: column-markers list, space-separated, unsorted.
* PROP_TEXT_EXTENT: (read): 2-tuple: average character size on canvas (x, y).
* PROP_ZOOM: (read/write): int: current zoom value in percents.
* PROP_INSERT: (read/write): bool: insert-mode is on (otherwise replace-mode is on).
* PROP_MODIFIED: (read): bool: editor text is modified (after last save).
* PROP_VIS_LINES: (read): int: number of visible lines (not considering word-wrap).
* PROP_VIS_COLS: (read): int: number of visible columns.
* PROP_LEFT, PROP_COLUMN_LEFT: (read/write): int: horizontal scroll value (index of left visible column).
* PROP_TOP, PROP_LINE_TOP: (read/write): int: vertical scroll value (index of top visible line).
* PROP_BOTTOM, PROP_LINE_BOTTOM: (read): int: index of line visible at bottom of editor (considering word-wrap).
* PROP_RULER: (read/write/event): bool: horizontal ruler is visible.
* PROP_LEXER_FILE: (read/write): string: lexer name for entire file (empty string: no lexer used).
* PROP_LEXER_CARET: (read): string: lexer name for current caret position (note that lexers may have sublexers, like CSS in HTML).
* PROP_LEXER_POS: (read): string: lexer name for absolute offset, given by string `value`.
* PROP_TOKEN_TYPE: (read): string: token type at absolute offset, given by string `value`. Returns 'c' for comment, 's' for string, empty string otherwise. 
* PROP_COLOR: (read/write): int: some color property, given by string `value`. When getting, pass `value = color_id`. When setting, pass `value = color_id + ',' + str(color_value)`. `color_id` must be one of `PROP_COLOR_nnnn` string constants. 
* PROP_NON_PRINTED: : (read/write): bool: non-printable chars: enabled flag.
* PROP_NON_PRINTED_SPACES: (read/write): bool: non-printable spaces/tabs shown.
* PROP_NON_PRINTED_ENDS: (read/write): bool: non-printable line-ends shown.
* PROP_NON_PRINTED_ENDS_EX: (read/write): bool: non-printable detailed line-ends shown.
* PROP_TAG: (read/write): str: plugin-defined string (initially empty). It's not the same as `Editor._my_tag`, which is different for different Editor objects, this flag is different for different Delphi objects (one Delphi object can have 2 or more Python objects).
* PROP_LINE_STATE: (read): int: state of line with specified index (0-based), one of `LINESTATE_nnnnn` consts.
* PROP_KEEP_TRAIL_BLANKS: (read/write): bool: flag "Keep trailing spaces on file saving".
* PROP_KEEP_CARET_IN_TEXT: (read/write): bool: flag "Keep caret position in text" (don't allow caret beyond end of line).  
* PROP_AUTO_INDENT: (read/write): bool: flag "Auto-indent mode" (make indent after pressing Enter on indented line).         
* PROP_LAST_LINE_SHOW: (read/write): bool: flag "Allow scrolling to last line" (last line shows on top/bottom of control). 
* PROP_TAB_FILL: (read/write): bool: flag "Optimal fill indent using Tab chars".    
* PROP_WRAP_AT_MARGIN: (read/write): bool: flag "Word-wrap at right margin" (instead of wrap at editor edge).      
* PROP_INDEX_GROUP: (read): int: index of group with editor's tab, 0-based.
* PROP_INDEX_TAB: (read): int: index of editor's tab in group, 0-based.
* PROP_TAB_TITLE: (read/write): str: title of tab, useful for untitled tabs.
* PROP_TAB_COLOR: (read/write): int: color of tab containing editor; COLOR_NONE if not set.
* PROP_TAB_ID: (read): int: unique tab's identifier (one number for main/secondary editors in tab), it is not changed when tab is moved.
* PROP_ENC: (read/write): int: encoding of text. If value>2, it's OS codepage (see MSDN help page). Else it's one of `EDENC_nnnn` values.

Notes
-----

* Param `value` is string, use `str()` if needed to pass int value, example:

    pos = ed.get_caret_pos()
    style = ed.get_prop(PROP_TOKEN_TYPE, str(pos))

* "event" mark means that `on_state` event is called, when this prop changes.
