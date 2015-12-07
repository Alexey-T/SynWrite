Possible values of `app_log()` id:

Id | Meaning
--|---------
`LOG_CLEAR` | Clears log panel, `text` is ignored.
`LOG_ADD` | Adds single line `text` to log panel.
`LOG_SET_PANEL` | Sets active log panel. `text` is one of values: `LOG_PANEL_OUTPUT`, `LOG_PANEL_VALIDATE`.
`LOG_SET_REGEX` | Sets parsing regex for log panel. Regex must have some groups in round brackets, indexes of these groups must be passed in separate API calls. All lines in log panel, which can be parsed by this regex, will allow navigation to source code by double-click.
`LOG_SET_LINE_ID` | Sets index of regex group for line-number. `text` is one-char string from "1" to "8", and "0" means "not used".
`LOG_SET_COL_ID` | Sets index of regex group for column-number.
`LOG_SET_NAME_ID` | Sets index of regex group for file-name.
`LOG_SET_FILENAME` | Sets default file-name, which will be used when regex cannot find file-name in a string. 
`LOG_SET_ZEROBASE` | Sets flag: line and column numbers are zero-based, not 1-based. `text` is one-char string "0" or "1".
`LOG_CONSOLE_CLEAR` | Clears "Python console" panel. `text` is ignored.
`LOG_CONSOLE_ADD` | Adds line `text` to "Python console" panel.  
`LOG_CONSOLE_GET` | Returns list of "Python console" panel combobox lines. `text` is ignored. 

Example
-------
For line "line 10 column 20: text message here" the following regex and indexes can be used:

* regex "\w+ (\d+) \w+ (\d+): .+"
* line-number index "1"
* column-number index "2"
* file-name index "0" (not used)
* zero-base flag "0" (off)
