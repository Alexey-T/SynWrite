This action is called by SynWrite to set colors in panel plugins, after plugin form is created.

Parameters:

- **A1** (Integer) - UI element id. One of `cColorId_nnnnnn` constants.
- **A2** (Integer) - Color value in Delphi format. This means, that if value is OR'ed with 0xFF000000 mask, plugin must exclude this mask and call `GetSysColor` Win API to get real color value.
- **A3, A4** - not used.

Return value: ignored.
