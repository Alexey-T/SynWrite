Possible values of application-property id:

Id | Access | Type | Meaning
---|--------|------|--------
`PROP_COORD_WINDOW` | RW | 4-tuple of int | Coords of program window.
`PROP_COORD_TREE`   | RW | 4-tuple of int | Coords of tree/project panel. Note: coords are relative to dock-control, if panel is docked.
`PROP_COORD_CLIP`   | RW | 4-tuple of int | Coords of clip/minimap panel.
`PROP_COORD_OUT`    | RW | 4-tuple of int | Coords of output panel.
`PROP_COORD_PRE`    | RW | 4-tuple of int | Coords of preview panel.
`PROP_DOCK_TREE` | RW | str | Dock id of tree/project panel.
`PROP_DOCK_CLIP` | RW | str | Dock id of clip/minimap panel.
`PROP_DOCK_OUT`  | RW | str | Dock id of output panel.
`PROP_DOCK_PRE`  | RW | str | Dock id of preview panel.
`PROP_COORD_DESKTOP`  | R | 4-tuple of int | Coords of virtual desktop (which includes all monitors).
`PROP_COORD_MONITOR`  | R | 4-tuple of int | Coords of monitor with program window.
`PROP_COORD_MONITOR0` | R | 4-tuple of int | Coords of 1st monitor.
`PROP_COORD_MONITOR1` | R | 4-tuple of int | Coords of 2nd monitor or `None` if monitor not found.
`PROP_COORD_MONITOR2` | R | 4-tuple of int | Coords of 3rd monitor or `None` if monitor not found.
`PROP_COORD_MONITOR3` | R | 4-tuple of int | Coords of 4th monitor or `None` if monitor not found.
`PROP_SPLIT_MAIN_POS`   | RW | int | Main splitter position in percents.
`PROP_FILENAME_SESSION` | RW | str | Filename of current session or empty string if session not saved.
`PROP_FILENAME_PROJECT` | RW | str | Filename of current project or empty string if project not saved.
`PROP_RECENT_FILES`    | R | list of str | List of recent opened files or `None` if recent-list empty.
`PROP_RECENT_SESSIONS` | R | list of str | List of recent opened sessions or `None` if recent-list empty.
`PROP_RECENT_PROJECTS` | R | list of str | List of recent opened projects or `None` if recent-list empty.
`PROP_RECENT_NEWDOC`   | R | list of str | List of recent new-document templates or `None` if recent-list empty.
`PROP_EVENTS` | W | str | Registering properties of event plugin. 3 strings ";"-separated: plugin module name, events list (like in "SynPlugins.ini", see [py event names], pass empty string to remove events for plugin), lexers list (like in "SynPlugins.ini", pass empty string for all lexers). Example: `'syn_docblock;on_key,k13;JavaScript,PHP;'`.
`PROP_GROUP_MODE`  | RW | int | Tabs-grouping mode. One of `GROUPING_nnnn` constants.

Deprecated actions
------------------

Soon, at end of 2016, these will be deleted.

Id | Access | Type | Meaning
---|--------|------|--------
`PROP_GROUP_INDEX` | R  | int | Index of active tab-group. 1-based.
`PROP_GROUPS`      | R  | str | Count of tabs in each tab-group. It's ","-separated list of ints.
`PROP_EDITOR_BY_INDEX` | R | int | Handle of editor at given group-index and tab-index. `value` parameter must be 3 numbers ","-separated.

Notes
------

- When setting bool, pass one of strings: '0' or '1'
- When getting coords, you get 4-tuple of int: `(x1, y1, x2, y2)`
- When setting coords, you should pass string: `'%d,%d,%d,%d' % (x1, y1, x2, y2)`
- Possible values of dock id: [py dock id]
