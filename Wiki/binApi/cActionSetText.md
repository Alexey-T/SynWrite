This action can be called by plugin to write text to current editor.

Parameters:

- **A1** (Integer) - [text range id] (negative value) or line number (0-based).     
- **A2** (PWideChar) - text buffer.
- **A3** (Integer) - buffer size, in chars. 
- **A4** - not used.

Return value: `cSynOK` if all parameter values are correct, `cSynError` otherwise. Error is returned when a) incorrect text range id or line number is passed, b) zero buffer pointer or non-positive buffer size is passed, c) editor is read-only.
