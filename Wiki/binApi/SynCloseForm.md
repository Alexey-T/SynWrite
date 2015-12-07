**SynCloseForm** function is called to close plugin window. You may use it to destroy the window and/or save plugin settings to ini file. Its prototype is:

    procedure SynCloseForm(AHandle: Pointer); stdcall;

Parameters are:

- **AHandle** - handle which was previously returned by plugin in SynOpenForm.
