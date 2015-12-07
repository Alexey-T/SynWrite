This action can be called by plugin to set caret position (0-based) in the current editor.

Parameters:

- **A1** (Integer) - caret X position (column). If it's negative, A2 parameter means absolute text offset.
- **A2** (Integer) - caret Y position (line).
- **A3, A4** - not used.

Return value: `cSynError` if invalid position was passed (e.g. too big line number), or `cSynOK` otherwise.
