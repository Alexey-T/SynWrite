This page describes API for SynWrite plugins written in Python.  
Plugin types:

- Command plugins: Activated by user when calling menu items in "Plugins" menu. Method name in "Command" class: "run" or any other.
- Event plugins: Activated by SynWrite when some event occurs in editor, e.g. "text changed" or "file saved". Method name in "Command" class: one of [py event names].
- Auto-completion plugins: Special case of event plugins. Activated by "Auto-completion popup" command (Ctrl+Space hotkey) or "Function hint" command (Ctrl+Shift+Space hotkey).
- Goto-definition plugins: Special case of event plugins. Activated by "Go to definition" menu item from editor context menu.

Functions
=========

- [python API functions]
- [python API changes]

Example for command plugin
==========================

`install.inf` declares method "run" with lexers attached.

```
[info]
title=AStyle Format
desc=Formats source code for these lexers: C, C++, C#, Java; uses AStyle library
type=py-plugin
subdir=syn_astyle_format

[ini]
section=Commands
id=AStyle Format\Format
params=run;C,C++,C#,Java;;
```

`__init__.py` has code of method "run".

```
from sw import *
import sys
import os

class Command:
    def run(self):
        pass
        #some work
```


Example for event plugin
========================

`install.inf` declares event "on_caret_move" and method "jump".

```
[info]
title=Brackets Hilite
desc=Highlights pair brackets for caret position, when caret moves
type=py-plugin
subdir=syn_brackets_hilite

[ini1]
section=Events
id=BracketsHilite
params=on_caret_move

[ini2]
section=Commands
id=Brackets Hilite\Go to pair bracket
params=jump
```

`__init__.py` has code for event, and for method.

```
import os
import shutil
from sw import *

class Command:

    def on_caret_move(self, ed_self):
        pass
        #handle event
        
    def jump(self):
        pass
        #work
```

