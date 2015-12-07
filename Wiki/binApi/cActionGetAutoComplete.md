This action can be called by SynWrite to get auto-completion IDs, when user calls "Auto-complete" command (default shortcut is Ctrl+Space). Plugin should:

- get caret position using [cActionGetCaretPos]
- get search paths using [cActionGetText]
- read current file using [cActionGetText] and maybe read all include-files
- prepare Chr(13)-separated list of strings, each string is simply id or "|"-separated list: "id|type|(parameters)"
- copy resulting list to the buffer provided by SynWrite

Parameters:

- **A1** (PWideChar) - points to text buffer.
- **A2** (Integer) - buffer size, in chars. 
- **A3** - not used.
- **A4** - not used.

Return value: `cSynOK` if source file was parsed and some strings were returned, `cSynError` otherwise.
