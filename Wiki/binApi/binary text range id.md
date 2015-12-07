Possible values of text range id:

- `cSynIdAllText` - entire editor text, lines are EOL-separated (EOL is file-dependant).
- `cSynIdSelectedText` - selected text block (for stream and column blocks), lines are EOL-separated.
- `cSynIdCurrentLine` - current line (without EOL).

Values only for [cActionGetText]:

- `cSynIdSelectedLines` - lines affected by selection, Chr(13)-separated.
- `cSynIdSearchPaths` - list of search folders, ";"-separated.
- `cSynIdFavoritesText` - list of Favorites items, Chr(13)-separated.
