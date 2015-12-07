This action can be called by plugin to read properties of current editor.

Parameters:

- **A1** (Integer) - [property id].
- **A2** (Pointer) - points to data buffer. For Integer or Bool data buffer must contain SizeOf(Integer)=4 bytes, for text data it must contain `cSynMaxPath` wide chars.
- **A3** (Integer) - property parameter (e.g. line number).
- **A4** - not used.

Return value: `cSynOK` if correct property id is passed, `cSynError` otherwise.
