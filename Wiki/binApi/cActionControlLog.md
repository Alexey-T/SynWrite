This action can be called by plugin to control plugin's log panel, which is shown in Output panel.

Parameters:

- **A1** (PWideChar) - data string.
- **A2** (Integer) - command id. See possible values in the table below.
- **A3** (Integer) - string color for command "Append data string".
- **A4** - not used.

  Command id | Meaning
  -----------|--------
  cSynLogCmdHide | Hide log panel
  cSynLogCmdShow | Show log panel
  cSynLogCmdAddLine | Append data string to log panel
  cSynLogCmdClear | Clear log panel
  cSynLogCmdSetCaption | Set log panel's caption to data string

Return value: `cSynOK` if valid command id was passed, or `cSynBadCmd` otherwise.


