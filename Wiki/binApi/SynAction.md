**SynAction** function is used to call some misc plugin functionality. Its Delphi prototype is:

    function SynAction(AHandle: Pointer; AName: PWideChar; A1, A2, A3, A4: Pointer): Integer; stdcall;

Parameters are:

- **AHandle** - handle which was previously returned by plugin in SynOpenForm.
- **AName** - action name, see possible values in [binary API actions] page.
- **A1, A2, A3, A4** - action parameters, their meaninings are different for different actions.

Return value depends on action, generally it may be:

- `cSynOK` to indicate OK result.
- `cSynBadCmd` to indicate unknown action.
- `cSynError` to indicate error result.
