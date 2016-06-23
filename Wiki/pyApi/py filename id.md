Possible values of `file_get_name()` id and their meanings:

Id | Meaning
---|--------
`id >= 0` | filename of editor-tab with specified absolute index (index is used through all tab-groups)
`FILENAME_CURRENT` | current filename in active tab-group
`FILENAME_OPPOSITE` | current filename in opposite tab-group (for 1st group - 2nd, for 2nd group - 1st, for others - empty) 
`FILENAME_SESSION` | session filename
`FILENAME_PROJECT` | project filename
`FILENAME_PROJECT_MAIN` | project's "main filename"
`FILENAME_PROJECT_WORKDIR` | project's "working folder"
`FILENAME_PROJECT_SESSION` | project's session filename
`FILENAME_PROJECT_FILES` | project's all filenames, list of str
`FILENAME_LEXLIB` | lexer-library filename
`FILENAME_PATHS` | search-paths, str ";"-separated
