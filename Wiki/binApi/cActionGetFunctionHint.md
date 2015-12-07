This action can be called by SynWrite to get function parameters hint, when user calls "Parameters popup" command (default shortcut is Ctrl+Shift+Space).

The usage of this action is the same as for [cActionGetAutoComplete], only meaning of text buffer is different: plugin should store in text buffer Chr(13)-separated list of function hints, each surrounded by "(" and ")" braces. 

Parameters should be separated by "," char.
No trailing ";" char is needed.
Examples of hints:

    (Param1: integer, Param2: string, const Param3: array of char)
    (const P1, P2: array of string, var Result: string)
    (int N, char* Ptr)
