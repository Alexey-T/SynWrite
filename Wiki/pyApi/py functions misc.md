Function | Description
-------- | -------------
`app_version()` | Returns SynWrite program version string. 
`app_api_version()` | Returns SynWrite API version string: `major + '.' + minor + '.' + build`. 
`app_exe_dir()` | Returns folder path of SynWrite program.
`app_ini_dir()` | Returns folder path of SynWrite configuration files.
`app_log(id, text)` | Controls contents of log-panels and console-panel. Possible values of `id` are listed at [py log id].
`app_proc(id, text='')` | Performs some application-level action. Possible values of `id` are listed at [py app-proc id].
`ini_read(filename, section, key, value)` | Reads a string from ini-file. Filename should be without path (folder of program ini-files is used then). Recommended filename prefix is `"syn_"`. Default value passed as `value`. 
`ini_write(filename, section, key, value)` | Writes a string to ini-file. Same syntax as with `ini_read`. 
`file_open(filename, params='')` | Opens editor-tab for given file name. It activates already opened editor-tabs. Pass empty string for empty tab. `params` is optional: if it contains "/s", then installation of zip-filename will be silent. Returns bool: `filename` is empty or exists.
`file_save()` | Saves current editor-tab (shows "Save as" dialog for unnamed tab).
`file_get_name(id)` | Returns misc filename. Possible values of `id` are listed at [py filename id]. For incorrect `id` value, `None` is returned. To enumerate all editor-tabs, start with `id = 0`, and increase it until you get `None`.
`text_local(id, filename)` | Returns single string, from localization lang-file. Lang-files of your plugin must have names, described in [Plugins translation]. `id` is string identifier, `filename` is full path of any file in the same folder and lang-file - usually pass here `__file__` variable.
`text_convert(text, filename, back=False)` | Returns string converted using text-converter file (see help topic about text converters). Returns `None` if converter file is not found.
`regex_parse(regex, text)` | Parses string using regex, into 8 substrings, each substring is found by regex group (regex groups are defined as usual, by round brackets). Returns substrings as 8-tuple.
`get_app_prop(id, value='')` | Returns some application-level property. Possible values of `id` are listed at [py app-property id].
`set_app_prop(id, value)` | Sets some application-level property. Possible values of `id` are listed at [py app-property id].
`lexer_proc(id, text)` | Performs lexers-related action. Possible values of `id` are listed at [py lexer-proc id].
`ed_handles()` | Returns range object with all tabs editor handles. Pass all these handles to `Editor` constructor, to get editor objects. Here is example which prints all tabs contents: `for h in ed_handles(): print('---'); print(Editor(h).get_text_all());`
 