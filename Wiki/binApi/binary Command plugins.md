Command plugins add new menu items into "Plugins" item of SW main menu. ("Plugins" item is visible only when at last 1 plugin is installed.)

Command plugins must support at last [cActionMenuCommand] action.

The following functions must be exported by plugin:

- [SynInit]
- [SynAction]

See also:

- [binary API actions]
