This action can be called by plugin to get paths of current project files.

Parameters:

- **A1** (PWideChar) - pointer to filename buffer, which contains `cSynMaxPath` chars.
- **A2** (Integer) - file id. Possible values:
    - `cSynIdCurrentFile` (negative) - get path of main project file.
    - non-negative values - get path of project's tree node with absolute index. For folder nodes, result string will be empty, for file nodes it will be non-empty.
- **A3, A4** - not used.

Return value: `cSynOK` if valid id passed, `cSynError` otherwise.
If project is not opened, you'll get `cSynError` for id=0 (project pane not initialized) or id=1 (project pane initialized but empty).