This action can be called by SW to nagivate to a file/folder in panel plugin.

For example, if string "Explorer::some_path" was added to Favorites list by plugin, then, on navigating to this item, SW activates plugin with name "Explorer", and calls this action with value "some_path".

Parameters:

- **A1** (PWideChar) - path of file/folder to nagivate to.
- **A2, A3, A4** - not used.

Return value is ignored.
