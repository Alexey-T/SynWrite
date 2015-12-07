This action can be called by plugin to read text from current editor.

Action can also be used:

* To read list of search paths. Paths list contains list from SynWrite options + list from current project options. Paths don't end with a backslash (except root drive paths). At the end of any folder path `"*"` char may be appended - this means that user wants to search specified folder with all subfolders. 
* To read list of Favorites items.

Parameters:

- **A1** (Integer) - [text range id] (negative value) or line number (0-based).     
- **A2** (PWideChar) - points to text buffer.
- **A3** (PInteger) - points to variable which holds buffer size, in chars.
- **A4** - not used.

Return value: 

- If incorrect text range id or line number is passed, return value is `cSynError`.
- If buffer size is insufficient for text, return value is `cSynSmallBuffer`, and required buffer size is stored in A3 parameter.
- If buffer size is sufficient, return value is `cSynOK`, text is copied to buffer, and text length is stored in A3 parameter.
