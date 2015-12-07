{******************************************************************************}
{                                                                              }
{   Library:          Fundamentals 4.00                                        }
{   File name:        cStreams.pas                                             }
{   File version:     4.22                                                     }
{   Description:      Reader, Writer and Stream classes                        }
{                                                                              }
{   Copyright:        Copyright � 1999-2011, David J Butler                    }
{                     All rights reserved.                                     }
{                     Redistribution and use in source and binary forms, with  }
{                     or without modification, are permitted provided that     }
{                     the following conditions are met:                        }
{                     Redistributions of source code must retain the above     }
{                     copyright notice, this list of conditions and the        }
{                     following disclaimer.                                    }
{                     THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND   }
{                     CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED          }
{                     WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED   }
{                     WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A          }
{                     PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL     }
{                     THE REGENTS OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,    }
{                     INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR             }
{                     CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,    }
{                     PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF     }
{                     USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)         }
{                     HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER   }
{                     IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING        }
{                     NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE   }
{                     USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE             }
{                     POSSIBILITY OF SUCH DAMAGE.                              }
{                                                                              }
{   Home page:        http://fundementals.sourceforge.net                      }
{   Forum:            http://sourceforge.net/forum/forum.php?forum_id=2117     }
{   E-mail:           fundamentalslib at gmail.com                             }
{                                                                              }
{ Revision history:                                                            }
{                                                                              }
{   1999/03/01  0.01  Initial version.                                         }
{   2000/02/08  1.02  AStreamEx.                                               }
{   2000/05/08  1.03  ATRecordStream.                                          }
{   2000/06/01  1.04  TFixedLenRecordStreamer.                                 }
{   2002/05/13  3.05  Added TBufferedReader and TSplitBufferReader.            }
{   2002/05/29  3.06  Created cReaders and cWriters units from cStreams.       }
{   2002/07/13  3.07  Moved text reader functionality to AReaderEx.            }
{   2002/08/03  3.08  Moved TVarSizeAllocator to unit cVarAllocator.           }
{   2002/08/18  3.09  Added TReaderWriter as AStream.                          }
{   2002/08/23  3.10  Added SelfTest procedure.                                }
{   2003/03/06  3.11  Improvements to AReaderEx.                               }
{   2003/03/17  3.12  Added new file open mode: fsomCreateOnWrite              }
{   2003/03/29  3.13  Added TStringWriter.                                     }
{   2003/04/09  3.14  Memory reader support for blocks with unknown size.      }
{   2004/02/21  3.15  Added TWideStringWriter.                                 }
{   2005/07/21  4.16  Added code from cReaders and cWriters units.             }
{   2005/08/26  4.17  Improved error messages.                                 }
{   2005/09/21  4.18  Revised for Fundamentals 4.                              }
{   2005/12/06  4.19  Compilable under FreePascal 2.0.1 Linux i386.            }
{   2008/12/30  4.20  Revision.                                                }
{   2010/06/27  4.21  Compilable with FreePascal 2.4.0 OSX x86-64              }
{   2011/10/14  4.22  Compilable with Delphi XE.                               }
{                                                                              }
{ Supported compilers:                                                         }
{                                                                              }
{   Borland Delphi 5-XE Win32 i386                                             }
{   FreePascal 2 Win32 i386                                                    }
{   FreePascal 2 Linux i386                                                    }
{                                                                              }
{******************************************************************************}

{$INCLUDE cDefines.inc}
{$IFDEF FREEPASCAL}{$IFDEF DEBUG}
  {$WARNINGS OFF}{$HINTS OFF}
{$ENDIF}{$ENDIF}
unit cStreams;

interface

uses
  { System }
  SysUtils,
  {$IFDEF MSWIN}
  Windows,
  {$ENDIF}
  {$IFDEF UNIX}
  BaseUnix,
  {$ENDIF}

  { Fundamentals }
  cUtils;



{                                                                              }
{ AReader                                                                      }
{   Abstract base class for a Reader.                                          }
{                                                                              }
{   Inherited classes must implement the abstract methods from AReader.        }
{                                                                              }
{   Read returns the actual number of bytes copied to the buffer.              }
{   Size returns -1 for reader's with unknown data size.                       }
{                                                                              }
type
  AReader = class
  protected
    function  GetPosition: Int64; virtual; abstract;
    procedure SetPosition(const Position: Int64); virtual; abstract;
    function  GetSize: Int64; virtual; abstract;

  public
    function  Read(var Buffer; const Size: Integer): Integer; virtual; abstract;

    property  Position: Int64 read GetPosition write SetPosition;
    property  Size: Int64 read GetSize;
    function  EOF: Boolean; virtual; abstract;
  end;
  EReader = class(Exception);



{                                                                              }
{ AReaderEx                                                                    }
{   Base class for Reader implementations. AReaderEx extends AReader with      }
{   commonly used functions.                                                   }
{                                                                              }
{   All methods in AReaderEx is implemented using calls to the abstract        }
{   methods in AReader. Reader implementations can override the virtual        }
{   methods in AReaderEx with more efficient versions.                         }
{                                                                              }
{   Match functions return True when a match is found. Match leaves the        }
{   reader's position unchanged except if a match is made and SkipOnMatch      }
{   is True.                                                                   }
{                                                                              }
{   Locate returns the offset (relative to the current position) of the        }
{   first match in the stream. Locate preserves the reader's position.         }
{   Locate returns -1 if a match was not made.                                 }
{                                                                              }
type
  TReaderEOLType  = (
      eolEOF,         // EOF          Files, Internet
      eolEOFAtEOF,    // #26 at EOF   Files
      eolCR,          // #13          Unix, Internet
      eolLF,          // #10          Internet
      eolCRLF,        // #13#10       MS-DOS, Windows, Internet
      eolLFCR);       // #10#13       Mac
  TReaderEOLTypes = Set of TReaderEOLType;

const
  DefaultReaderEOLTypes = [eolEOF, eolEOFAtEOF, eolCR, eolLF, eolCRLF, eolLFCR];

type
  AReaderEx = class(AReader)
  private
    function  SkipLineTerminator(const EOLTypes: TReaderEOLTypes): Integer;

  public
    procedure RaiseReadError(const Msg: String = '');
    procedure RaiseSeekError;
    
    procedure ReadBuffer(var Buffer; const Size: Integer);
    function  ReadStrA(const Size: Integer): AnsiString; virtual;
    function  ReadStrW(const Length: Integer): WideString; virtual;
    function  GetToEOF: AnsiString; virtual;
    function  GetAsStringA: AnsiString; virtual;

    function  ReadByte: Byte; virtual;
    function  ReadWord: Word;
    function  ReadLongWord: LongWord;
    function  ReadLongInt: LongInt;
    function  ReadInt64: Int64;
    function  ReadSingle: Single;
    function  ReadDouble: Double;
    function  ReadExtended: Extended;
    function  ReadPackedAnsiString: AnsiString;
    function  ReadPackedWideString: WideString;
    function  ReadPackedString: String; {$IFDEF UseInline}inline;{$ENDIF}
    function  ReadPackedAnsiStringArray: AnsiStringArray;
    function  ReadPackedWideStringArray: WideStringArray;

    function  Peek(var Buffer; const Size: Integer): Integer; virtual;
    procedure PeekBuffer(var Buffer; const Size: Integer);
    function  PeekStr(const Size: Integer): AnsiString; virtual;

    function  PeekByte: Byte; virtual;
    function  PeekWord: Word;
    function  PeekLongWord: LongWord;
    function  PeekLongInt: LongInt;
    function  PeekInt64: Int64;

    function  Match(const Buffer; const Size: Integer;
              const CaseSensitive: Boolean = True): Integer; virtual;
    function  MatchBuffer(const Buffer; const Size: Integer;
              const CaseSensitive: Boolean = True): Boolean;
    function  MatchStr(const S: AnsiString;
              const CaseSensitive: Boolean = True): Boolean; virtual;

    function  MatchChar(const Ch: AnsiChar;
              const MatchNonMatch: Boolean = False;
              const SkipOnMatch: Boolean = False): Boolean; overload;
    function  MatchChar(const C: CharSet; var Ch: AnsiChar;
              const MatchNonMatch: Boolean = False;
              const SkipOnMatch: Boolean = False): Boolean; overload;

    procedure Skip(const Count: Integer = 1); virtual;
    procedure SkipByte;

    function  SkipAll(const Ch: AnsiChar; const MatchNonMatch: Boolean = False;
              const MaxCount: Integer = -1): Integer; overload;
    function  SkipAll(const C: CharSet; const MatchNonMatch: Boolean = False;
              const MaxCount: Integer = -1): Integer; overload;

    function  Locate(const Ch: AnsiChar;
              const LocateNonMatch: Boolean = False;
              const MaxOffset: Integer = -1): Integer; overload; virtual;
    function  Locate(const C: CharSet;
              const LocateNonMatch: Boolean = False;
              const MaxOffset: Integer = -1): Integer; overload; virtual;

    function  LocateBuffer(const Buffer; const Size: Integer;
              const MaxOffset: Integer = -1;
              const CaseSensitive: Boolean = True): Integer; virtual;
    function  LocateStr(const S: AnsiString;
              const MaxOffset: Integer = -1;
              const CaseSensitive: Boolean = True): Integer; virtual;

    function  ExtractAll(const C: CharSet;
              const ExtractNonMatch: Boolean = False;
              const MaxCount: Integer = -1): AnsiString;
    function  ExtractToStr(const S: AnsiString; const MaxLength: Integer = -1;
              const CaseSensitive: Boolean = True): AnsiString;
    function  ExtractToChar(const C: AnsiChar; const MaxLength: Integer = -1): AnsiString; overload;
    function  ExtractToChar(const C: CharSet; const MaxLength: Integer = -1): AnsiString; overload;
    function  ExtractQuoted(const QuoteChars: CharSet): AnsiString;

    function  ExtractLine(const MaxLineLength: Integer = -1;
              const EOLTypes: TReaderEOLTypes = DefaultReaderEOLTypes): AnsiString;
    function  SkipLine(const MaxLineLength: Integer = -1;
              const EOLTypes: TReaderEOLTypes = DefaultReaderEOLTypes): Boolean;
  end;



{                                                                              }
{ TMemoryReader                                                                }
{   Reader implementation for a memory block.                                  }
{                                                                              }
{   If the reader is initialized with Size = -1, the content is unsized and    }
{   EOF will always return False.                                              }
{                                                                              }
type
  TMemoryReader = class(AReaderEx)
  protected
    FData : Pointer;
    FSize : Integer;
    FPos  : Integer;

    function  GetPosition: Int64; override;
    procedure SetPosition(const Position: Int64); override;
    function  GetSize: Int64; override;

  public
    constructor Create(const Data: Pointer; const Size: Integer);

    property  Data: Pointer read FData;
    property  Size: Integer read FSize;
    procedure SetData(const Data: Pointer; const Size: Integer);

    function  Read(var Buffer; const Size: Integer): Integer; override;
    function  EOF: Boolean; override;

    function  ReadByte: Byte; override;
    function  ReadLongInt: LongInt;
    function  ReadInt64: Int64;
    function  PeekByte: Byte; override;
    function  Match(const Buffer; const Size: Integer;
              const CaseSensitive: Boolean = True): Integer; override;
    procedure Skip(const Count: Integer = 1); override;
  end;
  EMemoryReader = class(EReader);



{                                                                              }
{ TStringReader                                                                }
{   Memory reader implementation for a reference counted string (long string). }
{                                                                              }
type
  TStringReader = class(TMemoryReader)
  protected
    FDataString : AnsiString;

    procedure SetDataString(const S: AnsiString);

  public
    constructor Create(const Data: AnsiString);

    property  DataString: AnsiString read FDataString write SetDataString;
    function  GetAsStringA: AnsiString; override;
  end;



{                                                                              }
{ TFileReader                                                                  }
{   Reader implementation for a file.                                          }
{                                                                              }
type
  TFileReaderAccessHint = (
      frahNone,
      frahRandomAccess,
      frahSequentialAccess);
  TFileReader = class(AReaderEx)
  protected
    FHandle      : Integer;
    FHandleOwner : Boolean;

    function  GetPosition: Int64; override;
    procedure SetPosition(const Position: Int64); override;
    function  GetSize: Int64; override;

  public
    constructor Create(const FileName: String;
                const AccessHint: TFileReaderAccessHint = frahNone); overload;
    constructor Create(const FileHandle: Integer; const HandleOwner: Boolean = False); overload;
    destructor Destroy; override;

    property  Handle: Integer read FHandle;
    property  HandleOwner: Boolean read FHandleOwner;

    function  Read(var Buffer; const Size: Integer): Integer; override;
    function  EOF: Boolean; override;
  end;
  EFileReader = class(EReader);

function  ReadFileToStrA(const FileName: String): AnsiString;



{                                                                              }
{ AReaderProxy                                                                 }
{   Base class for Reader Proxies.                                             }
{                                                                              }
type
  AReaderProxy = class(AReaderEx)
  protected
    FReader      : AReaderEx;
    FReaderOwner : Boolean;

    function  GetPosition: Int64; override;
    procedure SetPosition(const Position: Int64); override;
    function  GetSize: Int64; override;

  public
    constructor Create(const Reader: AReaderEx; const ReaderOwner: Boolean = True);
    destructor Destroy; override;

    function  Read(var Buffer; const Size: Integer): Integer; override;
    function  EOF: Boolean; override;

    property  Reader: AReaderEx read FReader;
    property  ReaderOwner: Boolean read FReaderOwner write FReaderOwner;
  end;



{                                                                              }
{ TReaderProxy                                                                 }
{   Reader Proxy implementation.                                               }
{                                                                              }
{   Proxies a block of data from Reader from the Reader's current position.    }
{   Size specifies the size of the data to be proxied, or if Size = -1,        }
{   all data up to EOF is proxied.                                             }
{                                                                              }
type
  TReaderProxy = class(AReaderProxy)
  protected
    FOffset : Int64;
    FSize   : Int64;

    function  GetPosition: Int64; override;
    procedure SetPosition(const Position: Int64); override;
    function  GetSize: Int64; override;

  public
    constructor Create(const Reader: AReaderEx; const ReaderOwner: Boolean = True;
                const Size: Int64 = -1);

    function  Read(var Buffer; const Size: Integer): Integer; override;
    function  EOF: Boolean; override;
  end;



{                                                                              }
{ TBufferedReader                                                              }
{   ReaderProxy implementation for buffered reading.                           }
{                                                                              }
type
  TBufferedReader = class(AReaderProxy)
  protected
    FBufferSize  : Integer;
    FPos         : Int64;
    FBuffer      : Pointer;
    FBufUsed     : Integer;
    FBufPos      : Integer;

    function  GetPosition: Int64; override;
    procedure SetPosition(const Position: Int64); override;
    function  GetSize: Int64; override;

    function  FillBuf: Boolean;
    procedure BufferByte;
    function  PosBuf(const C: CharSet; const LocateNonMatch: Boolean;
              const MaxOffset: Integer): Integer;

  public
    constructor Create(const Reader: AReaderEx; const BufferSize: Integer = 128;
                const ReaderOwner: Boolean = True);
    destructor Destroy; override;

    function  Read(var Buffer; const Size: Integer): Integer; override;
    function  EOF: Boolean; override;

    function  ReadByte: Byte; override;
    function  PeekByte: Byte; override;
    procedure Skip(const Count: Integer = 1); override;

    function  Locate(const C: CharSet; const LocateNonMatch: Boolean = False;
              const MaxOffset: Integer = -1): Integer; override;

    property  BufferSize: Integer read FBufferSize;
    procedure InvalidateBuffer;
  end;



{                                                                              }
{ TSplitBufferedReader                                                         }
{   ReaderProxy implementation for split buffered reading.                     }
{                                                                              }
{   One buffer is used for read-ahead buffering, the other for seek-back       }
{   buffering.                                                                 }
{                                                                              }
type
  TSplitBufferedReader = class(AReaderProxy)
  protected
    FBufferSize  : Integer;
    FPos         : Int64;
    FBuffer      : Array[0..1] of Pointer;
    FBufUsed     : Array[0..1] of Integer;
    FBufNr       : Integer;
    FBufPos      : Integer;

    function  GetPosition: Int64; override;
    procedure SetPosition(const Position: Int64); override;
    function  GetSize: Int64; override;

    function  BufferStart: Integer;
    function  BufferRemaining: Integer;
    function  MoveBuf(var Dest: PByte; var Remaining: Integer): Boolean;
    function  FillBuf(var Dest: PByte; var Remaining: Integer): Boolean;

  public
    constructor Create(const Reader: AReaderEx; const BufferSize: Integer = 128;
                const ReaderOwner: Boolean = True);
    destructor Destroy; override;

    property  BufferSize: Integer read FBufferSize;

    function  Read(var Buffer; const Size: Integer): Integer; override;
    function  EOF: Boolean; override;

    procedure InvalidateBuffer;
  end;



{                                                                              }
{ TBufferedFileReader                                                          }
{   TBufferedReader instance using a TFileReader.                              }
{                                                                              }
type
  TBufferedFileReader = class(TBufferedReader)
  public
    constructor Create(const FileName: String; const BufferSize: Integer = 512); overload;
    constructor Create(const FileHandle: Integer; const HandleOwner: Boolean = False;
                const BufferSize: Integer = 512); overload;
  end;



{                                                                              }
{ TSplitBufferedFileReader                                                     }
{   TSplitBufferedReader instance using a TFileReader.                         }
{                                                                              }
type
  TSplitBufferedFileReader = class(TSplitBufferedReader)
  public
    constructor Create(const FileName: String; const BufferSize: Integer = 512);
  end;



{                                                                              }
{ AWriter                                                                      }
{   Writer abstract base class.                                                }
{                                                                              }
type
  AWriter = class
  protected
    function  GetPosition: Int64; virtual; abstract;
    procedure SetPosition(const Position: Int64); virtual; abstract;
    function  GetSize: Int64; virtual; abstract;
    procedure SetSize(const Size: Int64); virtual; abstract;

  public
    function  Write(const Buffer; const Size: Integer): Integer; virtual; abstract;

    property  Position: Int64 read GetPosition write SetPosition;
    property  Size: Int64 read GetSize write SetSize;
  end;
  EWriter = class(Exception);



{                                                                              }
{ AWriterEx                                                                    }
{   Base class for Writer implementations. AWriteEx extends AWriter with       }
{   commonly used functions.                                                   }
{                                                                              }
{   All methods in AWriterEx are implemented using calls to the abstract       }
{   methods in AWriter. Writer implementations can override the virtual        }
{   methods in AWriterEx with more efficient versions.                         }
{                                                                              }
type
  TWriterNewLineType = (nlCR, nlLF, nlCRLF, nlLFCR);
  AWriterEx = class(AWriter)
  protected
    function  GetPosition: Int64; override;
    procedure SetPosition(const Position: Int64); override;
    function  GetSize: Int64; override;
    procedure SetSize(const Size: Int64); override;

    procedure SetAsString(const S: AnsiString); virtual;
    procedure SetAsWideString(const S: WideString); virtual;

  public
    procedure RaiseWriteError;

    procedure Append;
    procedure Truncate; virtual;
    procedure Clear; virtual;

    property  AsString: AnsiString write SetAsString;
    property  AsWideString: WideString write SetAsWideString;

    procedure WriteBuffer(const Buffer; const Size: Integer);
    procedure WriteStrA(const Buffer: AnsiString); virtual;
    procedure WriteStrW(const Buffer: WideString); virtual;

    procedure WriteByte(const V: Byte); virtual;
    procedure WriteWord(const V: Word); virtual;
    procedure WriteLongWord(const V: LongWord);
    procedure WriteLongInt(const V: LongInt);
    procedure WriteInt64(const V: Int64);
    procedure WriteSingle(const V: Single);
    procedure WriteDouble(const V: Double);
    procedure WriteExtended(const V: Extended);
    procedure WritePackedAnsiString(const V: AnsiString);
    procedure WritePackedWideString(const V: WideString);
    procedure WritePackedString(const V: String); {$IFDEF UseInline}inline;{$ENDIF}
    procedure WritePackedAnsiStringArray(const V: Array of AnsiString);
    procedure WritePackedWideStringArray(const V: Array of WideString);

    procedure WriteBufLine(const Buffer; const Size: Integer;
              const NewLineType: TWriterNewLineType = nlCRLF);
    procedure WriteLine(const S: AnsiString;
              const NewLineType: TWriterNewLineType = nlCRLF);
  end;



{                                                                              }
{ TFileWriter                                                                  }
{   Writer implementation for a file.                                          }
{                                                                              }
type
  TFileWriterOpenMode = (fwomOpen,              // Open existing
                         fwomTruncate,          // Open existing and truncate
                         fwomCreate,            // Always create
                         fwomCreateIfNotExist); // Create if not exist else open existing
  TFileWriterAccessHint = (
      fwahNone,
      fwahRandomAccess,
      fwahSequentialAccess);
  TFileWriterOptions = Set of (
      fwoWriteThrough);
  TFileWriter = class(AWriterEx)
  protected
    FFileName    : String;
    FHandle      : Integer;
    FHandleOwner : Boolean;
    FFileCreated : Boolean;

    function  GetPosition: Int64; override;
    procedure SetPosition(const Position: Int64); override;
    function  GetSize: Int64; override;
    procedure SetSize(const Size: Int64); override;

  public
    constructor Create(const FileName: String;
                const OpenMode: TFileWriterOpenMode = fwomCreateIfNotExist;
                const Options: TFileWriterOptions = [];
                const AccessHint: TFileWriterAccessHint = fwahNone); overload;
    constructor Create(const FileHandle: Integer; const HandleOwner: Boolean); overload;
    destructor Destroy; override;

    property  Handle: Integer read FHandle;
    property  HandleOwner: Boolean read FHandleOwner;
    property  FileCreated: Boolean read FFileCreated;

    function  Write(const Buffer; const Size: Integer): Integer; override;

    procedure Flush;
    procedure DeleteFile;
  end;
  EFileWriter = class(EWriter);

procedure WriteStrToFile(const FileName: String; const S: AnsiString;
          const OpenMode: TFileWriterOpenMode = fwomCreate);
procedure AppendStrToFile(const FileName: String; const S: AnsiString);

procedure WriteWideStrToFile(const FileName: String; const S: WideString;
          const OpenMode: TFileWriterOpenMode = fwomCreate);
procedure AppendWideStrToFile(const FileName: String; const S: WideString);



{                                                                              }
{ TStringWriter                                                                }
{   Writer implementation for a dynamic string.                                }
{                                                                              }
type
  TStringWriter = class(AWriterEx)
  protected
    FData : AnsiString;
    FSize : Integer;
    FPos  : Integer;

    function  GetPosition: Int64; override;
    procedure SetPosition(const Position: Int64); override;
    function  GetSize: Int64; override;
    procedure SetSize(const Size: Int64); reintroduce; overload; override;
    procedure SetSize(const Size: Integer); reintroduce; overload;
    function  GetAsString: AnsiString;
    procedure SetAsString(const S: AnsiString); override;

  public
    property  DataString: AnsiString read FData;
    property  DataSize: Integer read FSize;
    property  AsString: AnsiString read GetAsString write SetAsString;

    function  Write(const Buffer; const Size: Integer): Integer; override;

    procedure WriteStrA(const Buffer: AnsiString); override;
    procedure WriteByte(const V: Byte); override;
  end;



{                                                                              }
{ TWideStringWriter                                                            }
{   Writer implementation for a wide string.                                   }
{                                                                              }
type
  TWideStringWriter = class(AWriterEx)
  protected
    FData : WideString;
    FSize : Integer;
    FPos  : Integer;

    function  GetPosition: Int64; override;
    procedure SetPosition(const Position: Int64); override;
    function  GetSize: Int64; override;
    procedure SetSize(const Size: Int64); reintroduce; overload; override;
    procedure SetSize(const Size: Integer); reintroduce; overload;
    function  GetAsWideString: WideString;
    procedure SetAsWideString(const S: WideString); override;

  public
    property  DataString: WideString read FData;
    property  DataSize: Integer read FSize;
    property  AsWideString: WideString read GetAsWideString write SetAsWideString;

    function  Write(const Buffer; const Size: Integer): Integer; override;
    procedure WriteStrA(const Buffer: AnsiString); override;
    procedure WriteStrW(const Buffer: WideString); override;
    procedure WriteByte(const V: Byte); override;
    procedure WriteWord(const V: Word); override;
  end;



{                                                                              }
{ TOutputWriter                                                                }
{   Writer implementation for standard system output.                          }
{                                                                              }
type
  TOutputWriter = class(AWriterEx)
  public
    function  Write(const Buffer; const Size: Integer): Integer; override;
  end;



{                                                                              }
{ AStream                                                                      }
{   Abstract base class for streams.                                           }
{                                                                              }
type
  AStream = class;
  AStreamCopyProgressEvent = procedure (const Source, Destination: AStream;
      const BytesCopied: Int64; var Abort: Boolean) of object;
  AStream = class
  protected
    FOnCopyProgress : AStreamCopyProgressEvent;

    function  GetPosition: Int64; virtual; abstract;
    procedure SetPosition(const Position: Int64); virtual; abstract;
    function  GetSize: Int64; virtual; abstract;
    procedure SetSize(const Size: Int64); virtual; abstract;
    function  GetReader: AReaderEx; virtual; abstract;
    function  GetWriter: AWriterEx; virtual; abstract;

    procedure TriggerCopyProgressEvent(const Source, Destination: AStream;
              const BytesCopied: Int64; var Abort: Boolean); virtual;

  public
    function  Read(var Buffer; const Size: Integer): Integer; virtual; abstract;
    function  Write(const Buffer; const Size: Integer): Integer; virtual; abstract;

    property  Position: Int64 read GetPosition write SetPosition;
    property  Size: Int64 read GetSize write SetSize;
    function  EOF: Boolean; virtual;
    procedure Truncate; virtual;

    property  Reader: AReaderEx read GetReader;
    property  Writer: AWriterEx read GetWriter;

    procedure ReadBuffer(var Buffer; const Size: Integer);
    function  ReadByte: Byte;
    function  ReadStrA(const Size: Integer): AnsiString;
    procedure WriteBuffer(const Buffer; const Size: Integer);
    procedure WriteStrA(const S: AnsiString);

    procedure Assign(const Source: TObject); virtual;
    function  WriteTo(const Destination: AStream; const BlockSize: Integer = 0;
              const Count: Int64 = -1): Int64;

    property  OnCopyProgress: AStreamCopyProgressEvent read FOnCopyProgress write FOnCopyProgress;
  end;
  EStream = class(Exception);
  EStreamOperationAborted = class(EStream)
    constructor Create;
  end;



{                                                                              }
{ Stream proxies                                                               }
{                                                                              }
type
  {                                                                            }
  { TStreamReaderProxy                                                         }
  {                                                                            }
  TStreamReaderProxy = class(AReaderEx)
  protected
    FStream : AStream;

    function  GetPosition: Int64; override;
    procedure SetPosition(const Position: Int64); override;
    function  GetSize: Int64; override;

  public
    constructor Create(const Stream: AStream);
    property  Stream: AStream read FStream;

    function  Read(var Buffer; const Size: Integer): Integer; override;
    function  EOF: Boolean; override;
  end;

  {                                                                            }
  { TStreamWriterProxy                                                         }
  {                                                                            }
  TStreamWriterProxy = class (AWriterEx)
  protected
    FStream : AStream;

    function  GetPosition: Int64; override;
    procedure SetPosition(const Position: Int64); override;
    function  GetSize: Int64; override;
    procedure SetSize(const Size: Int64); override;

  public
    constructor Create(const Stream: AStream);
    property  Stream: AStream read FStream;

    function  Write(const Buffer; const Size: Integer): Integer; override;
  end;



{                                                                              }
{ Stream functions                                                             }
{                                                                              }
type
  TCopyProgressProcedure = procedure (const Source, Destination: AStream;
      const BytesCopied: Int64; var Abort: Boolean);
  TCopyDataEvent = procedure (const Offset: Int64; const Data: Pointer;
      const DataSize: Integer) of object;

function  CopyStream(const Source, Destination: AStream;
          const SourceOffset: Int64 = 0; const DestinationOffset: Int64 = 0;
          const BlockSize: Integer = 0; const Count: Int64 = -1;
          const ProgressCallback: TCopyProgressProcedure = nil;
          const CopyFromBack: Boolean = False): Int64; overload;

function  CopyStream(const Source: AReaderEx; const Destination: AWriterEx;
          const BlockSize: Integer = 0;
          const CopyDataEvent: TCopyDataEvent = nil): Int64; overload;

procedure DeleteStreamRange(const Stream: AStream; const Position, Count: Int64;
          const ProgressCallback: TCopyProgressProcedure = nil);

procedure InsertStreamRange(const Stream: AStream; const Position, Count: Int64;
          const ProgressCallback: TCopyProgressProcedure = nil);



{                                                                              }
{ TReaderWriter                                                                }
{   Composition of a Reader and a Writer as a Stream.                          }
{                                                                              }
type
  TReaderWriter = class(AStream)
  protected
    FReader      : AReaderEx;
    FWriter      : AWriterEx;
    FReaderOwner : Boolean;
    FWriterOwner : Boolean;

    procedure RaiseNoReaderError;
    procedure RaiseNoWriterError;

    function  GetPosition: Int64; override;
    procedure SetPosition(const Position: Int64); override;
    function  GetSize: Int64; override;
    procedure SetSize(const Size: Int64); override;
    function  GetReader: AReaderEx; override;
    function  GetWriter: AWriterEx; override;

  public
    constructor Create(const Reader: AReaderEx; const Writer: AWriterEx;
                const ReaderOwner: Boolean = True; const WriterOwner: Boolean = True);
    destructor Destroy; override;

    property  Reader: AReaderEx read FReader;
    property  Writer: AWriterEx read FWriter;
    property  ReaderOwner: Boolean read FReaderOwner write FReaderOwner;
    property  WriterOwner: Boolean read FWriterOwner write FWriterOwner;

    function  Read(var Buffer; const Size: Integer): Integer; override;
    function  Write(const Buffer; const Size: Integer): Integer; override;
    function  EOF: Boolean; override;
    procedure Truncate; override;
  end;
  EReaderWriter = class (Exception);



{                                                                              }
{ TFileStream                                                                  }
{   Stream implementation for a file.                                          }
{                                                                              }
type
  TFileStreamOpenMode = (
      fsomRead,
      fsomReadWrite,
      fsomCreate,
      fsomCreateIfNotExist,
      fsomCreateOnWrite);
  TFileStreamAccessHint = (
      fsahNone,
      fsahRandomAccess,
      fsahSequentialAccess);
  TFileStreamOptions = Set of (
      fsoWriteThrough);
  TFileStream = class(TReaderWriter)
  protected
    FFileName   : String;
    FOpenMode   : TFileStreamOpenMode;
    FOptions    : TFileStreamOptions;
    FAccessHint : TFileStreamAccessHint;

    procedure SetPosition(const Position: Int64); override;
    procedure SetSize(const Size: Int64); override;
    function  GetReader: AReaderEx; override;
    function  GetWriter: AWriterEx; override;

    function  GetFileHandle: Integer;
    function  GetFileCreated: Boolean;
    procedure EnsureCreateOnWrite;

  public
    constructor Create(const FileName: String;
                const OpenMode: TFileStreamOpenMode;
                const Options: TFileStreamOptions = [];
                const AccessHint: TFileStreamAccessHint = fsahNone); overload;
    constructor Create(const FileHandle: Integer; const HandleOwner: Boolean); overload;

    property  FileName: String read FFileName;
    property  FileHandle: Integer read GetFileHandle;
    property  FileCreated: Boolean read GetFileCreated;
    procedure DeleteFile;

    function  Write(const Buffer; const Size: Integer): Integer; override;
  end;
  EFileStream = class(EStream);



{                                                                              }
{ Test cases                                                                   }
{                                                                              }
procedure SelfTest;



implementation

{$IFDEF UNIX}
{$IFDEF FREEPASCAL}
uses
  Unix;
{$ELSE}
uses
  Libc;
{$ENDIF}
{$ENDIF}



resourcestring
  SReadError          = 'Read error';
  SWriteError         = 'Write error';
  SSeekError          = 'Seek error';
  SNotSupported       = 'Not supported';
  SFileError          = 'File error: %s';
  SFileOpenError      = 'File open error: %s';
  SFileSeekError      = 'File seek error: %s';
  SFileTruncateError  = 'File truncate error: %s';
  SFileResizeError    = 'File resize error: %s';
  SFileWriteError     = 'File write error: %s';
  SStreamReadError    = 'Stream read error';
  SStreamCopyError    = 'Stream copy error';
  SNoReader           = 'No reader';
  SNoWriter           = 'No writer';
  SModeNotImplemented = 'Mode not implemented';
  SInvalidDataFormat  = 'Invalid data format';
  SInvalidFileName    = 'Invalid file name';
  SInvalidPosition    = 'Invalid position';
  SInvalidSize        = 'Invalid size';
  SInvalidParameter   = 'Invalid parameter';



{                                                                              }
{ System helper functions                                                      }
{                                                                              }
resourcestring
  SSystemError = 'System error #%s';

{$IFDEF MSWIN}
{$IFDEF StringIsUnicode}
function GetLastOSErrorMessage: String;
const MAX_ERRORMESSAGE_LENGTH = 256;
var Err: LongWord;
    Buf: array[0..MAX_ERRORMESSAGE_LENGTH - 1] of Word;
    Len: LongWord;
begin
  Err := Windows.GetLastError;
  FillChar(Buf, Sizeof(Buf), #0);
  Len := Windows.FormatMessageW(FORMAT_MESSAGE_FROM_SYSTEM, nil, Err, 0,
      @Buf, MAX_ERRORMESSAGE_LENGTH, nil);
  if Len = 0 then
    Result := Format(SSystemError, [IntToStr(Err)])
  else
    Result := StrPas(PWideChar(@Buf));
end;
{$ELSE}
function GetLastOSErrorMessage: String;
const MAX_ERRORMESSAGE_LENGTH = 256;
var Err: LongWord;
    Buf: array[0..MAX_ERRORMESSAGE_LENGTH - 1] of Byte;
    Len: LongWord;
begin
  Err := Windows.GetLastError;
  FillChar(Buf, Sizeof(Buf), #0);
  Len := Windows.FormatMessageA(FORMAT_MESSAGE_FROM_SYSTEM, nil, Err, 0,
      @Buf, MAX_ERRORMESSAGE_LENGTH, nil);
  if Len = 0 then
    Result := Format(SSystemError, [IntToStr(Err)])
  else
    Result := StrPas(PAnsiChar(@Buf));
end;
{$ENDIF}
{$ELSE}
{$IFDEF UNIX}
{$IFDEF FREEPASCAL}
function GetLastOSErrorMessage: String;
begin
  Result := SysErrorMessage(GetLastOSError);
end;
{$ELSE}
function GetLastOSErrorMessage: String;
var Err: LongWord;
    Buf: Array[0..1023] of AnsiChar;
begin
  Err := BaseUnix.fpgeterrno;
  FillChar(Buf, Sizeof(Buf), #0);
  libc.strerror_r(Err, @Buf, SizeOf(Buf));
  if Buf[0] = #0 then
    Result := Format(SSystemError, [IntToStr(Err)])
  else
    Result := StrPas(@Buf);
end;
{$ENDIF}{$ENDIF}{$ENDIF}



{                                                                              }
{ AReaderEx                                                                    }
{                                                                              }
const
  DefaultBufSize = 2048;

procedure AReaderEx.RaiseReadError(const Msg: String);
var S : String;
begin
  if Msg = '' then
    S := SReadError
  else
    S := Msg;
  raise EReader.Create(S);
end;

procedure AReaderEx.RaiseSeekError;
begin
  raise EReader.Create(SSeekError);
end;

procedure AReaderEx.ReadBuffer(var Buffer; const Size: Integer);
begin
  if Size <= 0 then
    exit;
  if Read(Buffer, Size) <> Size then
    RaiseReadError;
end;

function AReaderEx.ReadStrA(const Size: Integer): AnsiString;
var L : Integer;
begin
  if Size <= 0 then
    begin
      Result := '';
      exit;
    end;
  SetLength(Result, Size);
  L := Read(Pointer(Result)^, Size);
  if L <= 0 then
    begin
      Result := '';
      exit;
    end;
  if L < Size then
    SetLength(Result, L);
end;

function AReaderEx.ReadStrW(const Length: Integer): WideString;
var L : Integer;
begin
  if Length <= 0 then
    begin
      Result := '';
      exit;
    end;
  SetLength(Result, Length);
  L := Read(Pointer(Result)^, Length * Sizeof(WideChar)) div Sizeof(WideChar);
  if L <= 0 then
    begin
      Result := '';
      exit;
    end;
  if L < Length then
    SetLength(Result, L);
end;

function AReaderEx.GetToEOF: AnsiString;
var S    : Int64;
    B    : Array[0..DefaultBufSize - 1] of Byte;
    I, J : Integer;
    L, N : Integer;
    R    : Boolean;
    Q    : PAnsiChar;
begin
  S := GetSize;
  if S < 0 then // size unknown
    begin
      Q := nil;
      Result := '';
      L := 0; // actual size
      N := 0; // allocated size
      R := EOF;
      While not R do
        begin
          I := Read(B[0], DefaultBufSize);
          R := EOF;
          if I > 0 then
            begin
              J := L + I;
              if J > N then
                begin
                  // allocate the exact buffer size for the first two reads
                  // allocate double the buffer size from the third read
                  if J <= DefaultBufSize * 2 then
                    N := J
                  else
                    N := J * 2;
                  SetLength(Result, N);
                  Q := Pointer(Result);
                  Inc(Q, L);
                end;
              Move(B[0], Q^, I);
              Inc(Q, I);
              Inc(L, I);
            end
          else
            if not R then
              RaiseReadError;
        end;
      if L < N then
        // set exact result size
        SetLength(Result, L);
    end
  else
    // size known
    Result := ReadStrA(S - GetPosition);
end;

function AReaderEx.GetAsStringA: AnsiString;
begin
  SetPosition(0);
  Result := GetToEOF;
end;

function AReaderEx.ReadByte: Byte;
begin
  ReadBuffer(Result, Sizeof(Byte));
end;

function AReaderEx.ReadWord: Word;
begin
  ReadBuffer(Result, Sizeof(Word));
end;

function AReaderEx.ReadLongWord: LongWord;
begin
  ReadBuffer(Result, Sizeof(LongWord));
end;

function AReaderEx.ReadLongInt: LongInt;
begin
  ReadBuffer(Result, Sizeof(LongInt));
end;

function AReaderEx.ReadInt64: Int64;
begin
  ReadBuffer(Result, Sizeof(Int64));
end;

function AReaderEx.ReadSingle: Single;
begin
  ReadBuffer(Result, Sizeof(Single));
end;

function AReaderEx.ReadDouble: Double;
begin
  ReadBuffer(Result, Sizeof(Double));
end;

function AReaderEx.ReadExtended: Extended;
begin
  ReadBuffer(Result, Sizeof(Extended));
end;

function AReaderEx.ReadPackedAnsiString: AnsiString;
var L : Integer;
begin
  L := ReadLongInt;
  if L < 0 then
    raise EReader.Create(SInvalidDataFormat);
  Result := ReadStrA(L);
end;

function AReaderEx.ReadPackedWideString: WideString;
var L : Integer;
begin
  L := ReadLongInt;
  if L < 0 then
    raise EReader.Create(SInvalidDataFormat);
  Result := ReadStrW(L);
end;

function AReaderEx.ReadPackedString: String;
begin
  {$IFDEF CharIsWide}
  Result := ReadPackedWideString;
  {$ELSE}
  Result := ReadPackedAnsiString;
  {$ENDIF}
end;

function AReaderEx.ReadPackedAnsiStringArray: AnsiStringArray;
var I, L : Integer;
begin
  L := ReadLongInt;
  if L < 0 then
    raise EReader.Create(SInvalidDataFormat);
  SetLength(Result, L);
  For I := 0 to L - 1 do
    Result[I] := ReadPackedAnsiString;
end;

function AReaderEx.ReadPackedWideStringArray: WideStringArray;
var I, L : Integer;
begin
  L := ReadLongInt;
  if L < 0 then
    raise EReader.Create(SInvalidDataFormat);
  SetLength(Result, L);
  For I := 0 to L - 1 do
    Result[I] := ReadPackedWideString;
end;

function AReaderEx.Peek(var Buffer; const Size: Integer): Integer;
var P : Int64;
begin
  P := GetPosition;
  Result := Read(Buffer, Size);
  if Result > 0 then
    SetPosition(P);
end;

procedure AReaderEx.PeekBuffer(var Buffer; const Size: Integer);
begin
  if Size <= 0 then
    exit;
  if Peek(Buffer, Size) <> Size then
    RaiseReadError;
end;

function AReaderEx.PeekStr(const Size: Integer): AnsiString;
var L : Integer;
begin
  if Size <= 0 then
    begin
      Result := '';
      exit;
    end;
  SetLength(Result, Size);
  L := Peek(Pointer(Result)^, Size);
  if L <= 0 then
    begin
      Result := '';
      exit;
    end;
  if L < Size then
    SetLength(Result, L);
end;

function AReaderEx.PeekByte: Byte;
begin
  PeekBuffer(Result, Sizeof(Byte));
end;

function AReaderEx.PeekWord: Word;
begin
  PeekBuffer(Result, Sizeof(Word));
end;

function AReaderEx.PeekLongWord: LongWord;
begin
  PeekBuffer(Result, Sizeof(LongWord));
end;

function AReaderEx.PeekLongInt: LongInt;
begin
  PeekBuffer(Result, Sizeof(LongInt));
end;

function AReaderEx.PeekInt64: Int64;
begin
  PeekBuffer(Result, Sizeof(Int64));
end;

{ Returns the number of characters read and matched, or -1 if no match }
function AReaderEx.Match(const Buffer; const Size: Integer;
    const CaseSensitive: Boolean): Integer;
var B : Pointer;
    F : Array[0..DefaultBufSize - 1] of Byte;
    M : Boolean;
    R : Boolean;
begin
  if Size <= 0 then
    begin
      Result := -1;
      exit;
    end;
  M := Size > DefaultBufSize;
  if M then
    GetMem(B, Size)
  else
    B := @F[0];
  try
    Result := Peek(B^, Size);
    if Result <= 0 then
      exit;
    if CaseSensitive then
      R := CompareMem(Buffer, B^, Result)
    else
      R := CompareMemNoCase(Buffer, B^, Result) = crEqual;
    if not R then
      Result := -1;
  finally
    if M then
      FreeMem(B);
  end;
end;

function AReaderEx.MatchBuffer(const Buffer; const Size: Integer;
    const CaseSensitive: Boolean): Boolean;
var I : Integer;
begin
  I := Match(Buffer, Size, CaseSensitive);
  if I < 0 then
    begin
      Result := False;
      exit;
    end;
  if I < Size then
    RaiseReadError;
  Result := True;
end;

function AReaderEx.MatchStr(const S: AnsiString; const CaseSensitive: Boolean): Boolean;
begin
  Result := MatchBuffer(Pointer(S)^, Length(S), CaseSensitive);
end;

function AReaderEx.MatchChar(const Ch: AnsiChar; const MatchNonMatch: Boolean;
    const SkipOnMatch: Boolean): Boolean;
begin
  if EOF then
    begin
      Result := False;
      exit;
    end;
  Result := (AnsiChar(PeekByte) = Ch) xor MatchNonMatch;
  if Result and SkipOnMatch then
    Skip(Sizeof(Byte));
end;

function AReaderEx.MatchChar(const C: CharSet; var Ch: AnsiChar; const MatchNonMatch: Boolean;
    const SkipOnMatch: Boolean): Boolean;
begin
  if EOF then
    begin
      Result := False;
      exit;
    end;
  Ch := AnsiChar(PeekByte);
  Result := (Ch in C) xor MatchNonMatch;
  if Result and SkipOnMatch then
    Skip(Sizeof(Byte));
end;

procedure AReaderEx.Skip(const Count: Integer);
begin
  if Count < 0 then
    raise EReader.Create(SSeekError);
  if Count = 0 then
    exit;
  SetPosition(GetPosition + Count);
end;

procedure AReaderEx.SkipByte;
begin
  Skip(Sizeof(Byte));
end;

function AReaderEx.SkipAll(const Ch: AnsiChar; const MatchNonMatch: Boolean;
    const MaxCount: Integer): Integer;
begin
  Result := 0;
  While (MaxCount < 0) or (Result < MaxCount) do
    if not MatchChar(Ch, MatchNonMatch, True) then
      exit
    else
      Inc(Result);
end;

function AReaderEx.SkipAll(const C: CharSet; const MatchNonMatch: Boolean;
    const MaxCount: Integer): Integer;
var Ch : AnsiChar;
begin
  Result := 0;
  While (MaxCount < 0) or (Result < MaxCount) do
    if not MatchChar(C, Ch, MatchNonMatch, True) then
      exit
    else
      Inc(Result);
end;

function AReaderEx.Locate(const Ch: AnsiChar; const LocateNonMatch: Boolean;
    const MaxOffset: Integer): Integer;
var P : Int64;
    I : Integer;
begin
  P := GetPosition;
  I := 0;
  While not EOF and ((MaxOffset < 0) or (I <= MaxOffset)) do
    if (AnsiChar(ReadByte) = Ch) xor LocateNonMatch then
      begin
        SetPosition(P);
        Result := I;
        exit;
      end
    else
      Inc(I);
  SetPosition(P);
  Result := -1;
end;

function AReaderEx.Locate(const C: CharSet; const LocateNonMatch: Boolean;
    const MaxOffset: Integer): Integer;
var P : Int64;
    I : Integer;
begin
  P := GetPosition;
  I := 0;
  While not EOF and ((MaxOffset < 0) or (I <= MaxOffset)) do
    if (AnsiChar(ReadByte) in C) xor LocateNonMatch then
      begin
        SetPosition(P);
        Result := I;
        exit;
      end
    else
      Inc(I);
  SetPosition(P);
  Result := -1;
end;

function AReaderEx.LocateBuffer(const Buffer; const Size: Integer;
    const MaxOffset: Integer; const CaseSensitive: Boolean): Integer;
var P    : Int64;
    I, J : Integer;
    B    : Pointer;
    R, M : Boolean;
    F    : Array[0..DefaultBufSize - 1] of Byte;
begin
  if Size <= 0 then
    begin
      Result := -1;
      exit;
    end;
  M := Size > DefaultBufSize;
  if M then
    GetMem(B, Size)
  else
    B := @F[0];
  try
    P := GetPosition;
    I := 0;
    While not EOF and
          ((MaxOffset < 0) or (I <= MaxOffset)) do
      begin
        J := Read(B^, Size);
        if J < Size then
          begin
            if EOF then
              begin
                SetPosition(P);
                Result := -1;
                exit;
              end
            else
              RaiseReadError;
          end;
        if CaseSensitive then
          R := CompareMem(Buffer, B^, Size)
        else
          R := CompareMemNoCase(Buffer, B^, Size) = crEqual;
        if R then
          begin
            SetPosition(P);
            Result := I;
            exit;
          end
        else
          begin
            Inc(I);
            SetPosition(P + I);
          end;
      end;
    SetPosition(P);
    Result := -1;
  finally
    if M then
      FreeMem(B);
  end;
end;

function AReaderEx.LocateStr(const S: AnsiString; const MaxOffset: Integer;
    const CaseSensitive: Boolean): Integer;
begin
  Result := LocateBuffer(Pointer(S)^, Length(S), MaxOffset, CaseSensitive);
end;

function AReaderEx.ExtractAll(const C: CharSet; const ExtractNonMatch: Boolean;
    const MaxCount: Integer): AnsiString;
var I : Integer;
begin
  I := Locate(C, not ExtractNonMatch, MaxCount);
  if I = -1 then
    if MaxCount = -1 then
      Result := GetToEOF
    else
      Result := ReadStrA(MaxCount)
  else
    Result := ReadStrA(I);
end;

function AReaderEx.ExtractToStr(const S: AnsiString; const MaxLength: Integer;
    const CaseSensitive: Boolean): AnsiString;
var I : Integer;
begin
  I := LocateStr(S, MaxLength, CaseSensitive);
  if I = -1 then
    if MaxLength = -1 then
      Result := GetToEOF
    else
      Result := ReadStrA(MaxLength)
  else
    Result := ReadStrA(I);
end;

function AReaderEx.ExtractToChar(const C: AnsiChar; const MaxLength: Integer = -1): AnsiString;
var I : Integer;
begin
  I := Locate(C, False, MaxLength);
  if I = -1 then
    if MaxLength = -1 then
      Result := GetToEOF
    else
      Result := ReadStrA(MaxLength)
  else
    Result := ReadStrA(I);
end;

function AReaderEx.ExtractToChar(const C: CharSet; const MaxLength: Integer = -1): AnsiString;
var I : Integer;
begin
  I := Locate(C, False, MaxLength);
  if I = -1 then
    if MaxLength = -1 then
      Result := GetToEOF
    else
      Result := ReadStrA(MaxLength)
  else
    Result := ReadStrA(I);
end;

function AReaderEx.ExtractQuoted(const QuoteChars: CharSet): AnsiString;
var QuoteCh : AnsiChar;
begin
  QuoteCh := AnsiChar(PeekByte);
  if not (QuoteCh in QuoteChars) then
    begin
      Result := '';
      exit;
    end;
  SkipByte;
  Result := ExtractToStr(QuoteCh, -1, True);
  SkipByte;
end;

const
  csNewLineNone    : CharSet = [];
  csNewLineCR      : CharSet = [#13];
  csNewLineLF      : CharSet = [#10];
  csNewLineEOF     : CharSet = [#26];
  csNewLineCRLF    : CharSet = [#10, #13];
  csNewLineCREOF   : CharSet = [#13, #26];
  csNewLineLFEOF   : CharSet = [#10, #26];
  csNewLineCRLFEOF : CharSet = [#10, #13, #26];

procedure FirstNewLineCharsFromEOLTypes(const EOLTypes: TReaderEOLTypes;
    var Chars: PCharSet);
begin
  if [eolCR, eolCRLF] * EOLTypes <> [] then
    if [eolLF, eolLFCR] * EOLTypes <> [] then
      if eolEOFAtEOF in EOLTypes then
        Chars := @csNewLineCRLFEOF else
        Chars := @csNewLineCRLF
    else
      if eolEOFAtEOF in EOLTypes then
        Chars := @csNewLineCREOF else
        Chars := @csNewLineCR
  else
    if [eolLF, eolLFCR] * EOLTypes <> [] then
      if eolEOFAtEOF in EOLTypes then
        Chars := @csNewLineLFEOF else
        Chars := @csNewLineLF
  else
    if eolEOFAtEOF in EOLTypes then
      Chars := @csNewLineEOF
    else
      Chars := @csNewLineNone;
end;

function AReaderEx.SkipLineTerminator(const EOLTypes: TReaderEOLTypes): Integer;
var C, D : AnsiChar;
    R    : Boolean;
begin
  C := AnsiChar(ReadByte);
  if ((C = #10) and ([eolLFCR, eolLF] * EOLTypes = [eolLF])) or
     ((C = #13) and ([eolCRLF, eolCR] * EOLTypes = [eolCR])) then
    begin
      Result := 1;
      exit;
    end;
  if not (((C = #10) and (eolLFCR in EOLTypes)) or
          ((C = #13) and (eolCRLF in EOLTypes))) then
    begin
      SetPosition(GetPosition - 1);
      Result := 0;
      exit;
    end;
  R := EOF;
  if (C = #26) and (eolEOFAtEOF in EOLTypes) and R then
    begin
      Result := 1;
      exit;
    end;
  if R then
    begin
      if ((C = #10) and (eolLF in EOLTypes)) or
         ((C = #13) and (eolCR in EOLTypes)) then
        begin
          Result := 1;
          exit;
        end;
      SetPosition(GetPosition - 1);
      Result := 0;
      exit;
    end;
  D := AnsiChar(ReadByte);
  if ((C = #13) and (D = #10) and (eolCRLF in EOLTypes)) or
     ((C = #10) and (D = #13) and (eolLFCR in EOLTypes)) then
    begin
      Result := 2;
      exit;
    end;
  if ((C = #13) and (eolCR in EOLTypes)) or
     ((C = #10) and (eolLF in EOLTypes)) then
    begin
      SetPosition(GetPosition - 1);
      Result := 1;
      exit;
    end;
  SetPosition(GetPosition - 2);
  Result := 0;
end;

function AReaderEx.ExtractLine(const MaxLineLength: Integer;
    const EOLTypes: TReaderEOLTypes): AnsiString;
var NewLineChars : PCharSet;
    Fin : Boolean;
begin
  if EOLTypes = [] then
    begin
      Result := '';
      exit;
    end;
  if EOLTypes = [eolEOF] then
    begin
      Result := GetToEOF;
      exit;
    end;
  FirstNewLineCharsFromEOLTypes(EOLTypes, NewLineChars);
  Result := '';
  Repeat
    Result := Result + ExtractAll(NewLineChars^, True, MaxLineLength);
    if EOF then
      if eolEOF in EOLTypes then
        exit
      else
        RaiseReadError;
    Fin := (MaxLineLength >= 0) and (Length(Result) >= MaxLineLength);
    if not Fin then
      begin
        Fin := SkipLineTerminator(EOLTypes) > 0;
        if not Fin then
          Result := Result + AnsiChar(ReadByte);
      end;
  Until Fin;
end;

function AReaderEx.SkipLine(const MaxLineLength: Integer;
    const EOLTypes: TReaderEOLTypes): Boolean;
var NewLineChars : PCharSet;
    I    : Integer;
    P, Q : Int64;
    Fin  : Boolean;
begin
  if EOLTypes = [] then
    begin
      Result := False;
      exit;
    end;
  Result := True;
  if EOLTypes = [eolEOF] then
    begin
      Position := Size;
      exit;
    end;
  FirstNewLineCharsFromEOLTypes(EOLTypes, NewLineChars);
  Fin := False;
  Repeat
    I := Locate(NewLineChars^, False, MaxLineLength);
    if I < 0 then
      if MaxLineLength < 0 then
        begin
          Position := Size;
          exit;
        end
      else
        begin
          P := Position + MaxLineLength;
          Q := Size;
          if P > Q then
            P := Q;
          Position := P;
          exit;
        end
    else
      begin
        Skip(I);
        if EOF then
          exit;
        Fin := SkipLineTerminator(EOLTypes) > 0;
        if not Fin then
          SkipByte;
      end;
  Until Fin;
end;



{                                                                              }
{ TMemoryReader                                                                }
{   For Size < 0 the memory reader assumes no size limit.                      }
{                                                                              }
constructor TMemoryReader.Create(const Data: Pointer; const Size: Integer);
begin
  inherited Create;
  SetData(Data, Size);
end;

procedure TMemoryReader.SetData(const Data: Pointer; const Size: Integer);
begin
  FData := Data;
  FSize := Size;
  FPos := 0;
end;

function TMemoryReader.GetPosition: Int64;
begin
  Result := FPos;
end;

procedure TMemoryReader.SetPosition(const Position: Int64);
var S : Integer;
begin
  S := FSize;
  if (Position < 0) or ((S >= 0) and (Position > S)) then
    RaiseSeekError;
  FPos := Integer(Position);
end;

function TMemoryReader.GetSize: Int64;
begin
  Result := FSize;
end;

function TMemoryReader.Read(var Buffer; const Size: Integer): Integer;
var L, S, I : Integer;
    P       : PByte;
begin
  I := FPos;
  S := FSize;
  if (Size <= 0) or ((S >= 0) and (I >= S)) then
    begin
      Result := 0;
      exit;
    end;
  if S < 0 then
    L := Size
  else
    begin
      L := S - I;
      if Size < L then
        L := Size;
    end;
  P := FData;
  Inc(P, I);
  MoveMem(P^, Buffer, L);
  Result := L;
  Inc(FPos, L);
end;

function TMemoryReader.EOF: Boolean;
var S : Integer;
begin
  S := FSize;
  if S < 0 then
    Result := False
  else
    Result := FPos >= S;
end;

function TMemoryReader.ReadByte: Byte;
var I, S : Integer;
    P    : PByte;
begin
  I := FPos;
  S := FSize;
  if (S >= 0) and (I >= S) then
    RaiseReadError;
  P := FData;
  Inc(P, I);
  Result := P^;
  Inc(FPos);
end;

function TMemoryReader.ReadLongInt: LongInt;
var I, S : Integer;
begin
  I := FPos;
  S := FSize;
  if (S >= 0) and (I + Sizeof(LongInt) > S) then
    RaiseReadError;
  Result := PLongInt(@PAnsiChar(FData)[I])^;
  Inc(FPos, Sizeof(LongInt));
end;

function TMemoryReader.ReadInt64: Int64;
var I, S : Integer;
begin
  I := FPos;
  S := FSize;
  if (S >= 0) and (I + Sizeof(Int64) > S) then
    RaiseReadError;
  Result := PInt64(@PAnsiChar(FData)[I])^;
  Inc(FPos, Sizeof(Int64));
end;

function TMemoryReader.PeekByte: Byte;
var I, S : Integer;
    P    : PByte;
begin
  I := FPos;
  S := FSize;
  if (S >= 0) and (I >= S) then
    RaiseReadError;
  P := FData;
  Inc(P, I);
  Result := P^;
end;

function TMemoryReader.Match(const Buffer; const Size: Integer;
    const CaseSensitive: Boolean): Integer;
var L, S : Integer;
    P    : PByte;
    R    : Boolean;
begin
  S := FSize;
  if S < 0 then
    L := Size
  else
    begin
      L := S - FPos;
      if L > Size then
        L := Size;
    end;
  if L <= 0 then
    begin
      Result := -1;
      exit;
    end;
  P := FData;
  Inc(P, FPos);
  if CaseSensitive then
    R := CompareMem(Buffer, P^, L) else
    R := CompareMemNoCase(Buffer, P^, L) = crEqual;
  if R then
    Result := L else
    Result := -1;
end;

procedure TMemoryReader.Skip(const Count: Integer);
var S, I : Integer;
begin
  if Count <= 0 then
    exit;
  S := FSize;
  if S < 0 then
    Inc(FPos, Count)
  else
    begin
      I := FPos + Count;
      if I > S then
        RaiseSeekError;
      FPos := I;
    end;
end;



{                                                                              }
{ TStringReader                                                                }
{                                                                              }
constructor TStringReader.Create(const Data: AnsiString);
begin
  FDataString := Data;
  inherited Create(Pointer(FDataString), Length(FDataString));
end;

procedure TStringReader.SetDataString(const S: AnsiString);
begin
  FDataString := S;
  SetData(Pointer(FDataString), Length(FDataString));
end;

function TStringReader.GetAsStringA: AnsiString;
begin
  Result := FDataString;
end;



{                                                                              }
{ TFileReader                                                                  }
{                                                                              }
constructor TFileReader.Create(const FileName: String;
    const AccessHint: TFileReaderAccessHint);
{$IFDEF MSWIN}
var F : LongWord;
{$ENDIF}
begin
  inherited Create;
  {$IFDEF MSWIN}
  F := FILE_ATTRIBUTE_NORMAL;
  Case AccessHint of
    frahNone             : ;
    frahRandomAccess     : F := F or FILE_FLAG_RANDOM_ACCESS;
    frahSequentialAccess : F := F or FILE_FLAG_SEQUENTIAL_SCAN;
  end;
  {$IFDEF StringIsUnicode}
  FHandle := Integer(Windows.CreateFileW(PWideChar(FileName), GENERIC_READ,
      FILE_SHARE_READ or FILE_SHARE_WRITE, nil, OPEN_EXISTING, F, 0));
  {$ELSE}
  FHandle := Integer(Windows.CreateFileA(PAnsiChar(FileName), GENERIC_READ,
      FILE_SHARE_READ or FILE_SHARE_WRITE, nil, OPEN_EXISTING, F, 0));
  {$ENDIF}
  {$ELSE}
  FHandle := FileOpen(FileName, fmOpenRead or fmShareDenyNone);
  {$ENDIF}
  if FHandle = -1 then
    raise EFileReader.CreateFmt(SFileOpenError, [GetLastOSErrorMessage]);
  FHandleOwner := True;
end;

constructor TFileReader.Create(const FileHandle: Integer; const HandleOwner: Boolean);
begin
  inherited Create;
  FHandle := FileHandle;
  FHandleOwner := HandleOwner;
end;

destructor TFileReader.Destroy;
begin
  if FHandleOwner and (FHandle <> -1) and (FHandle <> 0) then
    FileClose(FHandle);
  inherited Destroy;
end;

function TFileReader.GetPosition: Int64;
begin
  Result := FileSeek(FHandle, Int64(0), 1);
  if Result = -1 then
    raise EFileReader.CreateFmt(SFileError, [GetLastOSErrorMessage]);
end;

procedure TFileReader.SetPosition(const Position: Int64);
begin
  if FileSeek(FHandle, Position, 0) = -1 then
    raise EFileReader.CreateFmt(SFileSeekError, [GetLastOSErrorMessage]);
end;

function TFileReader.GetSize: Int64;
var I : Int64;
    S : String;
begin
  I := GetPosition;
  Result := FileSeek(FHandle, Int64(0), 2);
  if Result = -1 then
    S := GetLastOSErrorMessage;
  SetPosition(I);
  if Result = -1 then
    raise EFileReader.CreateFmt(SFileError, [S]);
end;

function TFileReader.Read(var Buffer; const Size: Integer): Integer;
var I : Integer;
begin
  if Size <= 0 then
    begin
      Result := 0;
      exit;
    end;
  I := FileRead(FHandle, Buffer, Size);
  if I <= 0 then
    begin
      Result := 0;
      exit;
    end;
  Result := I;
end;

function TFileReader.EOF: Boolean;
begin
  Result := GetPosition >= GetSize;
end;



{ ReadFileToStrA                                                               }
function ReadFileToStrA(const FileName: String): AnsiString;
var F : TFileReader;
begin
  F := TFileReader.Create(FileName);
  try
    Result := F.GetAsStringA;
  finally
    F.Free;
  end;
end;



{                                                                              }
{ AReaderProxy                                                                 }
{                                                                              }
constructor AReaderProxy.Create(const Reader: AReaderEx; const ReaderOwner: Boolean);
begin
  Assert(Assigned(Reader));
  inherited Create;
  FReader := Reader;
  FReaderOwner := ReaderOwner;
end;

destructor AReaderProxy.Destroy;
begin
  if FReaderOwner then
    FreeAndNil(FReader);
  inherited Destroy;
end;

function AReaderProxy.Read(var Buffer; const Size: Integer): Integer;
begin
  Result := FReader.Read(Buffer, Size);
end;

function AReaderProxy.EOF: Boolean;
begin
  Result := FReader.EOF;
end;

function AReaderProxy.GetPosition: Int64;
begin
  Result := FReader.GetPosition;
end;

procedure AReaderProxy.SetPosition(const Position: Int64);
begin
  FReader.SetPosition(Position);
end;

function AReaderProxy.GetSize: Int64;
begin
  Result := FReader.GetSize;
end;



{                                                                              }
{ TReaderProxy                                                                 }
{                                                                              }
constructor TReaderProxy.Create(const Reader: AReaderEx; const ReaderOwner: Boolean;
    const Size: Int64);
begin
  inherited Create(Reader, ReaderOwner);
  FOffset := Reader.GetPosition;
  FSize := Size;
end;

function TReaderProxy.GetPosition: Int64;
begin
  Result := FReader.GetPosition - FOffset;
end;

procedure TReaderProxy.SetPosition(const Position: Int64);
begin
  if Position < 0 then
    raise EReader.Create(SSeekError);
  if (FSize >= 0) and (Position > FOffset + FSize) then
    raise EReader.Create(SSeekError);
  FReader.SetPosition(FOffset + Position);
end;

function TReaderProxy.GetSize: Int64;
begin
  Result := FReader.GetSize;
  if Result >= FOffset then
    Dec(Result, FOffset)
  else
    Result := -1;
  if (FSize >= 0) and (FSize < Result) then
    Result := FSize;
end;

function TReaderProxy.EOF: Boolean;
begin
  Result := FReader.EOF;
  if Result or (FSize < 0) then
    exit;
  Result := FReader.Position >= FOffset + FSize;
end;

function TReaderProxy.Read(var Buffer; const Size: Integer): Integer;
var L : Integer;
    M : Int64;
begin
  L := Size;
  if FSize >= 0 then
    begin
      M := FSize - (FReader.Position - FOffset);
      if M < L then
        L := Integer(M);
    end;
  if L <= 0 then
    begin
      Result := 0;
      exit;
    end;
  Result := FReader.Read(Buffer, L);
end;



{                                                                              }
{ TBufferedReader                                                              }
{                                                                              }
constructor TBufferedReader.Create(const Reader: AReaderEx; const BufferSize: Integer;
    const ReaderOwner: Boolean);
begin
  inherited Create(Reader, ReaderOwner);
  FBufferSize := BufferSize;
  GetMem(FBuffer, BufferSize);
  FPos := Reader.GetPosition;
end;

destructor TBufferedReader.Destroy;
begin
  if Assigned(FBuffer) then
    FreeMem(FBuffer);
  inherited Destroy;
end;

function TBufferedReader.GetPosition: Int64;
begin
  Result := FPos;
end;

function TBufferedReader.GetSize: Int64;
begin
  Result := FReader.GetSize;
end;

procedure TBufferedReader.SetPosition(const Position: Int64);
var B, C : Int64;
begin
  B := Position - FPos;
  if B = 0 then
    exit;
  C := B + FBufPos;
  if (C >= 0) and (C <= FBufUsed) then
    begin
      Inc(FBufPos, Integer(B));
      FPos := Position;
      exit;
    end;
  FReader.SetPosition(Position);
  FPos := Position;
  FBufPos := 0;
  FBufUsed := 0;
end;

procedure TBufferedReader.Skip(const Count: Integer);
var I : Integer;
    P : Int64;
begin
  if Count < 0 then
    raise EReader.Create(SSeekError);
  if Count = 0 then
    exit;
  I := FBufUsed - FBufPos;
  if I >= Count then
    begin
      Inc(FBufPos, Count);
      Inc(FPos, Count);
      exit;
    end;
  P := GetPosition + Count;
  FReader.SetPosition(P);
  FPos := P;
  FBufPos := 0;
  FBufUsed := 0;
end;

// Internal function FillBuf
// Returns True if buffer was only partially filled
function TBufferedReader.FillBuf: Boolean;
var P : PByte;
    L, N : Integer;
begin
  L := FBufferSize - FBufUsed;
  if L <= 0 then
    begin
      Result := False;
      exit;
    end;
  P := FBuffer;
  Inc(P, FBufPos);
  N := FReader.Read(P^, L);
  Inc(FBufUsed, N);
  Result := N < L;
end;

function TBufferedReader.Read(var Buffer; const Size: Integer): Integer;
var L, M : Integer;
    P, Q : PByte;
    R : Boolean;
begin
  if Size <= 0 then
    begin
      Result := 0;
      exit;
    end;
  Q := @Buffer;
  M := Size;
  R := False;
  Repeat
    L := FBufUsed - FBufPos;
    if L > M then
      L := M;
    if L > 0 then
      begin
        P := FBuffer;
        Inc(P, FBufPos);
        MoveMem(P^, Q^, L);
        Inc(FBufPos, L);
        Inc(FPos, L);
        Dec(M, L);
        if M = 0 then
          begin
            Result := Size;
            exit;
          end;
        Inc(Q, L);
      end;
    FBufPos := 0;
    FBufUsed := 0;
    if R then
      begin
        Result := Size - M;
        exit;
      end;
    R := FillBuf;
  Until False;
end;

function TBufferedReader.EOF: Boolean;
begin
  if FBufUsed > FBufPos then
    Result := False else
    Result := FReader.EOF;
end;

procedure TBufferedReader.InvalidateBuffer;
begin
  FReader.SetPosition(FPos);
  FBufPos := 0;
  FBufUsed := 0;
end;

// Internal function BufferByte
// Fills buffer with at least one character, otherwise raises an exception
procedure TBufferedReader.BufferByte;
var I : Integer;
begin
  I := FBufUsed;
  if FBufPos < I then
    exit;
  if I >= FBufferSize then
    begin
      FBufPos := 0;
      FBufUsed := 0;
    end;
  FillBuf;
  if FBufPos >= FBufUsed then
    RaiseReadError;
end;

function TBufferedReader.ReadByte: Byte;
var P : PByte;
begin
  BufferByte;
  P := FBuffer;
  Inc(P, FBufPos);
  Result := P^;
  Inc(FBufPos);
  Inc(FPos);
end;

function TBufferedReader.PeekByte: Byte;
var P : PByte;
begin
  BufferByte;
  P := FBuffer;
  Inc(P, FBufPos);
  Result := P^;
end;

function TBufferedReader.PosBuf(const C: CharSet; const LocateNonMatch: Boolean;
    const MaxOffset: Integer): Integer;
var P : PAnsiChar;
    L : Integer;
begin
  P := FBuffer;
  L := FBufPos;
  Inc(P, L);
  Result := 0;
  While (L < FBufUsed) and ((MaxOffset < 0) or (Result <= MaxOffset)) do
    if (P^ in C) xor LocateNonMatch then
      exit else
      begin
        Inc(P);
        Inc(L);
        Inc(Result);
      end;
  Result := -1;
end;

function TBufferedReader.Locate(const C: CharSet; const LocateNonMatch: Boolean;
    const MaxOffset: Integer): Integer;
var I, J, M, K : Integer;
    P : Int64;
    R : Boolean;
begin
  P := GetPosition;
  M := MaxOffset;
  J := 0;
  R := False;
  Repeat
    K := FBufUsed - FBufPos;
    if K > 0 then
      begin
        I := PosBuf(C, LocateNonMatch, M);
        if I >= 0 then
          begin
            SetPosition(P);
            Result := J + I;
            exit;
          end;
      end;
    if R then
      begin
        SetPosition(P);
        Result := -1;
        exit;
      end;
    Inc(J, K);
    Inc(FPos, K);
    FBufPos := 0;
    FBufUsed := 0;
    if M >= 0 then
      begin
        Dec(M, K);
        if M < 0 then
          begin
            SetPosition(P);
            Result := -1;
            exit;
          end;
      end;
    R := FillBuf;
  Until False;
end;



{                                                                              }
{ TSplitBufferedReader                                                         }
{                                                                              }
constructor TSplitBufferedReader.Create(const Reader: AReaderEx; const BufferSize: Integer;
    const ReaderOwner: Boolean);
var I : Integer;
begin
  inherited Create(Reader, ReaderOwner);
  FBufferSize := BufferSize;
  For I := 0 to 1 do
    GetMem(FBuffer[I], BufferSize);
  FPos := Reader.GetPosition;
end;

destructor TSplitBufferedReader.Destroy;
var I : Integer;
begin
  For I := 0 to 1 do
    if Assigned(FBuffer[I]) then
      FreeMem(FBuffer[I]);
  inherited Destroy;
end;

function TSplitBufferedReader.GetSize: Int64;
begin
  Result := FReader.GetSize;
end;

function TSplitBufferedReader.GetPosition: Int64;
begin
  Result := FPos;
end;

// Internal function BufferStart used by SetPosition
// Returns the relative offset of the first buffered byte
function TSplitBufferedReader.BufferStart: Integer;
begin
  Result := -FBufPos;
  if FBufNr = 1 then
    Dec(Result, FBufUsed[0]);
end;

// Internal function BufferRemaining used by SetPosition
// Returns the length of the remaining buffered data
function TSplitBufferedReader.BufferRemaining: Integer;
begin
  Result := FBufUsed[FBufNr] - FBufPos;
  if FBufNr = 0 then
    Inc(Result, FBufUsed[1]);
end;

procedure TSplitBufferedReader.SetPosition(const Position: Int64);
var D : Int64;
begin
  D := Position - FPos;
  if D = 0 then
    exit;
  if (D >= BufferStart) and (D <= BufferRemaining) then
    begin
      Inc(FBufPos, D);
      if (FBufNr = 1) and (FBufPos < 0) then // Set position from Buf1 to Buf0
        begin
          Inc(FBufPos, FBufUsed[0]);
          FBufNr := 0;
        end else
      if (FBufNr = 0) and (FBufPos > FBufUsed[0]) then // Set position from Buf0 to Buf1
        begin
          Dec(FBufPos, FBufUsed[0]);
          FBufNr := 1;
        end;
      FPos := Position;
      exit;
    end;
  FReader.SetPosition(Position);
  FPos := Position;
  FBufNr := 0;
  FBufPos := 0;
  FBufUsed[0] := 0;
  FBufUsed[1] := 0;
end;

procedure TSplitBufferedReader.InvalidateBuffer;
begin
  FReader.SetPosition(FPos);
  FBufNr := 0;
  FBufPos := 0;
  FBufUsed[0] := 0;
  FBufUsed[1] := 0;
end;

// Internal function MoveBuf used by Read
// Moves remaining data from Buffer[BufNr]^[BufPos] to Dest
// Returns True if complete (Remaining=0)
function TSplitBufferedReader.MoveBuf(var Dest: PByte; var Remaining: Integer): Boolean;
var P : PByte;
    L, R, N, O : Integer;
begin
  N := FBufNr;
  O := FBufPos;
  L := FBufUsed[N] - O;
  if L <= 0 then
    begin
      Result := False;
      exit;
    end;
  P := FBuffer[N];
  Inc(P, O);
  R := Remaining;
  if R < L then
    L := R;
  MoveMem(P^, Dest^, L);
  Inc(Dest, L);
  Inc(FBufPos, L);
  Dec(R, L);
  if R <= 0 then
    Result := True else
    Result := False;
  Remaining := R;
end;

// Internal function FillBuf used by Read
// Fill Buffer[BufNr]^[BufPos] with up to BufferSize bytes and moves
// the read data to Dest
// Returns True if complete (incomplete Read or Remaining=0)
function TSplitBufferedReader.FillBuf(var Dest: PByte; var Remaining: Integer): Boolean;
var P : PByte;
    I, L, N : Integer;
begin
  N := FBufNr;
  I := FBufUsed[N];
  L := FBufferSize - I;
  if L <= 0 then
    begin
      Result := False;
      exit;
    end;
  P := FBuffer[N];
  Inc(P, I);
  I := FReader.Read(P^, L);
  if I > 0 then
    begin
      Inc(FBufUsed[N], I);
      if MoveBuf(Dest, Remaining) then
        begin
          Result := True;
          exit;
        end;
    end;
  Result := I < L;
end;

function TSplitBufferedReader.Read(var Buffer; const Size: Integer): Integer;
var Dest : PByte;
    Remaining : Integer;
begin
  if Size <= 0 then
    begin
      Result := 0;
      exit;
    end;
  Dest := @Buffer;
  Remaining := Size;
  Repeat
    if MoveBuf(Dest, Remaining) then
      begin
        Result := Size;
        Inc(FPos, Size);
        exit;
      end;
    if FillBuf(Dest, Remaining) then
      begin
        Result := Size - Remaining;
        Inc(FPos, Result);
        exit;
      end;
    if FBufNr = 0 then
      FBufNr := 1 else
      begin
        Swap(FBuffer[0], FBuffer[1]);
        FBufUsed[0] := FBufUsed[1];
        FBufUsed[1] := 0;
      end;
    FBufPos := 0;
  Until False;
end;

function TSplitBufferedReader.EOF: Boolean;
begin
  if FBufUsed[FBufNr] > FBufPos then
    Result := False else
    if FBufNr = 1 then
      Result := FReader.EOF else
      if FBufUsed[1] > 0 then
        Result := False
      else
        Result := FReader.EOF;
end;



{                                                                              }
{ TBufferedFileReader                                                          }
{                                                                              }
constructor TBufferedFileReader.Create(const FileName: String; const BufferSize: Integer);
begin
  inherited Create(TFileReader.Create(FileName), BufferSize, True);
end;

constructor TBufferedFileReader.Create(const FileHandle: Integer;
    const HandleOwner: Boolean; const BufferSize: Integer);
begin
  inherited Create(TFileReader.Create(FileHandle, HandleOwner), BufferSize, True);
end;



{                                                                              }
{ TSplitBufferedFileReader                                                     }
{                                                                              }
constructor TSplitBufferedFileReader.Create(const FileName: String; const BufferSize: Integer);
begin
  inherited Create(TFileReader.Create(FileName), BufferSize, True);
end;



{                                                                              }
{ AWriterEx                                                                    }
{                                                                              }
procedure AWriterEx.RaiseWriteError;
begin
  raise EWriter.Create(SWriteError);
end;

function AWriterEx.GetPosition: Int64;
begin
  raise EWriter.Create(SNotSupported);
end;

procedure AWriterEx.SetPosition(const Position: Int64);
begin
  raise EWriter.Create(SSeekError);
end;

function AWriterEx.GetSize: Int64;
begin
  raise EWriter.Create(SNotSupported);
end;

procedure AWriterEx.SetSize(const Size: Int64);
begin
  raise EWriter.Create(SNotSupported);
end;

procedure AWriterEx.Append;
begin
  Position := Size;
end;

procedure AWriterEx.Truncate;
begin
  Size := Position;
end;

procedure AWriterEx.Clear;
begin
  Size := 0;
end;

procedure AWriterEx.WriteBuffer(const Buffer; const Size: Integer);
begin
  if Size <= 0 then
    exit;
  if Write(Buffer, Size) <> Size then
    RaiseWriteError;
end;

procedure AWriterEx.WriteStrA(const Buffer: AnsiString);
begin
  WriteBuffer(Pointer(Buffer)^, Length(Buffer));
end;

procedure AWriterEx.WriteStrW(const Buffer: WideString);
begin
  WriteBuffer(Pointer(Buffer)^, Length(Buffer) * Sizeof(WideChar));
end;

procedure AWriterEx.SetAsString(const S: AnsiString);
begin
  Position := 0;
  WriteStrA(S);
  Truncate;
end;

procedure AWriterEx.SetAsWideString(const S: WideString);
begin
  Position := 0;
  WriteStrW(S);
  Truncate;
end;

procedure AWriterEx.WriteByte(const V: Byte);
begin
  WriteBuffer(V, Sizeof(Byte));
end;

procedure AWriterEx.WriteWord(const V: Word);
begin
  WriteBuffer(V, Sizeof(Word));
end;

procedure AWriterEx.WriteLongWord(const V: LongWord);
begin
  WriteBuffer(V, Sizeof(LongWord));
end;

procedure AWriterEx.WriteLongInt(const V: LongInt);
begin
  WriteBuffer(V, Sizeof(LongInt));
end;

procedure AWriterEx.WriteInt64(const V: Int64);
begin
  WriteBuffer(V, Sizeof(Int64));
end;

procedure AWriterEx.WriteSingle(const V: Single);
begin
  WriteBuffer(V, Sizeof(Single));
end;

procedure AWriterEx.WriteDouble(const V: Double);
begin
  WriteBuffer(V, Sizeof(Double));
end;

procedure AWriterEx.WriteExtended(const V: Extended);
begin
  WriteBuffer(V, Sizeof(Extended));
end;

procedure AWriterEx.WritePackedAnsiString(const V: AnsiString);
begin
  WriteLongInt(Length(V));
  WriteStrA(V);
end;

procedure AWriterEx.WritePackedWideString(const V: WideString);
begin
  WriteLongInt(Length(V));
  WriteStrW(V);
end;

procedure AWriterEx.WritePackedString(const V: String);
begin
  {$IFDEF CharIsWide}
  WritePackedWideString(V);
  {$ELSE}
  WritePackedAnsiString(V);
  {$ENDIF}
end;

procedure AWriterEx.WritePackedAnsiStringArray(const V: Array of AnsiString);
var I, L : Integer;
begin
  L := Length(V);
  WriteLongInt(L);
  For I := 0 to L - 1 do
    WritePackedAnsiString(V[I]);
end;

procedure AWriterEx.WritePackedWideStringArray(const V: Array of WideString);
var I, L : Integer;
begin
  L := Length(V);
  WriteLongInt(L);
  For I := 0 to L - 1 do
    WritePackedWideString(V[I]);
end;

procedure AWriterEx.WriteBufLine(const Buffer; const Size: Integer;
    const NewLineType: TWriterNewLineType);
begin
  WriteBuffer(Buffer, Size);
  Case NewLineType of
    nlCR   : WriteByte(13);
    nlLF   : WriteByte(10);
    nlCRLF : WriteStrA(#13#10);
    nlLFCR : WriteStrA(#10#13);
  end;
end;

procedure AWriterEx.WriteLine(const S: AnsiString; const NewLineType: TWriterNewLineType);
begin
  WriteBufLine(Pointer(S)^, Length(S), NewLineType);
end;



{                                                                              }
{ TFileWriter                                                                  }
{                                                                              }
constructor TFileWriter.Create(const FileName: String;
    const OpenMode: TFileWriterOpenMode; const Options: TFileWriterOptions;
    const AccessHint: TFileWriterAccessHint);
var CreateFile : Boolean;
    {$IFDEF MSWIN}
    F : LongWord;
    D : LongWord;
    {$ENDIF}
begin
  inherited Create;
  FFileName := FileName;
  Case OpenMode of
    fwomCreate           : CreateFile := True;
    fwomCreateIfNotExist : CreateFile := not FileExists(FileName);
    {$IFNDEF MSWIN}
    fwomTruncate         : CreateFile := True;
    {$ENDIF}
  else
    CreateFile := False;
  end;
  {$IFDEF MSWIN}
  F := FILE_ATTRIBUTE_NORMAL;
  Case AccessHint of
    fwahNone             : ;
    fwahRandomAccess     : F := F or FILE_FLAG_RANDOM_ACCESS;
    fwahSequentialAccess : F := F or FILE_FLAG_SEQUENTIAL_SCAN;
  end;
  if fwoWriteThrough in Options then
    F := F or FILE_FLAG_WRITE_THROUGH;
  if CreateFile then
    D := CREATE_ALWAYS
  else
    D := OPEN_EXISTING;
  {$IFDEF StringIsUnicode}
  FHandle := Integer(Windows.CreateFileW(PWideChar(FileName),
      GENERIC_READ or GENERIC_WRITE, 0, nil, D, F, 0));
  {$ELSE}
  FHandle := Integer(Windows.CreateFileA(PAnsiChar(FileName),
      GENERIC_READ or GENERIC_WRITE, 0, nil, D, F, 0));
  {$ENDIF}
  {$ELSE}
  if CreateFile then
    FHandle := FileCreate(FileName)
  else
    FHandle := FileOpen(FileName, fmOpenReadWrite);
  {$ENDIF}
  if FHandle = -1 then
    raise EFileWriter.CreateFmt(SFileOpenError, [GetLastOSErrorMessage]);
  FHandleOwner := True;
  FFileCreated := CreateFile;
  {$IFDEF MSWIN}
  if OpenMode = fwomTruncate then
    if not SetEndOfFile(FHandle) then
      raise EFileWriter.CreateFmt(SFileTruncateError, [GetLastOSErrorMessage]);
  {$ENDIF}
end;

constructor TFileWriter.Create(const FileHandle: Integer; const HandleOwner: Boolean);
begin
  inherited Create;
  FHandle := FileHandle;
  FHandleOwner := HandleOwner;
end;

destructor TFileWriter.Destroy;
begin
  if FHandleOwner and (FHandle <> -1) and (FHandle <> 0) then
    FileClose(FHandle);
  inherited Destroy;
end;

function TFileWriter.GetPosition: Int64;
begin
  Result := FileSeek(FHandle, Int64(0), 1);
  if Result = -1 then
    raise EFileWriter.CreateFmt(SFileError, [GetLastOSErrorMessage]);
end;

procedure TFileWriter.SetPosition(const Position: Int64);
begin
  if FileSeek(FHandle, Position, 0) = -1 then
    raise EFileWriter.CreateFmt(SFileSeekError, [GetLastOSErrorMessage]);
end;

function TFileWriter.GetSize: Int64;
var I : Int64;
    S : String;
begin
  I := GetPosition;
  Result := FileSeek(FHandle, Int64(0), 2);
  if Result = -1 then
    S := GetLastOSErrorMessage;
  SetPosition(I);
  if Result = -1 then
    raise EFileWriter.CreateFmt(SFileError, [S]);
end;

procedure TFileWriter.SetSize(const Size: Int64);
begin
  {$IFDEF MSWIN}
  SetPosition(Size);
  if not SetEndOfFile(FHandle) then
    raise EFileWriter.CreateFmt(SFileResizeError, [GetLastOSErrorMessage]);
  {$ELSE}{$IFDEF UNIX}
  {$IFDEF FREEPASCAL}
  SetPosition(Size);
  if fpftruncate(FHandle, Size) <> 0 then
    raise EFileWriter.CreateFmt(SFileResizeError, [GetLastOSErrorMessage]);
  {$ELSE}
  SetPosition(Size);
  if libc.ftruncate(FHandle, Size) <> 0 then
    raise EFileWriter.CreateFmt(SFileResizeError, [GetLastOSErrorMessage]);
  {$ENDIF}
  {$ELSE}
  SetPosition(Size);
  if not TruncateFile(FHandle, Size) then
    raise EFileWriter.CreateFmt(SFileResizeError, [GetLastOSErrorMessage]);
  {$ENDIF}{$ENDIF}
end;

function TFileWriter.Write(const Buffer; const Size: Integer): Integer;
var I : Integer;
begin
  if Size <= 0 then
    begin
      Result := 0;
      exit;
    end;
  I := FileWrite(FHandle, Buffer, Size);
  if I < 0 then
    raise EFileWriter.CreateFmt(SFileWriteError, [GetLastOSErrorMessage]);
  Result := I;
end;

procedure TFileWriter.Flush;
begin
  {$IFDEF MSWIN}
  if not FlushFileBuffers(FHandle) then
    raise EFileWriter.CreateFmt(SFileError, [GetLastOSErrorMessage]);
  {$ENDIF}
end;

procedure TFileWriter.DeleteFile;
begin
  if FFileName = '' then
    raise EFileWriter.Create(SInvalidFileName);
  if (FHandle <> -1) and (FHandle <> 0) then
    FileClose(FHandle);
  FHandle := -1;
  if not SysUtils.DeleteFile(FFileName) then
    raise EFileWriter.CreateFmt(SFileError, [GetLastOSErrorMessage]);
end;

procedure WriteStrToFile(const FileName: String; const S: AnsiString;
    const OpenMode: TFileWriterOpenMode);
var F : TFileWriter;
begin
  F := TFileWriter.Create(FileName, OpenMode);
  try
    F.SetAsString(S);
  finally
    F.Free;
  end;
end;

procedure AppendStrToFile(const FileName: String; const S: AnsiString);
var F : TFileWriter;
begin
  F := TFileWriter.Create(FileName, fwomCreateIfNotExist);
  try
    F.Append;
    F.WriteStrA(S);
  finally
    F.Free;
  end;
end;

procedure WriteWideStrToFile(const FileName: String; const S: WideString;
    const OpenMode: TFileWriterOpenMode);
var F : TFileWriter;
begin
  F := TFileWriter.Create(FileName, OpenMode);
  try
    F.SetAsWideString(S);
  finally
    F.Free;
  end;
end;

procedure AppendWideStrToFile(const FileName: String; const S: WideString);
var F : TFileWriter;
begin
  F := TFileWriter.Create(FileName, fwomCreateIfNotExist);
  try
    F.Append;
    F.WriteStrW(S);
  finally
    F.Free;
  end;
end;



{                                                                              }
{ TStringWriter                                                                }
{                                                                              }
function TStringWriter.GetPosition: Int64;
begin
  Result := FPos;
end;

procedure TStringWriter.SetPosition(const Position: Int64);
begin
  if (Position < 0) or (Position > High(Integer)) then
    raise EFileWriter.Create(SInvalidPosition);
  FPos := Integer(Position);
end;

function TStringWriter.GetSize: Int64;
begin
  Result := FSize;
end;

procedure TStringWriter.SetSize(const Size: Integer);
var L : Integer;
begin
  if Size = FSize then
    exit;
  L := Length(FData);
  if Size > L then
    begin
      // memory allocation strategy
      if L = 0 then        // first allocation is exactly as requested
        L := Size else
      if Size < 16 then    // if grow to < 16 then allocate 16
        L := 16
      else                 // if grow to >= 16 then pre-allocate 1/4
        L := Size + (Size shr 2);
      SetLength(FData, L);
    end;
  FSize := Size;
end;

procedure TStringWriter.SetSize(const Size: Int64);
begin
  if Size > High(Integer) then
    raise EFileWriter.Create(SInvalidSize);
  SetSize(Integer(Size));
end;

function TStringWriter.GetAsString: AnsiString;
var L : Integer;
begin
  L := Length(FData);
  if L = FSize then
    Result := FData
  else
    Result := Copy(FData, 1, FSize);
end;

procedure TStringWriter.SetAsString(const S: AnsiString);
begin
  FData := S;
  FSize := Length(S);
  FPos := FSize;
end;

function TStringWriter.Write(const Buffer; const Size: Integer): Integer;
var I, J : Integer;
    P    : PAnsiChar;
begin
  if Size <= 0 then
    begin
      Result := 0;
      exit;
    end;
  I := FPos;
  J := I + Size;
  if J > FSize then
    SetSize(J);
  P := Pointer(FData);
  Inc(P, I);
  Move(Buffer, P^, Size);
  Result := Size;
  FPos := J;
end;

procedure TStringWriter.WriteStrA(const Buffer: AnsiString);
begin
  Write(Pointer(Buffer)^, Length(Buffer));
end;

procedure TStringWriter.WriteByte(const V: Byte);
var I, J : Integer;
    P    : PAnsiChar;
begin
  I := FPos;
  J := I + 1;
  if J > FSize then
    SetSize(J);
  P := Pointer(FData);
  Inc(P, I);
  PByte(P)^ := V;
  FPos := J;
end;



{                                                                              }
{ TWideStringWriter                                                            }
{                                                                              }
function TWideStringWriter.GetPosition: Int64;
begin
  Result := FPos;
end;

procedure TWideStringWriter.SetPosition(const Position: Int64);
begin
  if (Position < 0) or (Position > High(Integer)) then
    raise EFileWriter.Create(SInvalidPosition);
  FPos := Integer(Position);
end;

function TWideStringWriter.GetSize: Int64;
begin
  Result := FSize;
end;

procedure TWideStringWriter.SetSize(const Size: Integer);
var L : Integer;
begin
  if Size = FSize then
    exit;
  L := Length(FData) * Sizeof(WideChar);
  if Size > L then
    begin
      // memory allocation strategy
      if L = 0 then        // first allocation is exactly as request
        L := Size else
      if Size < 16 then    // if grow to < 16 then allocate 16
        L := 16 else
        L := Size + (Size shr 2); // if grow to > 16 then pre-allocate 1/4
      SetLength(FData, (L + 1) div Sizeof(WideChar));
    end;
  FSize := Size;
end;

procedure TWideStringWriter.SetSize(const Size: Int64);
begin
  if Size > High(Integer) then
    raise EFileWriter.Create(SInvalidSize);
  SetSize(Integer(Size));
end;

function TWideStringWriter.GetAsWideString: WideString;
var L : Integer;
begin
  L := Length(FData) * Sizeof(WideChar);
  if L = FSize then
    Result := FData else
    Result := Copy(FData, 1, FSize div Sizeof(WideChar));
end;

procedure TWideStringWriter.SetAsWideString(const S: WideString);
begin
  FData := S;
  FSize := Length(S) * Sizeof(WideChar);
  FPos := FSize;
end;

function TWideStringWriter.Write(const Buffer; const Size: Integer): Integer;
var I, J : Integer;
    P    : PAnsiChar;
begin
  if Size <= 0 then
    begin
      Result := 0;
      exit;
    end;
  I := FPos;
  J := I + Size;
  if J > FSize then
    SetSize(J);
  P := Pointer(FData);
  Inc(P, I);
  Move(Buffer, P^, Size);
  Result := Size;
  FPos := J;
end;

procedure TWideStringWriter.WriteStrA(const Buffer: AnsiString);
begin
  Write(Pointer(Buffer)^, Length(Buffer));
end;

procedure TWideStringWriter.WriteStrW(const Buffer: WideString);
begin
  Write(Pointer(Buffer)^, Length(Buffer) * Sizeof(WideChar));
end;

procedure TWideStringWriter.WriteByte(const V: Byte);
var I, J : Integer;
    P    : PAnsiChar;
begin
  I := FPos;
  J := I + 1;
  if J > FSize then
    SetSize(J);
  P := Pointer(FData);
  Inc(P, I);
  PByte(P)^ := V;
  FPos := J;
end;

procedure TWideStringWriter.WriteWord(const V: Word);
var I, J : Integer;
    P    : PAnsiChar;
begin
  I := FPos;
  J := I + 2;
  if J > FSize then
    SetSize(J);
  P := Pointer(FData);
  Inc(P, I);
  PWord(P)^ := V;
  FPos := J;
end;



{                                                                              }
{ TOutputWriter                                                                }
{                                                                              }
function TOutputWriter.Write(const Buffer; const Size: Integer): Integer;
var I : Integer;
    P : PByte;
begin
  if Size <= 0 then
    begin
      Result := 0;
      exit;
    end;
  P := @Buffer;
  For I := 1 to Size do
    begin
      System.Write(Char(P^));
      Inc(P);
    end;
  Result := Size;
end;



{                                                                              }
{ EStreamOperationAborted                                                      }
{                                                                              }
constructor EStreamOperationAborted.Create;
begin
  inherited Create('Stream operation aborted');
end;



{                                                                              }
{ TStreamReaderProxy                                                           }
{                                                                              }
constructor TStreamReaderProxy.Create(const Stream: AStream);
begin
  inherited Create;
  Assert(Assigned(Stream));
  FStream := Stream;
end;

function TStreamReaderProxy.GetPosition: Int64;
begin
  Result := FStream.Position;
end;

procedure TStreamReaderProxy.SetPosition(const Position: Int64);
begin
  FStream.Position := Position;
end;

function TStreamReaderProxy.GetSize: Int64;
begin
  Result := FStream.Size;
end;

function TStreamReaderProxy.Read(var Buffer; const Size: Integer): Integer;
begin
  Result := FStream.Read(Buffer, Size)
end;

function TStreamReaderProxy.EOF: Boolean;
begin
  Result := FStream.EOF;
end;



{                                                                              }
{ TStreamWriterProxy                                                           }
{                                                                              }
constructor TStreamWriterProxy.Create(const Stream: AStream);
begin
  inherited Create;
  Assert(Assigned(Stream));
  FStream := Stream;
end;

function TStreamWriterProxy.GetPosition: Int64;
begin
  Result := FStream.Position;
end;

procedure TStreamWriterProxy.SetPosition(const Position: Int64);
begin
  FStream.Position := Position;
end;

function TStreamWriterProxy.GetSize: Int64;
begin
  Result := FStream.Size;
end;

procedure TStreamWriterProxy.SetSize(const Size: Int64);
begin
  FStream.Size := Size;
end;

function TStreamWriterProxy.Write(const Buffer; const Size: Integer): Integer;
begin
  Result := FStream.Write(Buffer, Size)
end;



{                                                                              }
{ CopyStream                                                                   }
{                                                                              }
const
  DefaultBlockSize = 2048;

function CopyStream(const Source, Destination: AStream; const SourceOffset: Int64;
    const DestinationOffset: Int64; const BlockSize: Integer; const Count: Int64;
    const ProgressCallback: TCopyProgressProcedure; const CopyFromBack: Boolean): Int64;
var Buf     : Pointer;
    L, I, C : Integer;
    R, S, D : Int64;
    A       : Boolean;
begin
  if not Assigned(Source) then
    raise EStream.Create(SInvalidParameter);
  if not Assigned(Destination) then
    raise EStream.Create(SInvalidParameter);
  S := SourceOffset;
  D := DestinationOffset;
  if (S < 0) or (D < 0) then
    raise EStream.Create(SInvalidParameter);
  if (Source = Destination) and (Count < 0) and (S < D) then
    raise EStream.Create(SInvalidParameter);
  A := False;
  if Assigned(ProgressCallback) then
    begin
      ProgressCallback(Source, Destination, 0, A);
      if A then
        raise EStreamOperationAborted.Create;
    end;
  Result := 0;
  R := Count;
  if R = 0 then
    exit;
  L := BlockSize;
  if L <= 0 then
    L := DefaultBlockSize;
  if (R > 0) and (R < L) then
    L := Integer(R);
  if CopyFromBack then
    begin
      if R < 0 then
        raise EStream.Create(SInvalidParameter);
      Inc(S, R - L);
      Inc(D, R - L);
    end;
  GetMem(Buf, L);
  try
    While not Source.EOF and (R <> 0) do
      begin
        C := L;
        if (R > 0) and (R < C) then
          C := Integer(R);
        if CopyFromBack then
          Source.Position := S;
        I := Source.Read(Buf^, C);
        if (I <= 0) and not Source.EOF then
          raise EStream.Create(SStreamReadError);
        if CopyFromBack then
          Destination.Position := D;
        Destination.WriteBuffer(Buf^, I);
        Inc(Result, I);
        if R > 0 then
          Dec(R, I);
        if CopyFromBack then
          begin
            Dec(S, I);
            Dec(D, I);
          end
        else
          begin
            Inc(S, I);
            Inc(D, I);
          end;
        if Assigned(ProgressCallback) then
          begin
            ProgressCallback(Source, Destination, Result, A);
            if A then
              raise EStreamOperationAborted.Create;
          end;
      end;
  finally
    FreeMem(Buf);
  end;
end;

function CopyStream(const Source: AReaderEx; const Destination: AWriterEx;
    const BlockSize: Integer; const CopyDataEvent: TCopyDataEvent): Int64;
var Buf  : Pointer;
    L, I : Integer;
begin
  if not Assigned(Source) then
    raise EStream.Create(SInvalidParameter);
  if not Assigned(Destination) then
    raise EStream.Create(SInvalidParameter);
  L := BlockSize;
  if L <= 0 then
    L := DefaultBlockSize;
  Result := 0;
  GetMem(Buf, L);
  try
    While not Source.EOF do
      begin
        I := Source.Read(Buf^, L);
        if (I = 0) and not Source.EOF then
          Source.RaiseReadError;
        Destination.WriteBuffer(Buf^, I);
        if Assigned(CopyDataEvent) then
          CopyDataEvent(Result, Buf, I);
        Inc(Result, I);
      end;
  finally
    FreeMem(Buf);
  end;
end;

procedure DeleteStreamRange(const Stream: AStream; const Position, Count: Int64;
    const ProgressCallback: TCopyProgressProcedure);
begin
  if Count <= 0 then
    exit;
  if CopyStream(Stream, Stream, Position + Count, Position, 0, Count,
      ProgressCallback, False) <> Count then
    raise EStream.Create(SStreamCopyError);
end;

procedure InsertStreamRange(const Stream: AStream; const Position, Count: Int64;
    const ProgressCallback: TCopyProgressProcedure);
begin
  if Count <= 0 then
    exit;
  if CopyStream(Stream, Stream, Position, Position + Count, 0, Count,
      ProgressCallback, True) <> Count then
    raise EStream.Create(SStreamCopyError);
end;



{                                                                              }
{ AStream                                                                      }
{                                                                              }
function AStream.EOF: Boolean;
begin
  Result := Position >= Size;
end;

procedure AStream.Truncate;
begin
  Size := Position;
end;

procedure AStream.ReadBuffer(var Buffer; const Size: Integer);
begin
  if Size <= 0 then
    exit;
  if Read(Buffer, Size) <> Size then
    raise EStream.Create(SReadError);
end;

function AStream.ReadByte: Byte;
begin
  ReadBuffer(Result, 1);
end;

function AStream.ReadStrA(const Size: Integer): AnsiString;
var L : Integer;
begin
  if Size <= 0 then
    begin
      Result := '';
      exit;
    end;
  SetLength(Result, Size);
  L := Read(Pointer(Result)^, Size);
  if L <= 0 then
    begin
      Result := '';
      exit;
    end;
  if L < Size then
    SetLength(Result, L);
end;

procedure AStream.WriteBuffer(const Buffer; const Size: Integer);
begin
  if Size <= 0 then
    exit;
  if Write(Buffer, Size) <> Size then
    raise EStream.Create(SWriteError);
end;

procedure AStream.WriteStrA(const S: AnsiString);
begin
  WriteBuffer(Pointer(S)^, Length(S));
end;

procedure AStreamCopyCallback(const Source, Destination: AStream;
    const BytesCopied: Int64; var Abort: Boolean);
begin
  Assert(Assigned(Source) and Assigned(Destination) and not Abort);
  Source.TriggerCopyProgressEvent(Source, Destination, BytesCopied, Abort);
  if Abort then
    exit;
  Destination.TriggerCopyProgressEvent(Source, Destination, BytesCopied, Abort);
end;

procedure AStream.TriggerCopyProgressEvent(const Source, Destination: AStream;
    const BytesCopied: Int64; var Abort: Boolean);
begin
  if Assigned(FOnCopyProgress) then
    FOnCopyProgress(Source, Destination, BytesCopied, Abort);
end;

procedure AStream.Assign(const Source: TObject);
begin
  if not Assigned(Source) then
    raise EStream.Create(SInvalidParameter);
  if Source is AStream then
    Size := CopyStream(AStream(Source), self, 0, 0, 0, -1, AStreamCopyCallback, False)
  else
    raise EStream.Create(SInvalidParameter);
end;

function AStream.WriteTo(const Destination: AStream; const BlockSize: Integer;
    const Count: Int64): Int64;
begin
  Result := CopyStream(self, Destination, Position, Destination.Position,
      BlockSize, Count, AStreamCopyCallback, False);
end;



{                                                                              }
{ TReaderWriter                                                                }
{                                                                              }
constructor TReaderWriter.Create(const Reader: AReaderEx; const Writer: AWriterEx;
    const ReaderOwner: Boolean; const WriterOwner: Boolean);
begin
  inherited Create;
  FReader := Reader;
  FReaderOwner := ReaderOwner;
  FWriter := Writer;
  FWriterOwner := WriterOwner;
end;

destructor TReaderWriter.Destroy;
begin
  if FReaderOwner then
    FReader.Free;
  FReader := nil;
  if FWriterOwner then
    FWriter.Free;
  FWriter := nil;
  inherited Destroy;
end;

procedure TReaderWriter.RaiseNoReaderError;
begin
  raise EReaderWriter.Create(SNoReader);
end;

procedure TReaderWriter.RaiseNoWriterError;
begin
  raise EReaderWriter.Create(SNoWriter);
end;

function TReaderWriter.GetReader: AReaderEx;
begin
  Result := FReader;
end;

function TReaderWriter.GetWriter: AWriterEx;
begin
  Result := FWriter;
end;

function TReaderWriter.GetPosition: Int64;
begin
  if Assigned(FReader) then
    Result := FReader.Position else
  if Assigned(FWriter) then
    Result := FWriter.Position else
    Result := 0;
end;

procedure TReaderWriter.SetPosition(const Position: Int64);
begin
  if Assigned(FReader) then
    FReader.Position := Position;
  if Assigned(FWriter) then
    FWriter.Position := Position;
end;

function TReaderWriter.GetSize: Int64;
begin
  if Assigned(FWriter) then
    Result := FWriter.Size else
  if Assigned(FReader) then
    Result := FReader.Size else
    Result := 0;
end;

procedure TReaderWriter.SetSize(const Size: Int64);
begin
  if not Assigned(FWriter) then
    RaiseNoWriterError;
  FWriter.Size := Size;
end;

function TReaderWriter.Read(var Buffer; const Size: Integer): Integer;
begin
  if not Assigned(FReader) then
    RaiseNoReaderError;
  Result := FReader.Read(Buffer, Size);
end;

function TReaderWriter.Write(const Buffer; const Size: Integer): Integer;
begin
  if not Assigned(FWriter) then
    RaiseNoWriterError;
  Result := FWriter.Write(Buffer, Size);
end;

function TReaderWriter.EOF: Boolean;
begin
  if Assigned(FReader) then
    Result := FReader.EOF else
  if Assigned(FWriter) then
    Result := FWriter.Position >= FWriter.Size else
    Result := True;
end;

procedure TReaderWriter.Truncate;
begin
  if not Assigned(FWriter) then
    RaiseNoWriterError;
  FWriter.Truncate;
end;



{                                                                              }
{ TFileStream                                                                  }
{                                                                              }
const
  WriterModes: Array[TFileStreamOpenMode] of TFileWriterOpenMode =
      (fwomOpen, fwomOpen, fwomCreate, fwomCreateIfNotExist, fwomOpen);
  ReaderAccessHints: Array[TFileStreamAccessHint] of TFileReaderAccessHint =
      (frahNone, frahRandomAccess, frahSequentialAccess);
  WriterAccessHints: Array[TFileStreamAccessHint] of TFileWriterAccessHint =
      (fwahNone, fwahRandomAccess, fwahSequentialAccess);

constructor TFileStream.Create(const FileName: String;
    const OpenMode: TFileStreamOpenMode; const Options: TFileStreamOptions;
    const AccessHint: TFileStreamAccessHint);
var W : TFileWriter;
    R : AReaderEx;
    T : TFileWriterOptions;
begin
  FFileName := FileName;
  FOpenMode := OpenMode;
  FOptions := Options;
  FAccessHint := AccessHint;
  R := nil;
  W := nil;
  T := [];
  if fsoWriteThrough in Options then
    Include(T, fwoWriteThrough);
  Case OpenMode of
    fsomRead :
      R := TFileReader.Create(FileName, ReaderAccessHints[AccessHint]);
    fsomCreateOnWrite :
      try
        W := TFileWriter.Create(FileName, fwomOpen, T,
            WriterAccessHints[AccessHint]);
      except
        W := nil;
      end;
    else
      W := TFileWriter.Create(FileName, WriterModes[OpenMode], T,
          WriterAccessHints[AccessHint]);
  end;
  if Assigned(W) then
    try
      R := TFileReader.Create(W.Handle, False);
    except
      W.Free;
      raise;
    end;
  inherited Create(R, W, True, True);
end;

constructor TFileStream.Create(const FileHandle: Integer; const HandleOwner: Boolean);
var W : TFileWriter;
    R : TFileReader;
begin
  W := TFileWriter.Create(FileHandle, HandleOwner);
  try
    R := TFileReader.Create(FileHandle, False);
  except
    W.Free;
    raise;
  end;
  inherited Create(R, W, True, True);
end;

function TFileStream.GetFileHandle: Integer;
begin
  Assert(Assigned(FReader));
  Result := TFileReader(FReader).Handle;
end;

function TFileStream.GetFileCreated: Boolean;
begin
  Result := Assigned(FWriter) and TFileWriter(FWriter).FileCreated;
end;

procedure TFileStream.DeleteFile;
begin
  if FFileName = '' then
    raise EFileStream.Create(SInvalidFileName);
  SysUtils.DeleteFile(FFileName);
end;

procedure TFileStream.EnsureCreateOnWrite;
var T : TFileWriterOptions;
begin
  T := [];
  if fsoWriteThrough in FOptions then
    Include(T, fwoWriteThrough);
  FWriter := TFileWriter.Create(FileName, fwomCreateIfNotExist, T,
      WriterAccessHints[FAccessHint]);
  FReader := TFileReader.Create(TFileWriter(FWriter).Handle, False);
end;

procedure TFileStream.SetPosition(const Position: Int64);
begin
  if (FOpenMode = fsomCreateOnWrite) and not Assigned(FWriter) and
     (Position > 0) then
    EnsureCreateOnWrite;
  if Assigned(FWriter) then
    FWriter.Position := Position else
  if Assigned(FReader) then
    FReader.Position := Position;
end;

procedure TFileStream.SetSize(const Size: Int64);
begin
  if (FOpenMode = fsomCreateOnWrite) and not Assigned(FWriter) then
    EnsureCreateOnWrite;
  inherited SetSize(Size);
end;

function TFileStream.GetReader: AReaderEx;
begin
  if (FOpenMode = fsomCreateOnWrite) and not Assigned(FWriter) then
    EnsureCreateOnWrite;
  Result := FReader;
end;

function TFileStream.GetWriter: AWriterEx;
begin
  if (FOpenMode = fsomCreateOnWrite) and not Assigned(FWriter) then
    EnsureCreateOnWrite;
  Result := FWriter;
end;

function TFileStream.Write(const Buffer; const Size: Integer): Integer;
begin
  if (FOpenMode = fsomCreateOnWrite) and not Assigned(FWriter) then
    EnsureCreateOnWrite;
  Result := inherited Write(Buffer, Size);
end;



{                                                                              }
{ Test cases                                                                   }
{                                                                              }
{$ASSERTIONS ON}
procedure TestReader(const Reader: AReaderEx; const FreeReader: Boolean);
begin
  try
    Reader.Position := 0;
    Assert(not Reader.EOF,                                 'Reader.EOF');
    Assert(Reader.Size = 26,                               'Reader.Size');
    Assert(Reader.PeekStr(0) = '',                         'Reader.PeekStr');
    Assert(Reader.PeekStr(-1) = '',                        'Reader.PeekStr');
    Assert(Reader.PeekStr(2) = '01',                       'Reader.PeekStr');
    Assert(Char(Reader.PeekByte) = '0',                    'Reader.PeekByte');
    Assert(Char(Reader.ReadByte) = '0',                    'Reader.ReadByte');
    Assert(Char(Reader.PeekByte) = '1',                    'Reader.PeekByte');
    Assert(Char(Reader.ReadByte) = '1',                    'Reader.ReadByte');
    Assert(Reader.ReadStrA(0) = '',                         'Reader.ReadStr');
    Assert(Reader.ReadStrA(-1) = '',                        'Reader.ReadStr');
    Assert(Reader.ReadStrA(1) = '2',                        'Reader.ReadStr');
    Assert(Reader.MatchChar('3'),                          'Reader.MatchChar');
    Assert(Reader.MatchStr('3', True),                     'Reader.MatchStr');
    Assert(Reader.MatchStr('345', True),                   'Reader.MatchStr');
    Assert(not Reader.MatchStr('35', True),                'Reader.MatchStr');
    Assert(not Reader.MatchStr('4', True),                 'Reader.MatchStr');
    Assert(not Reader.MatchStr('', True),                  'Reader.MatchStr');
    Assert(Reader.ReadStrA(2) = '34',                       'Reader.ReadStr');
    Assert(Reader.PeekStr(3) = '567',                      'Reader.PeekStr');
    Assert(Reader.Locate('5', False, 0) = 0,               'Reader.Locate');
    Assert(Reader.Locate('8', False, -1) = 3,              'Reader.Locate');
    Assert(Reader.Locate('8', False, 3) = 3,               'Reader.Locate');
    Assert(Reader.Locate('8', False, 2) = -1,              'Reader.Locate');
    Assert(Reader.Locate('8', False, 4) = 3,               'Reader.Locate');
    Assert(Reader.Locate('0', False, -1) = -1,             'Reader.Locate');
    Assert(Reader.Locate(['8'], False, -1) = 3,            'Reader.Locate');
    Assert(Reader.Locate(['8'], False, 3) = 3,             'Reader.Locate');
    Assert(Reader.Locate(['8'], False, 2) = -1,            'Reader.Locate');
    Assert(Reader.Locate(['0'], False, -1) = -1,           'Reader.Locate');
    Assert(Reader.LocateStr('8', -1, True) = 3,            'Reader.LocateStr');
    Assert(Reader.LocateStr('8', 3, True) = 3,             'Reader.LocateStr');
    Assert(Reader.LocateStr('8', 2, True) = -1,            'Reader.LocateStr');
    Assert(Reader.LocateStr('89', -1, True) = 3,           'Reader.LocateStr');
    Assert(Reader.LocateStr('0', -1, True) = -1,           'Reader.LocateStr');
    Assert(not Reader.EOF,                                 'Reader.EOF');
    Assert(Reader.Position = 5,                            'Reader.Position');
    Reader.Position := 7;
    Reader.SkipByte;
    Assert(Reader.Position = 8,                            'Reader.Position');
    Reader.Skip(2);
    Assert(Reader.Position = 10,                           'Reader.Position');
    Assert(not Reader.EOF,                                 'Reader.EOF');
    Assert(Reader.MatchStr('abcd', False),                 'Reader.MatchStr');
    Assert(not Reader.MatchStr('abcd', True),              'Reader.MatchStr');
    Assert(Reader.LocateStr('d', -1, True) = 3,            'Reader.LocateStr');
    Assert(Reader.LocateStr('d', 3, False) = 3,            'Reader.LocateStr');
    Assert(Reader.LocateStr('D', -1, True) = -1,           'Reader.LocateStr');
    Assert(Reader.LocateStr('D', -1, False) = 3,           'Reader.LocateStr');
    Assert(Reader.SkipAll('X', False, -1) = 0,             'Reader.SkipAll');
    Assert(Reader.SkipAll('A', False, -1) = 1,             'Reader.SkipAll');
    Assert(Reader.SkipAll(['b', 'C'], False, -1) = 2,      'Reader.SkipAll');
    Assert(Reader.SkipAll(['d'], False, 0) = 0,            'Reader.SkipAll');
    Assert(Reader.ExtractAll(['d', 'E'], False, 1) = 'd',  'Reader.ExtractAll');
    Assert(Reader.ExtractAll(['*'], True, 1) = 'E',        'Reader.ExtractAll');
    Assert(Reader.ReadStrA(2) = '*.',                       'Reader.ReadStr');
    Assert(Reader.ExtractAll(['X'], False, 1) = 'X',       'Reader.ExtractAll');
    Assert(Reader.ExtractAll(['X'], False, -1) = 'XX',     'Reader.ExtractAll');
    Assert(Reader.ExtractAll(['X', '*'], True, 1) = 'Y',   'Reader.ExtractAll');
    Assert(Reader.ExtractAll(['X', '*'], True, -1) = 'YYY','Reader.ExtractAll');
    Assert(Reader.ExtractAll(['X'], False, -1) = '',       'Reader.ExtractAll');
    Assert(Reader.ExtractAll(['X'], True, -1) = '*.',      'Reader.ExtractAll');
    Assert(Reader.EOF,                                     'Reader.EOF');
    Assert(Reader.Position = 26,                           'Reader.Position');
    Reader.Position := Reader.Position - 2;
    Assert(Reader.PeekStr(3) = '*.',                       'Reader.PeekStr');
    Assert(Reader.ReadStrA(3) = '*.',                       'Reader.ReadStr');
  finally
    if FreeReader then
      Reader.Free;
  end;
end;

procedure TestLineReader(const Reader: AReaderEx; const FreeReader: Boolean);
begin
  try
    Reader.Position := 0;
    Assert(not Reader.EOF,                    'Reader.EOF');
    Assert(Reader.ExtractLine = '1',          'Reader.ExtractLine');
    Assert(Reader.ExtractLine = '23',         'Reader.ExtractLine');
    Assert(Reader.ExtractLine = '',           'Reader.ExtractLine');
    Assert(Reader.ExtractLine = '4',          'Reader.ExtractLine');
    Assert(Reader.ExtractLine = '5',          'Reader.ExtractLine');
    Assert(Reader.ExtractLine = '6',          'Reader.ExtractLine');
    Assert(Reader.EOF,                        'Reader.EOF');

    Reader.Position := 0;
    Assert(Reader.ExtractLine(-1, [eolCRLF, eolEOF]) = '1', 'Reader.ExtractLine');
    Assert(Reader.ExtractLine(-1, [eolCRLF, eolEOF]) = '23'#13#13'4'#10'5'#10#13'6', 'Reader.ExtractLine');
    Assert(Reader.EOF, 'Reader.EOF');

    Reader.Position := 0;
    Assert(Reader.ExtractLine(-1, [eolCR, eolEOF]) = '1', 'Reader.ExtractLine');
    Assert(Reader.ExtractLine(-1, [eolCR, eolEOF]) = #10'23', 'Reader.ExtractLine');
    Assert(Reader.ExtractLine(-1, [eolCR, eolEOF]) = '', 'Reader.ExtractLine');
    Assert(Reader.ExtractLine(-1, [eolCR, eolEOF]) = '4'#10'5'#10, 'Reader.ExtractLine');
    Assert(Reader.ExtractLine(-1, [eolCR, eolEOF]) = '6', 'Reader.ExtractLine');
    Assert(Reader.EOF, 'Reader.EOF');

    Reader.Position := 0;
    Assert(Reader.ExtractLine(-1, [eolCR, eolCRLF, eolEOF]) = '1', 'Reader.ExtractLine');
    Assert(Reader.ExtractLine(-1, [eolCR, eolCRLF, eolEOF]) = '23', 'Reader.ExtractLine');
    Assert(Reader.ExtractLine(-1, [eolCR, eolCRLF, eolEOF]) = '', 'Reader.ExtractLine');
    Assert(Reader.ExtractLine(-1, [eolCR, eolCRLF, eolEOF]) = '4'#10'5'#10, 'Reader.ExtractLine');
    Assert(Reader.ExtractLine(-1, [eolCR, eolCRLF, eolEOF]) = '6', 'Reader.ExtractLine');
    Assert(Reader.EOF, 'Reader.EOF');

    Reader.Position := 0;
    Assert(Reader.SkipLine(-1, [eolCRLF, eolEOF]), 'Reader.SkipLine');
    Assert(Reader.SkipLine(-1, [eolCRLF, eolEOF]), 'Reader.SkipLine');
    Assert(Reader.EOF, 'Reader.EOF');

    Reader.Position := 0;
    Assert(Reader.SkipLine(-1, [eolCR, eolCRLF, eolEOF]), 'Reader.SkipLine');
    Assert(Reader.SkipLine(-1, [eolCR, eolCRLF, eolEOF]), 'Reader.SkipLine');
    Assert(Reader.SkipLine(-1, [eolCR, eolCRLF, eolEOF]), 'Reader.SkipLine');
    Assert(Reader.SkipLine(-1, [eolCR, eolCRLF, eolEOF]), 'Reader.SkipLine');
    Assert(Reader.SkipLine(-1, [eolCR, eolCRLF, eolEOF]), 'Reader.SkipLine');
    Assert(Reader.EOF, 'Reader.EOF');
  finally
    if FreeReader then
      Reader.Free;
  end;
end;

type
  TUnsizedStringReader = class(TStringReader)
  protected
    function  GetSize: Int64; override;
  end;

function TUnsizedStringReader.GetSize: Int64;
begin
  Result := -1;
end;

procedure TestUnsizedReader(const Data: AnsiString);
var S : TUnsizedStringReader;
    T : AnsiString;
begin
  S := TUnsizedStringReader.Create(Data);
  try
    T := S.GetToEOF;
    Assert(T = Data,     'UnsizedReader.GetToEOF');
    Assert(S.EOF,        'UnsizedReader.EOF');
  finally
    S.Free;
  end;
end;

procedure SelfTestReader;
var S : TStringReader;
    I : Integer;
    T : AnsiString;
    B : TFileReader;
begin
  S := TStringReader.Create('0123456789AbCdE*.XXXYYYY*.');
  try
    TestReader(TReaderProxy.Create(S, False, -1), True);
    TestReader(S, False);
    TestReader(TBufferedReader.Create(S, 128, False), True);
    For I := 1 to 16 do
      TestReader(TBufferedReader.Create(S, I, False), True);
    TestReader(TSplitBufferedReader.Create(S, 128, False), True);
    For I := 1 to 16 do
      TestReader(TSplitBufferedReader.Create(S, I, False), True);
  finally
    S.Free;
  end;

  S := TStringReader.Create('1'#13#10'23'#13#13'4'#10'5'#10#13'6');
  try
    TestLineReader(TReaderProxy.Create(S, False, -1), True);
    For I := 1 to 32 do
      TestLineReader(TBufferedReader.Create(S, I, False), True);
    For I := 1 to 32 do
      TestLineReader(TSplitBufferedReader.Create(S, I, False), True);
    TestLineReader(S, False);
  finally
    S.Free;
  end;

  TestUnsizedReader('');
  TestUnsizedReader('A');
  TestUnsizedReader('ABC');
  T := '';
  For I := 1 to 1000 do
    T := T + 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  TestUnsizedReader(T);

  try
    WriteStrToFile('selftestfile', '0123456789AbCdE*.XXXYYYY*.', fwomCreate);
    B := TFileReader.Create('selftestfile');
    TestReader(B, True);
    WriteStrToFile('selftestfile', '1'#13#10'23'#13#13'4'#10'5'#10#13'6', fwomCreate);
    B := TFileReader.Create('selftestfile');
    TestLineReader(B, True);
  finally
    DeleteFile('selftestfile');
  end;
end;

procedure SelfTestWriter;
var A : TStringWriter;
    B : TFileWriter;
begin
  A := TStringWriter.Create;
  A.WriteStrA('123');
  Assert(A.Size = 3, 'Writer.Size');
  Assert(A.GetAsString = '123', 'Writer.GetAsString');
  A.WriteStrA('ABC');
  Assert(A.Size = 6, 'Writer.Size');
  Assert(A.GetAsString = '123ABC', 'Writer.GetAsString');
  A.Free;

  B := TFileWriter.Create('selftestfile', fwomCreate);
  try
    Assert(B.Size = 0, 'Writer.Size');
    B.WriteStrA('123');
    Assert(B.Size = 3, 'Writer.Size');
    B.WriteByte(65);
    Assert(B.Size = 4, 'Writer.Size');
    B.Size := 2;
    Assert(B.Size = 2, 'Writer.Size');
    Assert(B.Position = 2, 'Writer.Position');
  finally
    B.Free;
    DeleteFile('selftestfile');
  end;
end;

procedure SelfTestStream;
var A : TFileStream;
    S : AnsiString;
begin
  A := TFileStream.Create('selftestfile', fsomCreate);
  try
    Assert(A.Size = 0, 'Stream.Size');
    Assert(A.Position = 0, 'Stream.Position');
    A.WriteStrA('123');
    Assert(A.Size = 3, 'Stream.Size');
    A.WriteStrA('ABC');
    Assert(A.Size = 6, 'Stream.Size');
    Assert(A.Position = 6, 'Stream.Position');
    A.SetPosition(1);
    Assert(A.Position = 1, 'Stream.Position');
    S := A.ReadStrA(3);
    Assert(S = '23A', 'Stream.ReadStr');
    S := A.ReadStrA(3);
    Assert(S = 'BC', 'Stream.ReadStr');
  finally
    A.Free;
    DeleteFile('selftestfile');
  end;
end;

procedure SelfTest;
begin
  SelfTestReader;
  SelfTestWriter;
  SelfTestStream;
end;



end.

