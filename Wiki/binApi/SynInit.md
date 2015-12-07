**SynInit** function is called first after plugin loading. It's Delphi prototype is:

    procedure SynInit(ADefaultIni: PWideChar; AActionProc: Pointer); stdcall;

Parameters are:

- **ADefaultIni** - path to plugin's default ini file (located in "%AppData%\SynWrite" or in SynWrite installation folder).
- **AActionProc** - address of function which can be used by plugin to call SynWrite actions. It has the same prototype as [SynAction] function, only it has different allowed action names. Possible actions names are listed in the [binary API actions] page.
