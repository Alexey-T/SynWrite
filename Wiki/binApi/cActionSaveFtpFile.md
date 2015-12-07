This action is called by SW when user saves file which was opened from FTP connection before. FTP info sctucture is the same as was passed by plugin in [cActionOpenFtpFile] action.

Parameters:

- **A1** (PWideChar) - local file path.
- **A2** (Pointer) - pointer to FTP info structure.
- **A3** (Integer) - size of FTP info structure, in bytes.
- **A4** - not used.

Return value: not used.
