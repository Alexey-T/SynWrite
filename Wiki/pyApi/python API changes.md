Changes in Python API
=====================

oct 2016

* release 1.0.157
* add: lexer_proc: LEXER_DETECT
* add: ed.set_prop: can set PROP_LEXER_FILE
* del: ed.get_prop: PROP_RECENT_NEWDOC
* release 1.0.156
* add: lexer_proc: LEXER_GET_COMMENT_STREAM, LEXER_GET_COMMENT_LINED
* add: lexer_proc: LEXER_GET_STYLES_COMMENTS, LEXER_GET_STYLES_STRINGS
* deprecated id of lexer_proc: LEXER_ACTIVATE
* deprecated id of get_app_prop, soon will be deleted: PROP_GROUP_INDEX, PROP_GROUPS, PROP_EDITOR_BY_INDEX 

sep 2016

* release 1.0.155
* del: id FILENAME_LEXLIB
* del: id LEXER_SAVE_LIB, LEXER_CONFIG_ALT
* release 1.0.154
* add: lexer_proc: LEXER_GET_COMMENT
* add: ed.get_prop: PROP_INDEX_GROUP, PROP_INDEX_TAB, PROP_TAB_TITLE, PROP_TAB_COLOR, PROP_TAB_ID
* add: ed.get_prop: aliases PROP_LINE_TOP, PROP_LINE_BOTTOM, PROP_COLUMN_LEFT
* del: ed.get_tabcolor, ed.set_tabcolor (use PROP_TAB_COLOR)
* del: ed.get_indexes (use PROP_INDEX_GROUP, PROP_INDEX_TAB)

jun 2016

* release 1.0.153
* add: dlg_custom: "type=tabs"
* release 1.0.152
* del: Favorites api, cmds

may 2016

* release 1.0.151
* add: dlg_custom()
* add: app_proc: PROC_SET_ESCAPE, PROC_GET_ESCAPE

jan 2016

* release 1.0.150
* add: on_click_dbl
* release 1.0.149
* add: dlg_menu param "focused"
* change dlg_input: last params optional
* release 1.0.148
* add: on_click

feb 2015

* release 1.0.147
* add: app_proc: PROC_GET_COMMAND
* del: app_proc: id "report keys"

jan 2015

* release 1.0.146
* add: editor-property ids
* add: Editor.get_enc
* add: Editor.set_enc
* add: app_proc id "add recent color"
* del: app_proc id "color picker ex"

nov 2014

* release 1.0.145
* add Editor.get_attr()
* add Editor.set_attr()
* add app_proc() id "add gutter icon"
* release 1.0.144
* add dlg_file()
* add dlg_folder()
* release 1.0.143
* add dlg_checklist()
* add file_open() parameter

oct 2014

* release 1.0.142
* added lexer-proc id "get links", "get styles", "set links"
* release 1.0.141
* added dlg_snippet
* release 1.0.140
* added editor-prop "line state"
* added event on_lexer

sep 2014

* release 1.0.139
* added event on_panel_log
* added param to insert_snippet
* release 1.0.138
* del id filename_project_base, added id filename_project_files
* chg: id filename_favs gives list, not str

aug 2014

* release 1.0.137
* added ed methods get_tabcolor, set_tabcolor
* release 1.0.136
* added app-proc "report keys html"
* change: editor-prop "tag" is str
* release 1.0.135
* added ed method get_indexes
* added app-prop "groups"
* added app-prop "editor by index"
* added editor-prop "tag"
* added event on_focus
* release 1.0.134
* added app-prop "events"
* release 1.0.133
* added ed.cmd "print now"
* added app-proc "color picker"
* added editor-prop "non printed nnnnnnn"

jul 2014

* release 1.0.132
* added Editor.get_staple
* added grouping constants for get_app_prop
* release 1.0.131
* added app-property "grouping mode"
* removed app-property "main splitter horiz."

may 2014

* release 1.0.130
* removed deprecated app_lock and its constants
* removed constant CUR_LINE=-1
* added color props to Editor.set_prop
* added event on_console (useful for Vim-Mode plugins)
* release 1.0.129
* added func ed_handles
* added bringing of tab to front on Editor(some_handle).focus()

apr 2014

* release 1.0.128
* changed: added selection param to Editor.add_caret_xy
* changed: added selections to Editor.get_carets result
* added support for chr(9) in dlg_menu simple style
* release 1.0.126
* changed auto-completion API: compare method not used, use on_compare event instead.
* changed find-id API: findid method not used, use on_goto_def event instead.
* added function-hint on_func_hint event.
* release 1.0.125
* added events on_change, on_select, on_caret_move
* added events on_compare, on_num
* changed type of lexer_proc get-list result
* added get_app_prop ids: recent lists + session/project filenames

mar 2014

* release 1.0.124
* added get_app_prop ids: main splitter props
* release 1.0.123
* removed get_clip, set_clip, use app_proc instead
* deprecated app_lock, use app_proc instead
* added app_proc
* added on_key called for any key if no kNNN specified
* added get_app_prop, set_app_prop
* added dlg_input_memo
* added dlg_input_ex
* removed Editor.get_lexer, use Editor.get_prop new id instead
* release 1.0.122
* removed get_console, set_console, use app_log new id instead
* added get_prop id "token type"
* added lexer_proc id "activate"
* release 1.0.121
* added lexer-library api lexer_proc
* added hint param to Editor.set_bk

feb 2014

* release 1.0.120
* added event on_open
* added Editor.get_alerts, set_alerts
* added log id "zerobase"
* added checkmarks and separators for dlg_menu std style
* release 1.0.119
* added event on_state
* added menu id "std"
* added app_lock
* release 1.0.118
* added dlg_menu
* added get_console, set_console
* added Editor.set_prop
* added event on_key
* added text_convert
* renamed msg_local to text_local
* release 1.0.116
* added Editor.get_filename
* added Editor.insert_snippet
* added log api: app_log
* added beep ids for msg_box
* added support for event plugins
* release 1.0.114
* added filename ids: search-paths, fav-items
* added support for auto-completion plugins
* added bookmark api: Editor.get_bk, Editor.set_bk

jan 2014

* added class Editor and object ed
* redone all API

dec 2013

* release 1.0.101
