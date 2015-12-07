This action can be called by plugin to save file tab.

Parameters:

- **A1** (Integer) - tab id. Possible values:
    `cSynIdCurrentFile` (negative) - current editor tab;
    `cSynIdOppositeFile` (negative) - current tab in opposite SW view;
    non-negative values - tab with absolute number.
- **A2** (Bool) - enables to show Save File dialog for unnamed tab.
- **A3, A4** - not used.

Return value: `cSynOK` if passed correct tab id and saving was done, `cSynError` otherwise.


