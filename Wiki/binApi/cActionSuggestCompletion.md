This action can be called by plugin to suggest user list of auto-completion strings. This may be needed by some abbreviation expansion plugins, similar to Zen Coding.

Suggestions list is Chr(13)-separated list of strings, each string is simply id or "|"-separated list: "id|type|(parameters)".

Parameters:

- **A1** (PWideChar) - suggestions list.
- **A2** (Integer) - length of text, which will be replaced by suggested text. 
- **A3** (Bool) - allows to show completion popup window with suggested strings. If False, instant replace will be performed without popup shown, with the first passed string.
- **A4** - not used.

Return value: `cSynError` if some parameters are not valid (e.g. strings list is empty), or `cSynOK` otherwise.

Example for A2 parameter: if caret is in position 1:4 after word "wwww", and length parameter is 3, then last 3 "w" chars will be replaced with suggested string (which is chosen by user from popup window if it's enabled).

