Auto-Completion plugins can add intelligent auto-completion to any lexers. They are called by "Auto-Complete" (default shortcut is Ctrl+Space) and "Parameters popup" (default shortcut is Ctrl+Shift+Space) commands.

Plugins must support [cActionGetAutoComplete] and/or [cActionGetFunctionHint] actions and should handle them like this:

- get caret position using [cActionGetCaretPos];
- get search paths using [cActionGetText];
- read current file using [cActionGetText] and maybe read all include-files;
- prepare text buffer with list of resulting strings;
- copy this buffer to the buffer provided by SynWrite.

The following functions must be exported by plugin:

- [SynInit]
- [SynAction]

See also:

- [binary API actions]
