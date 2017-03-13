New form: `msg_box(text, flags)`
==============================

Values of flags:

* MB_OK
* MB_OKCANCEL
* MB_ABORTRETRYIGNORE
* MB_YESNOCANCEL
* MB_YESNO
* MB_RETRYCANCEL

Add to flags, to show icons:

* MB_ICONERROR
* MB_ICONQUESTION
* MB_ICONWARNING
* MB_ICONINFO

Gets values:

* ID_OK
* ID_CANCEL
* ID_ABORT
* ID_RETRY
* ID_IGNORE
* ID_YES
* ID_NO


Old form: `msg_box(id, text)`
=============================

Values of id:

* MSG_INFO: One-line message-box, with Info icon.      
* MSG_WARN: One-line message-box, with Warning icon.      
* MSG_ERROR: One-line message-box, with Error icon.
* MSG_CONFIRM: One-line message-box, with two buttons: OK, Cancel. Gets bool: OK pressed.
* MSG_CONFIRM_Q: Same as previous, but with question icon.
* BEEP_INFO: Sound signal, Info kind. 
* BEEP_WARN: Sound signal, Warning kind.  
* BEEP_ERROR: Sound signal, Error kind.
