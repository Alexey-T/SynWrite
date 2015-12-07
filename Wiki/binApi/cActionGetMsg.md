This action can be called by plugin to read translatable string from plugin's lang-file (considering current interface language).

Currently the lang-file section "L" is always used.
If given string doesn't exist in the current lang-file, the English lang-file is used. If given string doesn't exist even in the English file, the empty string is returned.

Parameters:

- **AHandle** - not used, so you can call this action even in SynOpenForm.
- **A1** (PWideChar) - full path of plugin DLL file.
- **A2** (PWideChar) - string id, ie. the key name in language file.
- **A3** (PWideChar) - pointer to buffer for resulting string. Buffer must be at last `cSynMaxMsg` chars in size.
- **A4** - not used.

Return value: not used.
