Panel plugins add additional panels to SynWrite, their tabs appear after Tree/Project tabs. You can see examples, which ship with source code: [plugin Explorer] and [plugin FTP_Fake]. 

The following functions must be exported by plugin:

- [SynInit]
- [SynOpenForm]
- [SynCloseForm]

The following functions can be exported optionally:

- [SynAction]

See also:

- [binary API actions]
