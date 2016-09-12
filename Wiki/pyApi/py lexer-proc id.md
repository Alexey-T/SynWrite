Possible values of `lexer_proc(id, text)` id.

When two strings are needed for command, `text` must be `text1 + ";" + text2`, otherwise it's single value without ";" char.

Id | Meaning
---|-----------
`LEXER_GET_LIST` | Returns list of installed lexers, or `None` if lexer-library empty. `text` is ignored.
`LEXER_GET_ENABLED` | Returns bool: enabled-flag of lexer with name `text`.
`LEXER_GET_EXT` | Returns str: extensions-list (space-separated) of lexer with name `text`.
`LEXER_GET_MOD` | Returns bool: lexer-library is modified. `text` is ignored.
`LEXER_GET_LINKS` | Returns list of str: sublexers names of lexer with name `text`, or `None` if empty.
`LEXER_GET_STYLES` | Returns list of str: styles names of lexer with name `text`, or `None` if empty.
`LEXER_GET_COMMENT` | Returns str: line-comment string for lexer with name `text`, or `None` if cannot find lexer.
`LEXER_SET_NAME` | Sets for lexer with name `text1` new name `text2`.
`LEXER_SET_ENABLED` | Sets for lexer with name `text1` enabled-flag `text2`: `"0"` or `"1"`.
`LEXER_SET_EXT` | Sets for lexer with name `text1` extensions-list `text2`. 
`LEXER_SET_LINKS` | Sets for lexer with name `text1` sublexers names: pass as `text2` "vertical line"-separated sublexer names (any number allowed).
`LEXER_DELETE` | Deletes lexer with name `text`.
`LEXER_IMPORT` | Adds new lexer from file-name `text`. Returns name of this lexer, or `None` if import failed.
`LEXER_EXPORT` | Saves lexer with name `text1` into file-name `text2` (recommended extension is "lcf").
`LEXER_CONFIG` | Shows properties dialog for lexer with name `text`. Returns bool: user pressed OK.
`LEXER_ACTIVATE` | Makes lexer with name `text` active for current editor. Empty string, or non-existing name, turns lexer off.
