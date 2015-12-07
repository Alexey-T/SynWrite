This action can be called by plugin to parse some regex (regular expression) into subparts. 

Subparts are surrounded by braces in regex and are numbered from 1 to 8.
For example: string "www 123-44" can be parsed by regex "(\w+) (\d+)-(\d+)" into subparts
"www", "123", "44", others are empty.
If you pass bad regex for a string, all subparts will be empty.

Parameters:

- **A1** (PWideChar) - regular expression.
- **A2** (PWideChar) - data string.
- **A3** (PSynRegexArray) - pointer to structure which gets resulting subparts.
- **A4** - not used.

Return value: not used.

