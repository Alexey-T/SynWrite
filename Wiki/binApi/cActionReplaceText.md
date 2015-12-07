This action can be called by plugin to delete and/or insert text at caret position of current editor.

Parameters:

- **A1** (Integer) - length of text to delete. Can be 0 for inserting only.
- **A2** (PWideChar) - points to text to insert. Can be 0 for deleting only.
- **A3** (Integer) - length of text to insert. Can be 0 for deleting only.
- **A4** - not used.

Return value: `cSynError` if editor is read-only or incorrect parameter values are passed, `cSynOK` otherwise.
