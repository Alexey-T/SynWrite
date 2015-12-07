Format of SynWrite session files, with "synw-session" extension.

* Files have ini format. 
* Encoding is ANSI.
* No spaces should be around "=" chars.

Section "sess"
==============

Key | Example | Desc
----|---------|-----
`gr_mode` | 4 | Grouping mode, 1-based (1 is "one group", 2 is next in groups menu, 3 is next in menu etc)
`gr_act` | 4 | Index of active group, 1-based
`tab_act` | 0,0,1,2,-1,-1 | Indexes of active tabs in all groups, 6 ints ","-separated, 0-based or -1 if no tabs in group
`split` | 50 | Splitter position, in percents, only for few group modes (1x2, 2x1, 1+2), else 50
`tabs` | 10 | Number of tabs

Sections "f#"
=============
Next these sections go, from "f0" to "fN" where N is the value of `tabs` key minus 1.  

Key | Desc
----|-----
`gr` | Index of tab group (1..6)
`fn` | Filename, utf8 (can start with ".\", "." means folder path of session file itself, if file in same folder)
`top` | 2 ints, ","-separated, top line index for master/slave editors
`caret` | 2 ints, ","-separated, caret absolute offsets for master/slave
`wrap` | 2 bools (0 or 1), ","-separated, word wrap for master/slave
`prop` | 4 numbers, ","-separated. 1) read/only (bool), 2) line numbers visible (bool), 3) folding enabled (bool), 4) select-mode (0-based)
`color` | Color of tab, string like "clSilver" or "$00F0A0", "clNone" if not set
`colmark` | Column markers, string like "10 20 30"
`folded` | 2 strings, ";"-separated, collapsed ranges lists (ints ","-separated) for master/slave

"Master" is editor at the top of a tab, when this tab is splitted. "Slave" is hidden if not splitted.
