This action is called by SW for FindID plugins, when user calls command "Go to definition" in editor context menu, and current editor lexer is supported by plugin.

Parameters:

- **A1**-**A4**: not used.

Return value: `cSynOK` if plugin could process the file, `cSynError` if parsing error occured.