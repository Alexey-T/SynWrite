Possible names of Python class methods, for Event plugins, are listed here.  
All methods get object `ed_self` of type `Editor`, it's editor object for which event occured. This object is not always the same as `ed`, for example, "Save all" command may call `on_save` for non-active editor.

Id in SynPlugins.ini | Method signature | Description
---------------------|------------------|------------
`on_open`        | `on_open(self, ed_self)`            | Called after opening a file. 
`on_save`        | `on_save(self, ed_self)`            | Called after saving a file.
`on_save_pre`    | `on_save_pre(self, ed_self)`        | Called before saving a file. Method can return `False` to disable saving, other return value is ignored.
`on_change`      | `on_change(self, ed_self)`          | Called after text changed.
`on_change_slow` | `on_change_slow(self, ed_self)`     | Called after text changed, and after a delay (2-5 seconds, configurable in "Syn.ini" file). This is suitable for Lint plugins, which need to act after few seconds after last text-change.
`on_select`      | `on_select(self, ed_self)`          | Called after selection changed.
`on_caret_move`  | `on_caret_move(self, ed_self)`      | Called after caret moved.
`on_key`         | `on_key(self, ed_self, key, state)` | Called when user presses a key. `key` is int key code. `state` is few chars string: "a" if Alt pressed, "c" if Ctrl pressed, "s" if Shift pressed. Method can return `False` do disable key processing, other return value is ignored.
`on_state`       | `on_state(self, ed_self, id)`       | Called before changing some editor state. `id` is one of values listed at [py property id]. Method can return `False` to disable state changing, other return value is ignored.
`on_num`         | `on_num(self, ed_self, number)`     | Called to get string values for line-numbers gutter column. `number` is int line number, 0-based. Method must return str for this number.
`on_focus`       | `on_focus(self, ed_self)`           | Called after editor is focused.
`on_lexer`       | `on_lexer(self, ed_self)`           | Called after lexer is changed.
`on_complete`    | `on_complete(self, ed_self)`        | Called by auto-completion command (default hotkey: Ctrl+Space). Method should call `Editor.complete` API. Method must return `True` if it handled command, otherwise `None`.  
`on_func_hint`   | `on_func_hint(self, ed_self)`       | Called by function-hint command (default hotkey: Ctrl+Shift+Space). Method must return function-hint string (comma-separated parameters), or empty string.  
`on_goto_def`    | `on_goto_def(self, ed_self)`        | Called by go-to-definition command (mouse shortcut: Ctrl+Alt+Click). Method must return `True` if it handled command, otherwise `None`.
`on_console`     | `on_console(self, ed_self, text)`   | Called on entering text command in Python Console panel. Method can return `True` to disable internal command processing, other return value is ignored.
`on_compare`     | `on_compare(self, ed_self, filename1, filename2)` | Called when program is run with "/cmp" command-line parameter. This is needed for file-compare plugin: plugin should compare passed filenames and open two editors in left/right views with compare results.
`on_panel_log`   | `on_panel_log(self, ed_self, name, msg, msg_time)` | Called on adding log line from Panel plugin (e.g. SynFTP). `name` is plugin filename. `msg` is log message. `msg_time` is formatted timestamp str, you may ignore it and use your own timestamp str.
`kNNN` (NNN is number) | No such methods | Id `kNNN` means that `on_key` event should happen for key-code `NNN`. E.g., if plugin needs to react only to 4 arrow keys, you need to specify in SynPlugins.ini: `on_key,k37,k38,k39,k40`. If no `kNNN` listed, plugin will react to all keys. See constants for key-codes in file `sw_keys.py`.

Example for on_compare
----------------------

Handler just opens two empty editors in two groups, and shows passed filenames in both editors.

    from sw import *
    from sw_cmd import *

    class Command:
        def on_compare(self, ed_self, filename1, filename2):
            ed.insert(filename1)
            file_open('')
            ed.insert(filename2)
            ed.cmd(cmd_FileMoveToOtherView)
            ed.cmd(cmd_ToggleFocusView)

Example for on_num
------------------

Handler shows "*" char for each 10th line number.

    def on_num(self, ed_self, number):
        s = str(number+1)
        if s.endswith('0'):
            s = '*' + s
        return s

Example for on_panel_log
------------------------

Handler appends FTP log message to fixed file.

    def on_panel_log(self, ed_self, name, msg, msg_time):
        if not name: return
        i = name.find('.')
        name = name[:i]
        filename = 'd:\\' + name + '.log'
        with open(filename, 'a') as f:
            f.write(msg_time+msg+'\n')

