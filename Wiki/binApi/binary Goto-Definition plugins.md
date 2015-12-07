Goto-Definition plugins allow to find declaration of identifiers in the source code. They are called by command "Go to definition" of editor context menu.

Plugins must support at last [cActionFindID] action and should handle it like this:

- get caret position using [cActionGetCaretPos];
- get search paths using [cActionGetText];
- read current file using [cActionGetText] and maybe read include-files;
- find ID declaration in some file;
- open found file using [cActionOpenFile];
- set caret position using [cActionSetCaretPos].

The following functions must be exported by plugin:

- [SynInit]
- [SynAction]

See also:

- [binary API actions]
