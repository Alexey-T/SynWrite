This action can be called by plugin to open file from FTP connection. Plugin should store FTP-related info into some structure and pass pointer to this structure to SW.

Parameters:

- **A1** (PWideChar) - pointer to local file name (usually in some temp folder).
- **A2** (Pointer) - pointer to FTP info structure. SW will later pass this structure back to plugin in [cActionSaveFtpFile] action.
- **A3** (Integer) - size of FTP info structure in bytes.
- **A4** - not used.

Return value: `cSynOK` if local file name could be opened (SW may ask confirmation about binary file content), or `cSynError` otherwise.
