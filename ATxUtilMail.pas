unit ATxUtilMail;

interface

function FSendEmail(const SText, SSubj, SToName, SToAddr, Attachment: AnsiString): Boolean;

implementation

uses
  Windows, Mapi, Forms;

function FSendEmail(const SText, SSubj, SToName, SToAddr, Attachment: AnsiString): Boolean;
var
  h: THandle;
  SendMail: TFNMapiSendMail;
  MapiMessage: TMapiMessage;
  MapiFileDesc: TMapiFileDesc;
  MapiRecip: TMapiRecipDesc;
begin
  FillChar(MapiMessage, SizeOf(MapiMessage), 0);
  FillChar(MapiFileDesc, SizeOf(MapiFileDesc), 0);
  FillChar(MapiRecip, SizeOf(MapiRecip), 0);

  with MapiMessage do
  begin
    if SSubj <> '' then
      lpszSubject := PAnsiChar(SSubj);
    if SText <> '' then
      lpszNoteText := PAnsiChar(SText);

    if SToName <> '' then
    begin
      with MapiRecip do
      begin
        lpszName := PAnsiChar(SToName);
        if SToAddr <> '' then
          lpszAddress := PAnsiChar(SToAddr);
        ulRecipClass := MAPI_TO;
      end;
      nRecipCount := 1;
      lpRecips := @MapiRecip;
    end;

    if Attachment <> '' then
    begin
      with MapiFileDesc do
      begin
        lpszPathName := PAnsiChar(Attachment);
      end;
      nFileCount := 1;
      lpFiles := @MapiFileDesc;
    end;
  end;

  h := LoadLibrary('mapi32.dll');
  Result := h <> 0;
  if Result then
    try
      @SendMail := GetProcAddress(h, 'MAPISendMail');
      Result := @SendMail <> nil;
      if Result then
        Result := SendMail(0, Application.Handle,
          MapiMessage, MAPI_DIALOG or MAPI_LOGON_UI or MAPI_NEW_SESSION, 0) = SUCCESS_SUCCESS;
    finally
      FreeLibrary(h);
    end;
end;


end.
