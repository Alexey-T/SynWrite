This action can be called by plugin to add file or folder to Favorites list.
Later, when user calls this Favorites item, SynWrite calls [cActionNavigateToFile] action with the path previously stored in this action.

Example of file path with prefix:

    Explorer::C:\path\file.txt

Prefix ("Explorer" in example) means panel plugin name, which must be equal to string in SynPlugins.ini file.

Parameters:

- **A1** (PWideChar) - path of file or folder, with optional prefix and "::" characters.
- **A2, A3, A4** - ignored.

Return value can be ignored.
