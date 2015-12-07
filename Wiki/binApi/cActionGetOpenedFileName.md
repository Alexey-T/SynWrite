This action can be called by plugin to retrieve path of opened files in editor.

Parameters:

- **A1** (PWideChar) - points to WideChar buffer to store filename. Buffer must be at last `cSynMaxPath` characters in size.
- **A2** (Integer) - file id. Possible values:
    - `cSynIdCurrentFile` (negative) - current editor file;
    - `cSynIdOppositeFile` (negative) - current file in opposite SW view; 
    - non-negative values - file from tab with absolute number.
- **A3, A4** - ignored.

Return value is `cSynOK` if file with given id exists, or `cSynError` otherwise.
For no-named tabs, return value will be `cSynOK` and buffer will contain an empty string.
