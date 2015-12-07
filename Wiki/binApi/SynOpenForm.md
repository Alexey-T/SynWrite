**SynOpenForm** function is called to show panel plugin. Its prototype is:

    function SynOpenForm(AParentWindow: THandle; var AWindow: THandle): Pointer; stdcall;

Parameters are:

- **AParentWindow** - handle of SW window, which must become perent of plugin window. You must create plugin window and set its parent to AParentWindow.
- **AWindow** - you must set here the handle of plugin's created window.

Result is a handle which then will be used by SW as parameter to other plugin exported functions.
If you use Delphi, return here the pointer to plugin form (TForm).
