Possible values of id in `get_app_prop(id, text) / set_app_prop(id, text)`:

* PROP_COORD_WINDOW: (read/write): 4-tuple of int: Coords of program window.
* PROP_COORD_TREE: (read/write): 4-tuple of int: Coords of tree/project panel. Note: coords are relative to dock-control, if panel is docked.
* PROP_COORD_CLIP: (read/write): 4-tuple of int: Coords of clip/minimap panel.
* PROP_COORD_OUT: (read/write): 4-tuple of int: Coords of output panel.
* PROP_COORD_PRE: (read/write): 4-tuple of int: Coords of preview panel.
* PROP_DOCK_TREE: (read/write): str: Dock id of tree/project panel.
* PROP_DOCK_CLIP: (read/write): str: Dock id of clip/minimap panel.
* PROP_DOCK_OUT: (read/write): str: Dock id of output panel.
* PROP_DOCK_PRE: (read/write): str: Dock id of preview panel.
* PROP_COORD_DESKTOP: (read): 4-tuple of int: Coords of virtual desktop (which includes all monitors).
* PROP_COORD_MONITOR: (read): 4-tuple of int: Coords of monitor with program window.
* PROP_COORD_MONITOR0: (read): 4-tuple of int: Coords of 1st monitor.
* PROP_COORD_MONITOR1: (read): 4-tuple of int: Coords of 2nd monitor or `None` if monitor not found.
* PROP_COORD_MONITOR2: (read): 4-tuple of int: Coords of 3rd monitor or `None` if monitor not found.
* PROP_COORD_MONITOR3: (read): 4-tuple of int: Coords of 4th monitor or `None` if monitor not found.
* PROP_SPLIT_MAIN_POS: (read/write): int: Main splitter position in percents.
* PROP_FILENAME_SESSION: (read/write): str: Filename of current session or empty string if session not saved.
* PROP_FILENAME_PROJECT: (read/write): str: Filename of current project or empty string if project not saved.
* PROP_RECENT_FILES: (read): list of str: List of recent opened files or `None` if recent-list empty.
* PROP_RECENT_SESSIONS: (read): list of str: List of recent opened sessions or `None` if recent-list empty.
* PROP_RECENT_PROJECTS: (read): list of str: List of recent opened projects or `None` if recent-list empty.
* PROP_RECENT_NEWDOC: (read): list of str: List of recent new-document templates or `None` if recent-list empty.
* PROP_EVENTS: (write): str: Registering properties of event plugin. 3 strings ";"-separated: plugin module name, events list (like in "SynPlugins.ini", see [py event names], pass empty string to remove events for plugin), lexers list (like in "SynPlugins.ini", pass empty string for all lexers). Example: `'syn_docblock;on_key,k13;JavaScript,PHP;'`.
* PROP_GROUP_MODE: (read/write): int: Tabs-grouping mode. One of `GROUPING_nnnn` constants.

Notes
------

* When setting bool, pass one of strings: "0", "1"
* When getting coords, you get 4-tuple of int: `(x1, y1, x2, y2)`
* When setting coords, you should pass string: `'%d,%d,%d,%d' % (x1, y1, x2, y2)`
* Possible values of dock id: [py dock id]
