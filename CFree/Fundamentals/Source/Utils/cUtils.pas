{***************************************************************************** }
{                                                                              }
{   Library:          Fundamentals 4.00                                        }
{   File name:        cUtils.pas                                               }
{   File version:     4.46                                                     }
{   Description:      Utility functions for simple data types and dynamic      }
{                     arrays                                                   }
{                                                                              }
{   Copyright:        Copyright © 2000-2011, David J Butler                    }
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
{   2000/02/02  0.01  Initial version.                                         }
{   2000/03/08  1.02  Added array functions.                                   }
{   2000/04/10  1.03  Added Append, Renamed Delete to Remove and added         }
{                     StringArrays.                                            }
{   2000/05/03  1.04  Added Path functions.                                    }
{   2000/05/08  1.05  Revision.                                                }
{   2000/06/01  1.06  Added Range and Dup constructors for dynamic arrays.     }
{   2000/06/03  1.07  Added ArrayInsert functions.                             }
{   2000/06/06  1.08  Added bit functions from cMaths.                         }
{   2000/06/08  1.09  Removed data structure classes.                          }
{   2000/06/10  1.10  Added linked lists for Integer, Int64, Extended and      }
{                     String.                                                  }
{   2000/06/14  1.11  cUtils now generated from a template using a source      }
{                     pre-processor.                                           }
{   2000/07/04  1.12  Revision for first Fundamentals release.                 }
{   2000/07/24  1.13  Added TrimArray functions.                               }
{   2000/07/26  1.14  Added Difference functions.                              }
{   2000/09/02  1.15  Added RemoveDuplicates functions.                        }
{                     Added Count functions.                                   }
{                     Fixed bug in Sort.                                       }
{   2000/09/27  1.16  Fixed bug in ArrayInsert.                                }
{   2000/11/29  1.17  Moved SetFPUPrecision to cSysUtils.                      }
{   2001/05/03  1.18  Improved bit functions. Added Pascal versions of         }
{                     assembly routines.                                       }
{   2001/05/13  1.19  Added CharCount.                                         }
{   2001/05/15  1.20  Added PosNext (ClassType, ObjectArray).                  }
{   2001/05/18  1.21  Added hashing functions from cMaths.                     }
{   2001/07/07  1.22  Added TBinaryTreeNode.                                   }
{   2001/11/11  2.23  Revision.                                                }
{   2002/01/03  2.24  Added EncodeBase64, DecodeBase64 from cMaths and         }
{                     optimized. Added LongWordToHex, HexToLongWord.           }
{   2002/03/30  2.25  Fixed bug in DecodeBase64.                               }
{   2002/04/02  2.26  Removed dependencies on all other units to remove        }
{                     initialization code associated with SysUtils. This       }
{                     allows usage of cUtils in projects and still have        }
{                     very small binaries.                                     }
{                     Fixed bug in LongWordToHex.                              }
{   2002/05/31  3.27  Refactored for Fundamentals 3.                           }
{                     Moved linked lists to cLinkedLists.                      }
{   2002/08/09  3.28  Added HashInteger.                                       }
{   2002/10/06  3.29  Renamed Cond to iif.                                     }
{   2002/12/12  3.30  Small revisions.                                         }
{   2003/03/14  3.31  Removed ApproxZero. Added FloatZero, FloatsEqual and     }
{                     FloatsCompare. Added documentation and test cases for    }
{                     comparison functions.                                    }
{                     Added support for Currency type.                         }
{   2003/07/27  3.32  Added fast ZeroMem and FillMem routines.                 }
{   2003/09/11  3.33  Added InterfaceArray functions.                          }
{   2004/01/18  3.34  Added WideStringArray functions.                         }
{   2004/07/24  3.35  Optimizations of Sort functions.                         }
{   2004/08/01  3.36  Improved validation in base conversion routines.         }
{   2004/08/22  3.37  Compilable with Delphi 8.                                }
{   2005/06/10  4.38  Compilable with FreePascal 2 Win32 i386.                 }
{   2005/08/19  4.39  Compilable with FreePascal 2 Linux i386.                 }
{   2005/09/21  4.40  Revised for Fundamentals 4.                              }
{   2006/03/04  4.41  Compilable with Delphi 2006 Win32/.NET.                  }
{   2007/06/08  4.42  Compilable with FreePascal 2.04 Win32 i386               }
{   2007/08/08  4.43  Changes to memory functions for Delphi 2006/2007.        }
{   2008/06/06  4.44  Fixed bug in case insensitive hashing functions.         }
{   2009/10/09  4.45  Compilable with Delphi 2009 Win32/.NET.                  }
{   2010/06/27  4.46  Compilable with FreePascal 2.4.0 OSX x86-64.             }
{                                                                              }
{ Supported compilers:                                                         }
{                                                                              }
{   Delphi 5 Win32 i386                                                        }
{   Delphi 6 Win32 i386                                                        }
{   Delphi 7 Win32 i386                 4.45  2009/10/09                       }
{   Delphi 8 .NET                                                              }
{   Delphi 2005 Win32 i386                                                     }
{   Delphi 2006 Win32 i386                                                     }
{   Delphi 2007 Win32 i386              4.45  2009/10/09                       }
{   Delphi 2009 Win32 i386              4.46  2011/09/27                       }
{   Delphi 2009 .NET                    4.45  2009/10/09                       }
{   FreePascal 2 Win32 i386                                                    }
{   FreePascal 2.0.4 Linux i386                                                }
{   FreePascal 2.4.0 OSX x86-64         4.46  2010/06/27                       }
{                                                                              }
{ Notes:                                                                       }
{                                                                              }
{   This unit doesn't depend on any other units, including standard system     }
{   units such as SysUtils. This allows it to be used in projects that         }
{   require very small binaries.                                               }
{                                                                              }
{******************************************************************************}

{$INCLUDE cDefines.inc}

{$IFDEF FREEPASCAL}
  {$WARNINGS OFF}
  {$HINTS OFF}
{$ENDIF}

{$IFDEF DEBUG}
{$IFDEF SELFTEST}
  {$DEFINE UTILS_SELFTEST}
{$ENDIF}
{$ENDIF}

unit cUtils;

interface



{                                                                              }
{ Fundamentals Library constants                                               }
{                                                                              }
const
  LibraryVersion      = '4.00';
  LibraryMajorVersion = 4;
  LibraryMinorVersion = 0;
  LibraryName         = 'Fundamentals ' + LibraryVersion;
  LibraryCopyright    = 'Copyright (c) 1998-2011 David J Butler';



{                                                                              }
{ Integer types                                                                }
{                                                                              }
{   Unsigned integers                   Signed integers                        }
{   --------------------------------    --------------------------------       }
{   Byte      unsigned 8 bits           ShortInt  signed 8 bits                }
{   Word      unsigned 16 bits          SmallInt  signed 16 bits               }
{   LongWord  unsigned 32 bits          LongInt   signed 32 bits               }
{   -                                   Int64     signed 64 bits               }
{   Cardinal  unsigned system word      Integer   signed system word           }
{                                                                              }
type
  Int8      = ShortInt;
  Int16     = SmallInt;
  Int32     = LongInt;

  LargeInt  = Int64;

  Word8     = Byte;
  Word16    = Word;
  Word32    = LongWord;

  UInt8     = Word8;
  UInt16    = Word16;
  UInt32    = Word32;

  {$IFDEF DELPHI5_DOWN}
  PByte     = ^Byte;
  PWord     = ^Word;
  PLongWord = ^LongWord;
  PShortInt = ^ShortInt;
  PSmallInt = ^SmallInt;
  PLongInt  = ^LongInt;
  PInteger  = ^Integer;
  PInt64    = ^Int64;
  {$ENDIF}

  PInt8     = ^Int8;
  PInt16    = ^Int16;
  PInt32    = ^Int32;

  PLargeInt = ^LargeInt;

  PWord8    = ^Word8;
  PWord16   = ^Word16;
  PWord32   = ^Word32;

  PUInt8    = ^UInt8;
  PUInt16   = ^UInt16;
  PUInt32   = ^UInt32;

  {$IFNDEF ManagedCode}
  SmallIntRec = packed record
    case Integer of
      0 : (Lo, Hi : Byte);
      1 : (Bytes  : array[0..1] of Byte);
  end;

  LongIntRec = packed record
    case Integer of
      0 : (Lo, Hi : Word);
      1 : (Words  : array[0..1] of Word);
      2 : (Bytes  : array[0..3] of Byte);
  end;
  PLongIntRec = ^LongIntRec;
  {$ENDIF}

const
  MinByte     = Low(Byte);
  MaxByte     = High(Byte);
  MinWord     = Low(Word);
  MaxWord     = High(Word);
  MinShortInt = Low(ShortInt);
  MaxShortInt = High(ShortInt);
  MinSmallInt = Low(SmallInt);
  MaxSmallInt = High(SmallInt);
  MinLongWord = LongWord(Low(LongWord));
  MaxLongWord = LongWord(High(LongWord));
  MinLongInt  = LongInt(Low(LongInt));
  MaxLongInt  = LongInt(High(LongInt));
  MaxInt64    = Int64(High(Int64));
  MinInt64    = Int64(Low(Int64));
  MinInteger  = Integer(Low(Integer));
  MaxInteger  = Integer(High(Integer));
  MinCardinal = Cardinal(Low(Cardinal));
  MaxCardinal = Cardinal(High(Cardinal));

const
  BitsPerByte      = 8;
  BitsPerWord      = 16;
  BitsPerLongWord  = 32;
  BytesPerCardinal = Sizeof(Cardinal);
  BitsPerCardinal  = BytesPerCardinal * 8;

{ Min returns smallest of A and B                                              }
{ Max returns greatest of A and B                                              }
function  MinI(const A, B: Integer): Integer;   {$IFDEF UseInline}inline;{$ENDIF}
function  MaxI(const A, B: Integer): Integer;   {$IFDEF UseInline}inline;{$ENDIF}
function  MinC(const A, B: Cardinal): Cardinal; {$IFDEF UseInline}inline;{$ENDIF}
function  MaxC(const A, B: Cardinal): Cardinal; {$IFDEF UseInline}inline;{$ENDIF}

{ Clip returns Value if in Low..High range, otherwise Low or High              }
function  Clip(const Value: LongInt; const Low, High: LongInt): LongInt; overload; {$IFDEF UseInline}inline;{$ENDIF}
function  Clip(const Value: Int64; const Low, High: Int64): Int64; overload;       {$IFDEF UseInline}inline;{$ENDIF}
function  ClipByte(const Value: LongInt): LongInt; overload;                       {$IFDEF UseInline}inline;{$ENDIF}
function  ClipByte(const Value: Int64): Int64; overload;                           {$IFDEF UseInline}inline;{$ENDIF}
function  ClipWord(const Value: LongInt): LongInt; overload;                       {$IFDEF UseInline}inline;{$ENDIF}
function  ClipWord(const Value: Int64): Int64; overload;                           {$IFDEF UseInline}inline;{$ENDIF}
function  ClipLongWord(const Value: Int64): LongWord;                              {$IFDEF UseInline}inline;{$ENDIF}
function  SumClipI(const A, I: Integer): Integer;
function  SumClipC(const A: Cardinal; const I: Integer): Cardinal;

{ InXXXRange returns True if A in range of type XXX                            }
function  InByteRange(const A: Int64): Boolean;     {$IFDEF UseInline}inline;{$ENDIF}
function  InWordRange(const A: Int64): Boolean;     {$IFDEF UseInline}inline;{$ENDIF}
function  InLongWordRange(const A: Int64): Boolean; {$IFDEF UseInline}inline;{$ENDIF}
function  InShortIntRange(const A: Int64): Boolean; {$IFDEF UseInline}inline;{$ENDIF}
function  InSmallIntRange(const A: Int64): Boolean; {$IFDEF UseInline}inline;{$ENDIF}
function  InLongIntRange(const A: Int64): Boolean;  {$IFDEF UseInline}inline;{$ENDIF}



{                                                                              }
{ Boolean types                                                                }
{                                                                              }
{   Boolean    -        -                                                      }
{   ByteBool   Bool8    8 bits                                                 }
{   WordBool   Bool16   16 bits                                                }
{   LongBool   Bool32   32 bits                                                }
{                                                                              }
type
  Bool8     = ByteBool;
  Bool16    = WordBool;
  Bool32    = LongBool;

  {$IFDEF DELPHI5_DOWN}
  PBoolean  = ^Boolean;
  PByteBool = ^ByteBool;
  PWordBool = ^WordBool;
  {$ENDIF}
  {$IFNDEF FREEPASCAL}
  PLongBool = ^LongBool;
  {$ENDIF}

  PBool8    = ^Bool8;
  PBool16   = ^Bool16;
  PBool32   = ^Bool32;



{                                                                              }
{ Real types                                                                   }
{                                                                              }
{   Floating point                                                             }
{     Single    32 bits  7-8 significant digits                                }
{     Double    64 bits  15-16 significant digits                              }
{     Extended  80 bits  19-20 significant digits (mapped to Double in .NET)   }
{                                                                              }
{   Fixed point                                                                }
{     Currency  64 bits  19-20 significant digits, 4 after the decimal point.  }
{                                                                              }
const
  MinSingle   : Single   = 1.5E-45;
  MaxSingle   : Single   = 3.4E+38;
  MinDouble   : Double   = 5.0E-324;
  MaxDouble   : Double   = 1.7E+308;
  {$IFDEF CLR}
  MinExtended : Extended = 5.0E-324;
  MaxExtended : Extended = 1.7E+308;
  {$ELSE}
  MinExtended : Extended = 3.4E-4932;
  MaxExtended : Extended = 1.1E+4932;
  {$ENDIF}
  {$IFNDEF CLR}
  MinCurrency : Currency = -922337203685477.5807;
  MaxCurrency : Currency = 922337203685477.5807;
  {$ENDIF}

type
  {$IFDEF DELPHI5_DOWN}
  PSingle   = ^Single;
  PDouble   = ^Double;
  PExtended = ^Extended;
  PCurrency = ^Currency;
  {$ENDIF}

  {$IFNDEF ManagedCode}
  ExtendedRec = packed record
    case Boolean of
      True: (
        Mantissa : packed array[0..1] of LongWord; { MSB of [1] is the normalized 1 bit }
        Exponent : Word;                           { MSB is the sign bit                }
      );
      False: (Value: Extended);
  end;
  {$ENDIF}

  {$IFDEF CLR}
  Float  = Double;
  {$ELSE}
  Float  = Extended;
  PFloat = ^Float;
  {$ENDIF}

{$IFNDEF ManagedCode}
const
  ExtendedNan      : ExtendedRec = (Mantissa:($FFFFFFFF, $FFFFFFFF); Exponent:$7FFF);
  ExtendedInfinity : ExtendedRec = (Mantissa:($00000000, $80000000); Exponent:$7FFF);
{$ENDIF}

{ Min returns smallest of A and B                                              }
{ Max returns greatest of A and B                                              }
{ Clip returns Value if in Low..High range, otherwise Low or High              }
function  MinF(const A, B: Float): Float; {$IFDEF UseInline}inline;{$ENDIF}
function  MaxF(const A, B: Float): Float; {$IFDEF UseInline}inline;{$ENDIF}
function  ClipF(const Value: Float; const Low, High: Float): Float;

{ InXXXRange returns True if A in range of type XXX                            }
function  InSingleRange(const A: Float): Boolean; {$IFDEF UseInline}inline;{$ENDIF}
function  InDoubleRange(const A: Float): Boolean; {$IFDEF UseInline}inline;{$ENDIF}
{$IFNDEF CLR}
function  InCurrencyRange(const A: Float): Boolean; overload;
function  InCurrencyRange(const A: Int64): Boolean; overload;
{$ENDIF}



{                                                                              }
{ Bit functions                                                                }
{                                                                              }
function  ClearBit(const Value, BitIndex: LongWord): LongWord;
function  SetBit(const Value, BitIndex: LongWord): LongWord;
function  IsBitSet(const Value, BitIndex: LongWord): Boolean;
function  ToggleBit(const Value, BitIndex: LongWord): LongWord;
function  IsHighBitSet(const Value: LongWord): Boolean;

function  SetBitScanForward(const Value: LongWord): Integer; overload;
function  SetBitScanForward(const Value, BitIndex: LongWord): Integer; overload;
function  SetBitScanReverse(const Value: LongWord): Integer; overload;
function  SetBitScanReverse(const Value, BitIndex: LongWord): Integer; overload;
function  ClearBitScanForward(const Value: LongWord): Integer; overload;
function  ClearBitScanForward(const Value, BitIndex: LongWord): Integer; overload;
function  ClearBitScanReverse(const Value: LongWord): Integer; overload;
function  ClearBitScanReverse(const Value, BitIndex: LongWord): Integer; overload;

function  ReverseBits(const Value: LongWord): LongWord; overload;
function  ReverseBits(const Value: LongWord; const BitCount: Integer): LongWord; overload;
function  SwapEndian(const Value: LongWord): LongWord;
{$IFDEF ManagedCode}
procedure SwapEndianBuf(var Buf: array of LongWord);
{$ELSE}
procedure SwapEndianBuf(var Buf; const Count: Integer);
{$ENDIF}
function  TwosComplement(const Value: LongWord): LongWord;

function  RotateLeftBits16(const Value: Word; const Bits: Byte): Word;
function  RotateLeftBits32(const Value: LongWord; const Bits: Byte): LongWord;
function  RotateRightBits16(const Value: Word; const Bits: Byte): Word;
function  RotateRightBits32(const Value: LongWord; const Bits: Byte): LongWord;

function  BitCount(const Value: LongWord): LongWord;
function  IsPowerOfTwo(const Value: LongWord): Boolean;

function  LowBitMask(const HighBitIndex: LongWord): LongWord;
function  HighBitMask(const LowBitIndex: LongWord): LongWord;
function  RangeBitMask(const LowBitIndex, HighBitIndex: LongWord): LongWord;

function  SetBitRange(const Value: LongWord;
          const LowBitIndex, HighBitIndex: LongWord): LongWord;
function  ClearBitRange(const Value: LongWord;
          const LowBitIndex, HighBitIndex: LongWord): LongWord;
function  ToggleBitRange(const Value: LongWord;
          const LowBitIndex, HighBitIndex: LongWord): LongWord;
function  IsBitRangeSet(const Value: LongWord;
          const LowBitIndex, HighBitIndex: LongWord): Boolean;
function  IsBitRangeClear(const Value: LongWord;
          const LowBitIndex, HighBitIndex: LongWord): Boolean;

const
  BitMaskTable: array[0..31] of LongWord =
    ($00000001, $00000002, $00000004, $00000008,
     $00000010, $00000020, $00000040, $00000080,
     $00000100, $00000200, $00000400, $00000800,
     $00001000, $00002000, $00004000, $00008000,
     $00010000, $00020000, $00040000, $00080000,
     $00100000, $00200000, $00400000, $00800000,
     $01000000, $02000000, $04000000, $08000000,
     $10000000, $20000000, $40000000, $80000000);



{                                                                              }
{ Sets                                                                         }
{   Operations on byte and character sets.                                     }
{                                                                              }
type
  CharSet = set of AnsiChar;
  ByteSet = set of Byte;
  PCharSet = ^CharSet;
  PByteSet = ^ByteSet;

const
  CompleteCharSet = [AnsiChar(#0)..AnsiChar(#255)];
  CompleteByteSet = [0..255];

function  AsCharSet(const C: array of AnsiChar): CharSet;
function  AsByteSet(const C: array of Byte): ByteSet;
procedure ComplementChar(var C: CharSet; const Ch: AnsiChar);
procedure ClearCharSet(var C: CharSet);
procedure FillCharSet(var C: CharSet);
procedure ComplementCharSet(var C: CharSet);
procedure AssignCharSet(var DestSet: CharSet; const SourceSet: CharSet); overload;
procedure Union(var DestSet: CharSet; const SourceSet: CharSet); overload;
procedure Difference(var DestSet: CharSet; const SourceSet: CharSet); overload;
procedure Intersection(var DestSet: CharSet; const SourceSet: CharSet); overload;
procedure XORCharSet(var DestSet: CharSet; const SourceSet: CharSet);
function  IsSubSet(const A, B: CharSet): Boolean;
function  IsEqual(const A, B: CharSet): Boolean; overload;
function  IsEmpty(const C: CharSet): Boolean;
function  IsComplete(const C: CharSet): Boolean;
function  CharCount(const C: CharSet): Integer; overload;
procedure ConvertCaseInsensitive(var C: CharSet);
function  CaseInsensitiveCharSet(const C: CharSet): CharSet;



{                                                                              }
{ Range functions                                                              }
{                                                                              }
{   RangeLength      Length of a range                                         }
{   RangeAdjacent    True if ranges are adjacent                               }
{   RangeOverlap     True if ranges overlap                                    }
{   RangeHasElement  True if element is in range                               }
{                                                                              }
function  IntRangeLength(const Low, High: Integer): Int64;
function  IntRangeAdjacent(const Low1, High1, Low2, High2: Integer): Boolean;
function  IntRangeOverlap(const Low1, High1, Low2, High2: Integer): Boolean;
function  IntRangeHasElement(const Low, High, Element: Integer): Boolean;

function  IntRangeIncludeElement(var Low, High: Integer;
          const Element: Integer): Boolean;
function  IntRangeIncludeElementRange(var Low, High: Integer;
          const LowElement, HighElement: Integer): Boolean;

function  CardRangeLength(const Low, High: Cardinal): Int64;
function  CardRangeAdjacent(const Low1, High1, Low2, High2: Cardinal): Boolean;
function  CardRangeOverlap(const Low1, High1, Low2, High2: Cardinal): Boolean;
function  CardRangeHasElement(const Low, High, Element: Cardinal): Boolean;

function  CardRangeIncludeElement(var Low, High: Cardinal;
          const Element: Cardinal): Boolean;
function  CardRangeIncludeElementRange(var Low, High: Cardinal;
          const LowElement, HighElement: Cardinal): Boolean;



{                                                                              }
{ Swap                                                                         }
{                                                                              }
procedure Swap(var X, Y: Boolean); overload;
procedure Swap(var X, Y: Byte); overload;
procedure Swap(var X, Y: Word); overload;
procedure Swap(var X, Y: LongWord); overload;
procedure Swap(var X, Y: ShortInt); overload;
procedure Swap(var X, Y: SmallInt); overload;
procedure Swap(var X, Y: LongInt); overload;
procedure Swap(var X, Y: Int64); overload;
procedure Swap(var X, Y: Single); overload;
procedure Swap(var X, Y: Double); overload;
procedure Swap(var X, Y: Extended); overload;
procedure Swap(var X, Y: Currency); overload;
procedure Swap(var X, Y: AnsiString); overload;
procedure Swap(var X, Y: WideString); overload;
procedure Swap(var X, Y: TObject); overload;
{$IFDEF ManagedCode}
procedure SwapObjects(var X, Y: TObject);
{$ELSE}
procedure SwapObjects(var X, Y);
{$ENDIF}
{$IFNDEF ManagedCode}
procedure Swap(var X, Y: Pointer); overload;
{$ENDIF}



{                                                                              }
{ Inline if                                                                    }
{                                                                              }
{   iif returns TrueValue if Expr is True, otherwise it returns FalseValue.    }
{                                                                              }
function  iif(const Expr: Boolean; const TrueValue: Integer;
          const FalseValue: Integer = 0): Integer; overload;
          {$IFDEF UseInline}inline;{$ENDIF}
function  iif(const Expr: Boolean; const TrueValue: Int64;
          const FalseValue: Int64 = 0): Int64; overload;
          {$IFDEF UseInline}inline;{$ENDIF}
function  iif(const Expr: Boolean; const TrueValue: Extended;
          const FalseValue: Extended = 0.0): Extended; overload;
          {$IFDEF UseInline}inline;{$ENDIF}
function  iifA(const Expr: Boolean; const TrueValue: AnsiString;
          const FalseValue: AnsiString = ''): AnsiString; overload;
          {$IFDEF UseInline}inline;{$ENDIF}
function  iifW(const Expr: Boolean; const TrueValue: WideString;
          const FalseValue: WideString = ''): WideString; overload;
          {$IFDEF UseInline}inline;{$ENDIF}
function  iif(const Expr: Boolean; const TrueValue: String;
          const FalseValue: String = ''): String; overload;
          {$IFDEF UseInline}inline;{$ENDIF}
function  iif(const Expr: Boolean; const TrueValue: TObject;
          const FalseValue: TObject = nil): TObject; overload;
          {$IFDEF UseInline}inline;{$ENDIF}



{                                                                              }
{ Comparison                                                                   }
{                                                                              }
type
  TCompareResult = (
      crLess,
      crEqual,
      crGreater,
      crUndefined);
  TCompareResultSet = set of TCompareResult;

function  ReverseCompareResult(const C: TCompareResult): TCompareResult;



{                                                                              }
{ Direct comparison                                                            }
{                                                                              }
{   Compare(I1, I2) returns crLess if I1 < I2, crEqual if I1 = I2 or           }
{   crGreater if I1 > I2.                                                      }
{                                                                              }
function  Compare(const I1, I2: Boolean): TCompareResult; overload;
function  Compare(const I1, I2: Integer): TCompareResult; overload;
function  Compare(const I1, I2: Int64): TCompareResult; overload;
function  Compare(const I1, I2: Extended): TCompareResult; overload;
function  Compare(const I1, I2: AnsiString): TCompareResult; overload;
function  WideCompare(const I1, I2: WideString): TCompareResult;

function  Sign(const A: LongInt): Integer; overload;
function  Sign(const A: Int64): Integer; overload;
function  Sign(const A: Extended): Integer; overload;



{                                                                              }
{ Approximate comparison of floating point values                              }
{                                                                              }
{   FloatZero, FloatOne, FloatsEqual and FloatsCompare are functions for       }
{   comparing floating point numbers based on a fixed CompareDelta difference  }
{   between the values. This means that values are considered equal if the     }
{   unsigned difference between the values are less than CompareDelta.         }
{                                                                              }
const
  // Minimum CompareDelta values for the different floating point types:
  // The values were chosen to be slightly higher than the minimum value that
  // the floating-point type can store.
  SingleCompareDelta   = 1.0E-34;
  DoubleCompareDelta   = 1.0E-280;
  {$IFDEF CLR}
  ExtendedCompareDelta = DoubleCompareDelta;
  {$ELSE}
  ExtendedCompareDelta = 1.0E-4400;
  {$ENDIF}

  // Default CompareDelta is set to SingleCompareDelta. This allows any type
  // of floating-point value to be compared with any other.
  DefaultCompareDelta = SingleCompareDelta;

function  FloatZero(const A: Float;
          const CompareDelta: Float = DefaultCompareDelta): Boolean;
function  FloatOne(const A: Float;
          const CompareDelta: Float = DefaultCompareDelta): Boolean;

function  FloatsEqual(const A, B: Float;
          const CompareDelta: Float = DefaultCompareDelta): Boolean;
function  FloatsCompare(const A, B: Float;
          const CompareDelta: Float = DefaultCompareDelta): TCompareResult;



{$IFNDEF CLR}
{                                                                              }
{ Scaled approximate comparison of floating point values                       }
{                                                                              }
{   ApproxEqual and ApproxCompare are functions for comparing floating point   }
{   numbers based on a scaled order of magnitude difference between the        }
{   values. CompareEpsilon is the ratio applied to the largest of the two      }
{   exponents to give the maximum difference (CompareDelta) for comparison.    }
{                                                                              }
{   For example:                                                               }
{                                                                              }
{   When the CompareEpsilon is 1.0E-9, the result of                           }
{                                                                              }
{   ApproxEqual(1.0E+20, 1.000000001E+20) = False, but the result of           }
{   ApproxEqual(1.0E+20, 1.0000000001E+20) = True, ie the first 9 digits of    }
{   the mantissas of the values must be the same.                              }
{                                                                              }
{   Note that for A <> 0.0, the value of ApproxEqual(A, 0.0) will always be    }
{   False. Rather use the unscaled FloatZero, FloatsEqual and FloatsCompare    }
{   functions when specifically testing for zero.                              }
{                                                                              }
const
  // Smallest (most sensitive) CompareEpsilon values allowed for the different
  // floating point types:
  SingleCompareEpsilon   = 1.0E-5;
  DoubleCompareEpsilon   = 1.0E-13;
  ExtendedCompareEpsilon = 1.0E-17;

  // Default CompareEpsilon is set for half the significant digits of the
  // Extended type.
  DefaultCompareEpsilon  = 1.0E-10;

function  ApproxEqual(const A, B: Extended;
          const CompareEpsilon: Double = DefaultCompareEpsilon): Boolean;
function  ApproxCompare(const A, B: Extended;
          const CompareEpsilon: Double = DefaultCompareEpsilon): TCompareResult;



{                                                                              }
{ Special floating-point values                                                }
{                                                                              }
{   FloatIsInfinity is True if A is a positive or negative infinity.           }
{   FloatIsNaN is True if A is Not-a-Number.                                   }
{                                                                              }
function  FloatIsInfinity(const A: Extended): Boolean;
function  FloatIsNaN(const A: Extended): Boolean;
{$ENDIF}



{                                                                              }
{ Integer conversion                                                           }
{                                                                              }
function  AnsiCharToInt(const A: AnsiChar): Integer;                                 {$IFDEF UseInline}inline;{$ENDIF}
function  WideCharToInt(const A: WideChar): Integer;                                 {$IFDEF UseInline}inline;{$ENDIF}
function  CharToInt(const A: Char): Integer;                                         {$IFDEF UseInline}inline;{$ENDIF}

function  IntToAnsiChar(const A: Integer): AnsiChar;                                 {$IFDEF UseInline}inline;{$ENDIF}
function  IntToWideChar(const A: Integer): WideChar;                                 {$IFDEF UseInline}inline;{$ENDIF}
function  IntToChar(const A: Integer): Char;                                         {$IFDEF UseInline}inline;{$ENDIF}

function  IsHexAnsiChar(const Ch: AnsiChar): Boolean;
function  IsHexWideChar(const Ch: WideChar): Boolean;
function  IsHexChar(const Ch: Char): Boolean;                                        {$IFDEF UseInline}inline;{$ENDIF}

function  HexAnsiCharToInt(const A: AnsiChar): Integer;
function  HexWideCharToInt(const A: WideChar): Integer;
function  HexCharToInt(const A: Char): Integer;                                      {$IFDEF UseInline}inline;{$ENDIF}

function  IntToUpperHexAnsiChar(const A: Integer): AnsiChar;
function  IntToUpperHexWideChar(const A: Integer): WideChar;
function  IntToUpperHexChar(const A: Integer): Char;                                 {$IFDEF UseInline}inline;{$ENDIF}

function  IntToLowerHexAnsiChar(const A: Integer): AnsiChar;
function  IntToLowerHexWideChar(const A: Integer): WideChar;
function  IntToLowerHexChar(const A: Integer): Char;                                 {$IFDEF UseInline}inline;{$ENDIF}

function  IntToAnsiString(const A: Integer): AnsiString;
function  IntToWideString(const A: Integer): WideString;
function  IntToString(const A: Integer): String;                                     {$IFDEF UseInline}inline;{$ENDIF}

function  LongWordToHexAnsiString(const A: LongWord; const Digits: Integer = 0; const LowerCase: Boolean = False): AnsiString;
function  LongWordToHexWideString(const A: LongWord; const Digits: Integer = 0; const LowerCase: Boolean = False): WideString;
function  LongWordToHexString(const A: LongWord; const Digits: Integer = 0; const LowerCase: Boolean = False): String; {$IFDEF UseInline}inline;{$ENDIF}

function  AnsiStringToInt(const A: AnsiString): Integer;
function  TryAnsiStringToInt(const A: AnsiString; out B: Integer): Boolean;
function  AnsiStringToIntDef(const A: AnsiString; const Default: Integer): Integer;
function  WideStringToInt(const A: WideString): Integer;
function  WideStringToIntDef(const A: WideString; const Default: Integer): Integer;
function  StringToInt(const A: String): Integer;                                     {$IFDEF UseInline}inline;{$ENDIF}
function  StringToIntDef(const A: String; const Default: Integer): Integer;          {$IFDEF UseInline}inline;{$ENDIF}



{                                                                              }
{ Base Conversion                                                              }
{                                                                              }
{   EncodeBase64 converts a binary string (S) to a base 64 string using        }
{   Alphabet. if Pad is True, the result will be padded with PadChar to be a   }
{   multiple of PadMultiple.                                                   }
{                                                                              }
{   DecodeBase64 converts a base 64 string using Alphabet (64 characters for   }
{   values 0-63) to a binary string.                                           }
{                                                                              }
const
  StrHexDigitsUpper: String[16] = '0123456789ABCDEF';
  StrHexDigitsLower: String[16] = '0123456789abcdef';

function  LongWordToBin(const I: LongWord; const Digits: Byte = 0): AnsiString;
function  LongWordToOct(const I: LongWord; const Digits: Byte = 0): AnsiString;
function  LongWordToHex(const I: LongWord; const Digits: Byte = 0;
          const UpperCase: Boolean = True): AnsiString;
function  LongWordToStr(const I: LongWord; const Digits: Byte = 0): AnsiString;

function  IsValidBinStr(const S: AnsiString): Boolean;
function  IsValidOctStr(const S: AnsiString): Boolean;
function  IsValidDecStr(const S: AnsiString): Boolean;
function  IsValidHexStr(const S: AnsiString): Boolean;

{ xxxStrToLongWord converts a number in a specific base to a LongWord value.   }
{ Valid is False on return if the string could not be converted.               }
function  BinStrToLongWord(const S: AnsiString; var Valid: Boolean): LongWord;
function  OctStrToLongWord(const S: AnsiString; var Valid: Boolean): LongWord;
function  DecStrToLongWord(const S: AnsiString; var Valid: Boolean): LongWord;
function  HexStrToLongWord(const S: AnsiString; var Valid: Boolean): LongWord;

function  EncodeBase64(const S, Alphabet: AnsiString;
          const Pad: Boolean = False;
          const PadMultiple: Integer = 4;
          const PadChar: AnsiChar = '='): AnsiString;
function  DecodeBase64(const S, Alphabet: AnsiString;
          const PadSet: CharSet{$IFNDEF CLR} = []{$ENDIF}): AnsiString;

const
  b64_MIMEBase64 = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/';
  b64_UUEncode   = ' !"#$%&''()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_';
  b64_XXEncode   = '+-0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';

function  MIMEBase64Decode(const S: AnsiString): AnsiString;
function  MIMEBase64Encode(const S: AnsiString): AnsiString;
function  UUDecode(const S: AnsiString): AnsiString;
function  XXDecode(const S: AnsiString): AnsiString;

function  BytesToHex(
          {$IFDEF ManagedCode}const P: array of Byte;
          {$ELSE}             const P: Pointer; const Count: Integer;{$ENDIF}
          const UpperCase: Boolean = True): AnsiString;



{                                                                              }
{ Type conversion                                                              }
{                                                                              }
{$IFNDEF ManagedCode}
function  PointerToStr(const P: Pointer): AnsiString;
function  StrToPointer(const S: AnsiString): Pointer;
{$ENDIF}
function  ObjectClassName(const O: TObject): String;
function  ClassClassName(const C: TClass): String;
function  ObjectToStr(const O: TObject): String;
function  CharSetToStr(const C: CharSet): AnsiString;
function  StrToCharSet(const S: AnsiString): CharSet;



{                                                                              }
{ Hashing functions                                                            }
{                                                                              }
{   HashBuf uses a every byte in the buffer to calculate a hash.               }
{                                                                              }
{   HashStrBuf/HashStr is a general purpose string hashing function.           }
{   For large strings, HashStr will sample up to 48 bytes from the string.     }
{                                                                              }
{   If Slots = 0 the hash value is in the LongWord range (0-$FFFFFFFF),        }
{   otherwise the value is in the range from 0 to Slots-1. Note that the       }
{   'mod' operation, which is used when Slots <> 0, is comparitively slow.     }
{                                                                              }
{$IFNDEF ManagedCode}
function  HashBuf(const Buf; const BufSize: Integer;
          const Slots: LongWord = 0): LongWord;
function  HashStrBuf(const StrBuf: Pointer; const StrLength: Integer;
          const Slots: LongWord = 0): LongWord;
function  HashStrBufNoCase(const StrBuf: Pointer; const StrLength: Integer;
          const Slots: LongWord = 0): LongWord;
{$ENDIF}
function  HashStr(const S: AnsiString; const Slots: LongWord = 0;
          const CaseSensitive: Boolean = True): LongWord;
function  HashInteger(const I: Integer; const Slots: LongWord = 0): LongWord;
function  HashLongWord(const I: LongWord; const Slots: LongWord = 0): LongWord;



{                                                                              }
{ Memory operations                                                            }
{                                                                              }
{$IFDEF DELPHI5_DOWN}
type
  PPointer = ^Pointer;
{$ENDIF}

const
  Bytes1KB  = 1024;
  Bytes1MB  = 1024 * Bytes1KB;
  Bytes1GB  = 1024 * Bytes1MB;
  Bytes64KB = 64 * Bytes1KB;
  Bytes64MB = 64 * Bytes1MB;
  Bytes2GB  = 2 * LongWord(Bytes1GB);

{$IFNDEF ManagedCode}
{$IFDEF ASM386_DELPHI}{$IFNDEF DELPHI2006_UP}
  {$DEFINE UseAsmMemFunction}
{$ENDIF}{$ENDIF}
{$IFDEF UseInline}{$IFNDEF UseAsmMemFunction}
  {$DEFINE InlineMemFunction}
{$ENDIF}{$ENDIF}

procedure FillMem(var Buf; const Count: Integer; const Value: Byte); {$IFDEF InlineMemFunction}inline;{$ENDIF}
procedure ZeroMem(var Buf; const Count: Integer);                    {$IFDEF InlineMemFunction}inline;{$ENDIF}
procedure GetZeroMem(var P: Pointer; const Size: Integer);           {$IFDEF InlineMemFunction}inline;{$ENDIF}
procedure MoveMem(const Source; var Dest; const Count: Integer);     {$IFDEF InlineMemFunction}inline;{$ENDIF}
function  CompareMem(const Buf1; const Buf2; const Count: Integer): Boolean;
function  CompareMemNoCase(const Buf1; const Buf2; const Count: Integer): TCompareResult;
function  LocateMem(const Buf1; const Size1: Integer; const Buf2; const Size2: Integer): Integer;
procedure ReverseMem(var Buf; const Size: Integer);
{$ENDIF}



{                                                                              }
{ IInterface                                                                   }
{                                                                              }
{$IFDEF DELPHI5_DOWN}
type
  IInterface = interface
    ['{00000000-0000-0000-C000-000000000046}']
    function QueryInterface(const IID: TGUID; out Obj): HResult; stdcall;
    function _AddRef: Integer; stdcall;
    function _Release: Integer; stdcall;
  end;
{$ENDIF}



{                                                                              }
{ Array pointers                                                               }
{                                                                              }

{ Maximum array elements                                                       }
const
  MaxArraySize = $7FFFFFFF; // 2 Gigabytes
  MaxByteArrayElements = MaxArraySize div Sizeof(Byte);
  MaxWordArrayElements = MaxArraySize div Sizeof(Word);
  MaxLongWordArrayElements = MaxArraySize div Sizeof(LongWord);
  MaxCardinalArrayElements = MaxArraySize div Sizeof(Cardinal);
  MaxShortIntArrayElements = MaxArraySize div Sizeof(ShortInt);
  MaxSmallIntArrayElements = MaxArraySize div Sizeof(SmallInt);
  MaxLongIntArrayElements = MaxArraySize div Sizeof(LongInt);
  MaxIntegerArrayElements = MaxArraySize div Sizeof(Integer);
  MaxInt64ArrayElements = MaxArraySize div Sizeof(Int64);
  MaxSingleArrayElements = MaxArraySize div Sizeof(Single);
  MaxDoubleArrayElements = MaxArraySize div Sizeof(Double);
  MaxExtendedArrayElements = MaxArraySize div Sizeof(Extended);
  MaxBooleanArrayElements = MaxArraySize div Sizeof(Boolean);
  {$IFNDEF CLR}
  MaxCurrencyArrayElements = MaxArraySize div Sizeof(Currency);
  MaxAnsiStringArrayElements = MaxArraySize div Sizeof(AnsiString);
  MaxWideStringArrayElements = MaxArraySize div Sizeof(WideString);
  {$IFDEF StringIsUnicode}
  MaxStringArrayElements = MaxArraySize div Sizeof(UnicodeString);
  {$ELSE}
  MaxStringArrayElements = MaxArraySize div Sizeof(AnsiString);
  {$ENDIF}
  MaxPointerArrayElements = MaxArraySize div Sizeof(Pointer);
  MaxObjectArrayElements = MaxArraySize div Sizeof(TObject);
  MaxInterfaceArrayElements = MaxArraySize div Sizeof(IInterface);
  MaxCharSetArrayElements = MaxArraySize div Sizeof(CharSet);
  MaxByteSetArrayElements = MaxArraySize div Sizeof(ByteSet);
  {$ENDIF}

{ Static array types                                                           }
type
  TStaticByteArray = array[0..MaxByteArrayElements - 1] of Byte;
  TStaticWordArray = array[0..MaxWordArrayElements - 1] of Word;
  TStaticLongWordArray = array[0..MaxLongWordArrayElements - 1] of LongWord;
  TStaticShortIntArray = array[0..MaxShortIntArrayElements - 1] of ShortInt;
  TStaticSmallIntArray = array[0..MaxSmallIntArrayElements - 1] of SmallInt;
  TStaticLongIntArray = array[0..MaxLongIntArrayElements - 1] of LongInt;
  TStaticInt64Array = array[0..MaxInt64ArrayElements - 1] of Int64;
  TStaticSingleArray = array[0..MaxSingleArrayElements - 1] of Single;
  TStaticDoubleArray = array[0..MaxDoubleArrayElements - 1] of Double;
  TStaticExtendedArray = array[0..MaxExtendedArrayElements - 1] of Extended;
  TStaticBooleanArray = array[0..MaxBooleanArrayElements - 1] of Boolean;
  {$IFNDEF CLR}
  TStaticCurrencyArray = array[0..MaxCurrencyArrayElements - 1] of Currency;
  TStaticAnsiStringArray = array[0..MaxAnsiStringArrayElements - 1] of AnsiString;
  TStaticWideStringArray = array[0..MaxWideStringArrayElements - 1] of WideString;
  {$IFDEF StringIsUnicode}
  TStaticStringArray = TStaticWideStringArray;
  {$ELSE}
  TStaticStringArray = TStaticAnsiStringArray;
  {$ENDIF}
  TStaticPointerArray = array[0..MaxPointerArrayElements - 1] of Pointer;
  TStaticObjectArray = array[0..MaxObjectArrayElements - 1] of TObject;
  TStaticInterfaceArray = array[0..MaxInterfaceArrayElements - 1] of IInterface;
  TStaticCharSetArray = array[0..MaxCharSetArrayElements - 1] of CharSet;
  TStaticByteSetArray = array[0..MaxByteSetArrayElements - 1] of ByteSet;
  {$ENDIF}
  TStaticCardinalArray = TStaticLongWordArray;
  TStaticIntegerArray = TStaticLongIntArray;

{ Static array pointers                                                        }
type
  PStaticByteArray = ^TStaticByteArray;
  PStaticWordArray = ^TStaticWordArray;
  PStaticLongWordArray = ^TStaticLongWordArray;
  PStaticCardinalArray = ^TStaticCardinalArray;
  PStaticShortIntArray = ^TStaticShortIntArray;
  PStaticSmallIntArray = ^TStaticSmallIntArray;
  PStaticLongIntArray = ^TStaticLongIntArray;
  PStaticIntegerArray = ^TStaticIntegerArray;
  PStaticInt64Array = ^TStaticInt64Array;
  PStaticSingleArray = ^TStaticSingleArray;
  PStaticDoubleArray = ^TStaticDoubleArray;
  PStaticExtendedArray = ^TStaticExtendedArray;
  PStaticBooleanArray = ^TStaticBooleanArray;
  {$IFNDEF CLR}
  PStaticCurrencyArray = ^TStaticCurrencyArray;
  PStaticAnsiStringArray = ^TStaticAnsiStringArray;
  PStaticWideStringArray = ^TStaticWideStringArray;
  PStaticStringArray = ^TStaticStringArray;
  PStaticPointerArray = ^TStaticPointerArray;
  PStaticObjectArray = ^TStaticObjectArray;
  PStaticInterfaceArray = ^TStaticInterfaceArray;
  PStaticCharSetArray = ^TStaticCharSetArray;
  PStaticByteSetArray = ^TStaticByteSetArray;
  {$ENDIF}



{                                                                              }
{ Dynamic arrays                                                               }
{                                                                              }
type
  ByteArray = array of Byte;
  WordArray = array of Word;
  LongWordArray = array of LongWord;
  ShortIntArray = array of ShortInt;
  SmallIntArray = array of SmallInt;
  LongIntArray = array of LongInt;
  Int64Array = array of Int64;
  SingleArray = array of Single;
  DoubleArray = array of Double;
  ExtendedArray = array of Extended;
  CurrencyArray = array of Currency;
  BooleanArray = array of Boolean;
  AnsiStringArray = array of AnsiString;
  WideStringArray = array of WideString;
  {$IFDEF StringIsUnicode}
  StringArray = WideStringArray;
  {$ELSE}
  StringArray = AnsiStringArray;
  {$ENDIF}
  {$IFNDEF ManagedCode}
  PointerArray = array of Pointer;
  {$ENDIF}
  ObjectArray = array of TObject;
  InterfaceArray = array of IInterface;
  CharSetArray = array of CharSet;
  ByteSetArray = array of ByteSet;
  IntegerArray = LongIntArray;
  CardinalArray = LongWordArray;


function  Append(var V: ByteArray; const R: Byte): Integer; overload; {$IFDEF UseInline}inline;{$ENDIF}
function  Append(var V: WordArray; const R: Word): Integer; overload; {$IFDEF UseInline}inline;{$ENDIF}
function  Append(var V: LongWordArray; const R: LongWord): Integer; overload; {$IFDEF UseInline}inline;{$ENDIF}
function  Append(var V: ShortIntArray; const R: ShortInt): Integer; overload; {$IFDEF UseInline}inline;{$ENDIF}
function  Append(var V: SmallIntArray; const R: SmallInt): Integer; overload; {$IFDEF UseInline}inline;{$ENDIF}
function  Append(var V: LongIntArray; const R: LongInt): Integer; overload; {$IFDEF UseInline}inline;{$ENDIF}
function  Append(var V: Int64Array; const R: Int64): Integer; overload; {$IFDEF UseInline}inline;{$ENDIF}
function  Append(var V: SingleArray; const R: Single): Integer; overload; {$IFDEF UseInline}inline;{$ENDIF}
function  Append(var V: DoubleArray; const R: Double): Integer; overload; {$IFDEF UseInline}inline;{$ENDIF}
function  Append(var V: ExtendedArray; const R: Extended): Integer; overload; {$IFDEF UseInline}inline;{$ENDIF}
function  Append(var V: CurrencyArray; const R: Currency): Integer; overload; {$IFDEF UseInline}inline;{$ENDIF}
function  Append(var V: BooleanArray; const R: Boolean): Integer; overload; {$IFDEF UseInline}inline;{$ENDIF}
function  Append(var V: AnsiStringArray; const R: AnsiString): Integer; overload; {$IFDEF UseInline}inline;{$ENDIF}
function  Append(var V: WideStringArray; const R: WideString): Integer; overload; {$IFDEF UseInline}inline;{$ENDIF}
{$IFNDEF ManagedCode}
function  Append(var V: PointerArray; const R: Pointer): Integer; overload; {$IFDEF UseInline}inline;{$ENDIF}
{$ENDIF}
function  Append(var V: ObjectArray; const R: TObject): Integer; overload; {$IFDEF UseInline}inline;{$ENDIF}
function  Append(var V: InterfaceArray; const R: IInterface): Integer; overload; {$IFDEF UseInline}inline;{$ENDIF}
function  Append(var V: ByteSetArray; const R: ByteSet): Integer; overload; {$IFDEF UseInline}inline;{$ENDIF}
function  Append(var V: CharSetArray; const R: CharSet): Integer; overload; {$IFDEF UseInline}inline;{$ENDIF}
function  AppendByteArray(var V: ByteArray; const R: array of Byte): Integer; overload;
function  AppendWordArray(var V: WordArray; const R: array of Word): Integer; overload;
function  AppendCardinalArray(var V: CardinalArray; const R: array of LongWord): Integer; overload;
function  AppendShortIntArray(var V: ShortIntArray; const R: array of ShortInt): Integer; overload;
function  AppendSmallIntArray(var V: SmallIntArray; const R: array of SmallInt): Integer; overload;
function  AppendIntegerArray(var V: IntegerArray; const R: array of LongInt): Integer; overload;
function  AppendInt64Array(var V: Int64Array; const R: array of Int64): Integer; overload;
function  AppendSingleArray(var V: SingleArray; const R: array of Single): Integer; overload;
function  AppendDoubleArray(var V: DoubleArray; const R: array of Double): Integer; overload;
function  AppendExtendedArray(var V: ExtendedArray; const R: array of Extended): Integer; overload;
function  AppendAnsiStringArray(var V: AnsiStringArray; const R: array of AnsiString): Integer; overload;
function  AppendWideStringArray(var V: WideStringArray; const R: array of WideString): Integer; overload;
function  AppendStringArray(var V: StringArray; const R: array of String): Integer; overload;
{$IFNDEF CLR}
function  AppendCurrencyArray(var V: CurrencyArray; const R: array of Currency): Integer; overload;
function  AppendPointerArray(var V: PointerArray; const R: array of Pointer): Integer; overload;
function  AppendCharSetArray(var V: CharSetArray; const R: array of CharSet): Integer; overload;
function  AppendByteSetArray(var V: ByteSetArray; const R: array of ByteSet): Integer; overload;
{$ENDIF}
function  AppendObjectArray(var V: ObjectArray; const R: ObjectArray): Integer; overload;


function  Remove(var V: ByteArray; const Idx: Integer; const Count: Integer = 1): Integer; overload;
function  Remove(var V: WordArray; const Idx: Integer; const Count: Integer = 1): Integer; overload;
function  Remove(var V: LongWordArray; const Idx: Integer; const Count: Integer = 1): Integer; overload;
function  Remove(var V: ShortIntArray; const Idx: Integer; const Count: Integer = 1): Integer; overload;
function  Remove(var V: SmallIntArray; const Idx: Integer; const Count: Integer = 1): Integer; overload;
function  Remove(var V: LongIntArray; const Idx: Integer; const Count: Integer = 1): Integer; overload;
function  Remove(var V: Int64Array; const Idx: Integer; const Count: Integer = 1): Integer; overload;
function  Remove(var V: SingleArray; const Idx: Integer; const Count: Integer = 1): Integer; overload;
function  Remove(var V: DoubleArray; const Idx: Integer; const Count: Integer = 1): Integer; overload;
function  Remove(var V: ExtendedArray; const Idx: Integer; const Count: Integer = 1): Integer; overload;
function  Remove(var V: AnsiStringArray; const Idx: Integer; const Count: Integer = 1): Integer; overload;
function  Remove(var V: WideStringArray; const Idx: Integer; const Count: Integer = 1): Integer; overload;
{$IFNDEF ManagedCode}
function  Remove(var V: PointerArray; const Idx: Integer; const Count: Integer = 1): Integer; overload;
{$ENDIF}
{$IFNDEF CLR}
function  Remove(var V: CurrencyArray; const Idx: Integer; const Count: Integer = 1): Integer; overload;
{$ENDIF}
function  Remove(var V: ObjectArray; const Idx: Integer; const Count: Integer = 1;
          const FreeObjects: Boolean = False): Integer; overload;
function  Remove(var V: InterfaceArray; const Idx: Integer; const Count: Integer = 1): Integer; overload;

procedure RemoveDuplicates(var V: ByteArray; const IsSorted: Boolean); overload;
procedure RemoveDuplicates(var V: WordArray; const IsSorted: Boolean); overload;
procedure RemoveDuplicates(var V: LongWordArray; const IsSorted: Boolean); overload;
procedure RemoveDuplicates(var V: ShortIntArray; const IsSorted: Boolean); overload;
procedure RemoveDuplicates(var V: SmallIntArray; const IsSorted: Boolean); overload;
procedure RemoveDuplicates(var V: LongIntArray; const IsSorted: Boolean); overload;
procedure RemoveDuplicates(var V: Int64Array; const IsSorted: Boolean); overload;
procedure RemoveDuplicates(var V: SingleArray; const IsSorted: Boolean); overload;
procedure RemoveDuplicates(var V: DoubleArray; const IsSorted: Boolean); overload;
procedure RemoveDuplicates(var V: ExtendedArray; const IsSorted: Boolean); overload;
procedure RemoveDuplicates(var V: AnsiStringArray; const IsSorted: Boolean); overload;
procedure RemoveDuplicates(var V: WideStringArray; const IsSorted: Boolean); overload;
{$IFNDEF ManagedCode}
procedure RemoveDuplicates(var V: PointerArray; const IsSorted: Boolean); overload;
{$ENDIF}

procedure TrimArrayLeft(var S: ByteArray; const TrimList: array of Byte); overload;
procedure TrimArrayLeft(var S: WordArray; const TrimList: array of Word); overload;
procedure TrimArrayLeft(var S: LongWordArray; const TrimList: array of LongWord); overload;
procedure TrimArrayLeft(var S: ShortIntArray; const TrimList: array of ShortInt); overload;
procedure TrimArrayLeft(var S: SmallIntArray; const TrimList: array of SmallInt); overload;
procedure TrimArrayLeft(var S: LongIntArray; const TrimList: array of LongInt); overload;
procedure TrimArrayLeft(var S: Int64Array; const TrimList: array of Int64); overload;
procedure TrimArrayLeft(var S: SingleArray; const TrimList: array of Single); overload;
procedure TrimArrayLeft(var S: DoubleArray; const TrimList: array of Double); overload;
procedure TrimArrayLeft(var S: ExtendedArray; const TrimList: array of Extended); overload;
procedure TrimArrayLeft(var S: AnsiStringArray; const TrimList: array of AnsiString); overload;
procedure TrimArrayLeft(var S: WideStringArray; const TrimList: array of WideString); overload;
{$IFNDEF ManagedCode}
procedure TrimArrayLeft(var S: PointerArray; const TrimList: array of Pointer); overload;
{$ENDIF}

procedure TrimArrayRight(var S: ByteArray; const TrimList: array of Byte); overload;
procedure TrimArrayRight(var S: WordArray; const TrimList: array of Word); overload;
procedure TrimArrayRight(var S: LongWordArray; const TrimList: array of LongWord); overload;
procedure TrimArrayRight(var S: ShortIntArray; const TrimList: array of ShortInt); overload;
procedure TrimArrayRight(var S: SmallIntArray; const TrimList: array of SmallInt); overload;
procedure TrimArrayRight(var S: LongIntArray; const TrimList: array of LongInt); overload;
procedure TrimArrayRight(var S: Int64Array; const TrimList: array of Int64); overload;
procedure TrimArrayRight(var S: SingleArray; const TrimList: array of Single); overload;
procedure TrimArrayRight(var S: DoubleArray; const TrimList: array of Double); overload;
procedure TrimArrayRight(var S: ExtendedArray; const TrimList: array of Extended); overload;
procedure TrimArrayRight(var S: AnsiStringArray; const TrimList: array of AnsiString); overload;
procedure TrimArrayRight(var S: WideStringArray; const TrimList: array of WideString); overload;
{$IFNDEF ManagedCode}
procedure TrimArrayRight(var S: PointerArray; const TrimList: array of Pointer); overload;
{$ENDIF}

function  ArrayInsert(var V: ByteArray; const Idx: Integer; const Count: Integer): Integer; overload;
function  ArrayInsert(var V: WordArray; const Idx: Integer; const Count: Integer): Integer; overload;
function  ArrayInsert(var V: LongWordArray; const Idx: Integer; const Count: Integer): Integer; overload;
function  ArrayInsert(var V: ShortIntArray; const Idx: Integer; const Count: Integer): Integer; overload;
function  ArrayInsert(var V: SmallIntArray; const Idx: Integer; const Count: Integer): Integer; overload;
function  ArrayInsert(var V: LongIntArray; const Idx: Integer; const Count: Integer): Integer; overload;
function  ArrayInsert(var V: Int64Array; const Idx: Integer; const Count: Integer): Integer; overload;
function  ArrayInsert(var V: SingleArray; const Idx: Integer; const Count: Integer): Integer; overload;
function  ArrayInsert(var V: DoubleArray; const Idx: Integer; const Count: Integer): Integer; overload;
function  ArrayInsert(var V: ExtendedArray; const Idx: Integer; const Count: Integer): Integer; overload;
function  ArrayInsert(var V: CurrencyArray; const Idx: Integer; const Count: Integer): Integer; overload;
function  ArrayInsert(var V: AnsiStringArray; const Idx: Integer; const Count: Integer): Integer; overload;
function  ArrayInsert(var V: WideStringArray; const Idx: Integer; const Count: Integer): Integer; overload;
{$IFNDEF ManagedCode}
function  ArrayInsert(var V: PointerArray; const Idx: Integer; const Count: Integer): Integer; overload;
function  ArrayInsert(var V: ObjectArray; const Idx: Integer; const Count: Integer): Integer; overload;
{$ENDIF}
function  ArrayInsert(var V: InterfaceArray; const Idx: Integer; const Count: Integer): Integer; overload;

{$IFDEF ManagedCode}
procedure FreeObjectArray(var V: ObjectArray); overload;
procedure FreeObjectArray(var V: ObjectArray; const LoIdx, HiIdx: Integer); overload;
{$ELSE}
procedure FreeObjectArray(var V); overload;
procedure FreeObjectArray(var V; const LoIdx, HiIdx: Integer); overload;
{$ENDIF}
procedure FreeAndNilObjectArray(var V: ObjectArray);

function  PosNext(const Find: Byte; const V: ByteArray; const PrevPos: Integer = -1;
          const IsSortedAscending: Boolean = False): Integer; overload;
function  PosNext(const Find: Word; const V: WordArray; const PrevPos: Integer = -1;
          const IsSortedAscending: Boolean = False): Integer; overload;
function  PosNext(const Find: LongWord; const V: LongWordArray; const PrevPos: Integer = -1;
          const IsSortedAscending: Boolean = False): Integer; overload;
function  PosNext(const Find: ShortInt; const V: ShortIntArray; const PrevPos: Integer = -1;
          const IsSortedAscending: Boolean = False): Integer; overload;
function  PosNext(const Find: SmallInt; const V: SmallIntArray; const PrevPos: Integer = -1;
          const IsSortedAscending: Boolean = False): Integer; overload;
function  PosNext(const Find: LongInt; const V: LongIntArray; const PrevPos: Integer = -1;
          const IsSortedAscending: Boolean = False): Integer; overload;
function  PosNext(const Find: Int64; const V: Int64Array; const PrevPos: Integer = -1;
          const IsSortedAscending: Boolean = False): Integer; overload;
function  PosNext(const Find: Single; const V: SingleArray; const PrevPos: Integer = -1;
          const IsSortedAscending: Boolean = False): Integer; overload;
function  PosNext(const Find: Double; const V: DoubleArray; const PrevPos: Integer = -1;
          const IsSortedAscending: Boolean = False): Integer; overload;
function  PosNext(const Find: Extended; const V: ExtendedArray; const PrevPos: Integer = -1;
          const IsSortedAscending: Boolean = False): Integer; overload;
function  PosNext(const Find: Boolean; const V: BooleanArray; const PrevPos: Integer = -1;
          const IsSortedAscending: Boolean = False): Integer; overload;
function  PosNext(const Find: AnsiString; const V: AnsiStringArray; const PrevPos: Integer = -1;
          const IsSortedAscending: Boolean = False): Integer; overload;
function  PosNext(const Find: WideString; const V: WideStringArray; const PrevPos: Integer = -1;
          const IsSortedAscending: Boolean = False): Integer; overload;
{$IFNDEF ManagedCode}
function  PosNext(const Find: Pointer; const V: PointerArray;
          const PrevPos: Integer = -1): Integer; overload;
{$ENDIF}
function  PosNext(const Find: TObject; const V: ObjectArray;
          const PrevPos: Integer = -1): Integer; overload;
function  PosNext(const ClassType: TClass; const V: ObjectArray;
          const PrevPos: Integer = -1): Integer; overload;
function  PosNext(const ClassName: String; const V: ObjectArray;
          const PrevPos: Integer = -1): Integer; overload;

function  Count(const Find: Byte; const V: ByteArray;
          const IsSortedAscending: Boolean = False): Integer; overload;
function  Count(const Find: Word; const V: WordArray;
          const IsSortedAscending: Boolean = False): Integer; overload;
function  Count(const Find: LongWord; const V: LongWordArray;
          const IsSortedAscending: Boolean = False): Integer; overload;
function  Count(const Find: ShortInt; const V: ShortIntArray;
          const IsSortedAscending: Boolean = False): Integer; overload;
function  Count(const Find: SmallInt; const V: SmallIntArray;
          const IsSortedAscending: Boolean = False): Integer; overload;
function  Count(const Find: LongInt; const V: LongIntArray;
          const IsSortedAscending: Boolean = False): Integer; overload;
function  Count(const Find: Int64; const V: Int64Array;
          const IsSortedAscending: Boolean = False): Integer; overload;
function  Count(const Find: Single; const V: SingleArray;
          const IsSortedAscending: Boolean = False): Integer; overload;
function  Count(const Find: Double; const V: DoubleArray;
          const IsSortedAscending: Boolean = False): Integer; overload;
function  Count(const Find: Extended; const V: ExtendedArray;
          const IsSortedAscending: Boolean = False): Integer; overload;
function  Count(const Find: AnsiString; const V: AnsiStringArray;
          const IsSortedAscending: Boolean = False): Integer; overload;
function  Count(const Find: WideString; const V: WideStringArray;
          const IsSortedAscending: Boolean = False): Integer; overload;
function  Count(const Find: Boolean; const V: BooleanArray;
          const IsSortedAscending: Boolean = False): Integer; overload;

procedure RemoveAll(const Find: Byte; var V: ByteArray;
          const IsSortedAscending: Boolean = False); overload; 
procedure RemoveAll(const Find: Word; var V: WordArray;
          const IsSortedAscending: Boolean = False); overload; 
procedure RemoveAll(const Find: LongWord; var V: LongWordArray;
          const IsSortedAscending: Boolean = False); overload; 
procedure RemoveAll(const Find: ShortInt; var V: ShortIntArray;
          const IsSortedAscending: Boolean = False); overload; 
procedure RemoveAll(const Find: SmallInt; var V: SmallIntArray;
          const IsSortedAscending: Boolean = False); overload; 
procedure RemoveAll(const Find: LongInt; var V: LongIntArray;
          const IsSortedAscending: Boolean = False); overload; 
procedure RemoveAll(const Find: Int64; var V: Int64Array;
          const IsSortedAscending: Boolean = False); overload; 
procedure RemoveAll(const Find: Single; var V: SingleArray;
          const IsSortedAscending: Boolean = False); overload; 
procedure RemoveAll(const Find: Double; var V: DoubleArray;
          const IsSortedAscending: Boolean = False); overload; 
procedure RemoveAll(const Find: Extended; var V: ExtendedArray;
          const IsSortedAscending: Boolean = False); overload; 
procedure RemoveAll(const Find: AnsiString; var V: AnsiStringArray;
          const IsSortedAscending: Boolean = False); overload; 
procedure RemoveAll(const Find: WideString; var V: WideStringArray;
          const IsSortedAscending: Boolean = False); overload; 

function  Intersection(const V1, V2: ByteArray;
          const IsSortedAscending: Boolean = False): ByteArray; overload;
function  Intersection(const V1, V2: WordArray;
          const IsSortedAscending: Boolean = False): WordArray; overload;
function  Intersection(const V1, V2: LongWordArray;
          const IsSortedAscending: Boolean = False): LongWordArray; overload;
function  Intersection(const V1, V2: ShortIntArray;
          const IsSortedAscending: Boolean = False): ShortIntArray; overload;
function  Intersection(const V1, V2: SmallIntArray;
          const IsSortedAscending: Boolean = False): SmallIntArray; overload;
function  Intersection(const V1, V2: LongIntArray;
          const IsSortedAscending: Boolean = False): LongIntArray; overload;
function  Intersection(const V1, V2: Int64Array;
          const IsSortedAscending: Boolean = False): Int64Array; overload;
function  Intersection(const V1, V2: SingleArray;
          const IsSortedAscending: Boolean = False): SingleArray; overload;
function  Intersection(const V1, V2: DoubleArray;
          const IsSortedAscending: Boolean = False): DoubleArray; overload;
function  Intersection(const V1, V2: ExtendedArray;
          const IsSortedAscending: Boolean = False): ExtendedArray; overload;
function  Intersection(const V1, V2: AnsiStringArray;
          const IsSortedAscending: Boolean = False): AnsiStringArray; overload;
function  Intersection(const V1, V2: WideStringArray;
          const IsSortedAscending: Boolean = False): WideStringArray; overload;

function  Difference(const V1, V2: ByteArray;
          const IsSortedAscending: Boolean = False): ByteArray; overload;
function  Difference(const V1, V2: WordArray;
          const IsSortedAscending: Boolean = False): WordArray; overload;
function  Difference(const V1, V2: LongWordArray;
          const IsSortedAscending: Boolean = False): LongWordArray; overload;
function  Difference(const V1, V2: ShortIntArray;
          const IsSortedAscending: Boolean = False): ShortIntArray; overload;
function  Difference(const V1, V2: SmallIntArray;
          const IsSortedAscending: Boolean = False): SmallIntArray; overload;
function  Difference(const V1, V2: LongIntArray;
          const IsSortedAscending: Boolean = False): LongIntArray; overload;
function  Difference(const V1, V2: Int64Array;
          const IsSortedAscending: Boolean = False): Int64Array; overload;
function  Difference(const V1, V2: SingleArray;
          const IsSortedAscending: Boolean = False): SingleArray; overload;
function  Difference(const V1, V2: DoubleArray;
          const IsSortedAscending: Boolean = False): DoubleArray; overload;
function  Difference(const V1, V2: ExtendedArray;
          const IsSortedAscending: Boolean = False): ExtendedArray; overload;
function  Difference(const V1, V2: AnsiStringArray;
          const IsSortedAscending: Boolean = False): AnsiStringArray; overload;
function  Difference(const V1, V2: WideStringArray;
          const IsSortedAscending: Boolean = False): WideStringArray; overload;

procedure Reverse(var V: ByteArray); overload;
procedure Reverse(var V: WordArray); overload;
procedure Reverse(var V: LongWordArray); overload;
procedure Reverse(var V: ShortIntArray); overload;
procedure Reverse(var V: SmallIntArray); overload;
procedure Reverse(var V: LongIntArray); overload;
procedure Reverse(var V: Int64Array); overload;
procedure Reverse(var V: SingleArray); overload;
procedure Reverse(var V: DoubleArray); overload;
procedure Reverse(var V: ExtendedArray); overload;
procedure Reverse(var V: AnsiStringArray); overload;
procedure Reverse(var V: WideStringArray); overload;
{$IFNDEF ManagedCode}
procedure Reverse(var V: PointerArray); overload;
{$ENDIF}
procedure Reverse(var V: ObjectArray); overload;

function  AsBooleanArray(const V: array of Boolean): BooleanArray; overload;
function  AsByteArray(const V: array of Byte): ByteArray; overload;
function  AsWordArray(const V: array of Word): WordArray; overload;
function  AsLongWordArray(const V: array of LongWord): LongWordArray; overload;
function  AsCardinalArray(const V: array of Cardinal): CardinalArray; overload;
function  AsShortIntArray(const V: array of ShortInt): ShortIntArray; overload;
function  AsSmallIntArray(const V: array of SmallInt): SmallIntArray; overload;
function  AsLongIntArray(const V: array of LongInt): LongIntArray; overload;
function  AsIntegerArray(const V: array of Integer): IntegerArray; overload;
function  AsInt64Array(const V: array of Int64): Int64Array; overload;
function  AsSingleArray(const V: array of Single): SingleArray; overload;
function  AsDoubleArray(const V: array of Double): DoubleArray; overload;
function  AsExtendedArray(const V: array of Extended): ExtendedArray; overload;
function  AsCurrencyArray(const V: array of Currency): CurrencyArray; overload;
function  AsAnsiStringArray(const V: array of AnsiString): AnsiStringArray; overload;
function  AsWideStringArray(const V: array of WideString): WideStringArray; overload;
function  AsStringArray(const V: array of String): StringArray; overload;
{$IFNDEF ManagedCode}
function  AsPointerArray(const V: array of Pointer): PointerArray; overload;
{$ENDIF}
function  AsCharSetArray(const V: array of CharSet): CharSetArray; overload;
function  AsObjectArray(const V: array of TObject): ObjectArray; overload;
function  AsInterfaceArray(const V: array of IInterface): InterfaceArray; overload;

function  RangeByte(const First: Byte; const Count: Integer;
          const Increment: Byte = 1): ByteArray;
function  RangeWord(const First: Word; const Count: Integer;
          const Increment: Word = 1): WordArray;
function  RangeLongWord(const First: LongWord; const Count: Integer;
          const Increment: LongWord = 1): LongWordArray;
function  RangeCardinal(const First: Cardinal; const Count: Integer;
          const Increment: Cardinal = 1): CardinalArray;
function  RangeShortInt(const First: ShortInt; const Count: Integer;
          const Increment: ShortInt = 1): ShortIntArray;
function  RangeSmallInt(const First: SmallInt; const Count: Integer;
          const Increment: SmallInt = 1): SmallIntArray;
function  RangeLongInt(const First: LongInt; const Count: Integer;
          const Increment: LongInt = 1): LongIntArray;
function  RangeInteger(const First: Integer; const Count: Integer;
          const Increment: Integer = 1): IntegerArray;
function  RangeInt64(const First: Int64; const Count: Integer;
          const Increment: Int64 = 1): Int64Array;
function  RangeSingle(const First: Single; const Count: Integer;
          const Increment: Single = 1): SingleArray;
function  RangeDouble(const First: Double; const Count: Integer;
          const Increment: Double = 1): DoubleArray;
function  RangeExtended(const First: Extended; const Count: Integer;
          const Increment: Extended = 1): ExtendedArray;

function  DupByte(const V: Byte; const Count: Integer): ByteArray;
function  DupWord(const V: Word; const Count: Integer): WordArray;
function  DupLongWord(const V: LongWord; const Count: Integer): LongWordArray;
function  DupCardinal(const V: Cardinal; const Count: Integer): CardinalArray;
function  DupShortInt(const V: ShortInt; const Count: Integer): ShortIntArray;
function  DupSmallInt(const V: SmallInt; const Count: Integer): SmallIntArray;
function  DupLongInt(const V: LongInt; const Count: Integer): LongIntArray;
function  DupInteger(const V: Integer; const Count: Integer): IntegerArray;
function  DupInt64(const V: Int64; const Count: Integer): Int64Array;
function  DupSingle(const V: Single; const Count: Integer): SingleArray;
function  DupDouble(const V: Double; const Count: Integer): DoubleArray;
function  DupExtended(const V: Extended; const Count: Integer): ExtendedArray;
function  DupCurrency(const V: Currency; const Count: Integer): CurrencyArray;
function  DupAnsiString(const V: AnsiString; const Count: Integer): AnsiStringArray;
function  DupWideString(const V: WideString; const Count: Integer): WideStringArray;
function  DupString(const V: String; const Count: Integer): StringArray;
function  DupCharSet(const V: CharSet; const Count: Integer): CharSetArray;
function  DupObject(const V: TObject; const Count: Integer): ObjectArray;

procedure SetLengthAndZero(var V: ByteArray; const NewLength: Integer); overload;
procedure SetLengthAndZero(var V: WordArray; const NewLength: Integer); overload;
procedure SetLengthAndZero(var V: LongWordArray; const NewLength: Integer); overload;
procedure SetLengthAndZero(var V: ShortIntArray; const NewLength: Integer); overload;
procedure SetLengthAndZero(var V: SmallIntArray; const NewLength: Integer); overload;
procedure SetLengthAndZero(var V: LongIntArray; const NewLength: Integer); overload;
procedure SetLengthAndZero(var V: Int64Array; const NewLength: Integer); overload;
procedure SetLengthAndZero(var V: SingleArray; const NewLength: Integer); overload;
procedure SetLengthAndZero(var V: DoubleArray; const NewLength: Integer); overload;
procedure SetLengthAndZero(var V: ExtendedArray; const NewLength: Integer); overload;
procedure SetLengthAndZero(var V: CurrencyArray; const NewLength: Integer); overload;
procedure SetLengthAndZero(var V: CharSetArray; const NewLength: Integer); overload;
procedure SetLengthAndZero(var V: BooleanArray; const NewLength: Integer); overload;
{$IFNDEF ManagedCode}
procedure SetLengthAndZero(var V: PointerArray; const NewLength: Integer); overload;
{$ENDIF}
procedure SetLengthAndZero(var V: ObjectArray; const NewLength: Integer;
          const FreeObjects: Boolean = False); overload;

function  IsEqual(const V1, V2: ByteArray): Boolean; overload;
function  IsEqual(const V1, V2: WordArray): Boolean; overload;
function  IsEqual(const V1, V2: LongWordArray): Boolean; overload;
function  IsEqual(const V1, V2: ShortIntArray): Boolean; overload;
function  IsEqual(const V1, V2: SmallIntArray): Boolean; overload;
function  IsEqual(const V1, V2: LongIntArray): Boolean; overload;
function  IsEqual(const V1, V2: Int64Array): Boolean; overload;
function  IsEqual(const V1, V2: SingleArray): Boolean; overload;
function  IsEqual(const V1, V2: DoubleArray): Boolean; overload;
function  IsEqual(const V1, V2: ExtendedArray): Boolean; overload;
function  IsEqual(const V1, V2: CurrencyArray): Boolean; overload;
function  IsEqual(const V1, V2: AnsiStringArray): Boolean; overload;
function  IsEqual(const V1, V2: WideStringArray): Boolean; overload;
function  IsEqual(const V1, V2: CharSetArray): Boolean; overload;

function  ByteArrayToLongIntArray(const V: ByteArray): LongIntArray;
function  WordArrayToLongIntArray(const V: WordArray): LongIntArray;
function  ShortIntArrayToLongIntArray(const V: ShortIntArray): LongIntArray;
function  SmallIntArrayToLongIntArray(const V: SmallIntArray): LongIntArray;
function  LongIntArrayToInt64Array(const V: LongIntArray): Int64Array;
function  LongIntArrayToSingleArray(const V: LongIntArray): SingleArray;
function  LongIntArrayToDoubleArray(const V: LongIntArray): DoubleArray;
function  LongIntArrayToExtendedArray(const V: LongIntArray): ExtendedArray;
function  SingleArrayToDoubleArray(const V: SingleArray): DoubleArray;
function  SingleArrayToExtendedArray(const V: SingleArray): ExtendedArray;
function  SingleArrayToCurrencyArray(const V: SingleArray): CurrencyArray;
function  SingleArrayToLongIntArray(const V: SingleArray): LongIntArray;
function  SingleArrayToInt64Array(const V: SingleArray): Int64Array;
function  DoubleArrayToExtendedArray(const V: DoubleArray): ExtendedArray;
function  DoubleArrayToCurrencyArray(const V: DoubleArray): CurrencyArray;
function  DoubleArrayToLongIntArray(const V: DoubleArray): LongIntArray;
function  DoubleArrayToInt64Array(const V: DoubleArray): Int64Array;
function  ExtendedArrayToCurrencyArray(const V: ExtendedArray): CurrencyArray;
function  ExtendedArrayToLongIntArray(const V: ExtendedArray): LongIntArray;
function  ExtendedArrayToInt64Array(const V: ExtendedArray): Int64Array;

function  ByteArrayFromIndexes(const V: ByteArray;
          const Indexes: IntegerArray): ByteArray;
function  WordArrayFromIndexes(const V: WordArray;
          const Indexes: IntegerArray): WordArray;
function  LongWordArrayFromIndexes(const V: LongWordArray;
          const Indexes: IntegerArray): LongWordArray;
function  CardinalArrayFromIndexes(const V: CardinalArray;
          const Indexes: IntegerArray): CardinalArray;
function  ShortIntArrayFromIndexes(const V: ShortIntArray;
          const Indexes: IntegerArray): ShortIntArray;
function  SmallIntArrayFromIndexes(const V: SmallIntArray;
          const Indexes: IntegerArray): SmallIntArray;
function  LongIntArrayFromIndexes(const V: LongIntArray;
          const Indexes: IntegerArray): LongIntArray;
function  IntegerArrayFromIndexes(const V: IntegerArray;
          const Indexes: IntegerArray): IntegerArray;
function  Int64ArrayFromIndexes(const V: Int64Array;
          const Indexes: IntegerArray): Int64Array;
function  SingleArrayFromIndexes(const V: SingleArray;
          const Indexes: IntegerArray): SingleArray;
function  DoubleArrayFromIndexes(const V: DoubleArray;
          const Indexes: IntegerArray): DoubleArray;
function  ExtendedArrayFromIndexes(const V: ExtendedArray;
          const Indexes: IntegerArray): ExtendedArray;
function  StringArrayFromIndexes(const V: StringArray;
          const Indexes: IntegerArray): StringArray;

procedure Sort(const V: ByteArray); overload;
procedure Sort(const V: WordArray); overload;
procedure Sort(const V: LongWordArray); overload;
procedure Sort(const V: ShortIntArray); overload;
procedure Sort(const V: SmallIntArray); overload;
procedure Sort(const V: LongIntArray); overload;
procedure Sort(const V: Int64Array); overload;
procedure Sort(const V: SingleArray); overload;
procedure Sort(const V: DoubleArray); overload;
procedure Sort(const V: ExtendedArray); overload;
procedure Sort(const V: AnsiStringArray); overload;
procedure Sort(const V: WideStringArray); overload;

procedure Sort(const Key: IntegerArray; const Data: IntegerArray); overload;
procedure Sort(const Key: IntegerArray; const Data: Int64Array); overload;
procedure Sort(const Key: IntegerArray; const Data: AnsiStringArray); overload;
procedure Sort(const Key: IntegerArray; const Data: ExtendedArray); overload;
{$IFNDEF ManagedCode}
procedure Sort(const Key: IntegerArray; const Data: PointerArray); overload;
{$ENDIF}
procedure Sort(const Key: AnsiStringArray; const Data: IntegerArray); overload;
procedure Sort(const Key: AnsiStringArray; const Data: Int64Array); overload;
procedure Sort(const Key: AnsiStringArray; const Data: AnsiStringArray); overload;
procedure Sort(const Key: AnsiStringArray; const Data: ExtendedArray); overload;
{$IFNDEF ManagedCode}
procedure Sort(const Key: AnsiStringArray; const Data: PointerArray); overload;
{$ENDIF}
procedure Sort(const Key: ExtendedArray; const Data: IntegerArray); overload;
procedure Sort(const Key: ExtendedArray; const Data: Int64Array); overload;
procedure Sort(const Key: ExtendedArray; const Data: AnsiStringArray); overload;
procedure Sort(const Key: ExtendedArray; const Data: ExtendedArray); overload;
{$IFNDEF ManagedCode}
procedure Sort(const Key: ExtendedArray; const Data: PointerArray); overload;
{$ENDIF}



{$IFNDEF CLR}
{                                                                              }
{ Generic quick sort algorithm                                                 }
{                                                                              }
type
  TQuickSortCompareFunction =
      function  (const Data: Pointer; const Index1, Index2: Integer): TCompareResult;
  TQuickSortSwapFunction =
      procedure (const Data: Pointer; const Index1, Index2: Integer);

procedure GenericQuickSort(const Data: Pointer; const Count: Integer;
          const CompareFunc: TQuickSortCompareFunction;
          const SwapFunc: TQuickSortSwapFunction);



{                                                                              }
{ Generic binary search algorithm                                              }
{                                                                              }
type
  TBinarySearchCompareFunction =
      function  (const Data: Pointer; const Index: Integer;
                 const Item: Pointer): TCompareResult;

function GenericBinarySearch(const Data: Pointer; const Count: Integer;
         const Item: Pointer;
         const CompareFunc: TBinarySearchCompareFunction): Integer;
{$ENDIF}



{                                                                              }
{ Test cases                                                                   }
{                                                                              }
{$IFDEF UTILS_SELFTEST}
procedure SelfTest;
{$ENDIF}



implementation

{$IFDEF ManagedCode}
uses
  SysUtils;
{$ENDIF}



{                                                                              }
{ CPU identification                                                           }
{                                                                              }
{$IFDEF ASM386_DELPHI}
var
  CPUIDInitialised : Boolean = False;
  CPUIDSupport     : Boolean = False;
  MMXSupport       : Boolean = False;

procedure InitialiseCPUID; assembler;
asm
      // Set CPUID flag
      PUSHFD
      POP     EAX
      OR      EAX, $200000
      PUSH    EAX
      POPFD

      // Check if CPUID flag is still set
      PUSHFD
      POP     EAX
      AND     EAX, $200000
      JNZ     @CPUIDSupported

      // CPUID not supported
      MOV     BYTE PTR [CPUIDSupport], 0
      MOV     BYTE PTR [MMXSupport], 0
      JMP     @CPUIDFin

      // CPUID supported
  @CPUIDSupported:
      MOV     BYTE PTR [CPUIDSupport], 1

      PUSH    EBX

      // Perform CPUID function 1
      MOV     EAX, 1
      {$IFDEF DELPHI5_DOWN}
      DW      0FA2h
      {$ELSE}
      CPUID
      {$ENDIF}

      // Check if MMX feature flag is set
      AND     EDX, $800000
      SETNZ   AL
      MOV     BYTE PTR [MMXSupport], AL

      POP     EBX

  @CPUIDFin:
      MOV     BYTE PTR [CPUIDInitialised], 1
end;
{$ENDIF}



{                                                                              }
{ Range check error                                                            }
{                                                                              }
{$IFOPT R+}
{$IFDEF ManagedCode}
resourcestring
  SRangeCheckError = 'Range check error';

procedure RaiseRangeCheckError; {$IFDEF UseInline}inline;{$ENDIF}
begin
  raise ERangeError.Create(SRangeCheckError);
end;
{$ELSE}
{$IFDEF DELPHI2005_UP}
procedure RaiseRangeCheckError;
begin
  // Raise range check error using Error function in System.pas
  Error(reRangeError);
end;
{$ELSE}
resourcestring
  SRangeCheckError = 'Range check error';

procedure RaiseRangeCheckError;
begin
  // Raise range check error using Assert mechanism
  {$IFOPT C+}
    {$DEFINE OPT_C_ON}
  {$ELSE}
    {$UNDEF OPT_C_ON}
    {$C+}
  {$ENDIF}
  Assert(False, SRangeCheckError);
  {$IFNDEF OPT_C_ON}
    {$C-}
  {$ENDIF}
end;
{$ENDIF}
{$ENDIF}
{$ENDIF}



{                                                                              }
{ Integer                                                                      }
{                                                                              }
function MinI(const A, B: Integer): Integer;
begin
  if A < B then
    Result := A
  else
    Result := B;
end;

function MaxI(const A, B: Integer): Integer;
begin
  if A > B then
    Result := A
  else
    Result := B;
end;

function MinC(const A, B: Cardinal): Cardinal;
begin
  if A < B then
    Result := A
  else
    Result := B;
end;

function MaxC(const A, B: Cardinal): Cardinal;
begin
  if A > B then
    Result := A
  else
    Result := B;
end;

function Clip(const Value: LongInt; const Low, High: LongInt): LongInt;
begin
  if Value < Low then
    Result := Low else
  if Value > High then
    Result := High
  else
    Result := Value;
end;

function Clip(const Value: Int64; const Low, High: Int64): Int64;
begin
  if Value < Low then
    Result := Low else
  if Value > High then
    Result := High
  else
    Result := Value;
end;

function ClipByte(const Value: LongInt): LongInt;
begin
  if Value < MinByte then
    Result := MinByte else
  if Value > MaxByte then
    Result := MaxByte
  else
    Result := Value;
end;

function ClipByte(const Value: Int64): Int64;
begin
  if Value < MinByte then
    Result := MinByte else
  if Value > MaxByte then
    Result := MaxByte
  else
    Result := Value;
end;

function ClipWord(const Value: LongInt): LongInt;
begin
  if Value < MinWord then
    Result := MinWord else
  if Value > MaxWord then
    Result := MaxWord
  else
    Result := Value;
end;

function ClipWord(const Value: Int64): Int64;
begin
  if Value < MinWord then
    Result := MinWord else
  if Value > MaxWord then
    Result := MaxWord
  else
    Result := Value;
end;

function ClipLongWord(const Value: Int64): LongWord;
begin
  if Value < MinLongWord then
    Result := MinLongWord else
  if Value > MaxLongWord then
    Result := MaxLongWord
  else
    Result := LongWord(Value);
end;

function SumClipI(const A, I: Integer): Integer;
begin
  if I >= 0 then
    if A >= MaxInteger - I then
      Result := MaxInteger
    else
      Result := A + I
  else
    if A <= MinInteger - I then
      Result := MinInteger
    else
      Result := A + I;
end;

function SumClipC(const A: Cardinal; const I: Integer): Cardinal;
var B : Cardinal;
begin
  if I >= 0 then
    if A >= MaxCardinal - Cardinal(I) then
      Result := MaxCardinal
    else
      Result := A + Cardinal(I)
  else
    begin
      B := Cardinal(-I);
      if A <= B then
        Result := 0
      else
        Result := A - B;
    end;
end;

function InByteRange(const A: Int64): Boolean;
begin
  Result := (A >= MinByte) and (A <= MaxByte);
end;

function InWordRange(const A: Int64): Boolean;
begin
  Result := (A >= MinWord) and (A <= MaxWord);
end;

function InLongWordRange(const A: Int64): Boolean;
begin
  Result := (A >= MinLongWord) and (A <= MaxLongWord);
end;

function InShortIntRange(const A: Int64): Boolean;
begin
  Result := (A >= MinShortInt) and (A <= MaxShortInt);
end;

function InSmallIntRange(const A: Int64): Boolean;
begin
  Result := (A >= MinSmallInt) and (A <= MaxSmallInt);
end;

function InLongIntRange(const A: Int64): Boolean;
begin
  Result := (A >= MinLongInt) and (A <= MaxLongInt);
end;



{                                                                              }
{ Real                                                                         }
{                                                                              }
function MinF(const A, B: Float): Float;
begin
  if A < B then
    Result := A
  else
    Result := B;
end;

function MaxF(const A, B: Float): Float;
begin
  if A > B then
    Result := A
  else
    Result := B;
end;

function ClipF(const Value: Float; const Low, High: Float): Float;
begin
  if Value < Low then
    Result := Low else
  if Value > High then
    Result := High
  else
    Result := Value;
end;

function InSingleRange(const A: Float): Boolean;
var B : Float;
begin
  B := Abs(A);
  Result := (B >= MinSingle) and (B <= MaxSingle);
end;

{$IFDEF CLR}
function InDoubleRange(const A: Float): Boolean;
begin
  Result := True;
end;
{$ELSE}
function InDoubleRange(const A: Float): Boolean;
var B : Float;
begin
  B := Abs(A);
  Result := (B >= MinDouble) and (B <= MaxDouble);
end;
{$ENDIF}

{$IFNDEF CLR}
function InCurrencyRange(const A: Float): Boolean;
begin
  Result := (A >= MinCurrency) and (A <= MaxCurrency);
end;

function InCurrencyRange(const A: Int64): Boolean;
begin
  Result := (A >= MinCurrency) and (A <= MaxCurrency);
end;
{$ENDIF}



{                                                                              }
{ Bit functions                                                                }
{                                                                              }
{$IFDEF ASM386_DELPHI}
function ReverseBits(const Value: LongWord): LongWord; register; assembler;
asm
      BSWAP   EAX
      MOV     EDX, EAX
      AND     EAX, 0AAAAAAAAh
      SHR     EAX, 1
      AND     EDX, 055555555h
      SHL     EDX, 1
      OR      EAX, EDX
      MOV     EDX, EAX
      AND     EAX, 0CCCCCCCCh
      SHR     EAX, 2
      AND     EDX, 033333333h
      SHL     EDX, 2
      OR      EAX, EDX
      MOV     EDX, EAX
      AND     EAX, 0F0F0F0F0h
      SHR     EAX, 4
      AND     EDX, 00F0F0F0Fh
      SHL     EDX, 4
      OR      EAX, EDX
end;
{$ELSE}
function ReverseBits(const Value: LongWord): LongWord;
var I : Byte;
begin
  Result := 0;
  for I := 0 to 31 do
    if Value and BitMaskTable[I] <> 0 then
      Result := Result or BitMaskTable[31 - I];
end;
{$ENDIF}

function ReverseBits(const Value: LongWord; const BitCount: Integer): LongWord;
var I : Integer;
  V : LongWord;
begin
  V := Value;
  Result := 0;
  for I := 0 to MinI(BitCount, BitsPerLongWord) - 1 do
    begin
      Result := (Result shl 1) or (V and 1);
      V := V shr 1;
    end;
end;

{$IFDEF ASM386_DELPHI}
function SwapEndian(const Value: LongWord): LongWord; register; assembler;
asm
      XCHG    AH, AL
      ROL     EAX, 16
      XCHG    AH, AL
end;
{$ELSE}
function SwapEndian(const Value: LongWord): LongWord;
begin
  Result := ((Value and $000000FF) shl 24)  or
            ((Value and $0000FF00) shl 8)   or
            ((Value and $00FF0000) shr 8)   or
            ((Value and $FF000000) shr 24);
end;
{$ENDIF}

{$IFDEF ManagedCode}
procedure SwapEndianBuf(var Buf: array of LongWord);
var I : Integer;
begin
  for I := 0 to Length(Buf) - 1 do
    Buf[I] := SwapEndian(Buf[I]);
end;
{$ELSE}
procedure SwapEndianBuf(var Buf; const Count: Integer);
var P : PLongWord;
    I : Integer;
begin
  P := @Buf;
  for I := 1 to Count do
    begin
      P^ := SwapEndian(P^);
      Inc(P);
    end;
end;
{$ENDIF}

{$IFDEF ASM386_DELPHI}
function TwosComplement(const Value: LongWord): LongWord; register; assembler;
asm
      NEG     EAX
end;
{$ELSE}
function TwosComplement(const Value: LongWord): LongWord;
begin
  Result := LongWord(not Value + 1);
end;
{$ENDIF}

{$IFDEF ASM386_DELPHI}
function RotateLeftBits16(const Value: Word; const Bits: Byte): Word;
asm
      MOV     CL, DL
      ROL     AX, CL
end;
{$ELSE}
function RotateLeftBits16(const Value: Word; const Bits: Byte): Word;
var I, B : Integer;
begin
  Result := Value;
  if Bits >= 16 then
    B := Bits mod 16
  else
    B := Bits;
  for I := 1 to B do
    if Result and $8000 = 0 then
      Result := Result shl 1
    else
      Result := Word(Result shl 1) or 1;
end;
{$ENDIF}

{$IFDEF ASM386_DELPHI}
function RotateLeftBits32(const Value: LongWord; const Bits: Byte): LongWord;
asm
      MOV     CL, DL
      ROL     EAX, CL
end;
{$ELSE}
function RotateLeftBits32(const Value: LongWord; const Bits: Byte): LongWord;
var I, B : Integer;
begin
  Result := Value;
  if Bits >= 32 then
    B := Bits mod 32
  else
    B := Bits;
  for I := 1 to B do
    if Result and $80000000 = 0 then
      Result := Result shl 1
    else
      Result := LongWord(Result shl 1) or 1;
end;
{$ENDIF}

{$IFDEF ASM386_DELPHI}
function RotateRightBits16(const Value: Word; const Bits: Byte): Word;
asm
      MOV     CL, DL
      ROR     AX, CL
end;
{$ELSE}
function RotateRightBits16(const Value: Word; const Bits: Byte): Word;
var I, B : Integer;
begin
  Result := Value;
  if Bits >= 16 then
    B := Bits mod 16
  else
    B := Bits;
  for I := 1 to B do
    if Result and 1 = 0 then
      Result := Result shr 1
    else
      Result := (Result shr 1) or $8000;
end;
{$ENDIF}

{$IFDEF ASM386_DELPHI}
function RotateRightBits32(const Value: LongWord; const Bits: Byte): LongWord;
asm
      MOV     CL, DL
      ROR     EAX, CL
end;
{$ELSE}
function RotateRightBits32(const Value: LongWord; const Bits: Byte): LongWord;
var I, B : Integer;
begin
  Result := Value;
  if Bits >= 32 then
    B := Bits mod 32
  else
    B := Bits;
  for I := 1 to B do
    if Result and 1 = 0 then
      Result := Result shr 1
    else
      Result := (Result shr 1) or $80000000;
end;
{$ENDIF}

{$IFDEF ASM386_DELPHI}
function SetBit(const Value, BitIndex: LongWord): LongWord;
asm
      {$IFOPT R+}
      CMP     BitIndex, BitsPerLongWord
      JB      @RangeOk
      JMP     RaiseRangeCheckError
  @RangeOk:
      {$ENDIF}
      OR      EAX, DWORD PTR [BitIndex * 4 + BitMaskTable]
end;
{$ELSE}
function SetBit(const Value, BitIndex: LongWord): LongWord;
begin
  Result := Value or BitMaskTable[BitIndex];
end;
{$ENDIF}

{$IFDEF ASM386_DELPHI}
function ClearBit(const Value, BitIndex: LongWord): LongWord;
asm
      {$IFOPT R+}
      CMP     BitIndex, BitsPerLongWord
      JB      @RangeOk
      JMP     RaiseRangeCheckError
  @RangeOk:
      {$ENDIF}
      MOV     ECX, DWORD PTR [BitIndex * 4 + BitMaskTable]
      NOT     ECX
      AND     EAX, ECX
  @Fin:
end;
{$ELSE}
function ClearBit(const Value, BitIndex: LongWord): LongWord;
begin
  Result := Value and not BitMaskTable[BitIndex];
end;
{$ENDIF}

{$IFDEF ASM386_DELPHI}
function ToggleBit(const Value, BitIndex: LongWord): LongWord;
asm
      {$IFOPT R+}
      CMP     BitIndex, BitsPerLongWord
      JB      @RangeOk
      JMP     RaiseRangeCheckError
  @RangeOk:
      {$ENDIF}
      XOR     EAX, DWORD PTR [BitIndex * 4 + BitMaskTable]
end;
{$ELSE}
function ToggleBit(const Value, BitIndex: LongWord): LongWord;
begin
  Result := Value xor BitMaskTable[BitIndex];
end;
{$ENDIF}

{$IFDEF ASM386_DELPHI}
function IsHighBitSet(const Value: LongWord): Boolean; register; assembler;
asm
      TEST    Value, $80000000
      SETNZ   AL
end;
{$ELSE}
function IsHighBitSet(const Value: LongWord): Boolean;
begin
  Result := Value and $80000000 <> 0;
end;
{$ENDIF}

{$IFDEF ASM386_DELPHI}
function IsBitSet(const Value, BitIndex: LongWord): Boolean;
asm
      {$IFOPT R+}
      CMP     BitIndex, BitsPerLongWord
      JB      @RangeOk
      JMP     RaiseRangeCheckError
  @RangeOk:
      {$ENDIF}
      MOV     ECX, DWORD PTR BitMaskTable [BitIndex * 4]
      TEST    Value, ECX
      SETNZ   AL
end;
{$ELSE}
function IsBitSet(const Value, BitIndex: LongWord): Boolean;
begin
  Result := Value and BitMaskTable[BitIndex] <> 0;
end;
{$ENDIF}

{$IFDEF ASM386_DELPHI}
function SetBitScanForward(const Value: LongWord): Integer;
asm
      OR      EAX, EAX
      JZ      @NoBits
      BSF     EAX, EAX
      RET
  @NoBits:
      MOV     EAX, -1
end;

function SetBitScanForward(const Value, BitIndex: LongWord): Integer;
asm
      CMP     BitIndex, BitsPerLongWord
      JAE     @NotFound
      MOV     ECX, BitIndex
      MOV     EDX, $FFFFFFFF
      SHL     EDX, CL
      AND     EDX, EAX
      JE      @NotFound
      BSF     EAX, EDX
      RET
  @NotFound:
      MOV     EAX, -1
end;
{$ELSE}
function SetBitScanForward(const Value, BitIndex: LongWord): Integer;
var I : Integer;
begin
  if BitIndex < BitsPerLongWord then
    for I := Integer(BitIndex) to 31 do
      if Value and BitMaskTable[I] <> 0 then
        begin
          Result := I;
          exit;
        end;
  Result := -1;
end;

function SetBitScanForward(const Value: LongWord): Integer;
begin
  Result := SetBitScanForward(Value, 0);
end;
{$ENDIF}

{$IFDEF ASM386_DELPHI}
function SetBitScanReverse(const Value: LongWord): Integer;
asm
      OR      EAX, EAX
      JZ      @NoBits
      BSR     EAX, EAX
      RET
  @NoBits:
      MOV     EAX, -1
end;

function SetBitScanReverse(const Value, BitIndex: LongWord): Integer;
asm
      CMP     EDX, BitsPerLongWord
      JAE     @NotFound
      LEA     ECX, [EDX - 31]
      MOV     EDX, $FFFFFFFF
      NEG     ECX
      SHR     EDX, CL
      AND     EDX, EAX
      JE      @NotFound
      BSR     EAX, EDX
      RET
  @NotFound:
      MOV     EAX, -1
end;
{$ELSE}
function SetBitScanReverse(const Value, BitIndex: LongWord): Integer;
var I : Integer;
begin
  if BitIndex < BitsPerLongWord then
    for I := Integer(BitIndex) downto 0 do
      if Value and BitMaskTable[I] <> 0 then
        begin
          Result := I;
          exit;
        end;
  Result := -1;
end;

function SetBitScanReverse(const Value: LongWord): Integer;
begin
  Result := SetBitScanReverse(Value, 31);
end;
{$ENDIF}

{$IFDEF ASM386_DELPHI}
function ClearBitScanForward(const Value: LongWord): Integer;
asm
      NOT     EAX
      OR      EAX, EAX
      JZ      @NoBits
      BSF     EAX, EAX
      RET
  @NoBits:
      MOV     EAX, -1
end;

function ClearBitScanForward(const Value, BitIndex: LongWord): Integer;
asm
      CMP     EDX, BitsPerLongWord
      JAE     @NotFound
      MOV     ECX, EDX
      MOV     EDX, $FFFFFFFF
      NOT     EAX
      SHL     EDX, CL
      AND     EDX, EAX
      JE      @NotFound
      BSF     EAX, EDX
      RET
  @NotFound:
      MOV     EAX, -1
end;
{$ELSE}
function ClearBitScanForward(const Value, BitIndex: LongWord): Integer;
var I : Integer;
begin
  if BitIndex < BitsPerLongWord then
    for I := Integer(BitIndex) to 31 do
      if Value and BitMaskTable[I] = 0 then
        begin
          Result := I;
          exit;
        end;
  Result := -1;
end;

function ClearBitScanForward(const Value: LongWord): Integer;
begin
  Result := ClearBitScanForward(Value, 0);
end;
{$ENDIF}

{$IFDEF ASM386_DELPHI}
function ClearBitScanReverse(const Value: LongWord): Integer;
asm
      NOT     EAX
      OR      EAX, EAX
      JZ      @NoBits
      BSR     EAX, EAX
      RET
  @NoBits:
      MOV     EAX, -1
end;

function ClearBitScanReverse(const Value, BitIndex: LongWord): Integer;
asm
      CMP     EDX, BitsPerLongWord
      JAE     @NotFound
      LEA     ECX, [EDX - 31]
      MOV     EDX, $FFFFFFFF
      NEG     ECX
      NOT     EAX
      SHR     EDX, CL
      AND     EDX, EAX
      JE      @NotFound
      BSR     EAX, EDX
      RET
  @NotFound:
      MOV     EAX, -1
end;
{$ELSE}
function ClearBitScanReverse(const Value, BitIndex: LongWord): Integer;
var I : Integer;
begin
  if BitIndex < BitsPerLongWord then
    for I := Integer(BitIndex) downto 0 do
      if Value and BitMaskTable[I] = 0 then
        begin
          Result := I;
          exit;
        end;
  Result := -1;
end;

function ClearBitScanReverse(const Value: LongWord): Integer;
begin
  Result := ClearBitScanReverse(Value, 31);
end;
{$ENDIF}

const
  BitCountTable : array[Byte] of Byte =
    (0, 1, 1, 2, 1, 2, 2, 3, 1, 2, 2, 3, 2, 3, 3, 4,
     1, 2, 2, 3, 2, 3, 3, 4, 2, 3, 3, 4, 3, 4, 4, 5,
     1, 2, 2, 3, 2, 3, 3, 4, 2, 3, 3, 4, 3, 4, 4, 5,
     2, 3, 3, 4, 3, 4, 4, 5, 3, 4, 4, 5, 4, 5, 5, 6,
     1, 2, 2, 3, 2, 3, 3, 4, 2, 3, 3, 4, 3, 4, 4, 5,
     2, 3, 3, 4, 3, 4, 4, 5, 3, 4, 4, 5, 4, 5, 5, 6,
     2, 3, 3, 4, 3, 4, 4, 5, 3, 4, 4, 5, 4, 5, 5, 6,
     3, 4, 4, 5, 4, 5, 5, 6, 4, 5, 5, 6, 5, 6, 6, 7,
     1, 2, 2, 3, 2, 3, 3, 4, 2, 3, 3, 4, 3, 4, 4, 5,
     2, 3, 3, 4, 3, 4, 4, 5, 3, 4, 4, 5, 4, 5, 5, 6,
     2, 3, 3, 4, 3, 4, 4, 5, 3, 4, 4, 5, 4, 5, 5, 6,
     3, 4, 4, 5, 4, 5, 5, 6, 4, 5, 5, 6, 5, 6, 6, 7,
     2, 3, 3, 4, 3, 4, 4, 5, 3, 4, 4, 5, 4, 5, 5, 6,
     3, 4, 4, 5, 4, 5, 5, 6, 4, 5, 5, 6, 5, 6, 6, 7,
     3, 4, 4, 5, 4, 5, 5, 6, 4, 5, 5, 6, 5, 6, 6, 7,
     4, 5, 5, 6, 5, 6, 6, 7, 5, 6, 6, 7, 6, 7, 7, 8);

{$IFDEF ASM386_DELPHI}
function BitCount(const Value: LongWord): LongWord; register; assembler;
asm
      MOVZX   EDX, AL
      MOVZX   EDX, BYTE PTR [EDX + BitCountTable]
      MOVZX   ECX, AH
      ADD     DL, BYTE PTR [ECX + BitCountTable]
      SHR     EAX, 16
      MOVZX   ECX, AH
      ADD     DL, BYTE PTR [ECX + BitCountTable]
      AND     EAX, $FF
      ADD     DL, BYTE PTR [EAX + BitCountTable]
      MOV     AL, DL
end;
{$ELSE}
function BitCount(const Value: LongWord): LongWord;
begin
  Result := BitCountTable[(Value and $000000FF)       ] +
            BitCountTable[(Value and $0000FF00) shr 8 ] +
            BitCountTable[(Value and $00FF0000) shr 16] +
            BitCountTable[(Value and $FF000000) shr 24];
end;
{$ENDIF}

function IsPowerOfTwo(const Value: LongWord): Boolean;
begin
  Result := BitCount(Value) = 1;
end;

function LowBitMask(const HighBitIndex: LongWord): LongWord;
begin
  if HighBitIndex >= BitsPerLongWord then
    Result := 0
  else
    Result := BitMaskTable[HighBitIndex] - 1;
end;

function HighBitMask(const LowBitIndex: LongWord): LongWord;
begin
  if LowBitIndex >= BitsPerLongWord then
    Result := 0
  else
    Result := not BitMaskTable[LowBitIndex] + 1;
end;

function RangeBitMask(const LowBitIndex, HighBitIndex: LongWord): LongWord;
begin
  if (LowBitIndex >= BitsPerLongWord) and (HighBitIndex >= BitsPerLongWord) then
    begin
      Result := 0;
      exit;
    end;
  Result := $FFFFFFFF;
  if LowBitIndex > 0 then
    Result := Result xor (BitMaskTable[LowBitIndex] - 1);
  if HighBitIndex < 31 then
    Result := Result xor (not BitMaskTable[HighBitIndex + 1] + 1);
end;

function SetBitRange(const Value: LongWord; const LowBitIndex, HighBitIndex: LongWord): LongWord;
begin
  Result := Value or RangeBitMask(LowBitIndex, HighBitIndex);
end;

function ClearBitRange(const Value: LongWord; const LowBitIndex, HighBitIndex: LongWord): LongWord;
begin
  Result := Value and not RangeBitMask(LowBitIndex, HighBitIndex);
end;

function ToggleBitRange(const Value: LongWord; const LowBitIndex, HighBitIndex: LongWord): LongWord;
begin
  Result := Value xor RangeBitMask(LowBitIndex, HighBitIndex);
end;

function IsBitRangeSet(const Value: LongWord; const LowBitIndex, HighBitIndex: LongWord): Boolean;
var M: LongWord;
begin
  M := RangeBitMask(LowBitIndex, HighBitIndex);
  Result := Value and M = M;
end;

function IsBitRangeClear(const Value: LongWord; const LowBitIndex, HighBitIndex: LongWord): Boolean;
begin
  Result := Value and RangeBitMask(LowBitIndex, HighBitIndex) = 0;
end;



{                                                                              }
{ Sets                                                                         }
{                                                                              }
function AsCharSet(const C: array of AnsiChar): CharSet;
var I: Integer;
begin
  Result := [];
  for I := 0 to High(C) do
    Include(Result, C[I]);
end;

function AsByteSet(const C: array of Byte): ByteSet;
var I: Integer;
begin
  Result := [];
  for I := 0 to High(C) do
    Include(Result, C[I]);
end;

{$IFDEF ASM386_DELPHI}
procedure ComplementChar(var C: CharSet; const Ch: AnsiChar);
asm
      MOVZX   ECX, DL
      BTC     [EAX], ECX
end;
{$ELSE}
procedure ComplementChar(var C: CharSet; const Ch: AnsiChar);
begin
  if Ch in C then
    Exclude(C, Ch)
  else
    Include(C, Ch);
end;
{$ENDIF}

{$IFDEF ASM386_DELPHI}
procedure ClearCharSet(var C: CharSet);
asm
      XOR     EDX, EDX
      MOV     [EAX], EDX
      MOV     [EAX + 4], EDX
      MOV     [EAX + 8], EDX
      MOV     [EAX + 12], EDX
      MOV     [EAX + 16], EDX
      MOV     [EAX + 20], EDX
      MOV     [EAX + 24], EDX
      MOV     [EAX + 28], EDX
end;
{$ELSE}
procedure ClearCharSet(var C: CharSet);
begin
  C := [];
end;
{$ENDIF}

{$IFDEF ASM386_DELPHI}
procedure FillCharSet(var C: CharSet);
asm
      MOV     EDX, $FFFFFFFF
      MOV     [EAX], EDX
      MOV     [EAX + 4], EDX
      MOV     [EAX + 8], EDX
      MOV     [EAX + 12], EDX
      MOV     [EAX + 16], EDX
      MOV     [EAX + 20], EDX
      MOV     [EAX + 24], EDX
      MOV     [EAX + 28], EDX
end;
{$ELSE}
procedure FillCharSet(var C: CharSet);
begin
  C := [#0..#255];
end;
{$ENDIF}

{$IFDEF ASM386_DELPHI}
procedure ComplementCharSet(var C: CharSet);
asm
      NOT     DWORD PTR [EAX]
      NOT     DWORD PTR [EAX + 4]
      NOT     DWORD PTR [EAX + 8]
      NOT     DWORD PTR [EAX + 12]
      NOT     DWORD PTR [EAX + 16]
      NOT     DWORD PTR [EAX + 20]
      NOT     DWORD PTR [EAX + 24]
      NOT     DWORD PTR [EAX + 28]
end;
{$ELSE}
procedure ComplementCharSet(var C: CharSet);
begin
  C := [#0..#255] - C;
end;
{$ENDIF}

{$IFDEF ASM386_DELPHI}
procedure AssignCharSet(var DestSet: CharSet; const SourceSet: CharSet);
asm
      MOV     ECX, [EDX]
      MOV     [EAX], ECX
      MOV     ECX, [EDX + 4]
      MOV     [EAX + 4], ECX
      MOV     ECX, [EDX + 8]
      MOV     [EAX + 8], ECX
      MOV     ECX, [EDX + 12]
      MOV     [EAX + 12], ECX
      MOV     ECX, [EDX + 16]
      MOV     [EAX + 16], ECX
      MOV     ECX, [EDX + 20]
      MOV     [EAX + 20], ECX
      MOV     ECX, [EDX + 24]
      MOV     [EAX + 24], ECX
      MOV     ECX, [EDX + 28]
      MOV     [EAX + 28], ECX
end;
{$ELSE}
procedure AssignCharSet(var DestSet: CharSet; const SourceSet: CharSet);
begin
  DestSet := SourceSet;
end;
{$ENDIF}

{$IFDEF ASM386_DELPHI}
procedure Union(var DestSet: CharSet; const SourceSet: CharSet);
asm
      MOV     ECX, [EDX]
      OR      [EAX], ECX
      MOV     ECX, [EDX + 4]
      OR      [EAX + 4], ECX
      MOV     ECX, [EDX + 8]
      OR      [EAX + 8], ECX
      MOV     ECX, [EDX + 12]
      OR      [EAX + 12], ECX
      MOV     ECX, [EDX + 16]
      OR      [EAX + 16], ECX
      MOV     ECX, [EDX + 20]
      OR      [EAX + 20], ECX
      MOV     ECX, [EDX + 24]
      OR      [EAX + 24], ECX
      MOV     ECX, [EDX + 28]
      OR      [EAX + 28], ECX
end;
{$ELSE}
procedure Union(var DestSet: CharSet; const SourceSet: CharSet);
begin
  DestSet := DestSet + SourceSet;
end;
{$ENDIF}

{$IFDEF ASM386_DELPHI}
procedure Difference(var DestSet: CharSet; const SourceSet: CharSet);
asm
      MOV     ECX, [EDX]
      NOT     ECX
      AND     [EAX], ECX
      MOV     ECX, [EDX + 4]
      NOT     ECX
      AND     [EAX + 4], ECX
      MOV     ECX, [EDX + 8]
      NOT     ECX
      AND     [EAX + 8],ECX
      MOV     ECX, [EDX + 12]
      NOT     ECX
      AND     [EAX + 12], ECX
      MOV     ECX, [EDX + 16]
      NOT     ECX
      AND     [EAX + 16], ECX
      MOV     ECX, [EDX + 20]
      NOT     ECX
      AND     [EAX + 20], ECX
      MOV     ECX, [EDX + 24]
      NOT     ECX
      AND     [EAX + 24], ECX
      MOV     ECX, [EDX + 28]
      NOT     ECX
      AND     [EAX + 28], ECX
end;
{$ELSE}
procedure Difference(var DestSet: CharSet; const SourceSet: CharSet);
begin
  DestSet := DestSet - SourceSet;
end;
{$ENDIF}

{$IFDEF ASM386_DELPHI}
procedure Intersection(var DestSet: CharSet; const SourceSet: CharSet);
asm
      MOV     ECX, [EDX]
      AND     [EAX], ECX
      MOV     ECX, [EDX + 4]
      AND     [EAX + 4], ECX
      MOV     ECX, [EDX + 8]
      AND     [EAX + 8], ECX
      MOV     ECX, [EDX + 12]
      AND     [EAX + 12], ECX
      MOV     ECX, [EDX + 16]
      AND     [EAX + 16], ECX
      MOV     ECX, [EDX + 20]
      AND     [EAX + 20], ECX
      MOV     ECX, [EDX + 24]
      AND     [EAX + 24], ECX
      MOV     ECX, [EDX + 28]
      AND     [EAX + 28], ECX
end;
{$ELSE}
procedure Intersection(var DestSet: CharSet; const SourceSet: CharSet);
begin
  DestSet := DestSet * SourceSet;
end;
{$ENDIF}

{$IFDEF ASM386_DELPHI}
procedure XORCharSet(var DestSet: CharSet; const SourceSet: CharSet);
asm
      MOV     ECX, [EDX]
      XOR     [EAX], ECX
      MOV     ECX, [EDX + 4]
      XOR     [EAX + 4], ECX
      MOV     ECX, [EDX + 8]
      XOR     [EAX + 8], ECX
      MOV     ECX, [EDX + 12]
      XOR     [EAX + 12], ECX
      MOV     ECX, [EDX + 16]
      XOR     [EAX + 16], ECX
      MOV     ECX, [EDX + 20]
      XOR     [EAX + 20], ECX
      MOV     ECX, [EDX + 24]
      XOR     [EAX + 24], ECX
      MOV     ECX, [EDX + 28]
      XOR     [EAX + 28], ECX
end;
{$ELSE}
procedure XORCharSet(var DestSet: CharSet; const SourceSet: CharSet);
var Ch: AnsiChar;
begin
  for Ch := #0 to #255 do
    if Ch in DestSet then
      begin
        if Ch in SourceSet then
          Exclude(DestSet, Ch);
      end else
      if Ch in SourceSet then
        Include(DestSet, Ch);
end;
{$ENDIF}

{$IFDEF ASM386_DELPHI}
function IsSubSet(const A, B: CharSet): Boolean;
asm
      MOV     ECX, [EDX]
      NOT     ECX
      AND     ECX, [EAX]
      JNE     @Fin0
      MOV     ECX, [EDX + 4]
      NOT     ECX
      AND     ECX, [EAX + 4]
      JNE     @Fin0
      MOV     ECX, [EDX + 8]
      NOT     ECX
      AND     ECX, [EAX + 8]
      JNE     @Fin0
      MOV     ECX, [EDX + 12]
      NOT     ECX
      AND     ECX, [EAX + 12]
      JNE     @Fin0
      MOV     ECX, [EDX + 16]
      NOT     ECX
      AND     ECX, [EAX + 16]
      JNE     @Fin0
      MOV     ECX, [EDX + 20]
      NOT     ECX
      AND     ECX, [EAX + 20]
      JNE     @Fin0
      MOV     ECX, [EDX + 24]
      NOT     ECX
      AND     ECX, [EAX + 24]
      JNE     @Fin0
      MOV     ECX, [EDX + 28]
      NOT     ECX
      AND     ECX, [EAX + 28]
      JNE     @Fin0
      MOV     EAX, 1
      RET
@Fin0:
      XOR     EAX, EAX
end;
{$ELSE}
function IsSubSet(const A, B: CharSet): Boolean;
begin
  Result := A <= B;
end;
{$ENDIF}

{$IFDEF ASM386_DELPHI}
function IsEqual(const A, B: CharSet): Boolean;
asm
      MOV     ECX, [EDX]
      XOR     ECX, [EAX]
      JNE     @Fin0
      MOV     ECX, [EDX + 4]
      XOR     ECX, [EAX + 4]
      JNE     @Fin0
      MOV     ECX, [EDX + 8]
      XOR     ECX, [EAX + 8]
      JNE     @Fin0
      MOV     ECX, [EDX + 12]
      XOR     ECX, [EAX + 12]
      JNE     @Fin0
      MOV     ECX, [EDX + 16]
      XOR     ECX, [EAX + 16]
      JNE     @Fin0
      MOV     ECX, [EDX + 20]
      XOR     ECX, [EAX + 20]
      JNE     @Fin0
      MOV     ECX, [EDX + 24]
      XOR     ECX, [EAX + 24]
      JNE     @Fin0
      MOV     ECX, [EDX + 28]
      XOR     ECX, [EAX + 28]
      JNE     @Fin0
      MOV     EAX, 1
      RET
@Fin0:
      XOR     EAX, EAX
end;
{$ELSE}
function IsEqual(const A, B: CharSet): Boolean;
begin
  Result := A = B;
end;
{$ENDIF}

{$IFDEF ASM386_DELPHI}
function IsEmpty(const C: CharSet): Boolean;
asm
      MOV     EDX, [EAX]
      OR      EDX, [EAX + 4]
      OR      EDX, [EAX + 8]
      OR      EDX, [EAX + 12]
      OR      EDX, [EAX + 16]
      OR      EDX, [EAX + 20]
      OR      EDX, [EAX + 24]
      OR      EDX, [EAX + 28]
      JNE     @Fin0
      MOV     EAX, 1
      RET
@Fin0:
      XOR     EAX,EAX
end;
{$ELSE}
function IsEmpty(const C: CharSet): Boolean;
begin
  Result := C = [];
end;
{$ENDIF}

{$IFDEF ASM386_DELPHI}
function IsComplete(const C: CharSet): Boolean;
asm
      MOV     EDX, [EAX]
      AND     EDX, [EAX + 4]
      AND     EDX, [EAX + 8]
      AND     EDX, [EAX + 12]
      AND     EDX, [EAX + 16]
      AND     EDX, [EAX + 20]
      AND     EDX, [EAX + 24]
      AND     EDX, [EAX + 28]
      CMP     EDX, $FFFFFFFF
      JNE     @Fin0
      MOV     EAX, 1
      RET
@Fin0:
      XOR     EAX, EAX
end;
{$ELSE}
function IsComplete(const C: CharSet): Boolean;
begin
  Result := C = CompleteCharSet;
end;
{$ENDIF}

{$IFDEF ASM386_DELPHI}
function CharCount(const C: CharSet): Integer;
asm
      PUSH    EBX
      PUSH    ESI
      MOV     EBX, EAX
      XOR     ESI, ESI
      MOV     EAX, [EBX]
      CALL    BitCount
      ADD     ESI, EAX
      MOV     EAX, [EBX + 4]
      CALL    BitCount
      ADD     ESI, EAX
      MOV     EAX, [EBX + 8]
      CALL    BitCount
      ADD     ESI, EAX
      MOV     EAX, [EBX + 12]
      CALL    BitCount
      ADD     ESI, EAX
      MOV     EAX, [EBX + 16]
      CALL    BitCount
      ADD     ESI, EAX
      MOV     EAX, [EBX + 20]
      CALL    BitCount
      ADD     ESI, EAX
      MOV     EAX, [EBX + 24]
      CALL    BitCount
      ADD     ESI, EAX
      MOV     EAX, [EBX + 28]
      CALL    BitCount
      ADD     EAX, ESI
      POP     ESI
      POP     EBX
end;
{$ELSE}
function CharCount(const C: CharSet): Integer;
var I : AnsiChar;
begin
  Result := 0;
  for I := #0 to #255 do
    if I in C then
      Inc(Result);
end;
{$ENDIF}

{$IFDEF ASM386_DELPHI}
procedure ConvertCaseInsensitive(var C: CharSet);
asm
      MOV     ECX, [EAX + 12]
      AND     ECX, $3FFFFFF
      OR      [EAX + 8], ECX
      MOV     ECX, [EAX + 8]
      AND     ECX, $3FFFFFF
      OR      [EAX + 12], ECX
end;
{$ELSE}
procedure ConvertCaseInsensitive(var C: CharSet);
var Ch : AnsiChar;
begin
  for Ch := 'A' to 'Z' do
    if Ch in C then
      Include(C, AnsiChar(Ord(Ch) + 32));
  for Ch := 'a' to 'z' do
    if Ch in C then
      Include(C, AnsiChar(Ord(Ch) - 32));
end;
{$ENDIF}

function CaseInsensitiveCharSet(const C: CharSet): CharSet;
begin
  AssignCharSet(Result, C);
  ConvertCaseInsensitive(Result);
end;



{                                                                              }
{ Range functions                                                              }
{                                                                              }
function IntRangeLength(const Low, High: Integer): Int64;
begin
  if Low > High then
    Result := 0
  else
    Result := Int64(High - Low) + 1;
end;

function IntRangeAdjacent(const Low1, High1, Low2, High2: Integer): Boolean;
begin
  Result := ((Low2 > MinInteger)  and (High1 = Low2 - 1)) or
            ((High2 < MaxInteger) and (Low1 = High2 + 1));
end;

function IntRangeOverlap(const Low1, High1, Low2, High2: Integer): Boolean;
begin
  Result := ((Low1 >= Low2) and (Low1 <= High2)) or
            ((Low2 >= Low1) and (Low2 <= High1));
end;

function IntRangeHasElement(const Low, High, Element: Integer): Boolean;
begin
  Result := (Element >= Low) and (Element <= High);
end;

function IntRangeIncludeElement(var Low, High: Integer;
    const Element: Integer): Boolean;
begin
  Result := (Element >= Low) and (Element <= High);
  if Result then
    exit;
  if (Element < Low) and (Element + 1 = Low) then
    begin
      Low := Element;
      Result := True;
    end else
  if (Element > High) and (Element - 1 = High) then
    begin
      High := Element;
      Result := True;
    end;
end;

function IntRangeIncludeElementRange(var Low, High: Integer;
    const LowElement, HighElement: Integer): Boolean;
begin
  Result := (LowElement >= Low) and (HighElement <= High);
  if Result then
    exit;
  if ((Low >= LowElement) and (Low <= HighElement)) or
     ((Low > MinInteger) and (Low - 1 = HighElement)) then
    begin
      Low := LowElement;
      Result := True;
    end;
  if ((High >= LowElement) and (High <= HighElement)) or
     ((High < MaxInteger) and (High + 1 = LowElement)) then
    begin
      High := HighElement;
      Result := True;
    end;
end;

function CardRangeLength(const Low, High: Cardinal): Int64;
begin
  if Low > High then
    Result := 0
  else
    Result := Int64(High - Low) + 1;
end;

function CardRangeAdjacent(const Low1, High1, Low2, High2: Cardinal): Boolean;
begin
  Result := ((Low2 > MinCardinal)  and (High1 = Low2 - 1)) or
            ((High2 < MaxCardinal) and (Low1 = High2 + 1));
end;

function CardRangeOverlap(const Low1, High1, Low2, High2: Cardinal): Boolean;
begin
  Result := ((Low1 >= Low2) and (Low1 <= High2)) or
            ((Low2 >= Low1) and (Low2 <= High1));
end;

function CardRangeHasElement(const Low, High, Element: Cardinal): Boolean;
begin
  Result := (Element >= Low) and (Element <= High);
end;

function CardRangeIncludeElement(var Low, High: Cardinal;
    const Element: Cardinal): Boolean;
begin
  Result := (Element >= Low) and (Element <= High);
  if Result then
    exit;
  if (Element < Low) and (Element + 1 = Low) then
    begin
      Low := Element;
      Result := True;
    end else
  if (Element > High) and (Element - 1 = High) then
    begin
      High := Element;
      Result := True;
    end;
end;

function CardRangeIncludeElementRange(var Low, High: Cardinal;
    const LowElement, HighElement: Cardinal): Boolean;
begin
  Result := (LowElement >= Low) and (HighElement <= High);
  if Result then
    exit;
  if ((Low >= LowElement) and (Low <= HighElement)) or
     ((Low > MinCardinal) and (Low - 1 = HighElement)) then
    begin
      Low := LowElement;
      Result := True;
    end;
  if ((High >= LowElement) and (High <= HighElement)) or
     ((High < MaxCardinal) and (High + 1 = LowElement)) then
    begin
      High := HighElement;
      Result := True;
    end;
end;



{                                                                              }
{ Swap                                                                         }
{                                                                              }
{$IFDEF ASM386_DELPHI}
procedure Swap(var X, Y: Boolean); register; assembler;
asm
      MOV     CL, [EDX]
      XCHG    BYTE PTR [EAX], CL
      MOV     [EDX], CL
end;
{$ELSE}
procedure Swap(var X, Y: Boolean);
var F : Boolean;
begin
  F := X;
  X := Y;
  Y := F;
end;
{$ENDIF}

{$IFDEF ASM386_DELPHI}
procedure Swap(var X, Y: Byte); register; assembler;
asm
      MOV     CL, [EDX]
      XCHG    BYTE PTR [EAX], CL
      MOV     [EDX], CL
end;
{$ELSE}
procedure Swap(var X, Y: Byte);
var F : Byte;
begin
  F := X;
  X := Y;
  Y := F;
end;
{$ENDIF}

{$IFDEF ASM386_DELPHI}
procedure Swap(var X, Y: ShortInt); register; assembler;
asm
      MOV     CL, [EDX]
      XCHG    BYTE PTR [EAX], CL
      MOV     [EDX], CL
end;
{$ELSE}
procedure Swap(var X, Y: ShortInt);
var F : ShortInt;
begin
  F := X;
  X := Y;
  Y := F;
end;
{$ENDIF}

{$IFDEF ASM386_DELPHI}
procedure Swap(var X, Y: Word); register; assembler;
asm
      MOV     CX, [EDX]
      XCHG    WORD PTR [EAX], CX
      MOV     [EDX], CX
end;
{$ELSE}
procedure Swap(var X, Y: Word);
var F : Word;
begin
  F := X;
  X := Y;
  Y := F;
end;
{$ENDIF}

{$IFDEF ASM386_DELPHI}
procedure Swap(var X, Y: SmallInt); register; assembler;
asm
      MOV     CX, [EDX]
      XCHG    WORD PTR [EAX], CX
      MOV     [EDX], CX
end;
{$ELSE}
procedure Swap(var X, Y: SmallInt);
var F : SmallInt;
begin
  F := X;
  X := Y;
  Y := F;
end;
{$ENDIF}

{$IFDEF ASM386_DELPHI}
procedure Swap(var X, Y: LongInt); register; assembler;
asm
      MOV     ECX, [EDX]
      XCHG    [EAX], ECX
      MOV     [EDX], ECX
end;
{$ELSE}
procedure Swap(var X, Y: LongInt);
var F : LongInt;
begin
  F := X;
  X := Y;
  Y := F;
end;
{$ENDIF}

{$IFDEF ASM386_DELPHI}
procedure Swap(var X, Y: LongWord); register; assembler;
asm
      MOV     ECX, [EDX]
      XCHG    [EAX], ECX
      MOV     [EDX], ECX
end;
{$ELSE}
procedure Swap(var X, Y: LongWord);
var F : LongWord;
begin
  F := X;
  X := Y;
  Y := F;
end;
{$ENDIF}

{$IFNDEF ManagedCode}
{$IFDEF ASM386_DELPHI}
procedure Swap(var X, Y: Pointer); register; assembler;
asm
      MOV     ECX, [EDX]
      XCHG    [EAX], ECX
      MOV     [EDX], ECX
end;
{$ELSE}
procedure Swap(var X, Y: Pointer);
var F : Pointer;
begin
  F := X;
  X := Y;
  Y := F;
end;
{$ENDIF}

{$ENDIF}
{$IFDEF ASM386_DELPHI}
procedure Swap(var X, Y: TObject); register; assembler;
asm
      MOV     ECX, [EDX]
      XCHG    [EAX], ECX
      MOV     [EDX], ECX
end;
{$ELSE}
procedure Swap(var X, Y: TObject);
var F : TObject;
begin
  F := X;
  X := Y;
  Y := F;
end;
{$ENDIF}

procedure Swap(var X, Y: Int64);
var F : Int64;
begin
  F := X;
  X := Y;
  Y := F;
end;

procedure Swap(var X, Y: Single);
var F : Single;
begin
  F := X;
  X := Y;
  Y := F;
end;

procedure Swap(var X, Y: Double);
var F : Double;
begin
  F := X;
  X := Y;
  Y := F;
end;

procedure Swap(var X, Y: Extended);
var F : Extended;
begin
  F := X;
  X := Y;
  Y := F;
end;

procedure Swap(var X, Y: Currency);
var F : Currency;
begin
  F := X;
  X := Y;
  Y := F;
end;

procedure Swap(var X, Y: AnsiString);
var F : AnsiString;
begin
  F := X;
  X := Y;
  Y := F;
end;

procedure Swap(var X, Y: WideString);
var F : WideString;
begin
  F := X;
  X := Y;
  Y := F;
end;

{$IFDEF ManagedCode}
procedure SwapObjects(var X, Y: TObject);
var F: TObject;
begin
  F := X;
  X := Y;
  Y := F;
end;
{$ELSE}
{$IFDEF ASM386_DELPHI}
procedure SwapObjects(var X, Y); register; assembler;
asm
      MOV     ECX, [EDX]
      XCHG    [EAX], ECX
      MOV     [EDX], ECX
end;
{$ELSE}
procedure SwapObjects(var X, Y);
var F: TObject;
begin
  F := TObject(X);
  TObject(X) := TObject(Y);
  TObject(Y) := F;
end;
{$ENDIF}{$ENDIF}



{                                                                              }
{ iif                                                                          }
{                                                                              }
function iif(const Expr: Boolean; const TrueValue, FalseValue: Integer): Integer;
begin
  if Expr then
    Result := TrueValue
  else
    Result := FalseValue;
end;

function iif(const Expr: Boolean; const TrueValue, FalseValue: Int64): Int64;
begin
  if Expr then
    Result := TrueValue
  else
    Result := FalseValue;
end;

function iif(const Expr: Boolean; const TrueValue, FalseValue: Extended): Extended;
begin
  if Expr then
    Result := TrueValue
  else
    Result := FalseValue;
end;

function iif(const Expr: Boolean; const TrueValue, FalseValue: String): String;
begin
  if Expr then
    Result := TrueValue
  else
    Result := FalseValue;
end;

function iifA(const Expr: Boolean; const TrueValue, FalseValue: AnsiString): AnsiString;
begin
  if Expr then
    Result := TrueValue
  else
    Result := FalseValue;
end;

function iifW(const Expr: Boolean; const TrueValue, FalseValue: WideString): WideString;
begin
  if Expr then
    Result := TrueValue
  else
    Result := FalseValue;
end;

function iif(const Expr: Boolean; const TrueValue, FalseValue: TObject): TObject;
begin
  if Expr then
    Result := TrueValue
  else
    Result := FalseValue;
end;




{                                                                              }
{ Compare                                                                      }
{                                                                              }
function ReverseCompareResult(const C: TCompareResult): TCompareResult;
begin
  if C = crLess then
    Result := crGreater else
  if C = crGreater then
    Result := crLess
  else
    Result := C;
end;

function Compare(const I1, I2: Integer): TCompareResult;
begin
  if I1 < I2 then
    Result := crLess else
  if I1 > I2 then
    Result := crGreater
  else
    Result := crEqual;
end;

function Compare(const I1, I2: Int64): TCompareResult;
begin
  if I1 < I2 then
    Result := crLess else
  if I1 > I2 then
    Result := crGreater
  else
    Result := crEqual;
end;

function Compare(const I1, I2: Extended): TCompareResult;
begin
  if I1 < I2 then
    Result := crLess else
  if I1 > I2 then
    Result := crGreater
  else
    Result := crEqual;
end;

function Compare(const I1, I2: Boolean): TCompareResult;
begin
  if I1 = I2 then
    Result := crEqual else
  if I1 then
    Result := crGreater
  else
    Result := crLess;
end;

function Compare(const I1, I2: AnsiString): TCompareResult;
begin
  if I1 = I2 then
    Result := crEqual else
  if I1 > I2 then
    Result := crGreater
  else
    Result := crLess;
end;

function WideCompare(const I1, I2: WideString): TCompareResult;
begin
  if I1 = I2 then
    Result := crEqual else
  if I1 > I2 then
    Result := crGreater
  else
    Result := crLess;
end;

function Sign(const A: LongInt): Integer;
begin
  if A < 0 then
    Result := -1 else
  if A > 0 then
    Result := 1
  else
    Result := 0;
end;

function Sign(const A: Int64): Integer;
begin
  if A < 0 then
    Result := -1 else
  if A > 0 then
    Result := 1
  else
    Result := 0;
end;

function Sign(const A: Extended): Integer;
begin
  if A < 0 then
    Result := -1 else
  if A > 0 then
    Result := 1
  else
    Result := 0;
end;



{                                                                              }
{ Approximate comparison                                                       }
{                                                                              }
function FloatZero(const A: Float; const CompareDelta: Float): Boolean;
begin
  Assert(CompareDelta >= 0.0);
  Result := Abs(A) <= CompareDelta;
end;

function FloatOne(const A: Float; const CompareDelta: Float): Boolean;
begin
  Assert(CompareDelta >= 0.0);
  Result := Abs(A - 1.0) <= CompareDelta;
end;

function FloatsEqual(const A, B: Float; const CompareDelta: Float): Boolean;
begin
  Assert(CompareDelta >= 0.0);
  Result := Abs(A - B) <= CompareDelta;
end;

function FloatsCompare(const A, B: Float; const CompareDelta: Float): TCompareResult;
var D : Float;
begin
  Assert(CompareDelta >= 0.0);
  D := A - B;
  if Abs(D) <= CompareDelta then
    Result := crEqual else
  if D >= CompareDelta then
    Result := crGreater
  else
    Result := crLess;
end;



{$IFNDEF CLR}
{                                                                              }
{ Scaled approximate comparison                                                }
{                                                                              }
{   The ApproxEqual and ApproxCompare functions were taken from the freeware   }
{   FltMath unit by Tempest Software, as taken from Knuth, Seminumerical       }
{   Algorithms, 2nd ed., Addison-Wesley, 1981, pp. 217-220.                    }
{                                                                              }
function ApproxEqual(const A, B: Extended; const CompareEpsilon: Double): Boolean;
var ExtA : ExtendedRec absolute A;
    ExtB : ExtendedRec absolute B;
    ExpA : Word;
    ExpB : Word;
    Exp  : ExtendedRec;
begin
  ExpA := ExtA.Exponent and $7FFF;
  ExpB := ExtB.Exponent and $7FFF;
  if (ExpA = $7FFF) and
     ((ExtA.Mantissa[1] <> $80000000) or (ExtA.Mantissa[0] <> 0)) then
    { A is NaN }
    Result := False else
  if (ExpB = $7FFF) and
     ((ExtB.Mantissa[1] <> $80000000) or (ExtB.Mantissa[0] <> 0)) then
    { B is NaN }
    Result := False else
  if (ExpA = $7FFF) or (ExpB = $7FFF) then
    { A or B is infinity. Use the builtin comparison, which will       }
    { properly account for signed infinities, comparing infinity with  }
    { infinity, or comparing infinity with a finite value.             }
    Result := A = B else
  begin
    { We are comparing two finite values, so take the difference and   }
    { compare that against the scaled Epsilon.                         }
    Exp.Value := 1.0;
    if ExpA < ExpB then
      Exp.Exponent := ExpB
    else
      Exp.Exponent := ExpA;
    Result := Abs(A - B) <= (CompareEpsilon * Exp.Value);
  end;
end;

function ApproxCompare(const A, B: Extended; const CompareEpsilon: Double): TCompareResult;
var ExtA : ExtendedRec absolute A;
    ExtB : ExtendedRec absolute B;
    ExpA : Word;
    ExpB : Word;
    Exp  : ExtendedRec;
    D, E : Extended;
begin
  ExpA := ExtA.Exponent and $7FFF;
  ExpB := ExtB.Exponent and $7FFF;
  if (ExpA = $7FFF) and
     ((ExtA.Mantissa[1] <> $80000000) or (ExtA.Mantissa[0] <> 0)) then
    { A is NaN }
    Result := crUndefined else
  if (ExpB = $7FFF) and
     ((ExtB.Mantissa[1] <> $80000000) or (ExtB.Mantissa[0] <> 0)) then
    { B is NaN }
    Result := crUndefined else
  if (ExpA = $7FFF) or (ExpB = $7FFF) then
    { A or B is infinity. Use the builtin comparison, which will       }
    { properly account for signed infinities, comparing infinity with  }
    { infinity, or comparing infinity with a finite value.             }
    Result := Compare(A, B) else
  begin
    { We are comparing two finite values, so take the difference and   }
    { compare that against the scaled Epsilon.                         }
    Exp.Value := 1.0;
    if ExpA < ExpB then
      Exp.Exponent := ExpB
    else
      Exp.Exponent := ExpA;
    E := CompareEpsilon * Exp.Value;
    D := A - B;
    if Abs(D) <= E then
      Result := crEqual else
    if D >= E then
      Result := crGreater
    else
      Result := crLess;
  end;
end;



{                                                                              }
{ Special floating-point values                                                }
{                                                                              }
function FloatIsInfinity(const A: Extended): Boolean;
var Ext : ExtendedRec absolute A;
begin
  if Ext.Exponent and $7FFF <> $7FFF then
    Result := False
  else
    Result := (Ext.Mantissa[1] = $80000000) and (Ext.Mantissa[0] = 0);
end;

function FloatIsNaN(const A: Extended): Boolean;
var Ext : ExtendedRec absolute A;
begin
  if Ext.Exponent and $7FFF <> $7FFF then
    Result := False
  else
    Result := (Ext.Mantissa[1] <> $80000000) or (Ext.Mantissa[0] <> 0)
end;
{$ENDIF}



{                                                                              }
{ Ascii char conversion lookup                                                 }
{                                                                              }
const
  HexLookup: array[AnsiChar] of Byte = (
      $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,
      $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,
      $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,
      0,   1,   2,   3,   4,   5,   6,   7,   8,   9,   $FF, $FF, $FF, $FF, $FF, $FF,
      $FF, 10,  11,  12,  13,  14,  15,  $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,
      $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,
      $FF, 10,  11,  12,  13,  14,  15,  $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,
      $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,
      $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,
      $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,
      $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,
      $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,
      $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,
      $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,
      $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,
      $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF);



{                                                                              }
{ Integer conversion                                                           }
{                                                                              }
function AnsiCharToInt(const A: AnsiChar): Integer;
begin
  if A in ['0'..'9'] then
    Result := Ord(A) - Ord('0')
  else
    Result := -1;
end;

function WideCharToInt(const A: WideChar): Integer;
begin
  if (Ord(A) >= Ord('0')) and (Ord(A) <= Ord('9')) then
    Result := Ord(A) - Ord('0')
  else
    Result := -1;
end;

function CharToInt(const A: Char): Integer;
begin
  {$IFDEF CharIsWide}
  Result := WideCharToInt(A);
  {$ELSE}
  Result := AnsiCharToInt(A);
  {$ENDIF}
end;

function IntToAnsiChar(const A: Integer): AnsiChar;
begin
  if (A < 0) or (A > 9) then
    Result := #$00
  else
    Result := AnsiChar(48 + A);
end;

function IntToWideChar(const A: Integer): WideChar;
begin
  if (A < 0) or (A > 9) then
    Result := #$00
  else
    Result := WideChar(48 + A);
end;

function IntToChar(const A: Integer): Char;
begin
  {$IFDEF CharIsWide}
  Result := IntToWideChar(A);
  {$ELSE}
  Result := IntToAnsiChar(A);
  {$ENDIF}
end;

function IsHexAnsiChar(const Ch: AnsiChar): Boolean;
begin
  Result := HexLookup[Ch] <= 15;
end;

function IsHexWideChar(const Ch: WideChar): Boolean;
begin
  if Ord(Ch) <= $FF then
    Result := HexLookup[AnsiChar(Ch)] <= 15
  else
    Result := False;
end;

function IsHexChar(const Ch: Char): Boolean;
begin
  {$IFDEF CharIsWide}
  Result := IsHexWideChar(Ch);
  {$ELSE}
  Result := IsHexAnsiChar(Ch);
  {$ENDIF}
end;

function HexAnsiCharToInt(const A: AnsiChar): Integer;
var B : Byte;
begin
  B := HexLookup[A];
  if B = $FF then
    Result := -1
  else
    Result := B;
end;

function HexWideCharToInt(const A: WideChar): Integer;
var B : Byte;
begin
  if Ord(A) > $FF then
    Result := -1
  else
    begin
      B := HexLookup[AnsiChar(Ord(A))];
      if B = $FF then
        Result := -1
      else
        Result := B;
    end;
end;

function HexCharToInt(const A: Char): Integer;
begin
  {$IFDEF CharIsWide}
  Result := HexWideCharToInt(A);
  {$ELSE}
  Result := HexAnsiCharToInt(A);
  {$ENDIF}
end;

function IntToUpperHexAnsiChar(const A: Integer): AnsiChar;
begin
  if (A < 0) or (A > 15) then
    Result := #$00
  else
  if A <= 9 then
    Result := AnsiChar(48 + A)
  else
    Result := AnsiChar(55 + A);
end;

function IntToUpperHexWideChar(const A: Integer): WideChar;
begin
  if (A < 0) or (A > 15) then
    Result := #$00
  else
  if A <= 9 then
    Result := WideChar(48 + A)
  else
    Result := WideChar(55 + A);
end;

function IntToUpperHexChar(const A: Integer): Char;
begin
  {$IFDEF CharIsWide}
  Result := IntToUpperHexWideChar(A);
  {$ELSE}
  Result := IntToUpperHexAnsiChar(A);
  {$ENDIF}
end;

function IntToLowerHexAnsiChar(const A: Integer): AnsiChar;
begin
  if (A < 0) or (A > 15) then
    Result := #$00
  else
  if A <= 9 then
    Result := AnsiChar(48 + A)
  else
    Result := AnsiChar(87 + A);
end;

function IntToLowerHexWideChar(const A: Integer): WideChar;
begin
  if (A < 0) or (A > 15) then
    Result := #$00
  else
  if A <= 9 then
    Result := WideChar(48 + A)
  else
    Result := WideChar(87 + A);
end;

function IntToLowerHexChar(const A: Integer): Char;
begin
  {$IFDEF CharIsWide}
  Result := IntToLowerHexWideChar(A);
  {$ELSE}
  Result := IntToLowerHexAnsiChar(A);
  {$ENDIF}
end;

function IntToAnsiString(const A: Integer): AnsiString;
var L, T, I : Integer;
begin
  if A = 0 then
    begin
      Result := '0';
      exit;
    end;
  // calculate length
  if A < 0 then
    L := 1
  else
    L := 0;
  T := A;
  while T <> 0 do
    begin
      T := T div 10;
      Inc(L);
    end;
  // convert
  SetLength(Result, L);
  I := 0;
  T := A;
  if T < 0 then
    begin
      Result[1] := '-';
      T := -T;
    end;
  while T > 0 do
    begin
      Result[L - I] := IntToAnsiChar(T mod 10);
      T := T div 10;
      Inc(I);
    end;
end;

function IntToWideString(const A: Integer): WideString;
var L, T, I : Integer;
begin
  if A = 0 then
    begin
      Result := '0';
      exit;
    end;
  // calculate length
  if A < 0 then
    L := 1
  else
    L := 0;
  T := A;
  while T <> 0 do
    begin
      T := T div 10;
      Inc(L);
    end;
  // convert
  SetLength(Result, L);
  I := 0;
  T := A;
  if T < 0 then
    begin
      Result[1] := '-';
      T := -T;
    end;
  while T > 0 do
    begin
      Result[L - I] := IntToWideChar(T mod 10);
      T := T div 10;
      Inc(I);
    end;
end;

function IntToString(const A: Integer): String;
begin
  {$IFDEF CharIsWide}
  Result := IntToWideString(A);
  {$ELSE}
  Result := IntToAnsiString(A);
  {$ENDIF}
end;

function LongWordToHexAnsiString(const A: LongWord; const Digits: Integer; const LowerCase: Boolean): AnsiString;
var L, I, D : Integer;
    T : LongWord;
    C : AnsiChar;
begin
  // calculate length
  L := 0;
  T := A;
  while T <> 0 do
    begin
      T := T div 16;
      Inc(L);
    end;
  if L = 0 then
    L := 1;
  if Digits > L then
    L := Digits;
  // convert
  SetLength(Result, L);
  I := 0;
  T := A;
  while T > 0 do
    begin
      D := T mod 16;
      if LowerCase then
        C := IntToLowerHexAnsiChar(D)
      else
        C := IntToUpperHexAnsiChar(D);
      Result[L - I] := C;
      T := T div 16;
      Inc(I);
    end;
  while I < L do
    begin
      Result[L - I] := '0';
      Inc(I);
    end;
end;

function LongWordToHexWideString(const A: LongWord; const Digits: Integer; const LowerCase: Boolean): WideString;
var L, I, D : Integer;
    T : LongWord;
    C : WideChar;
begin
  // calculate length
  L := 0;
  T := A;
  while T <> 0 do
    begin
      T := T div 16;
      Inc(L);
    end;
  if L = 0 then
    L := 1;
  if Digits > L then
    L := Digits;
  // convert
  SetLength(Result, L);
  I := 0;
  T := A;
  while T > 0 do
    begin
      D := T mod 16;
      if LowerCase then
        C := IntToLowerHexWideChar(D)
      else
        C := IntToUpperHexWideChar(D);
      Result[L - I] := C;
      T := T div 16;
      Inc(I);
    end;
  while I < L do
    begin
      Result[L - I] := '0';
      Inc(I);
    end;
end;

function TryAnsiStringToInt(const A: AnsiString; out B: Integer): Boolean;
var S, L, I, J : Integer;
    R : Int64;
begin
  L := Length(A);
  if L = 0 then
    begin
      B := 0;
      Result := False;
      exit;
    end;
  I := 1;
  // check sign
  if A[I] = '-' then
    begin
      Inc(I);
      S := -1;
    end
  else
    S := 1;
  // skip leading zeros
  while (I <= L) and (A[I] = '0') do
    Inc(I);
  if I > L then
    begin
      B := 0;
      Result := True;
      exit;
    end;
  // validate digits and convert
  J := I;
  R := 0;
  while J <= L do
    if A[J] in ['0'..'9'] then
      begin
        R := R * 10 + AnsiCharToInt(A[J]);
        Inc(J);
        if R > MaxInteger then
          begin
            if S < 0 then
              B := MinInteger
            else
              B := MaxInteger;
            Result := False;
            exit;
          end;
      end
    else
      begin
        B := 0;
        Result := False;
        exit;
      end;
  // apply sign and check range
  if S < 0 then
    begin
      R := -R;
      if R < MinInteger then
        begin
          B := MinInteger;
          Result := False;
          exit;
        end;
    end;
  // return integer result
  B := Integer(R);
  Result := True;
end;

function AnsiStringToInt(const A: AnsiString): Integer;
var S, L, I, J : Integer;
    B, R : Int64;
begin
  L := Length(A);
  {$IFOPT R+}
  if L = 0 then
    RaiseRangeCheckError;
  {$ELSE}
  if L = 0 then
    begin
      Result := 0;
      exit;
    end;
  {$ENDIF}
  I := 1;
  // check sign
  if A[I] = '-' then
    begin
      Inc(I);
      S := -1;
    end
  else
    S := 1;
  // skip leading zeros
  while (I <= L) and (A[I] = '0') do
    Inc(I);
  if I > L then
    begin
      Result := 0;
      exit;
    end;
  // validate digits and base range
  J := I;
  B := 0;
  while J <= L do
    if A[J] in ['0'..'9'] then
      begin
        Inc(J);
        if B = 0 then
          B := 1
        else
          B := B * 10;
        {$IFOPT R+}
        if B > MaxInteger then
          RaiseRangeCheckError;
        {$ELSE}
        if B > MaxInteger then
          begin
            Result := MaxInteger;
            exit;
          end;
        {$ENDIF}
      end
    else
      {$IFOPT R+}
      RaiseRangeCheckError;
      {$ELSE}
      begin
        Result := 0;
        exit;
      end;
      {$ENDIF}
  // convert
  R := 0;
  J := I;
  while J <= L do
    begin
      R := R * 10 + AnsiCharToInt(A[J]);
      Inc(J);
    end;
  // apply sign and check range
  if S < 0 then
    begin
      R := -R;
      {$IFOPT R+}
      if R < MinInteger then
        RaiseRangeCheckError;
      {$ELSE}
      if R < MinInteger then
        begin
          Result := MinInteger;
          exit;
        end;
      {$ENDIF}
    end
  else
    {$IFOPT R+}
    if R > MaxInteger then
      RaiseRangeCheckError;
    {$ELSE}
    if R > MaxInteger then
      begin
        Result := MaxInteger;
        exit;
      end;
    {$ENDIF}
  // return integer result
  Result := Integer(R);
end;

function AnsiStringToIntDef(const A: AnsiString; const Default: Integer): Integer;
begin
  try
    Result := AnsiStringToInt(A);
  except
    Result := Default;
  end;
end;

function WideStringToInt(const A: WideString): Integer;
var S, L, I, J : Integer;
    B, R : Int64;
begin
  L := Length(A);
  {$IFOPT R+}
  if L = 0 then
    RaiseRangeCheckError;
  {$ELSE}
  if L = 0 then
    begin
      Result := 0;
      exit;
    end;
  {$ENDIF}
  I := 1;
  // check sign
  if A[I] = '-' then
    begin
      Inc(I);
      S := -1;
    end
  else
    S := 1;
  // skip leading zeros
  while (I <= L) and (A[I] = '0') do
    Inc(I);
  if I > L then
    begin
      Result := 0;
      exit;
    end;
  // validate digits and base range
  J := I;
  B := 0;
  while J <= L do
    {$IFOPT R+}
    if Ord(A[J]) > $FF then
      RaiseRangeCheckError else
    {$ELSE}
    if Ord(A[J]) > $FF then
      begin
        Result := 0;
        exit;
      end;
    {$ENDIF}
    if AnsiChar(A[J]) in ['0'..'9'] then
      begin
        Inc(J);
        if B = 0 then
          B := 1
        else
          B := B * 10;
        {$IFOPT R+}
        if B > MaxInteger then
          RaiseRangeCheckError;
        {$ELSE}
        if B > MaxInteger then
          begin
            Result := MaxInteger;
            exit;
          end;
        {$ENDIF}
      end
    else
      {$IFOPT R+}
      RaiseRangeCheckError;
      {$ELSE}
      begin
        Result := 0;
        exit;
      end;
      {$ENDIF}
  // convert
  R := 0;
  J := I;
  while J <= L do
    begin
      R := R * 10 + AnsiCharToInt(AnsiChar(A[J]));
      Inc(J);
    end;
  // apply sign and check range
  if S < 0 then
    begin
      R := -R;
      {$IFOPT R+}
      if R < MinInteger then
        RaiseRangeCheckError;
      {$ELSE}
      if R < MinInteger then
        begin
          Result := MinInteger;
          exit;
        end;
      {$ENDIF}
    end
  else
    {$IFOPT R+}
    if R > MaxInteger then
      RaiseRangeCheckError;
    {$ELSE}
    if R > MaxInteger then
      begin
        Result := MaxInteger;
        exit;
      end;
    {$ENDIF}
  // return integer result
  Result := Integer(R);
end;

function WideStringToIntDef(const A: WideString; const Default: Integer): Integer;
begin
  try
    Result := WideStringToInt(A);
  except
    Result := Default;
  end;
end;

function StringToInt(const A: String): Integer;
begin
  {$IFDEF CharIsWide}
  Result := WideStringToInt(A);
  {$ELSE}
  Result := AnsiStringToInt(A);
  {$ENDIF}
end;

function StringToIntDef(const A: String; const Default: Integer): Integer;
begin
  {$IFDEF CharIsWide}
  Result := WideStringToIntDef(A, Default);
  {$ELSE}
  Result := AnsiStringToIntDef(A, Default);
  {$ENDIF}
end;

function LongWordToHexString(const A: LongWord; const Digits: Integer; const LowerCase: Boolean): String;
begin
  {$IFDEF DELPHI2009_UP}
  Result := LongWordToHexWideString(A, Digits, LowerCase);
  {$ELSE}
  Result := LongWordToHexAnsiString(A, Digits, LowerCase);
  {$ENDIF}
end;



{                                                                              }
{ Base Conversion                                                              }
{                                                                              }
function LongWordToBase(const I: LongWord; const Digits, Base: Byte;
         const UpperCase: Boolean = True): AnsiString;
var D : LongWord;
    L : Byte;
    {$IFNDEF CLR}
    P : PAnsiChar;
    {$ENDIF}
    V : Byte;
begin
  Assert((Base >= 2) and (Base <= 16));
  {$IFOPT R+}
  if (Base < 2) or (Base > 16) then
    begin
      Result := '';
      exit;
    end;
  {$ENDIF}
  if I = 0 then
    begin
      if Digits = 0 then
        L := 1
      else
        L := Digits;
      SetLength(Result, L);
      {$IFDEF ManagedCode}
      for V := 1 to L do
        Result[V] := '0';
      {$ELSE}
      FillMem(Pointer(Result)^, L, Ord('0'));
      {$ENDIF}
      exit;
    end;
  L := 0;
  D := I;
  while D > 0 do
    begin
      Inc(L);
      D := D div Base;
    end;
  if L < Digits then
    L := Digits;
  SetLength(Result, L);
  {$IFNDEF ManagedCode}
  P := Pointer(Result);
  Inc(P, L - 1);
  {$ENDIF}
  D := I;
  while D > 0 do
    begin
      V := D mod Base + 1;
      {$IFDEF CLR}
      if UpperCase then
        Result[L] := AnsiChar(StrHexDigitsUpper[V])
      else
        Result[L] := AnsiChar(StrHexDigitsLower[V]);
      {$ELSE}
      if UpperCase then
        P^ := StrHexDigitsUpper[V]
      else
        P^ := StrHexDigitsLower[V];
      Dec(P);
      {$ENDIF}
      Dec(L);
      D := D div Base;
    end;
  while L > 0 do
    begin
      {$IFDEF CLR}
      Result[L] := '0';
      {$ELSE}
      P^ := '0';
      Dec(P);
      {$ENDIF}
      Dec(L);
    end;
end;

function LongWordToBin(const I: LongWord; const Digits: Byte): AnsiString;
begin
  Result := LongWordToBase(I, Digits, 2);
end;

function LongWordToOct(const I: LongWord; const Digits: Byte): AnsiString;
begin
  Result := LongWordToBase(I, Digits, 8);
end;

function LongWordToHex(const I: LongWord; const Digits: Byte;
         const UpperCase: Boolean): AnsiString;
begin
  Result := LongWordToBase(I, Digits, 16, UpperCase);
end;

function LongWordToStr(const I: LongWord; const Digits: Byte): AnsiString;
begin
  Result := LongWordToBase(I, Digits, 10);
end;

{$IFDEF CLR}
function IsValidBaseStr(const S: AnsiString; const V: CharSet): Boolean;
var I : Integer;
begin
  I := Length(S);
  if I = 0 then
    begin
      Result := False;
      exit;
    end;
  while I > 0 do
    if not (S[I] in V) then
      begin
        Result := False;
        exit;
      end
    else
      Dec(I);
  Result := True;
end;
{$ELSE}
function IsValidBaseStr(const S: AnsiString; const V: CharSet): Boolean;
var I : Integer;
    P : PAnsiChar;
begin
  I := Length(S);
  if I = 0 then
    begin
      Result := False;
      exit;
    end;
  P := Pointer(S);
  while I > 0 do
    if not (P^ in V) then
      begin
        Result := False;
        exit;
      end else
      begin
        Dec(I);
        Inc(P);
      end;
  Result := True;
end;
{$ENDIF}

function IsValidBinStr(const S: AnsiString): Boolean;
begin
  Result := IsValidBaseStr(S, ['0'..'1']);
end;

function IsValidOctStr(const S: AnsiString): Boolean;
begin
  Result := IsValidBaseStr(S, ['0'..'7']);
end;

function IsValidDecStr(const S: AnsiString): Boolean;
begin
  Result := IsValidBaseStr(S, ['0'..'9']);
end;

function IsValidHexStr(const S: AnsiString): Boolean;
begin
  Result := IsValidBaseStr(S, ['0'..'9', 'A'..'F', 'a'..'f']);
end;

function BaseStrToLongWord(const S: AnsiString; const BaseLog2: Byte;
    var Valid: Boolean): LongWord;
var M : Byte;
    L : LongWord;
    P : Byte;
    C : Byte;
begin
  Assert(BaseLog2 <= 4);
  P := Length(S);
  if P = 0 then // empty string is invalid
    begin
      Valid := False;
      Result := 0;
      exit;
    end;
  M := (1 shl BaseLog2) - 1; // maximum digit value
  L := 0;
  Result := 0;
  repeat
    C := HexLookup[S[P]];
    if C > M then // invalid digit
      begin
        Valid := False;
        Result := 0;
        exit;
      end;
    {$IFDEF FPC}
    Result := Result + LongWord(C) shl L;
    {$ELSE}
    Inc(Result, LongWord(C) shl L);
    {$ENDIF}
    Inc(L, BaseLog2);
    if L > 32 then // overflow
      begin
        Valid := False;
        Result := 0;
        exit;
      end;
    Dec(P);
  until P = 0;
  Valid := True;
end;

function BinStrToLongWord(const S: AnsiString; var Valid: Boolean): LongWord;
begin
  Result := BaseStrToLongWord(S, 1, Valid);
end;

function OctStrToLongWord(const S: AnsiString; var Valid: Boolean): LongWord;
begin
  Result := BaseStrToLongWord(S, 3, Valid);
end;

function HexStrToLongWord(const S: AnsiString; var Valid: Boolean): LongWord;
begin
  Result := BaseStrToLongWord(S, 4, Valid);
end;

function DecStrToLongWord(const S: AnsiString; var Valid: Boolean): LongWord;
var L : Integer;
    {$IFDEF CLR}
    P : Integer;
    {$ELSE}
    P : PAnsiChar;
    {$ENDIF}
    C : AnsiChar;
    F : LongWord;
    R : Int64;
begin
  L := Length(S);
  if L = 0 then // empty string
    begin
      Result := 0;
      Valid := False;
      exit;
    end;
  R := 0;
  F := 1;
  {$IFDEF CLR}
  P := L;
  {$ELSE}
  P := Pointer(S);
  Inc(P, L - 1);
  {$ENDIF}
  repeat
    {$IFDEF CLR}
    C := S[P];
    {$ELSE}
    C := P^;
    {$ENDIF}
    if not (C in ['0'..'9']) then // invalid character
      begin
        Valid := False;
        Result := 0;
        exit;
      end;
    Inc(R, Int64(Ord(C) - Ord('0')) * F);
    if R > MaxLongWord then // overflow, value too large
      begin
        Valid := False;
        Result := 0;
        exit;
      end;
    Dec(P);
    Dec(L);
    if L > 0 then
      begin
        if F = 1000000000 then // overflow, too many digits
          begin
            Valid := False;
            Result := 0;
            exit;
          end;
        F := F * 10;
      end;
  until L = 0;
  Valid := True;
  Result := LongWord(R);
end;

{$IFDEF CLR}
function EncodeBase64(const S, Alphabet: AnsiString; const Pad: Boolean;
    const PadMultiple: Integer; const PadChar: AnsiChar): AnsiString;
var R, C : Byte;
    I, F, L, M, N, U : Integer;
    T : Boolean;
begin
  Assert(Length(Alphabet) = 64);
  {$IFOPT R+}
  if Length(Alphabet) <> 64 then
    begin
      Result := '';
      exit;
    end;
  {$ENDIF}
  L := Length(S);
  if L = 0 then
    begin
      Result := '';
      exit;
    end;
  M := L mod 3;
  N := (L div 3) * 4 + M;
  if M > 0 then
    Inc(N);
  T := Pad and (PadMultiple > 1);
  if T then
    begin
      U := N mod PadMultiple;
      if U > 0 then
        begin
          U := PadMultiple - U;
          Inc(N, U);
        end;
    end else
    U := 0;
  SetLength(Result, N);
  I := 1;
  R := 0;
  for F := 0 to L - 1 do
    begin
      C := Byte(S [F + 1]);
      case F mod 3 of
        0 : begin
              Result[I] := Alphabet[C shr 2 + 1];
              Inc(I);
              R := (C and 3) shl 4;
            end;
        1 : begin
              Result[I] := Alphabet[C shr 4 + R + 1];
              Inc(I);
              R := (C and $0F) shl 2;
            end;
        2 : begin
              Result[I] := Alphabet[C shr 6 + R + 1];
              Inc(I);
              Result[I] := Alphabet[C and $3F + 1];
              Inc(I);
            end;
      end;
    end;
  if M > 0 then
    begin
      Result[I] := Alphabet[R + 1];
      Inc(I);
    end;
  for F := 1 to U do
    begin
      Result[I] := PadChar;
      Inc(I);
    end;
end;
{$ELSE}
function EncodeBase64(const S, Alphabet: AnsiString; const Pad: Boolean;
    const PadMultiple: Integer; const PadChar: AnsiChar): AnsiString;
var R, C : Byte;
    F, L, M, N, U : Integer;
    P : PAnsiChar;
    T : Boolean;
begin
  Assert(Length(Alphabet) = 64);
  {$IFOPT R+}
  if Length(Alphabet) <> 64 then
    begin
      Result := '';
      exit;
    end;
  {$ENDIF}
  L := Length(S);
  if L = 0 then
    begin
      Result := '';
      exit;
    end;
  M := L mod 3;
  N := (L div 3) * 4 + M;
  if M > 0 then
    Inc(N);
  T := Pad and (PadMultiple > 1);
  if T then
    begin
      U := N mod PadMultiple;
      if U > 0 then
        begin
          U := PadMultiple - U;
          Inc(N, U);
        end;
    end else
    U := 0;
  SetLength(Result, N);
  P := Pointer(Result);
  R := 0;
  for F := 0 to L - 1 do
    begin
      C := Byte(S [F + 1]);
      case F mod 3 of
        0 : begin
              P^ := Alphabet[C shr 2 + 1];
              Inc(P);
              R := (C and 3) shl 4;
            end;
        1 : begin
              P^ := Alphabet[C shr 4 + R + 1];
              Inc(P);
              R := (C and $0F) shl 2;
            end;
        2 : begin
              P^ := Alphabet[C shr 6 + R + 1];
              Inc(P);
              P^ := Alphabet[C and $3F + 1];
              Inc(P);
            end;
      end;
    end;
  if M > 0 then
    begin
      P^ := Alphabet[R + 1];
      Inc(P);
    end;
  for F := 1 to U do
    begin
      P^ := PadChar;
      Inc(P);
    end;
end;
{$ENDIF}

{$IFDEF CLR}
function DecodeBase64(const S, Alphabet: AnsiString; const PadSet: CharSet): AnsiString;
var F, L, M, P : Integer;
    B, OutPos  : Byte;
    C          : AnsiChar;
    OutB       : array[1..3] of Byte;
    Lookup     : array[AnsiChar] of Byte;
    R          : Integer;
begin
  Assert(Length(Alphabet) = 64);
  {$IFOPT R+}
  if Length(Alphabet) <> 64 then
    begin
      Result := '';
      exit;
    end;
  {$ENDIF}
  L := Length(S);
  P := 0;
  if PadSet <> [] then
    while (L - P > 0) and (S[L - P] in PadSet) do
      Inc(P);
  M := L - P;
  if M = 0 then
    begin
      Result := '';
      exit;
    end;
  SetLength(Result, (M * 3) div 4);
  for C := #0 to #255 do
    Lookup[C] := 0;
  for F := 0 to 63 do
    Lookup[Alphabet[F + 1]] := Byte(F);
  R := 1;
  OutPos := 0;
  for F := 1 to L - P do
    begin
      B := Lookup[S[F]];
      case OutPos of
          0 : OutB[1] := B shl 2;
          1 : begin
                OutB[1] := OutB[1] or (B shr 4);
                Result[R] := AnsiChar(OutB[1]);
                Inc(R);
                OutB[2] := (B shl 4) and $FF;
              end;
          2 : begin
                OutB[2] := OutB[2] or (B shr 2);
                Result[R] := AnsiChar(OutB[2]);
                Inc(R);
                OutB[3] := (B shl 6) and $FF;
              end;
          3 : begin
                OutB[3] := OutB[3] or B;
                Result[R] := AnsiChar(OutB[3]);
                Inc(R);
              end;
        end;
      OutPos := (OutPos + 1) mod 4;
    end;
  if (OutPos > 0) and (P = 0) then // incomplete encoding, add the partial byte if not 0
    if OutB[OutPos] <> 0 then
      Result := Result + AnsiChar(OutB[OutPos]);
end;
{$ELSE}
function DecodeBase64(const S, Alphabet: AnsiString; const PadSet: CharSet): AnsiString;
var F, L, M, P : Integer;
    B, OutPos  : Byte;
    OutB       : array[1..3] of Byte;
    Lookup     : array[AnsiChar] of Byte;
    R          : PAnsiChar;
begin
  Assert(Length(Alphabet) = 64);
  {$IFOPT R+}
  if Length(Alphabet) <> 64 then
    begin
      Result := '';
      exit;
    end;
  {$ENDIF}
  L := Length(S);
  P := 0;
  if PadSet <> [] then
    while (L - P > 0) and (S[L - P] in PadSet) do
      Inc(P);
  M := L - P;
  if M = 0 then
    begin
      Result := '';
      exit;
    end;
  SetLength(Result, (M * 3) div 4);
  FillChar(Lookup, Sizeof(Lookup), #0);
  for F := 0 to 63 do
    Lookup[Alphabet[F + 1]] := Byte(F);
  R := Pointer(Result);
  OutPos := 0;
  for F := 1 to L - P do
    begin
      B := Lookup[S[F]];
      case OutPos of
          0 : OutB[1] := B shl 2;
          1 : begin
                OutB[1] := OutB[1] or (B shr 4);
                R^ := AnsiChar(OutB[1]);
                Inc(R);
                OutB[2] := (B shl 4) and $FF;
              end;
          2 : begin
                OutB[2] := OutB[2] or (B shr 2);
                R^ := AnsiChar(OutB[2]);
                Inc(R);
                OutB[3] := (B shl 6) and $FF;
              end;
          3 : begin
                OutB[3] := OutB[3] or B;
                R^ := AnsiChar(OutB[3]);
                Inc(R);
              end;
        end;
      OutPos := (OutPos + 1) mod 4;
    end;
  if (OutPos > 0) and (P = 0) then // incomplete encoding, add the partial byte if not 0
    if OutB[OutPos] <> 0 then
      Result := Result + AnsiChar(OutB[OutPos]);
end;
{$ENDIF}

function MIMEBase64Encode(const S: AnsiString): AnsiString;
begin
  Result := EncodeBase64(S, b64_MIMEBase64, True, 4, '=');
end;

function UUDecode(const S: AnsiString): AnsiString;
begin
  // Line without size indicator (first byte = length + 32)
  Result := DecodeBase64(S, b64_UUEncode, ['`']);
end;

function MIMEBase64Decode(const S: AnsiString): AnsiString;
begin
  Result := DecodeBase64(S, b64_MIMEBase64, ['=']);
end;

function XXDecode(const S: AnsiString): AnsiString;
begin
  Result := DecodeBase64(S, b64_XXEncode, []);
end;

{$IFDEF ManagedCode}
function BytesToHex(const P: array of Byte; const UpperCase: Boolean): AnsiString;
var D : Integer;
    E : Integer;
    L : Integer;
    V : Byte;
    W : Byte;
begin
  L := Length(P);
  if L = 0 then
    begin
      Result := '';
      exit;
    end;
  SetLength(Result, L * 2);
  D := 1;
  E := 1;
  while L > 0 do
    begin
      W := P[E];
      V := W shr 4 + 1;
      Inc(E);
      if UpperCase then
        Result[D] := AnsiChar(StrHexDigitsUpper[V])
      else
        Result[D] := AnsiChar(StrHexDigitsLower[V]);
      Inc(D);
      V := W and $F + 1;
      if UpperCase then
        Result[D] := AnsiChar(StrHexDigitsUpper[V])
      else
        Result[D] := AnsiChar(StrHexDigitsLower[V]);
      Inc(D);
      Dec(L);
    end;
end;
{$ELSE}
function BytesToHex(const P: Pointer; const Count: Integer;
         const UpperCase: Boolean): AnsiString;
var Q : PByte;
    D : PAnsiChar;
    L : Integer;
    V : Byte;
begin
  Q := P;
  L := Count;
  if (L <= 0) or not Assigned(Q) then
    begin
      Result := '';
      exit;
    end;
  SetLength(Result, Count * 2);
  D := Pointer(Result);
  while L > 0 do
    begin
      V := Q^ shr 4 + 1;
      if UpperCase then
        D^ := StrHexDigitsUpper[V]
      else
        D^ := StrHexDigitsLower[V];
      Inc(D);
      V := Q^ and $F + 1;
      if UpperCase then
        D^ := StrHexDigitsUpper[V]
      else
        D^ := StrHexDigitsLower[V];
      Inc(D);
      Inc(Q);
      Dec(L);
    end;
end;
{$ENDIF}



{                                                                              }
{ Type conversion                                                              }
{                                                                              }
{$IFNDEF ManagedCode}
function PointerToStr(const P: Pointer): AnsiString;
begin
  Result := '$' + LongWordToHex(LongWord(P), 8);
end;

function StrToPointer(const S: AnsiString): Pointer;
var V : Boolean;
begin
  Result := Pointer(HexStrToLongWord(S, V));
end;
{$ENDIF}

function ObjectClassName(const O: TObject): String;
begin
  if not Assigned(O) then
    Result := 'nil'
  else
    Result := O.ClassName;
end;

function ClassClassName(const C: TClass): String;
begin
  if not Assigned(C) then
    Result := 'nil'
  else
    Result := C.ClassName;
end;

function ObjectToStr(const O: TObject): String;
begin
  if not Assigned(O) then
    Result := 'nil'
  else
    Result := O.ClassName{$IFNDEF CLR} + '@' + LongWordToHexString(LongWord(O), 8){$ENDIF};
end;

{$IFDEF ASM386_DELPHI}
function CharSetToStr(const C: CharSet): AnsiString; // Andrew N. Driazgov
asm
      PUSH    EBX
      MOV     ECX, $100
      MOV     EBX, EAX
      PUSH    ESI
      MOV     EAX, EDX
      SUB     ESP, ECX
      XOR     ESI, ESI
      XOR     EDX, EDX
@@lp: BT      [EBX], EDX
      JC      @@mm
@@nx: INC     EDX
      DEC     ECX
      JNE     @@lp
      MOV     ECX, ESI
      MOV     EDX, ESP
      CALL    System.@LStrFromPCharLen
      ADD     ESP, $100
      POP     ESI
      POP     EBX
      RET
@@mm: MOV     [ESP + ESI], DL
      INC     ESI
      JMP     @@nx
end;
{$ELSE}
function CharSetToStr(const C: CharSet): AnsiString;
// Implemented recursively to avoid multiple memory allocations
  procedure CharMatch(const Start: AnsiChar; const Count: Integer);
  var Ch : AnsiChar;
  begin
    for Ch := Start to #255 do
      if Ch in C then
        begin
          if Ch = #255 then
            SetLength(Result, Count + 1)
          else
            CharMatch(AnsiChar(Byte(Ch) + 1), Count + 1);
          Result[Count + 1] := Ch;
          exit;
        end;
    SetLength(Result, Count);
  end;
begin
  CharMatch(#0, 0);
end;
{$ENDIF}

{$IFDEF ASM386_DELPHI}
function StrToCharSet(const S: AnsiString): CharSet; // Andrew N. Driazgov
asm
      XOR     ECX, ECX
      MOV     [EDX], ECX
      MOV     [EDX + 4], ECX
      MOV     [EDX + 8], ECX
      MOV     [EDX + 12], ECX
      MOV     [EDX + 16], ECX
      MOV     [EDX + 20], ECX
      MOV     [EDX + 24], ECX
      MOV     [EDX + 28], ECX
      TEST    EAX, EAX
      JE      @@qt
      MOV     ECX, [EAX - 4]
      PUSH    EBX
      SUB     ECX, 8
      JS      @@nx
@@lp: MOVZX   EBX, BYTE PTR [EAX]
      BTS     [EDX], EBX
      MOVZX   EBX, BYTE PTR [EAX + 1]
      BTS     [EDX], EBX
      MOVZX   EBX, BYTE PTR [EAX + 2]
      BTS     [EDX], EBX
      MOVZX   EBX, BYTE PTR [EAX + 3]
      BTS     [EDX], EBX
      MOVZX   EBX, BYTE PTR [EAX + 4]
      BTS     [EDX], EBX
      MOVZX   EBX, BYTE PTR [EAX + 5]
      BTS     [EDX], EBX
      MOVZX   EBX, BYTE PTR [EAX + 6]
      BTS     [EDX], EBX
      MOVZX   EBX, BYTE PTR [EAX + 7]
      BTS     [EDX], EBX
      ADD     EAX, 8
      SUB     ECX, 8
      JNS     @@lp
@@nx: JMP     DWORD PTR @@tV[ECX * 4 + 32]
@@tV: DD      @@ex, @@t1, @@t2, @@t3
      DD      @@t4, @@t5, @@t6, @@t7
@@t7: MOVZX   EBX, BYTE PTR [EAX + 6]
      BTS     [EDX], EBX
@@t6: MOVZX   EBX, BYTE PTR [EAX + 5]
      BTS     [EDX], EBX
@@t5: MOVZX   EBX, BYTE PTR [EAX + 4]
      BTS     [EDX], EBX
@@t4: MOVZX   EBX, BYTE PTR [EAX + 3]
      BTS     [EDX], EBX
@@t3: MOVZX   EBX, BYTE PTR [EAX + 2]
      BTS     [EDX], EBX
@@t2: MOVZX   EBX, BYTE PTR [EAX + 1]
      BTS     [EDX], EBX
@@t1: MOVZX   EBX, BYTE PTR [EAX]
      BTS     [EDX], EBX
@@ex: POP     EBX
@@qt:
end;
{$ELSE}
function StrToCharSet(const S: AnsiString): CharSet;
var I : Integer;
begin
  ClearCharSet(Result);
  for I := 1 to Length(S) do
    Include(Result, S[I]);
end;
{$ENDIF}



{                                                                              }
{ Hash functions                                                               }
{   Derived from a CRC32 algorithm.                                            }
{                                                                              }
var
  HashTableInit : Boolean = False;
  HashTable     : array[Byte] of LongWord;
  HashPoly      : LongWord = $EDB88320;

procedure InitHashTable;
var I, J : Byte;
    R    : LongWord;
begin
  for I := $00 to $FF do
    begin
      R := I;
      for J := 8 downto 1 do
        if R and 1 <> 0 then
          R := (R shr 1) xor HashPoly
        else
          R := R shr 1;
      HashTable[I] := R;
    end;
  HashTableInit := True;
end;

{$IFDEF ManagedCode}
function Hash(const Hash: LongWord; const Buf: AnsiString;
    const Index, Size: Integer): LongWord;
var I : Integer;
begin
  Result := Hash;
  for I := 0 to Size - 1 do
    Result := HashTable[Byte(Result) xor Byte(Buf[Index + I])] xor (Result shr 8);
end;
{$ELSE}
function Hash(const Hash: LongWord; const Buf; const BufSize: Integer): LongWord;
var P : PByte;
    I : Integer;
begin
  P := @Buf;
  Result := Hash;
  for I := 1 to BufSize do
    begin
      Result := HashTable[Byte(Result) xor P^] xor (Result shr 8);
      Inc(P);
    end;
end;
{$ENDIF}

{$IFDEF ManagedCode}
function HashNoCase(const Hash: LongWord; const Buf: AnsiString;
    const Index, Size: Integer): LongWord;
var I : Integer;
    C : Byte;
begin
  Result := Hash;
  for I := 0 to Size - 1 do
    begin
      C := Byte(Buf[Index + I]);
      if C in [Ord('A')..Ord('Z')] then
        C := C or 32;
      Result := HashTable[Byte(Result) xor C] xor (Result shr 8);
    end;
end;
{$ELSE}
function HashNoCase(const Hash: LongWord; const Buf; const BufSize: Integer): LongWord;
var P : PByte;
    I : Integer;
    C : Byte;
begin
  P := @Buf;
  Result := Hash;
  for I := 1 to BufSize do
    begin
      C := P^;
      if C in [Ord('A')..Ord('Z')] then
        C := C or 32;
      Result := HashTable[Byte(Result) xor C] xor (Result shr 8);
      Inc(P);
    end;
end;
{$ENDIF}

{$IFDEF ManagedCode}
function HashBuf(const Buf: AnsiString; const Index, Size: Integer;
    const Slots: LongWord): LongWord;
begin
  if not HashTableInit then
    InitHashTable;
  Result := not Hash($FFFFFFFF, Buf, Index, Size);
  // Mod into slots
  if Slots <> 0 then
    Result := Result mod Slots;
end;
{$ELSE}
function HashBuf(const Buf; const BufSize: Integer; const Slots: LongWord): LongWord;
begin
  if not HashTableInit then
    InitHashTable;
  Result := not Hash($FFFFFFFF, Buf, BufSize);
  // Mod into slots
  if Slots <> 0 then
    Result := Result mod Slots;
end;
{$ENDIF}

{$IFDEF ManagedCode}
function HashStrBuf(const StrBuf: AnsiString; const StrLength: Integer;
    const Slots: LongWord): LongWord;
var I, J : Integer;
begin
  if not HashTableInit then
    InitHashTable;
  if StrLength <= 48 then // Hash all characters for short strings
    Result := Hash($FFFFFFFF, StrBuf, 1, StrLength)
  else
    begin
      // Hash first 16 bytes
      Result := Hash($FFFFFFFF, StrBuf, 1, 16);
      // Hash last 16 bytes
      Result := Hash(Result, StrBuf, StrLength - 15, 16);
      // Hash 16 bytes sampled from rest of string
      I := (StrLength - 48) div 16;
      for J := 1 to 16 do
        Result := HashTable[Byte(Result) xor Byte(StrBuf[16 + J * I])] xor (Result shr 8);
    end;
  // Mod into slots
  if Slots <> 0 then
    Result := Result mod Slots;
end;
{$ELSE}
function HashStrBuf(const StrBuf: Pointer; const StrLength: Integer;
    const Slots: LongWord): LongWord;
var P    : PAnsiChar;
    I, J : Integer;
begin
  if not HashTableInit then
    InitHashTable;
  P := StrBuf;
  if StrLength <= 48 then // Hash all characters for short strings
    Result := Hash($FFFFFFFF, P^, StrLength)
  else
    begin
      // Hash first 16 bytes
      Result := Hash($FFFFFFFF, P^, 16);
      // Hash last 16 bytes
      Inc(P, StrLength - 16);
      Result := Hash(Result, P^, 16);
      // Hash 16 bytes sampled from rest of string
      I := (StrLength - 48) div 16;
      P := StrBuf;
      Inc(P, 16);
      for J := 1 to 16 do
        begin
          Result := HashTable[Byte(Result) xor Byte(P^)] xor (Result shr 8);
          Inc(P, I + 1);
        end;
    end;
  // Mod into slots
  if Slots <> 0 then
    Result := Result mod Slots;
end;
{$ENDIF}

{$IFDEF ManagedCode}
function HashStrBufNoCase(const StrBuf: AnsiString; const StrLength: Integer;
    const Slots: LongWord): LongWord;
var I, J : Integer;
    C    : Byte;
begin
  if not HashTableInit then
    InitHashTable;
  if StrLength <= 48 then // Hash all characters for short strings
    Result := HashNoCase($FFFFFFFF, StrBuf, 1, StrLength)
  else
    begin
      // Hash first 16 bytes
      Result := HashNoCase($FFFFFFFF, StrBuf, 1, 16);
      // Hash last 16 bytes
      Result := HashNoCase(Result, StrBuf, StrLength - 15, 16);
      // Hash 16 bytes sampled from rest of string
      I := (StrLength - 48) div 16;
      for J := 1 to 16 do
        begin
          C := Byte(StrBuf[16 + J * I]);
          if C in [Ord('A')..Ord('Z')] then
            C := C or 32;
          Result := HashTable[Byte(Result) xor C] xor (Result shr 8);
        end;
    end;
  // Mod into slots
  if Slots <> 0 then
    Result := Result mod Slots;
end;
{$ELSE}
function HashStrBufNoCase(const StrBuf: Pointer; const StrLength: Integer;
    const Slots: LongWord): LongWord;
var P    : PAnsiChar;
    I, J : Integer;
    C    : Byte;
begin
  if not HashTableInit then
    InitHashTable;
  P := StrBuf;
  if StrLength <= 48 then // Hash all characters for short strings
    Result := HashNoCase($FFFFFFFF, P^, StrLength)
  else
    begin
      // Hash first 16 bytes
      Result := HashNoCase($FFFFFFFF, P^, 16);
      // Hash last 16 bytes
      Inc(P, StrLength - 16);
      Result := HashNoCase(Result, P^, 16);
      // Hash 16 bytes sampled from rest of string
      I := (StrLength - 48) div 16;
      P := StrBuf;
      Inc(P, 16);
      for J := 1 to 16 do
        begin
          C := Byte(P^);
          if C in [Ord('A')..Ord('Z')] then
            C := C or 32;
          Result := HashTable[Byte(Result) xor C] xor (Result shr 8);
          Inc(P, I + 1);
        end;
    end;
  // Mod into slots
  if Slots <> 0 then
    Result := Result mod Slots;
end;
{$ENDIF}

{$IFDEF ManagedCode}
function HashStr(const S: AnsiString; const Slots: LongWord; const CaseSensitive: Boolean): LongWord;
begin
  if CaseSensitive then
    Result := HashStrBuf(S, Length(S), Slots)
  else
    Result := HashStrBufNoCase(S, Length(S), Slots);
end;
{$ELSE}
function HashStr(const S: AnsiString; const Slots: LongWord; const CaseSensitive: Boolean): LongWord;
begin
  if CaseSensitive then
    Result := HashStrBuf(Pointer(S), Length(S), Slots)
  else
    Result := HashStrBufNoCase(Pointer(S), Length(S), Slots);
end;
{$ENDIF}

{ HashInteger based on the CRC32 algorithm. It is a very good all purpose hash }
{ with a highly uniform distribution of results.                               }
{$IFDEF ManagedCode}
function HashInteger(const I: Integer; const Slots: LongWord): LongWord;
begin
  if not HashTableInit then
    InitHashTable;
  Result := $FFFFFFFF;
  Result := HashTable[Byte(Result) xor  (I and $000000FF)]         xor (Result shr 8);
  Result := HashTable[Byte(Result) xor ((I and $0000FF00) shr 8)]  xor (Result shr 8);
  Result := HashTable[Byte(Result) xor ((I and $00FF0000) shr 16)] xor (Result shr 8);
  Result := HashTable[Byte(Result) xor ((I and $FF000000) shr 24)] xor (Result shr 8);
  if Slots <> 0 then
    Result := Result mod Slots;
end;
{$ELSE}
function HashInteger(const I: Integer; const Slots: LongWord): LongWord;
var P : PByte;
begin
  if not HashTableInit then
    InitHashTable;
  Result := $FFFFFFFF;
  P := @I;
  Result := HashTable[Byte(Result) xor P^] xor (Result shr 8);
  Inc(P);
  Result := HashTable[Byte(Result) xor P^] xor (Result shr 8);
  Inc(P);
  Result := HashTable[Byte(Result) xor P^] xor (Result shr 8);
  Inc(P);
  Result := HashTable[Byte(Result) xor P^] xor (Result shr 8);
  if Slots <> 0 then
    Result := Result mod Slots;
end;
{$ENDIF}

{$IFDEF ManagedCode}
function HashLongWord(const I: LongWord; const Slots: LongWord): LongWord;
begin
  if not HashTableInit then
    InitHashTable;
  Result := $FFFFFFFF;
  Result := HashTable[Byte(Result) xor  (I and $000000FF)]         xor (Result shr 8);
  Result := HashTable[Byte(Result) xor ((I and $0000FF00) shr 8)]  xor (Result shr 8);
  Result := HashTable[Byte(Result) xor ((I and $00FF0000) shr 16)] xor (Result shr 8);
  Result := HashTable[Byte(Result) xor ((I and $FF000000) shr 24)] xor (Result shr 8);
  if Slots <> 0 then
    Result := Result mod Slots;
end;
{$ELSE}
function HashLongWord(const I: LongWord; const Slots: LongWord): LongWord;
var P : PByte;
begin
  if not HashTableInit then
    InitHashTable;
  Result := $FFFFFFFF;
  P := @I;
  Result := HashTable[Byte(Result) xor P^] xor (Result shr 8);
  Inc(P);
  Result := HashTable[Byte(Result) xor P^] xor (Result shr 8);
  Inc(P);
  Result := HashTable[Byte(Result) xor P^] xor (Result shr 8);
  Inc(P);
  Result := HashTable[Byte(Result) xor P^] xor (Result shr 8);
  if Slots <> 0 then
    Result := Result mod Slots;
end;
{$ENDIF}



{$IFNDEF ManagedCode}
{                                                                              }
{ Memory                                                                       }
{                                                                              }
{$IFDEF UseAsmMemFunction}
procedure FillMem(var Buf; const Count: Integer; const Value: Byte);
asm
      // EAX = Buf, EDX = Count, CL = Value
      OR      EDX, EDX
      JLE     @Fin
      // Set 4 bytes of ECX to Value byte
      MOV     CH, CL
      SHL     ECX, 8
      MOV     CL, CH
      SHL     ECX, 8
      MOV     CL, CH
      CMP     EDX, 16
      JBE     @SmallFillMem
      // General purpose FillMem
    @GeneralFillMem:
      PUSH    EDI
      MOV     EDI, EAX
      MOV     EAX, ECX
      MOV     ECX, EDX
      SHR     ECX, 2
      REP     STOSD
      AND     EDX, 3
      MOV     ECX, EDX
      REP     STOSB
      POP     EDI
      RET
      // FillMem for small blocks
    @SmallFillMem:
      JMP     DWORD PTR @JumpTable[EDX * 4]
    @JumpTable:
      DD      @Fill0,  @Fill1,  @Fill2,  @Fill3
      DD      @Fill4,  @Fill5,  @Fill6,  @Fill7
      DD      @Fill8,  @Fill9,  @Fill10, @Fill11
      DD      @Fill12, @Fill13, @Fill14, @Fill15
      DD      @Fill16
    @Fill16:
      MOV     DWORD PTR [EAX], ECX
      MOV     DWORD PTR [EAX + 4], ECX
      MOV     DWORD PTR [EAX + 8], ECX
      MOV     DWORD PTR [EAX + 12], ECX
      RET
    @Fill15:
      MOV     BYTE PTR [EAX + 14], CL
    @Fill14:
      MOV     DWORD PTR [EAX], ECX
      MOV     DWORD PTR [EAX + 4], ECX
      MOV     DWORD PTR [EAX + 8], ECX
      MOV     WORD PTR [EAX + 12], CX
      RET
    @Fill13:
      MOV     BYTE PTR [EAX + 12], CL
    @Fill12:
      MOV     DWORD PTR [EAX], ECX
      MOV     DWORD PTR [EAX + 4], ECX
      MOV     DWORD PTR [EAX + 8], ECX
      RET
    @Fill11:
      MOV     BYTE PTR [EAX + 10], CL
    @Fill10:
      MOV     DWORD PTR [EAX], ECX
      MOV     DWORD PTR [EAX + 4], ECX
      MOV     WORD PTR [EAX + 8], CX
      RET
    @Fill9:
      MOV     BYTE PTR [EAX + 8], CL
    @Fill8:
      MOV     DWORD PTR [EAX], ECX
      MOV     DWORD PTR [EAX + 4], ECX
      RET
    @Fill7:
      MOV     BYTE PTR [EAX + 6], CL
    @Fill6:
      MOV     DWORD PTR [EAX], ECX
      MOV     WORD PTR [EAX + 4], CX
      RET
    @Fill5:
      MOV     BYTE PTR [EAX + 4], CL
    @Fill4:
      MOV     DWORD PTR [EAX], ECX
      RET
    @Fill3:
      MOV     BYTE PTR [EAX + 2], CL
    @Fill2:
      MOV     WORD PTR [EAX], CX
      RET
    @Fill1:
      MOV     BYTE PTR [EAX], CL
    @Fill0:
    @Fin:
end;
{$ELSE}
procedure FillMem(var Buf; const Count: Integer; const Value: Byte);
begin
  FillChar(Buf, Count, Value);
end;
{$ENDIF}

{$IFDEF UseAsmMemFunction}
procedure ZeroMem(var Buf; const Count: Integer);
asm
    // EAX = Buf, EDX = Count
    OR     EDX, EDX
    JLE    @Zero0
    CMP    EDX, 16
    JA     @GeneralZeroMem
    XOR    ECX, ECX
    JMP    DWORD PTR @SmallZeroJumpTable[EDX * 4]
  @SmallZeroJumpTable:
    DD     @Zero0,  @Zero1,  @Zero2,  @Zero3
    DD     @Zero4,  @Zero5,  @Zero6,  @Zero7
    DD     @Zero8,  @Zero9,  @Zero10, @Zero11
    DD     @Zero12, @Zero13, @Zero14, @Zero15
    DD     @Zero16
  @Zero16:
    MOV    DWORD PTR [EAX], ECX
    MOV    DWORD PTR [EAX + 4], ECX
    MOV    DWORD PTR [EAX + 8], ECX
    MOV    DWORD PTR [EAX + 12], ECX
    RET
  @Zero15:
    MOV    BYTE PTR [EAX + 14], CL
  @Zero14:
    MOV    DWORD PTR [EAX], ECX
    MOV    DWORD PTR [EAX + 4], ECX
    MOV    DWORD PTR [EAX + 8], ECX
    MOV    WORD PTR [EAX + 12], CX
    RET
  @Zero13:
    MOV    BYTE PTR [EAX + 12], CL
  @Zero12:
    MOV    DWORD PTR [EAX], ECX
    MOV    DWORD PTR [EAX + 4], ECX
    MOV    DWORD PTR [EAX + 8], ECX
    RET
  @Zero11:
    MOV    BYTE PTR [EAX + 10], CL
  @Zero10:
    MOV    DWORD PTR [EAX], ECX
    MOV    DWORD PTR [EAX + 4], ECX
    MOV    WORD PTR [EAX + 8], CX
    RET
  @Zero9:
    MOV    BYTE PTR [EAX + 8], CL
  @Zero8:
    MOV    DWORD PTR [EAX], ECX
    MOV    DWORD PTR [EAX + 4], ECX
    RET
  @Zero7:
    MOV    BYTE PTR [EAX + 6], CL
  @Zero6:
    MOV    DWORD PTR [EAX], ECX
    MOV    WORD PTR [EAX + 4], CX
    RET
  @Zero5:
    MOV    BYTE PTR [EAX + 4], CL
  @Zero4:
    MOV    DWORD PTR [EAX], ECX
    RET
  @Zero3:
    MOV    BYTE PTR [EAX + 2], CL
  @Zero2:
    MOV    WORD PTR [EAX], CX
    RET
  @Zero1:
    MOV    BYTE PTR [EAX], CL
  @Zero0:
    RET
  @GeneralZeroMem:
    PUSH   EDI
    MOV    EDI, EAX
    XOR    EAX, EAX
    MOV    ECX, EDX
    SHR    ECX, 2
    REP    STOSD
    MOV    ECX, EDX
    AND    ECX, 3
    REP    STOSB
    POP    EDI
end;
{$ELSE}
procedure ZeroMem(var Buf; const Count: Integer);
begin
  FillChar(Buf, Count, #0);
end;
{$ENDIF}

procedure GetZeroMem(var P: Pointer; const Size: Integer);
begin
  GetMem(P, Size);
  ZeroMem(P^, Size);
end;

{$IFDEF UseAsmMemFunction}
{ Note: MoveMem implements a "safe move", that is, the Source and Dest memory  }
{ blocks are allowed to overlap.                                               }
procedure MoveMem(const Source; var Dest; const Count: Integer);
asm
    // EAX = Source, EDX = Dest, ECX = Count
    OR     ECX, ECX
    JLE    @Move0
    CMP    EAX, EDX
    JE     @Move0
    JB     @CheckSafe
  @GeneralMove:
    CMP    ECX, 16
    JA     @LargeMove
    JMP    DWORD PTR @SmallMoveJumpTable[ECX * 4]
  @CheckSafe:
    ADD    EAX, ECX
    CMP    EAX, EDX
    JBE    @IsSafe
  @NotSafe:
    SUB    EAX, ECX
    CMP    ECX, 10
    JA     @LargeMoveReverse
    JMP    DWORD PTR @SmallMoveJumpTable[ECX * 4]
  @IsSafe:
    SUB    EAX, ECX
    CMP    ECX, 16
    JA     @LargeMove
    JMP    DWORD PTR @SmallMoveJumpTable[ECX * 4]
  @SmallMoveJumpTable:
    DD     @Move0,  @Move1,  @Move2,  @Move3
    DD     @Move4,  @Move5,  @Move6,  @Move7
    DD     @Move8,  @Move9,  @Move10, @Move11
    DD     @Move12, @Move13, @Move14, @Move15
    DD     @Move16
  @Move16:
    PUSH   EBX
    MOV    ECX, [EAX]
    MOV    EBX, [EAX + 4]
    MOV    [EDX],      ECX
    MOV    [EDX + 4],  EBX
    MOV    ECX, [EAX + 8]
    MOV    EBX, [EAX + 12]
    MOV    [EDX + 8],  ECX
    MOV    [EDX + 12], EBX
    POP    EBX
    RET
  @Move15:
    PUSH   EBX
    MOV    ECX, [EAX]
    MOV    EBX, [EAX + 4]
    MOV    [EDX],      ECX
    MOV    [EDX + 4],  EBX
    MOV    ECX, [EAX + 8]
    MOV    BX,  [EAX + 12]
    MOV    AL,  [EAX + 14]
    MOV    [EDX + 8],  ECX
    MOV    [EDX + 12], BX
    MOV    [EDX + 14], AL
    POP    EBX
    RET
  @Move14:
    PUSH   EBX
    MOV    ECX, [EAX]
    MOV    EBX, [EAX + 4]
    MOV    [EDX],      ECX
    MOV    [EDX + 4],  EBX
    MOV    ECX, [EAX + 8]
    MOV    BX,  [EAX + 12]
    MOV    [EDX + 8],  ECX
    MOV    [EDX + 12], BX
    POP    EBX
    RET
  @Move13:
    PUSH   EBX
    MOV    ECX, [EAX]
    MOV    EBX, [EAX + 4]
    MOV    [EDX],      ECX
    MOV    [EDX + 4],  EBX
    MOV    ECX, [EAX + 8]
    MOV    BL,  [EAX + 12]
    MOV    [EDX + 8],  ECX
    MOV    [EDX + 12], BL
    POP    EBX
    RET
  @Move12:
    PUSH   EBX
    MOV    ECX, [EAX]
    MOV    EBX, [EAX + 4]
    MOV    EAX, [EAX + 8]
    MOV    [EDX],     ECX
    MOV    [EDX + 4], EBX
    MOV    [EDX + 8], EAX
    POP    EBX
    RET
  @Move11:
    PUSH   EBX
    MOV    ECX, [EAX]
    MOV    EBX, [EAX + 4]
    MOV    [EDX],      ECX
    MOV    [EDX + 4],  EBX
    MOV    CX,  [EAX + 8]
    MOV    BL,  [EAX + 10]
    MOV    [EDX + 8],  CX
    MOV    [EDX + 10], BL
    POP    EBX
    RET
  @Move10:
    PUSH   EBX
    MOV    ECX, [EAX]
    MOV    EBX, [EAX + 4]
    MOV    AX,  [EAX + 8]
    MOV    [EDX],     ECX
    MOV    [EDX + 4], EBX
    MOV    [EDX + 8], AX
    POP    EBX
    RET
  @Move9:
    PUSH   EBX
    MOV    ECX, [EAX]
    MOV    EBX, [EAX + 4]
    MOV    AL,  [EAX + 8]
    MOV    [EDX],     ECX
    MOV    [EDX + 4], EBX
    MOV    [EDX + 8], AL
    POP    EBX
    RET
  @Move8:
    MOV    ECX, [EAX]
    MOV    EAX, [EAX + 4]
    MOV    [EDX],     ECX
    MOV    [EDX + 4], EAX
    RET
  @Move7:
    PUSH   EBX
    MOV    ECX, [EAX]
    MOV    BX,  [EAX + 4]
    MOV    AL,  [EAX + 6]
    MOV    [EDX],     ECX
    MOV    [EDX + 4], BX
    MOV    [EDX + 6], AL
    POP    EBX
    RET
  @Move6:
    MOV    ECX, [EAX]
    MOV    AX,  [EAX + 4]
    MOV    [EDX],     ECX
    MOV    [EDX + 4], AX
    RET
  @Move5:
    MOV    ECX, [EAX]
    MOV    AL,  [EAX + 4]
    MOV    [EDX],     ECX
    MOV    [EDX + 4], AL
    RET
  @Move4:
    MOV    ECX, [EAX]
    MOV    [EDX], ECX
    RET
  @Move3:
    MOV    CX, [EAX]
    MOV    AL, [EAX + 2]
    MOV    [EDX],     CX
    MOV    [EDX + 2], AL
    RET
  @Move2:
    MOV    CX, [EAX]
    MOV    [EDX], CX
    RET
  @Move1:
    MOV    CL, [EAX]
    MOV    [EDX], CL
  @Move0:
    RET
  @LargeMove:
    PUSH   ESI
    PUSH   EDI
    MOV    ESI, EAX
    MOV    EDI, EDX
    MOV    EDX, ECX
    SHR    ECX, 2
    REP    MOVSD
    MOV    ECX, EDX
    AND    ECX, 3
    REP    MOVSB
    POP    EDI
    POP    ESI
    RET
  @LargeMoveReverse:
    PUSH   ESI
    PUSH   EDI
    MOV    ESI, EAX
    MOV    EDI, EDX
    LEA    ESI, [ESI + ECX - 4]
    LEA    EDI, [EDI + ECX - 4]
    MOV    EDX, ECX
    SHR    ECX, 2
    STD
    REP    MOVSD
    ADD    ESI, 3
    ADD    EDI, 3
    MOV    ECX, EDX
    AND    ECX, 3
    REP    MOVSB
    CLD
    POP    EDI
    POP    ESI
end;
{$ELSE}
procedure MoveMem(const Source; var Dest; const Count: Integer);
begin
  Move(Source, Dest, Count);
end;
{$ENDIF}

{$IFDEF ASM386_DELPHI}
function CompareMem(const Buf1; const Buf2; const Count: Integer): Boolean;
asm
      // EAX = Buf1, EDX = Buf2, ECX = Count
      OR      ECX, ECX
      JLE     @Fin1
      CMP     EAX, EDX
      JE      @Fin1
      PUSH    ESI
      PUSH    EDI
      MOV     ESI, EAX
      MOV     EDI, EDX
      MOV     EDX, ECX
      SHR     ECX, 2
      XOR     EAX, EAX
      REPE    CMPSD
      JNE     @Fin0
      MOV     ECX, EDX
      AND     ECX, 3
      REPE    CMPSB
      JNE     @Fin0
      INC     EAX
@Fin0:
      POP     EDI
      POP     ESI
      RET
@Fin1:
      MOV     AL, 1
end;
{$ELSE}
function CompareMem(const Buf1; const Buf2; const Count: Integer): Boolean;
var P, Q : Pointer;
    D, I : Integer;
begin
  P := @Buf1;
  Q := @Buf2;
  if (Count <= 0) or (P = Q) then
    begin
      Result := True;
      exit;
    end;
  D := LongWord(Count) div 4;
  for I := 1 to D do
    if PLongWord(P)^ = PLongWord(Q)^ then
      begin
        Inc(PLongWord(P));
        Inc(PLongWord(Q));
      end
    else
      begin
        Result := False;
        exit;
      end;
  D := LongWord(Count) and 3;
  for I := 1 to D do
    if PByte(P)^ = PByte(Q)^ then
      begin
        Inc(PByte(P));
        Inc(PByte(Q));
      end
    else
      begin
        Result := False;
        exit;
      end;
  Result := True;
end;
{$ENDIF}

function CompareMemNoCase(const Buf1; const Buf2; const Count: Integer): TCompareResult;
var P, Q : Pointer;
    I    : Integer;
    C, D : Byte;
begin
  if Count <= 0 then
    begin
      Result := crEqual;
      exit;
    end;
  P := @Buf1;
  Q := @Buf2;
  for I := 1 to Count do
    begin
      C := PByte(P)^;
      D := PByte(Q)^;
      if C in [Ord('A')..Ord('Z')] then
        C := C or 32;
      if D in [Ord('A')..Ord('Z')] then
        D := D or 32;
      if C = D then
        begin
          Inc(PByte(P));
          Inc(PByte(Q));
        end
      else
        begin
          if C < D then
            Result := crLess
          else
            Result := crGreater;
          exit;
        end;
    end;
  Result := crEqual;
end;

function LocateMem(const Buf1; const Size1: Integer; const Buf2; const Size2: Integer): Integer;
var P, Q : PByte;
    I    : Integer;
begin
  if (Size1 <= 0) or (Size2 <= 0) or (Size2 > Size1) then
    begin
      Result := -1;
      exit;
    end;
  for I := 0 to Size1 - Size2 do
    begin
      P := @Buf1;
      Inc(P, I);
      Q := @Buf2;
      if P = Q then
        begin
          Result := I;
          exit;
        end;
      if CompareMem(P^, Q^, Size2) then
        begin
          Result := I;
          exit;
        end;
    end;
  Result := -1;
end;

procedure ReverseMem(var Buf; const Size: Integer);
var I : Integer;
    P : PByte;
    Q : PByte;
    T : Byte;
begin
  P := @Buf;
  Q := P;
  Inc(Q, Size - 1);
  for I := 1 to Size div 2 do
    begin
      T := P^;
      P^ := Q^;
      Q^ := T;
      Inc(P);
      Dec(Q);
    end;
end;
{$ENDIF}



{                                                                              }
{ Append                                                                       }
{                                                                              }
function Append(var V: ByteArray; const R: Byte): Integer;
begin
  Result := Length(V);
  SetLength(V, Result + 1);
  V[Result] := R;
end;

function Append(var V: WordArray; const R: Word): Integer;
begin
  Result := Length(V);
  SetLength(V, Result + 1);
  V[Result] := R;
end;

function Append(var V: LongWordArray; const R: LongWord): Integer;
begin
  Result := Length(V);
  SetLength(V, Result + 1);
  V[Result] := R;
end;

function Append(var V: ShortIntArray; const R: ShortInt): Integer;
begin
  Result := Length(V);
  SetLength(V, Result + 1);
  V[Result] := R;
end;

function Append(var V: SmallIntArray; const R: SmallInt): Integer;
begin
  Result := Length(V);
  SetLength(V, Result + 1);
  V[Result] := R;
end;

function Append(var V: LongIntArray; const R: LongInt): Integer;
begin
  Result := Length(V);
  SetLength(V, Result + 1);
  V[Result] := R;
end;

function Append(var V: Int64Array; const R: Int64): Integer;
begin
  Result := Length(V);
  SetLength(V, Result + 1);
  V[Result] := R;
end;

function Append(var V: SingleArray; const R: Single): Integer;
begin
  Result := Length(V);
  SetLength(V, Result + 1);
  V[Result] := R;
end;

function Append(var V: DoubleArray; const R: Double): Integer;
begin
  Result := Length(V);
  SetLength(V, Result + 1);
  V[Result] := R;
end;

function Append(var V: ExtendedArray; const R: Extended): Integer;
begin
  Result := Length(V);
  SetLength(V, Result + 1);
  V[Result] := R;
end;

function Append(var V: CurrencyArray; const R: Currency): Integer;
begin
  Result := Length(V);
  SetLength(V, Result + 1);
  V[Result] := R;
end;

function Append(var V: BooleanArray; const R: Boolean): Integer;
begin
  Result := Length(V);
  SetLength(V, Result + 1);
  V[Result] := R;
end;

function Append(var V: AnsiStringArray; const R: AnsiString): Integer;
begin
  Result := Length(V);
  SetLength(V, Result + 1);
  V[Result] := R;
end;

function Append(var V: WideStringArray; const R: WideString): Integer;
begin
  Result := Length(V);
  SetLength(V, Result + 1);
  V[Result] := R;
end;

{$IFNDEF ManagedCode}
function Append(var V: PointerArray; const R: Pointer): Integer;
begin
  Result := Length(V);
  SetLength(V, Result + 1);
  V[Result] := R;
end;

{$ENDIF}
function Append(var V: ObjectArray; const R: TObject): Integer;
begin
  Result := Length(V);
  SetLength(V, Result + 1);
  V[Result] := R;
end;

function Append(var V: InterfaceArray; const R: IInterface): Integer;
begin
  Result := Length(V);
  SetLength(V, Result + 1);
  V[Result] := R;
end;

function Append(var V: ByteSetArray; const R: ByteSet): Integer;
begin
  Result := Length(V);
  SetLength(V, Result + 1);
  V[Result] := R;
end;

function Append(var V: CharSetArray; const R: CharSet): Integer;
begin
  Result := Length(V);
  SetLength(V, Result + 1);
  V[Result] := R;
end;



{$IFDEF ManagedCode}
function AppendByteArray(var V: ByteArray; const R: array of Byte): Integer;
var I, L : Integer;
begin
  Result := Length(V);
  L := Length(R);
  if L > 0 then
    begin
      SetLength(V, Result + L);
      for I := 0 to L - 1 do
        V[Result + I] := R[I];
    end;
end;
{$ELSE}
function AppendByteArray(var V: ByteArray; const R: array of Byte): Integer;
var L : Integer;
begin
  Result := Length(V);
  L := Length(R);
  if L > 0 then
    begin
      SetLength(V, Result + L);
      Move(R[0], V[Result], Sizeof(Byte) * L);
    end;
end;
{$ENDIF}

{$IFDEF ManagedCode}
function AppendWordArray(var V: WordArray; const R: array of Word): Integer;
var I, L : Integer;
begin
  Result := Length(V);
  L := Length(R);
  if L > 0 then
    begin
      SetLength(V, Result + L);
      for I := 0 to L - 1 do
        V[Result + I] := R[I];
    end;
end;
{$ELSE}
function AppendWordArray(var V: WordArray; const R: array of Word): Integer;
var L : Integer;
begin
  Result := Length(V);
  L := Length(R);
  if L > 0 then
    begin
      SetLength(V, Result + L);
      Move(R[0], V[Result], Sizeof(Word) * L);
    end;
end;
{$ENDIF}

{$IFDEF ManagedCode}
function AppendCardinalArray(var V: CardinalArray; const R: array of LongWord): Integer;
var I, L : Integer;
begin
  Result := Length(V);
  L := Length(R);
  if L > 0 then
    begin
      SetLength(V, Result + L);
      for I := 0 to L - 1 do
        V[Result + I] := R[I];
    end;
end;
{$ELSE}
function AppendCardinalArray(var V: CardinalArray; const R: array of LongWord): Integer;
var L : Integer;
begin
  Result := Length(V);
  L := Length(R);
  if L > 0 then
    begin
      SetLength(V, Result + L);
      Move(R[0], V[Result], Sizeof(LongWord) * L);
    end;
end;
{$ENDIF}

{$IFDEF ManagedCode}
function AppendShortIntArray(var V: ShortIntArray; const R: array of ShortInt): Integer;
var I, L : Integer;
begin
  Result := Length(V);
  L := Length(R);
  if L > 0 then
    begin
      SetLength(V, Result + L);
      for I := 0 to L - 1 do
        V[Result + I] := R[I];
    end;
end;
{$ELSE}
function AppendShortIntArray(var V: ShortIntArray; const R: array of ShortInt): Integer;
var L : Integer;
begin
  Result := Length(V);
  L := Length(R);
  if L > 0 then
    begin
      SetLength(V, Result + L);
      Move(R[0], V[Result], Sizeof(ShortInt) * L);
    end;
end;
{$ENDIF}

{$IFDEF ManagedCode}
function AppendSmallIntArray(var V: SmallIntArray; const R: array of SmallInt): Integer;
var I, L : Integer;
begin
  Result := Length(V);
  L := Length(R);
  if L > 0 then
    begin
      SetLength(V, Result + L);
      for I := 0 to L - 1 do
        V[Result + I] := R[I];
    end;
end;
{$ELSE}
function AppendSmallIntArray(var V: SmallIntArray; const R: array of SmallInt): Integer;
var L : Integer;
begin
  Result := Length(V);
  L := Length(R);
  if L > 0 then
    begin
      SetLength(V, Result + L);
      Move(R[0], V[Result], Sizeof(SmallInt) * L);
    end;
end;
{$ENDIF}

{$IFDEF ManagedCode}
function AppendIntegerArray(var V: IntegerArray; const R: array of LongInt): Integer;
var I, L : Integer;
begin
  Result := Length(V);
  L := Length(R);
  if L > 0 then
    begin
      SetLength(V, Result + L);
      for I := 0 to L - 1 do
        V[Result + I] := R[I];
    end;
end;
{$ELSE}
function AppendIntegerArray(var V: IntegerArray; const R: array of LongInt): Integer;
var L : Integer;
begin
  Result := Length(V);
  L := Length(R);
  if L > 0 then
    begin
      SetLength(V, Result + L);
      Move(R[0], V[Result], Sizeof(LongInt) * L);
    end;
end;
{$ENDIF}

{$IFDEF ManagedCode}
function AppendInt64Array(var V: Int64Array; const R: array of Int64): Integer;
var I, L : Integer;
begin
  Result := Length(V);
  L := Length(R);
  if L > 0 then
    begin
      SetLength(V, Result + L);
      for I := 0 to L - 1 do
        V[Result + I] := R[I];
    end;
end;
{$ELSE}
function AppendInt64Array(var V: Int64Array; const R: array of Int64): Integer;
var L : Integer;
begin
  Result := Length(V);
  L := Length(R);
  if L > 0 then
    begin
      SetLength(V, Result + L);
      Move(R[0], V[Result], Sizeof(Int64) * L);
    end;
end;
{$ENDIF}

{$IFDEF ManagedCode}
function AppendSingleArray(var V: SingleArray; const R: array of Single): Integer;
var I, L : Integer;
begin
  Result := Length(V);
  L := Length(R);
  if L > 0 then
    begin
      SetLength(V, Result + L);
      for I := 0 to L - 1 do
        V[Result + I] := R[I];
    end;
end;
{$ELSE}
function AppendSingleArray(var V: SingleArray; const R: array of Single): Integer;
var L : Integer;
begin
  Result := Length(V);
  L := Length(R);
  if L > 0 then
    begin
      SetLength(V, Result + L);
      Move(R[0], V[Result], Sizeof(Single) * L);
    end;
end;
{$ENDIF}

{$IFDEF ManagedCode}
function AppendDoubleArray(var V: DoubleArray; const R: array of Double): Integer;
var I, L : Integer;
begin
  Result := Length(V);
  L := Length(R);
  if L > 0 then
    begin
      SetLength(V, Result + L);
      for I := 0 to L - 1 do
        V[Result + I] := R[I];
    end;
end;
{$ELSE}
function AppendDoubleArray(var V: DoubleArray; const R: array of Double): Integer;
var L : Integer;
begin
  Result := Length(V);
  L := Length(R);
  if L > 0 then
    begin
      SetLength(V, Result + L);
      Move(R[0], V[Result], Sizeof(Double) * L);
    end;
end;
{$ENDIF}

{$IFDEF ManagedCode}
function AppendExtendedArray(var V: ExtendedArray; const R: array of Extended): Integer;
var I, L : Integer;
begin
  Result := Length(V);
  L := Length(R);
  if L > 0 then
    begin
      SetLength(V, Result + L);
      for I := 0 to L - 1 do
        V[Result + I] := R[I];
    end;
end;
{$ELSE}
function AppendExtendedArray(var V: ExtendedArray; const R: array of Extended): Integer;
var L : Integer;
begin
  Result := Length(V);
  L := Length(R);
  if L > 0 then
    begin
      SetLength(V, Result + L);
      Move(R[0], V[Result], Sizeof(Extended) * L);
    end;
end;
{$ENDIF}

{$IFNDEF CLR}
{$IFDEF ManagedCode}
function AppendCurrencyArray(var V: CurrencyArray; const R: array of Currency): Integer;
var I, L : Integer;
begin
  Result := Length(V);
  L := Length(R);
  if L > 0 then
    begin
      SetLength(V, Result + L);
      for I := 0 to L - 1 do
        V[Result + I] := R[I];
    end;
end;
{$ELSE}
function AppendCurrencyArray(var V: CurrencyArray; const R: array of Currency): Integer;
var L : Integer;
begin
  Result := Length(V);
  L := Length(R);
  if L > 0 then
    begin
      SetLength(V, Result + L);
      Move(R[0], V[Result], Sizeof(Currency) * L);
    end;
end;
{$ENDIF}

{$IFDEF ManagedCode}
function AppendPointerArray(var V: PointerArray; const R: array of Pointer): Integer;
var I, L : Integer;
begin
  Result := Length(V);
  L := Length(R);
  if L > 0 then
    begin
      SetLength(V, Result + L);
      for I := 0 to L - 1 do
        V[Result + I] := R[I];
    end;
end;
{$ELSE}
function AppendPointerArray(var V: PointerArray; const R: array of Pointer): Integer;
var L : Integer;
begin
  Result := Length(V);
  L := Length(R);
  if L > 0 then
    begin
      SetLength(V, Result + L);
      Move(R[0], V[Result], Sizeof(Pointer) * L);
    end;
end;
{$ENDIF}

{$IFDEF ManagedCode}
function AppendCharSetArray(var V: CharSetArray; const R: array of CharSet): Integer;
var I, L : Integer;
begin
  Result := Length(V);
  L := Length(R);
  if L > 0 then
    begin
      SetLength(V, Result + L);
      for I := 0 to L - 1 do
        V[Result + I] := R[I];
    end;
end;
{$ELSE}
function AppendCharSetArray(var V: CharSetArray; const R: array of CharSet): Integer;
var L : Integer;
begin
  Result := Length(V);
  L := Length(R);
  if L > 0 then
    begin
      SetLength(V, Result + L);
      Move(R[0], V[Result], Sizeof(CharSet) * L);
    end;
end;
{$ENDIF}

{$IFDEF ManagedCode}
function AppendByteSetArray(var V: ByteSetArray; const R: array of ByteSet): Integer;
var I, L : Integer;
begin
  Result := Length(V);
  L := Length(R);
  if L > 0 then
    begin
      SetLength(V, Result + L);
      for I := 0 to L - 1 do
        V[Result + I] := R[I];
    end;
end;
{$ELSE}
function AppendByteSetArray(var V: ByteSetArray; const R: array of ByteSet): Integer;
var L : Integer;
begin
  Result := Length(V);
  L := Length(R);
  if L > 0 then
    begin
      SetLength(V, Result + L);
      Move(R[0], V[Result], Sizeof(ByteSet) * L);
    end;
end;
{$ENDIF}

{$ENDIF}

function AppendObjectArray(var V: ObjectArray; const R: ObjectArray): Integer;
var I, LR : Integer;
begin
  Result := Length(V);
  LR := Length(R);
  if LR > 0 then
    begin
      SetLength(V, Result + LR);
      for I := 0 to LR - 1 do
        V[Result + I] := R[I];
    end;
end;

function AppendAnsiStringArray(var V: AnsiStringArray; const R: array of AnsiString): Integer;
var I, LR : Integer;
begin
  Result := Length(V);
  LR := Length(R);
  if LR > 0 then
    begin
      SetLength(V, Result + LR);
      for I := 0 to LR - 1 do
        V[Result + I] := R[I];
    end;
end;

function AppendWideStringArray(var V: WideStringArray; const R: array of WideString): Integer;
var I, LR : Integer;
begin
  Result := Length(V);
  LR := Length(R);
  if LR > 0 then
    begin
      SetLength(V, Result + LR);
      for I := 0 to LR - 1 do
        V[Result + I] := R[I];
    end;
end;

function AppendStringArray(var V: StringArray; const R: array of String): Integer;
var I, LR : Integer;
begin
  Result := Length(V);
  LR := Length(R);
  if LR > 0 then
    begin
      SetLength(V, Result + LR);
      for I := 0 to LR - 1 do
        V[Result + I] := R[I];
    end;
end;



{                                                                              }
{ FreeAndNil                                                                   }
{                                                                              }
{$IFDEF ManagedCode}
procedure FreeAndNil(var Obj: TObject);
var Temp : TObject;
begin
  Temp := Obj;
  Obj := nil;
  Temp.Free;
end;
{$ELSE}
procedure FreeAndNil(var Obj);
var Temp : TObject;
begin
  Temp := TObject(Obj);
  Pointer(Obj) := nil;
  Temp.Free;
end;
{$ENDIF}



{                                                                              }
{ Remove                                                                       }
{                                                                              }
function Remove(var V: ByteArray; const Idx: Integer; const Count: Integer): Integer;
var I, J, L, M{$IFDEF CLR}, F{$ENDIF}: Integer;
begin
  L := Length(V);
  if (Idx >= L) or (Idx + Count <= 0) or (L = 0) or (Count = 0) then
    begin
      Result := 0;
      exit;
    end;
  I := MaxI(Idx, 0);
  J := MinI(Count, L - I);
  M := L - J - I;
  {$IFDEF CLR}
  for F := 0 to M - 1 do
    V[I + F] := V[I + J + F];
  {$ELSE}
  if M > 0 then
    Move(V[I + J], V[I], M * SizeOf(Byte));
  {$ENDIF}
  SetLength(V, L - J);
  Result := J;
end;

function Remove(var V: WordArray; const Idx: Integer; const Count: Integer): Integer;
var I, J, L, M{$IFDEF CLR}, F{$ENDIF}: Integer;
begin
  L := Length(V);
  if (Idx >= L) or (Idx + Count <= 0) or (L = 0) or (Count = 0) then
    begin
      Result := 0;
      exit;
    end;
  I := MaxI(Idx, 0);
  J := MinI(Count, L - I);
  M := L - J - I;
  {$IFDEF CLR}
  for F := 0 to M - 1 do
    V[I + F] := V[I + J + F];
  {$ELSE}
  if M > 0 then
    Move(V[I + J], V[I], M * SizeOf(Word));
  {$ENDIF}
  SetLength(V, L - J);
  Result := J;
end;

function Remove(var V: LongWordArray; const Idx: Integer; const Count: Integer): Integer;
var I, J, L, M{$IFDEF CLR}, F{$ENDIF}: Integer;
begin
  L := Length(V);
  if (Idx >= L) or (Idx + Count <= 0) or (L = 0) or (Count = 0) then
    begin
      Result := 0;
      exit;
    end;
  I := MaxI(Idx, 0);
  J := MinI(Count, L - I);
  M := L - J - I;
  {$IFDEF CLR}
  for F := 0 to M - 1 do
    V[I + F] := V[I + J + F];
  {$ELSE}
  if M > 0 then
    Move(V[I + J], V[I], M * SizeOf(LongWord));
  {$ENDIF}
  SetLength(V, L - J);
  Result := J;
end;

function Remove(var V: ShortIntArray; const Idx: Integer; const Count: Integer): Integer;
var I, J, L, M{$IFDEF CLR}, F{$ENDIF}: Integer;
begin
  L := Length(V);
  if (Idx >= L) or (Idx + Count <= 0) or (L = 0) or (Count = 0) then
    begin
      Result := 0;
      exit;
    end;
  I := MaxI(Idx, 0);
  J := MinI(Count, L - I);
  M := L - J - I;
  {$IFDEF CLR}
  for F := 0 to M - 1 do
    V[I + F] := V[I + J + F];
  {$ELSE}
  if M > 0 then
    Move(V[I + J], V[I], M * SizeOf(ShortInt));
  {$ENDIF}
  SetLength(V, L - J);
  Result := J;
end;

function Remove(var V: SmallIntArray; const Idx: Integer; const Count: Integer): Integer;
var I, J, L, M{$IFDEF CLR}, F{$ENDIF}: Integer;
begin
  L := Length(V);
  if (Idx >= L) or (Idx + Count <= 0) or (L = 0) or (Count = 0) then
    begin
      Result := 0;
      exit;
    end;
  I := MaxI(Idx, 0);
  J := MinI(Count, L - I);
  M := L - J - I;
  {$IFDEF CLR}
  for F := 0 to M - 1 do
    V[I + F] := V[I + J + F];
  {$ELSE}
  if M > 0 then
    Move(V[I + J], V[I], M * SizeOf(SmallInt));
  {$ENDIF}
  SetLength(V, L - J);
  Result := J;
end;

function Remove(var V: LongIntArray; const Idx: Integer; const Count: Integer): Integer;
var I, J, L, M{$IFDEF CLR}, F{$ENDIF}: Integer;
begin
  L := Length(V);
  if (Idx >= L) or (Idx + Count <= 0) or (L = 0) or (Count = 0) then
    begin
      Result := 0;
      exit;
    end;
  I := MaxI(Idx, 0);
  J := MinI(Count, L - I);
  M := L - J - I;
  {$IFDEF CLR}
  for F := 0 to M - 1 do
    V[I + F] := V[I + J + F];
  {$ELSE}
  if M > 0 then
    Move(V[I + J], V[I], M * SizeOf(LongInt));
  {$ENDIF}
  SetLength(V, L - J);
  Result := J;
end;

function Remove(var V: Int64Array; const Idx: Integer; const Count: Integer): Integer;
var I, J, L, M{$IFDEF CLR}, F{$ENDIF}: Integer;
begin
  L := Length(V);
  if (Idx >= L) or (Idx + Count <= 0) or (L = 0) or (Count = 0) then
    begin
      Result := 0;
      exit;
    end;
  I := MaxI(Idx, 0);
  J := MinI(Count, L - I);
  M := L - J - I;
  {$IFDEF CLR}
  for F := 0 to M - 1 do
    V[I + F] := V[I + J + F];
  {$ELSE}
  if M > 0 then
    Move(V[I + J], V[I], M * SizeOf(Int64));
  {$ENDIF}
  SetLength(V, L - J);
  Result := J;
end;

function Remove(var V: SingleArray; const Idx: Integer; const Count: Integer): Integer;
var I, J, L, M{$IFDEF CLR}, F{$ENDIF}: Integer;
begin
  L := Length(V);
  if (Idx >= L) or (Idx + Count <= 0) or (L = 0) or (Count = 0) then
    begin
      Result := 0;
      exit;
    end;
  I := MaxI(Idx, 0);
  J := MinI(Count, L - I);
  M := L - J - I;
  {$IFDEF CLR}
  for F := 0 to M - 1 do
    V[I + F] := V[I + J + F];
  {$ELSE}
  if M > 0 then
    Move(V[I + J], V[I], M * SizeOf(Single));
  {$ENDIF}
  SetLength(V, L - J);
  Result := J;
end;

function Remove(var V: DoubleArray; const Idx: Integer; const Count: Integer): Integer;
var I, J, L, M{$IFDEF CLR}, F{$ENDIF}: Integer;
begin
  L := Length(V);
  if (Idx >= L) or (Idx + Count <= 0) or (L = 0) or (Count = 0) then
    begin
      Result := 0;
      exit;
    end;
  I := MaxI(Idx, 0);
  J := MinI(Count, L - I);
  M := L - J - I;
  {$IFDEF CLR}
  for F := 0 to M - 1 do
    V[I + F] := V[I + J + F];
  {$ELSE}
  if M > 0 then
    Move(V[I + J], V[I], M * SizeOf(Double));
  {$ENDIF}
  SetLength(V, L - J);
  Result := J;
end;

function Remove(var V: ExtendedArray; const Idx: Integer; const Count: Integer): Integer;
var I, J, L, M{$IFDEF CLR}, F{$ENDIF}: Integer;
begin
  L := Length(V);
  if (Idx >= L) or (Idx + Count <= 0) or (L = 0) or (Count = 0) then
    begin
      Result := 0;
      exit;
    end;
  I := MaxI(Idx, 0);
  J := MinI(Count, L - I);
  M := L - J - I;
  {$IFDEF CLR}
  for F := 0 to M - 1 do
    V[I + F] := V[I + J + F];
  {$ELSE}
  if M > 0 then
    Move(V[I + J], V[I], M * SizeOf(Extended));
  {$ENDIF}
  SetLength(V, L - J);
  Result := J;
end;

{$IFNDEF CLR}
function Remove(var V: CurrencyArray; const Idx: Integer; const Count: Integer): Integer;
var I, J, L, M{$IFDEF CLR}, F{$ENDIF}: Integer;
begin
  L := Length(V);
  if (Idx >= L) or (Idx + Count <= 0) or (L = 0) or (Count = 0) then
    begin
      Result := 0;
      exit;
    end;
  I := MaxI(Idx, 0);
  J := MinI(Count, L - I);
  M := L - J - I;
  {$IFDEF CLR}
  for F := 0 to M - 1 do
    V[I + F] := V[I + J + F];
  {$ELSE}
  if M > 0 then
    Move(V[I + J], V[I], M * SizeOf(Currency));
  {$ENDIF}
  SetLength(V, L - J);
  Result := J;
end;

function Remove(var V: PointerArray; const Idx: Integer; const Count: Integer): Integer;
var I, J, L, M{$IFDEF CLR}, F{$ENDIF}: Integer;
begin
  L := Length(V);
  if (Idx >= L) or (Idx + Count <= 0) or (L = 0) or (Count = 0) then
    begin
      Result := 0;
      exit;
    end;
  I := MaxI(Idx, 0);
  J := MinI(Count, L - I);
  M := L - J - I;
  {$IFDEF CLR}
  for F := 0 to M - 1 do
    V[I + F] := V[I + J + F];
  {$ELSE}
  if M > 0 then
    Move(V[I + J], V[I], M * SizeOf(Pointer));
  {$ENDIF}
  SetLength(V, L - J);
  Result := J;
end;

{$ENDIF}

function Remove(var V: ObjectArray; const Idx: Integer; const Count: Integer;
    const FreeObjects: Boolean): Integer;
var I, J, K, L, M, F : Integer;
begin
  L := Length(V);
  if (Idx >= L) or (Idx + Count <= 0) or (L = 0) or (Count = 0) then
    begin
      Result := 0;
      exit;
    end;
  I := MaxI(Idx, 0);
  J := MinI(Count, L - I);
  if FreeObjects then
    for K := I to I + J - 1 do
      FreeAndNil(V[K]);
  M := L - J - I;
  for F := I to I + M - 1 do
    V[F] := V[F + J];
  SetLength(V, L - J);
  Result := J;
end;

function Remove(var V: AnsiStringArray; const Idx: Integer; const Count: Integer): Integer;
var I, J, K, L : Integer;
begin
  L := Length(V);
  if (Idx >= L) or (Idx + Count <= 0) or (L = 0) or (Count = 0) then
    begin
      Result := 0;
      exit;
    end;
  I := MaxI(Idx, 0);
  J := MinI(Count, L - I);
  for K := I to L - J - 1 do
    V[K] := V[K + J];
  SetLength(V, L - J);
  Result := J;
end;

function Remove(var V: WideStringArray; const Idx: Integer; const Count: Integer): Integer;
var I, J, K, L : Integer;
begin
  L := Length(V);
  if (Idx >= L) or (Idx + Count <= 0) or (L = 0) or (Count = 0) then
    begin
      Result := 0;
      exit;
    end;
  I := MaxI(Idx, 0);
  J := MinI(Count, L - I);
  for K := I to L - J - 1 do
    V[K] := V[K + J];
  SetLength(V, L - J);
  Result := J;
end;

{$IFDEF ManagedCode}
function Remove(var V: InterfaceArray; const Idx: Integer; const Count: Integer): Integer;
var I, J, K, L, M, F : Integer;
begin
  L := Length(V);
  if (Idx >= L) or (Idx + Count <= 0) or (L = 0) or (Count = 0) then
    begin
      Result := 0;
      exit;
    end;
  I := MaxI(Idx, 0);
  J := MinI(Count, L - I);
  for K := I to I + J - 1 do
    V[K] := nil;
  M := L - J - I;
  for F := 0 to M - 1 do
    V[I + F] := V[I + J + F];
  for F := 0 to J - 1 do
    V[L - J + F] := nil;
  SetLength(V, L - J);
  Result := J;
end;
{$ELSE}
function Remove(var V: InterfaceArray; const Idx: Integer; const Count: Integer): Integer;
var I, J, K, L, M : Integer;
begin
  L := Length(V);
  if (Idx >= L) or (Idx + Count <= 0) or (L = 0) or (Count = 0) then
    begin
      Result := 0;
      exit;
    end;
  I := MaxI(Idx, 0);
  J := MinI(Count, L - I);
  for K := I to I + J - 1 do
    V[K] := nil;
  M := L - J - I;
  if M > 0 then
    Move(V[I + J], V[I], M * SizeOf(IInterface));
  FillChar(V[L - J], J * SizeOf(IInterface), #0);
  SetLength(V, L - J);
  Result := J;
end;
{$ENDIF}

{$IFDEF ManagedCode}
procedure FreeObjectArray(var V: ObjectArray);
var I : Integer;
begin
  for I := Length(V) - 1 downto 0 do
    FreeAndNil(V[I]);
end;

procedure FreeObjectArray(var V: ObjectArray; const LoIdx, HiIdx: Integer);
var I : Integer;
begin
  for I := HiIdx downto LoIdx do
    FreeAndNil(V[I]);
end;
{$ELSE}
procedure FreeObjectArray(var V);
var I : Integer;
    A : ObjectArray absolute V;
begin
  for I := Length(A) - 1 downto 0 do
    FreeAndNil(A[I]);
end;

procedure FreeObjectArray(var V; const LoIdx, HiIdx: Integer);
var I : Integer;
    A : ObjectArray absolute V;
begin
  for I := HiIdx downto LoIdx do
    FreeAndNil(A[I]);
end;
{$ENDIF}

// Note: The parameter can not be changed to be untyped and then typecasted
// using an absolute variable, as in FreeObjectArray. The reference counting
// will be done incorrectly.
procedure FreeAndNilObjectArray(var V: ObjectArray);
var W : ObjectArray;
begin
  W := V;
  V := nil;
  FreeObjectArray(W);
end;



{                                                                              }
{ RemoveDuplicates                                                             }
{                                                                              }
procedure RemoveDuplicates(var V: ByteArray; const IsSorted: Boolean);
var I, C, J, L : Integer;
    F          : Byte;
begin
  L := Length(V);
  if L = 0 then
    exit;

  if IsSorted then
    begin
      J := 0;
      repeat
        F := V[J];
        I := J + 1;
        while (I < L) and (V[I] = F) do
          Inc(I);
        C := I - J;
        if C > 1 then
          begin
            Remove(V, J + 1, C - 1);
            Dec(L, C - 1);
            Inc(J);
          end
        else
          J := I;
      until J >= L;
    end else
    begin
      J := 0;
      repeat
        repeat
          I := PosNext(V[J], V, J);
          if I >= 0 then
            Remove(V, I, 1);
        until I < 0;
        Inc(J);
      until J >= Length(V);
    end;
end;

procedure RemoveDuplicates(var V: WordArray; const IsSorted: Boolean);
var I, C, J, L : Integer;
    F          : Word;
begin
  L := Length(V);
  if L = 0 then
    exit;

  if IsSorted then
    begin
      J := 0;
      repeat
        F := V[J];
        I := J + 1;
        while (I < L) and (V[I] = F) do
          Inc(I);
        C := I - J;
        if C > 1 then
          begin
            Remove(V, J + 1, C - 1);
            Dec(L, C - 1);
            Inc(J);
          end
        else
          J := I;
      until J >= L;
    end else
    begin
      J := 0;
      repeat
        repeat
          I := PosNext(V[J], V, J);
          if I >= 0 then
            Remove(V, I, 1);
        until I < 0;
        Inc(J);
      until J >= Length(V);
    end;
end;

procedure RemoveDuplicates(var V: LongWordArray; const IsSorted: Boolean);
var I, C, J, L : Integer;
    F          : LongWord;
begin
  L := Length(V);
  if L = 0 then
    exit;

  if IsSorted then
    begin
      J := 0;
      repeat
        F := V[J];
        I := J + 1;
        while (I < L) and (V[I] = F) do
          Inc(I);
        C := I - J;
        if C > 1 then
          begin
            Remove(V, J + 1, C - 1);
            Dec(L, C - 1);
            Inc(J);
          end
        else
          J := I;
      until J >= L;
    end else
    begin
      J := 0;
      repeat
        repeat
          I := PosNext(V[J], V, J);
          if I >= 0 then
            Remove(V, I, 1);
        until I < 0;
        Inc(J);
      until J >= Length(V);
    end;
end;

procedure RemoveDuplicates(var V: ShortIntArray; const IsSorted: Boolean);
var I, C, J, L : Integer;
    F          : ShortInt;
begin
  L := Length(V);
  if L = 0 then
    exit;

  if IsSorted then
    begin
      J := 0;
      repeat
        F := V[J];
        I := J + 1;
        while (I < L) and (V[I] = F) do
          Inc(I);
        C := I - J;
        if C > 1 then
          begin
            Remove(V, J + 1, C - 1);
            Dec(L, C - 1);
            Inc(J);
          end
        else
          J := I;
      until J >= L;
    end else
    begin
      J := 0;
      repeat
        repeat
          I := PosNext(V[J], V, J);
          if I >= 0 then
            Remove(V, I, 1);
        until I < 0;
        Inc(J);
      until J >= Length(V);
    end;
end;

procedure RemoveDuplicates(var V: SmallIntArray; const IsSorted: Boolean);
var I, C, J, L : Integer;
    F          : SmallInt;
begin
  L := Length(V);
  if L = 0 then
    exit;

  if IsSorted then
    begin
      J := 0;
      repeat
        F := V[J];
        I := J + 1;
        while (I < L) and (V[I] = F) do
          Inc(I);
        C := I - J;
        if C > 1 then
          begin
            Remove(V, J + 1, C - 1);
            Dec(L, C - 1);
            Inc(J);
          end
        else
          J := I;
      until J >= L;
    end else
    begin
      J := 0;
      repeat
        repeat
          I := PosNext(V[J], V, J);
          if I >= 0 then
            Remove(V, I, 1);
        until I < 0;
        Inc(J);
      until J >= Length(V);
    end;
end;

procedure RemoveDuplicates(var V: LongIntArray; const IsSorted: Boolean);
var I, C, J, L : Integer;
    F          : LongInt;
begin
  L := Length(V);
  if L = 0 then
    exit;

  if IsSorted then
    begin
      J := 0;
      repeat
        F := V[J];
        I := J + 1;
        while (I < L) and (V[I] = F) do
          Inc(I);
        C := I - J;
        if C > 1 then
          begin
            Remove(V, J + 1, C - 1);
            Dec(L, C - 1);
            Inc(J);
          end
        else
          J := I;
      until J >= L;
    end else
    begin
      J := 0;
      repeat
        repeat
          I := PosNext(V[J], V, J);
          if I >= 0 then
            Remove(V, I, 1);
        until I < 0;
        Inc(J);
      until J >= Length(V);
    end;
end;

procedure RemoveDuplicates(var V: Int64Array; const IsSorted: Boolean);
var I, C, J, L : Integer;
    F          : Int64;
begin
  L := Length(V);
  if L = 0 then
    exit;

  if IsSorted then
    begin
      J := 0;
      repeat
        F := V[J];
        I := J + 1;
        while (I < L) and (V[I] = F) do
          Inc(I);
        C := I - J;
        if C > 1 then
          begin
            Remove(V, J + 1, C - 1);
            Dec(L, C - 1);
            Inc(J);
          end
        else
          J := I;
      until J >= L;
    end else
    begin
      J := 0;
      repeat
        repeat
          I := PosNext(V[J], V, J);
          if I >= 0 then
            Remove(V, I, 1);
        until I < 0;
        Inc(J);
      until J >= Length(V);
    end;
end;

procedure RemoveDuplicates(var V: SingleArray; const IsSorted: Boolean);
var I, C, J, L : Integer;
    F          : Single;
begin
  L := Length(V);
  if L = 0 then
    exit;

  if IsSorted then
    begin
      J := 0;
      repeat
        F := V[J];
        I := J + 1;
        while (I < L) and (V[I] = F) do
          Inc(I);
        C := I - J;
        if C > 1 then
          begin
            Remove(V, J + 1, C - 1);
            Dec(L, C - 1);
            Inc(J);
          end
        else
          J := I;
      until J >= L;
    end else
    begin
      J := 0;
      repeat
        repeat
          I := PosNext(V[J], V, J);
          if I >= 0 then
            Remove(V, I, 1);
        until I < 0;
        Inc(J);
      until J >= Length(V);
    end;
end;

procedure RemoveDuplicates(var V: DoubleArray; const IsSorted: Boolean);
var I, C, J, L : Integer;
    F          : Double;
begin
  L := Length(V);
  if L = 0 then
    exit;

  if IsSorted then
    begin
      J := 0;
      repeat
        F := V[J];
        I := J + 1;
        while (I < L) and (V[I] = F) do
          Inc(I);
        C := I - J;
        if C > 1 then
          begin
            Remove(V, J + 1, C - 1);
            Dec(L, C - 1);
            Inc(J);
          end
        else
          J := I;
      until J >= L;
    end else
    begin
      J := 0;
      repeat
        repeat
          I := PosNext(V[J], V, J);
          if I >= 0 then
            Remove(V, I, 1);
        until I < 0;
        Inc(J);
      until J >= Length(V);
    end;
end;

procedure RemoveDuplicates(var V: ExtendedArray; const IsSorted: Boolean);
var I, C, J, L : Integer;
    F          : Extended;
begin
  L := Length(V);
  if L = 0 then
    exit;

  if IsSorted then
    begin
      J := 0;
      repeat
        F := V[J];
        I := J + 1;
        while (I < L) and (V[I] = F) do
          Inc(I);
        C := I - J;
        if C > 1 then
          begin
            Remove(V, J + 1, C - 1);
            Dec(L, C - 1);
            Inc(J);
          end
        else
          J := I;
      until J >= L;
    end else
    begin
      J := 0;
      repeat
        repeat
          I := PosNext(V[J], V, J);
          if I >= 0 then
            Remove(V, I, 1);
        until I < 0;
        Inc(J);
      until J >= Length(V);
    end;
end;

procedure RemoveDuplicates(var V: AnsiStringArray; const IsSorted: Boolean);
var I, C, J, L : Integer;
    F          : AnsiString;
begin
  L := Length(V);
  if L = 0 then
    exit;

  if IsSorted then
    begin
      J := 0;
      repeat
        F := V[J];
        I := J + 1;
        while (I < L) and (V[I] = F) do
          Inc(I);
        C := I - J;
        if C > 1 then
          begin
            Remove(V, J + 1, C - 1);
            Dec(L, C - 1);
            Inc(J);
          end
        else
          J := I;
      until J >= L;
    end else
    begin
      J := 0;
      repeat
        repeat
          I := PosNext(V[J], V, J);
          if I >= 0 then
            Remove(V, I, 1);
        until I < 0;
        Inc(J);
      until J >= Length(V);
    end;
end;

procedure RemoveDuplicates(var V: WideStringArray; const IsSorted: Boolean);
var I, C, J, L : Integer;
    F          : WideString;
begin
  L := Length(V);
  if L = 0 then
    exit;

  if IsSorted then
    begin
      J := 0;
      repeat
        F := V[J];
        I := J + 1;
        while (I < L) and (V[I] = F) do
          Inc(I);
        C := I - J;
        if C > 1 then
          begin
            Remove(V, J + 1, C - 1);
            Dec(L, C - 1);
            Inc(J);
          end
        else
          J := I;
      until J >= L;
    end else
    begin
      J := 0;
      repeat
        repeat
          I := PosNext(V[J], V, J);
          if I >= 0 then
            Remove(V, I, 1);
        until I < 0;
        Inc(J);
      until J >= Length(V);
    end;
end;

{$IFNDEF ManagedCode}
procedure RemoveDuplicates(var V: PointerArray; const IsSorted: Boolean);
var I, C, J, L : Integer;
    F          : Pointer;
begin
  L := Length(V);
  if L = 0 then
    exit;

  if IsSorted then
    begin
      J := 0;
      repeat
        F := V[J];
        I := J + 1;
        while (I < L) and (V[I] = F) do
          Inc(I);
        C := I - J;
        if C > 1 then
          begin
            Remove(V, J + 1, C - 1);
            Dec(L, C - 1);
            Inc(J);
          end
        else
          J := I;
      until J >= L;
    end else
    begin
      J := 0;
      repeat
        repeat
          I := PosNext(V[J], V, J);
          if I >= 0 then
            Remove(V, I, 1);
        until I < 0;
        Inc(J);
      until J >= Length(V);
    end;
end;

{$ENDIF}


procedure TrimArrayLeft(var S: ByteArray; const TrimList: array of Byte); overload;
var I, J : Integer;
    R    : Boolean;
begin
  I := 0;
  R := True;
  while R and (I < Length(S)) do
    begin
      R := False;
      for J := 0 to High(TrimList) do
        if S[I] = TrimList[J] then
          begin
            R := True;
            Inc(I);
            break;
          end;
    end;
  if I > 0 then
    Remove(S, 0, I - 1);
end;

procedure TrimArrayLeft(var S: WordArray; const TrimList: array of Word); overload;
var I, J : Integer;
    R    : Boolean;
begin
  I := 0;
  R := True;
  while R and (I < Length(S)) do
    begin
      R := False;
      for J := 0 to High(TrimList) do
        if S[I] = TrimList[J] then
          begin
            R := True;
            Inc(I);
            break;
          end;
    end;
  if I > 0 then
    Remove(S, 0, I - 1);
end;

procedure TrimArrayLeft(var S: LongWordArray; const TrimList: array of LongWord); overload;
var I, J : Integer;
    R    : Boolean;
begin
  I := 0;
  R := True;
  while R and (I < Length(S)) do
    begin
      R := False;
      for J := 0 to High(TrimList) do
        if S[I] = TrimList[J] then
          begin
            R := True;
            Inc(I);
            break;
          end;
    end;
  if I > 0 then
    Remove(S, 0, I - 1);
end;

procedure TrimArrayLeft(var S: ShortIntArray; const TrimList: array of ShortInt); overload;
var I, J : Integer;
    R    : Boolean;
begin
  I := 0;
  R := True;
  while R and (I < Length(S)) do
    begin
      R := False;
      for J := 0 to High(TrimList) do
        if S[I] = TrimList[J] then
          begin
            R := True;
            Inc(I);
            break;
          end;
    end;
  if I > 0 then
    Remove(S, 0, I - 1);
end;

procedure TrimArrayLeft(var S: SmallIntArray; const TrimList: array of SmallInt); overload;
var I, J : Integer;
    R    : Boolean;
begin
  I := 0;
  R := True;
  while R and (I < Length(S)) do
    begin
      R := False;
      for J := 0 to High(TrimList) do
        if S[I] = TrimList[J] then
          begin
            R := True;
            Inc(I);
            break;
          end;
    end;
  if I > 0 then
    Remove(S, 0, I - 1);
end;

procedure TrimArrayLeft(var S: LongIntArray; const TrimList: array of LongInt); overload;
var I, J : Integer;
    R    : Boolean;
begin
  I := 0;
  R := True;
  while R and (I < Length(S)) do
    begin
      R := False;
      for J := 0 to High(TrimList) do
        if S[I] = TrimList[J] then
          begin
            R := True;
            Inc(I);
            break;
          end;
    end;
  if I > 0 then
    Remove(S, 0, I - 1);
end;

procedure TrimArrayLeft(var S: Int64Array; const TrimList: array of Int64); overload;
var I, J : Integer;
    R    : Boolean;
begin
  I := 0;
  R := True;
  while R and (I < Length(S)) do
    begin
      R := False;
      for J := 0 to High(TrimList) do
        if S[I] = TrimList[J] then
          begin
            R := True;
            Inc(I);
            break;
          end;
    end;
  if I > 0 then
    Remove(S, 0, I - 1);
end;

procedure TrimArrayLeft(var S: SingleArray; const TrimList: array of Single); overload;
var I, J : Integer;
    R    : Boolean;
begin
  I := 0;
  R := True;
  while R and (I < Length(S)) do
    begin
      R := False;
      for J := 0 to High(TrimList) do
        if S[I] = TrimList[J] then
          begin
            R := True;
            Inc(I);
            break;
          end;
    end;
  if I > 0 then
    Remove(S, 0, I - 1);
end;

procedure TrimArrayLeft(var S: DoubleArray; const TrimList: array of Double); overload;
var I, J : Integer;
    R    : Boolean;
begin
  I := 0;
  R := True;
  while R and (I < Length(S)) do
    begin
      R := False;
      for J := 0 to High(TrimList) do
        if S[I] = TrimList[J] then
          begin
            R := True;
            Inc(I);
            break;
          end;
    end;
  if I > 0 then
    Remove(S, 0, I - 1);
end;

procedure TrimArrayLeft(var S: ExtendedArray; const TrimList: array of Extended); overload;
var I, J : Integer;
    R    : Boolean;
begin
  I := 0;
  R := True;
  while R and (I < Length(S)) do
    begin
      R := False;
      for J := 0 to High(TrimList) do
        if S[I] = TrimList[J] then
          begin
            R := True;
            Inc(I);
            break;
          end;
    end;
  if I > 0 then
    Remove(S, 0, I - 1);
end;

procedure TrimArrayLeft(var S: AnsiStringArray; const TrimList: array of AnsiString); overload;
var I, J : Integer;
    R    : Boolean;
begin
  I := 0;
  R := True;
  while R and (I < Length(S)) do
    begin
      R := False;
      for J := 0 to High(TrimList) do
        if S[I] = TrimList[J] then
          begin
            R := True;
            Inc(I);
            break;
          end;
    end;
  if I > 0 then
    Remove(S, 0, I - 1);
end;

procedure TrimArrayLeft(var S: WideStringArray; const TrimList: array of WideString); overload;
var I, J : Integer;
    R    : Boolean;
begin
  I := 0;
  R := True;
  while R and (I < Length(S)) do
    begin
      R := False;
      for J := 0 to High(TrimList) do
        if S[I] = TrimList[J] then
          begin
            R := True;
            Inc(I);
            break;
          end;
    end;
  if I > 0 then
    Remove(S, 0, I - 1);
end;

{$IFNDEF ManagedCode}
procedure TrimArrayLeft(var S: PointerArray; const TrimList: array of Pointer); overload;
var I, J : Integer;
    R    : Boolean;
begin
  I := 0;
  R := True;
  while R and (I < Length(S)) do
    begin
      R := False;
      for J := 0 to High(TrimList) do
        if S[I] = TrimList[J] then
          begin
            R := True;
            Inc(I);
            break;
          end;
    end;
  if I > 0 then
    Remove(S, 0, I - 1);
end;

{$ENDIF}

procedure TrimArrayRight(var S: ByteArray; const TrimList: array of Byte); overload;
var I, J : Integer;
    R    : Boolean;
begin
  I := Length(S) - 1;
  R := True;
  while R and (I >= 0) do
    begin
      R := False;
      for J := 0 to High(TrimList) do
        if S[I] = TrimList[J] then
          begin
            R := True;
            Dec(I);
            break;
          end;
    end;
  if I < Length(S) - 1 then
    SetLength(S, I + 1);
end;

procedure TrimArrayRight(var S: WordArray; const TrimList: array of Word); overload;
var I, J : Integer;
    R    : Boolean;
begin
  I := Length(S) - 1;
  R := True;
  while R and (I >= 0) do
    begin
      R := False;
      for J := 0 to High(TrimList) do
        if S[I] = TrimList[J] then
          begin
            R := True;
            Dec(I);
            break;
          end;
    end;
  if I < Length(S) - 1 then
    SetLength(S, I + 1);
end;

procedure TrimArrayRight(var S: LongWordArray; const TrimList: array of LongWord); overload;
var I, J : Integer;
    R    : Boolean;
begin
  I := Length(S) - 1;
  R := True;
  while R and (I >= 0) do
    begin
      R := False;
      for J := 0 to High(TrimList) do
        if S[I] = TrimList[J] then
          begin
            R := True;
            Dec(I);
            break;
          end;
    end;
  if I < Length(S) - 1 then
    SetLength(S, I + 1);
end;

procedure TrimArrayRight(var S: ShortIntArray; const TrimList: array of ShortInt); overload;
var I, J : Integer;
    R    : Boolean;
begin
  I := Length(S) - 1;
  R := True;
  while R and (I >= 0) do
    begin
      R := False;
      for J := 0 to High(TrimList) do
        if S[I] = TrimList[J] then
          begin
            R := True;
            Dec(I);
            break;
          end;
    end;
  if I < Length(S) - 1 then
    SetLength(S, I + 1);
end;

procedure TrimArrayRight(var S: SmallIntArray; const TrimList: array of SmallInt); overload;
var I, J : Integer;
    R    : Boolean;
begin
  I := Length(S) - 1;
  R := True;
  while R and (I >= 0) do
    begin
      R := False;
      for J := 0 to High(TrimList) do
        if S[I] = TrimList[J] then
          begin
            R := True;
            Dec(I);
            break;
          end;
    end;
  if I < Length(S) - 1 then
    SetLength(S, I + 1);
end;

procedure TrimArrayRight(var S: LongIntArray; const TrimList: array of LongInt); overload;
var I, J : Integer;
    R    : Boolean;
begin
  I := Length(S) - 1;
  R := True;
  while R and (I >= 0) do
    begin
      R := False;
      for J := 0 to High(TrimList) do
        if S[I] = TrimList[J] then
          begin
            R := True;
            Dec(I);
            break;
          end;
    end;
  if I < Length(S) - 1 then
    SetLength(S, I + 1);
end;

procedure TrimArrayRight(var S: Int64Array; const TrimList: array of Int64); overload;
var I, J : Integer;
    R    : Boolean;
begin
  I := Length(S) - 1;
  R := True;
  while R and (I >= 0) do
    begin
      R := False;
      for J := 0 to High(TrimList) do
        if S[I] = TrimList[J] then
          begin
            R := True;
            Dec(I);
            break;
          end;
    end;
  if I < Length(S) - 1 then
    SetLength(S, I + 1);
end;

procedure TrimArrayRight(var S: SingleArray; const TrimList: array of Single); overload;
var I, J : Integer;
    R    : Boolean;
begin
  I := Length(S) - 1;
  R := True;
  while R and (I >= 0) do
    begin
      R := False;
      for J := 0 to High(TrimList) do
        if S[I] = TrimList[J] then
          begin
            R := True;
            Dec(I);
            break;
          end;
    end;
  if I < Length(S) - 1 then
    SetLength(S, I + 1);
end;

procedure TrimArrayRight(var S: DoubleArray; const TrimList: array of Double); overload;
var I, J : Integer;
    R    : Boolean;
begin
  I := Length(S) - 1;
  R := True;
  while R and (I >= 0) do
    begin
      R := False;
      for J := 0 to High(TrimList) do
        if S[I] = TrimList[J] then
          begin
            R := True;
            Dec(I);
            break;
          end;
    end;
  if I < Length(S) - 1 then
    SetLength(S, I + 1);
end;

procedure TrimArrayRight(var S: ExtendedArray; const TrimList: array of Extended); overload;
var I, J : Integer;
    R    : Boolean;
begin
  I := Length(S) - 1;
  R := True;
  while R and (I >= 0) do
    begin
      R := False;
      for J := 0 to High(TrimList) do
        if S[I] = TrimList[J] then
          begin
            R := True;
            Dec(I);
            break;
          end;
    end;
  if I < Length(S) - 1 then
    SetLength(S, I + 1);
end;

procedure TrimArrayRight(var S: AnsiStringArray; const TrimList: array of AnsiString); overload;
var I, J : Integer;
    R    : Boolean;
begin
  I := Length(S) - 1;
  R := True;
  while R and (I >= 0) do
    begin
      R := False;
      for J := 0 to High(TrimList) do
        if S[I] = TrimList[J] then
          begin
            R := True;
            Dec(I);
            break;
          end;
    end;
  if I < Length(S) - 1 then
    SetLength(S, I + 1);
end;

procedure TrimArrayRight(var S: WideStringArray; const TrimList: array of WideString); overload;
var I, J : Integer;
    R    : Boolean;
begin
  I := Length(S) - 1;
  R := True;
  while R and (I >= 0) do
    begin
      R := False;
      for J := 0 to High(TrimList) do
        if S[I] = TrimList[J] then
          begin
            R := True;
            Dec(I);
            break;
          end;
    end;
  if I < Length(S) - 1 then
    SetLength(S, I + 1);
end;

{$IFNDEF ManagedCode}
procedure TrimArrayRight(var S: PointerArray; const TrimList: array of Pointer); overload;
var I, J : Integer;
    R    : Boolean;
begin
  I := Length(S) - 1;
  R := True;
  while R and (I >= 0) do
    begin
      R := False;
      for J := 0 to High(TrimList) do
        if S[I] = TrimList[J] then
          begin
            R := True;
            Dec(I);
            break;
          end;
    end;
  if I < Length(S) - 1 then
    SetLength(S, I + 1);
end;

{$ENDIF}

{                                                                              }
{ ArrayInsert                                                                  }
{                                                                              }
{$IFDEF ManagedCode}
function ArrayInsert(var V: ByteArray; const Idx: Integer; const Count: Integer): Integer;
var I, L, J : Integer;
begin
  L := Length(V);
  if (Idx > L) or (Idx + Count <= 0) or (Count <= 0) then
    begin
      Result := -1;
      exit;
    end;
  SetLength(V, L + Count);
  I := Idx;
  if I < 0 then
    I := 0;
  for J := 0 to L - I - 1 do
    V[I + Count + J] := V[I + J];
  for J := 0 to Count - 1 do
    V[I + J] := 0;
  Result := I;
end;
{$ELSE}
function ArrayInsert(var V: ByteArray; const Idx: Integer; const Count: Integer): Integer;
var I, L : Integer;
    P    : Pointer;
begin
  L := Length(V);
  if (Idx > L) or (Idx + Count <= 0) or (Count <= 0) then
    begin
      Result := -1;
      exit;
    end;
  SetLength(V, L + Count);
  I := Idx;
  if I < 0 then
    I := 0;
  P := @V[I];
  if I < L then
    Move(P^, V[I + Count], (L - I) * Sizeof(Byte));
  FillChar(P^, Count * Sizeof(Byte), #0);
  Result := I;
end;
{$ENDIF}

{$IFDEF ManagedCode}
function ArrayInsert(var V: WordArray; const Idx: Integer; const Count: Integer): Integer;
var I, L, J : Integer;
begin
  L := Length(V);
  if (Idx > L) or (Idx + Count <= 0) or (Count <= 0) then
    begin
      Result := -1;
      exit;
    end;
  SetLength(V, L + Count);
  I := Idx;
  if I < 0 then
    I := 0;
  for J := 0 to L - I - 1 do
    V[I + Count + J] := V[I + J];
  for J := 0 to Count - 1 do
    V[I + J] := 0;
  Result := I;
end;
{$ELSE}
function ArrayInsert(var V: WordArray; const Idx: Integer; const Count: Integer): Integer;
var I, L : Integer;
    P    : Pointer;
begin
  L := Length(V);
  if (Idx > L) or (Idx + Count <= 0) or (Count <= 0) then
    begin
      Result := -1;
      exit;
    end;
  SetLength(V, L + Count);
  I := Idx;
  if I < 0 then
    I := 0;
  P := @V[I];
  if I < L then
    Move(P^, V[I + Count], (L - I) * Sizeof(Word));
  FillChar(P^, Count * Sizeof(Word), #0);
  Result := I;
end;
{$ENDIF}

{$IFDEF ManagedCode}
function ArrayInsert(var V: LongWordArray; const Idx: Integer; const Count: Integer): Integer;
var I, L, J : Integer;
begin
  L := Length(V);
  if (Idx > L) or (Idx + Count <= 0) or (Count <= 0) then
    begin
      Result := -1;
      exit;
    end;
  SetLength(V, L + Count);
  I := Idx;
  if I < 0 then
    I := 0;
  for J := 0 to L - I - 1 do
    V[I + Count + J] := V[I + J];
  for J := 0 to Count - 1 do
    V[I + J] := 0;
  Result := I;
end;
{$ELSE}
function ArrayInsert(var V: LongWordArray; const Idx: Integer; const Count: Integer): Integer;
var I, L : Integer;
    P    : Pointer;
begin
  L := Length(V);
  if (Idx > L) or (Idx + Count <= 0) or (Count <= 0) then
    begin
      Result := -1;
      exit;
    end;
  SetLength(V, L + Count);
  I := Idx;
  if I < 0 then
    I := 0;
  P := @V[I];
  if I < L then
    Move(P^, V[I + Count], (L - I) * Sizeof(LongWord));
  FillChar(P^, Count * Sizeof(LongWord), #0);
  Result := I;
end;
{$ENDIF}

{$IFDEF ManagedCode}
function ArrayInsert(var V: ShortIntArray; const Idx: Integer; const Count: Integer): Integer;
var I, L, J : Integer;
begin
  L := Length(V);
  if (Idx > L) or (Idx + Count <= 0) or (Count <= 0) then
    begin
      Result := -1;
      exit;
    end;
  SetLength(V, L + Count);
  I := Idx;
  if I < 0 then
    I := 0;
  for J := 0 to L - I - 1 do
    V[I + Count + J] := V[I + J];
  for J := 0 to Count - 1 do
    V[I + J] := 0;
  Result := I;
end;
{$ELSE}
function ArrayInsert(var V: ShortIntArray; const Idx: Integer; const Count: Integer): Integer;
var I, L : Integer;
    P    : Pointer;
begin
  L := Length(V);
  if (Idx > L) or (Idx + Count <= 0) or (Count <= 0) then
    begin
      Result := -1;
      exit;
    end;
  SetLength(V, L + Count);
  I := Idx;
  if I < 0 then
    I := 0;
  P := @V[I];
  if I < L then
    Move(P^, V[I + Count], (L - I) * Sizeof(ShortInt));
  FillChar(P^, Count * Sizeof(ShortInt), #0);
  Result := I;
end;
{$ENDIF}

{$IFDEF ManagedCode}
function ArrayInsert(var V: SmallIntArray; const Idx: Integer; const Count: Integer): Integer;
var I, L, J : Integer;
begin
  L := Length(V);
  if (Idx > L) or (Idx + Count <= 0) or (Count <= 0) then
    begin
      Result := -1;
      exit;
    end;
  SetLength(V, L + Count);
  I := Idx;
  if I < 0 then
    I := 0;
  for J := 0 to L - I - 1 do
    V[I + Count + J] := V[I + J];
  for J := 0 to Count - 1 do
    V[I + J] := 0;
  Result := I;
end;
{$ELSE}
function ArrayInsert(var V: SmallIntArray; const Idx: Integer; const Count: Integer): Integer;
var I, L : Integer;
    P    : Pointer;
begin
  L := Length(V);
  if (Idx > L) or (Idx + Count <= 0) or (Count <= 0) then
    begin
      Result := -1;
      exit;
    end;
  SetLength(V, L + Count);
  I := Idx;
  if I < 0 then
    I := 0;
  P := @V[I];
  if I < L then
    Move(P^, V[I + Count], (L - I) * Sizeof(SmallInt));
  FillChar(P^, Count * Sizeof(SmallInt), #0);
  Result := I;
end;
{$ENDIF}

{$IFDEF ManagedCode}
function ArrayInsert(var V: LongIntArray; const Idx: Integer; const Count: Integer): Integer;
var I, L, J : Integer;
begin
  L := Length(V);
  if (Idx > L) or (Idx + Count <= 0) or (Count <= 0) then
    begin
      Result := -1;
      exit;
    end;
  SetLength(V, L + Count);
  I := Idx;
  if I < 0 then
    I := 0;
  for J := 0 to L - I - 1 do
    V[I + Count + J] := V[I + J];
  for J := 0 to Count - 1 do
    V[I + J] := 0;
  Result := I;
end;
{$ELSE}
function ArrayInsert(var V: LongIntArray; const Idx: Integer; const Count: Integer): Integer;
var I, L : Integer;
    P    : Pointer;
begin
  L := Length(V);
  if (Idx > L) or (Idx + Count <= 0) or (Count <= 0) then
    begin
      Result := -1;
      exit;
    end;
  SetLength(V, L + Count);
  I := Idx;
  if I < 0 then
    I := 0;
  P := @V[I];
  if I < L then
    Move(P^, V[I + Count], (L - I) * Sizeof(LongInt));
  FillChar(P^, Count * Sizeof(LongInt), #0);
  Result := I;
end;
{$ENDIF}

{$IFDEF ManagedCode}
function ArrayInsert(var V: Int64Array; const Idx: Integer; const Count: Integer): Integer;
var I, L, J : Integer;
begin
  L := Length(V);
  if (Idx > L) or (Idx + Count <= 0) or (Count <= 0) then
    begin
      Result := -1;
      exit;
    end;
  SetLength(V, L + Count);
  I := Idx;
  if I < 0 then
    I := 0;
  for J := 0 to L - I - 1 do
    V[I + Count + J] := V[I + J];
  for J := 0 to Count - 1 do
    V[I + J] := 0;
  Result := I;
end;
{$ELSE}
function ArrayInsert(var V: Int64Array; const Idx: Integer; const Count: Integer): Integer;
var I, L : Integer;
    P    : Pointer;
begin
  L := Length(V);
  if (Idx > L) or (Idx + Count <= 0) or (Count <= 0) then
    begin
      Result := -1;
      exit;
    end;
  SetLength(V, L + Count);
  I := Idx;
  if I < 0 then
    I := 0;
  P := @V[I];
  if I < L then
    Move(P^, V[I + Count], (L - I) * Sizeof(Int64));
  FillChar(P^, Count * Sizeof(Int64), #0);
  Result := I;
end;
{$ENDIF}

{$IFDEF ManagedCode}
function ArrayInsert(var V: SingleArray; const Idx: Integer; const Count: Integer): Integer;
var I, L, J : Integer;
begin
  L := Length(V);
  if (Idx > L) or (Idx + Count <= 0) or (Count <= 0) then
    begin
      Result := -1;
      exit;
    end;
  SetLength(V, L + Count);
  I := Idx;
  if I < 0 then
    I := 0;
  for J := 0 to L - I - 1 do
    V[I + Count + J] := V[I + J];
  for J := 0 to Count - 1 do
    V[I + J] := 0.0;
  Result := I;
end;
{$ELSE}
function ArrayInsert(var V: SingleArray; const Idx: Integer; const Count: Integer): Integer;
var I, L : Integer;
    P    : Pointer;
begin
  L := Length(V);
  if (Idx > L) or (Idx + Count <= 0) or (Count <= 0) then
    begin
      Result := -1;
      exit;
    end;
  SetLength(V, L + Count);
  I := Idx;
  if I < 0 then
    I := 0;
  P := @V[I];
  if I < L then
    Move(P^, V[I + Count], (L - I) * Sizeof(Single));
  FillChar(P^, Count * Sizeof(Single), #0);
  Result := I;
end;
{$ENDIF}

{$IFDEF ManagedCode}
function ArrayInsert(var V: DoubleArray; const Idx: Integer; const Count: Integer): Integer;
var I, L, J : Integer;
begin
  L := Length(V);
  if (Idx > L) or (Idx + Count <= 0) or (Count <= 0) then
    begin
      Result := -1;
      exit;
    end;
  SetLength(V, L + Count);
  I := Idx;
  if I < 0 then
    I := 0;
  for J := 0 to L - I - 1 do
    V[I + Count + J] := V[I + J];
  for J := 0 to Count - 1 do
    V[I + J] := 0.0;
  Result := I;
end;
{$ELSE}
function ArrayInsert(var V: DoubleArray; const Idx: Integer; const Count: Integer): Integer;
var I, L : Integer;
    P    : Pointer;
begin
  L := Length(V);
  if (Idx > L) or (Idx + Count <= 0) or (Count <= 0) then
    begin
      Result := -1;
      exit;
    end;
  SetLength(V, L + Count);
  I := Idx;
  if I < 0 then
    I := 0;
  P := @V[I];
  if I < L then
    Move(P^, V[I + Count], (L - I) * Sizeof(Double));
  FillChar(P^, Count * Sizeof(Double), #0);
  Result := I;
end;
{$ENDIF}

{$IFDEF ManagedCode}
function ArrayInsert(var V: ExtendedArray; const Idx: Integer; const Count: Integer): Integer;
var I, L, J : Integer;
begin
  L := Length(V);
  if (Idx > L) or (Idx + Count <= 0) or (Count <= 0) then
    begin
      Result := -1;
      exit;
    end;
  SetLength(V, L + Count);
  I := Idx;
  if I < 0 then
    I := 0;
  for J := 0 to L - I - 1 do
    V[I + Count + J] := V[I + J];
  for J := 0 to Count - 1 do
    V[I + J] := 0.0;
  Result := I;
end;
{$ELSE}
function ArrayInsert(var V: ExtendedArray; const Idx: Integer; const Count: Integer): Integer;
var I, L : Integer;
    P    : Pointer;
begin
  L := Length(V);
  if (Idx > L) or (Idx + Count <= 0) or (Count <= 0) then
    begin
      Result := -1;
      exit;
    end;
  SetLength(V, L + Count);
  I := Idx;
  if I < 0 then
    I := 0;
  P := @V[I];
  if I < L then
    Move(P^, V[I + Count], (L - I) * Sizeof(Extended));
  FillChar(P^, Count * Sizeof(Extended), #0);
  Result := I;
end;
{$ENDIF}

{$IFDEF ManagedCode}
function ArrayInsert(var V: CurrencyArray; const Idx: Integer; const Count: Integer): Integer;
var I, L, J : Integer;
begin
  L := Length(V);
  if (Idx > L) or (Idx + Count <= 0) or (Count <= 0) then
    begin
      Result := -1;
      exit;
    end;
  SetLength(V, L + Count);
  I := Idx;
  if I < 0 then
    I := 0;
  for J := 0 to L - I - 1 do
    V[I + Count + J] := V[I + J];
  for J := 0 to Count - 1 do
    V[I + J] := 0.0;
  Result := I;
end;
{$ELSE}
function ArrayInsert(var V: CurrencyArray; const Idx: Integer; const Count: Integer): Integer;
var I, L : Integer;
    P    : Pointer;
begin
  L := Length(V);
  if (Idx > L) or (Idx + Count <= 0) or (Count <= 0) then
    begin
      Result := -1;
      exit;
    end;
  SetLength(V, L + Count);
  I := Idx;
  if I < 0 then
    I := 0;
  P := @V[I];
  if I < L then
    Move(P^, V[I + Count], (L - I) * Sizeof(Currency));
  FillChar(P^, Count * Sizeof(Currency), #0);
  Result := I;
end;
{$ENDIF}

{$IFDEF ManagedCode}
function ArrayInsert(var V: AnsiStringArray; const Idx: Integer; const Count: Integer): Integer;
var I, L, J : Integer;
begin
  L := Length(V);
  if (Idx > L) or (Idx + Count <= 0) or (Count <= 0) then
    begin
      Result := -1;
      exit;
    end;
  SetLength(V, L + Count);
  I := Idx;
  if I < 0 then
    I := 0;
  for J := 0 to L - I - 1 do
    V[I + Count + J] := V[I + J];
  for J := 0 to Count - 1 do
    V[I + J] := '';
  Result := I;
end;
{$ELSE}
function ArrayInsert(var V: AnsiStringArray; const Idx: Integer; const Count: Integer): Integer;
var I, L : Integer;
    P    : Pointer;
begin
  L := Length(V);
  if (Idx > L) or (Idx + Count <= 0) or (Count <= 0) then
    begin
      Result := -1;
      exit;
    end;
  SetLength(V, L + Count);
  I := Idx;
  if I < 0 then
    I := 0;
  P := @V[I];
  if I < L then
    Move(P^, V[I + Count], (L - I) * Sizeof(AnsiString));
  FillChar(P^, Count * Sizeof(AnsiString), #0);
  Result := I;
end;
{$ENDIF}

{$IFDEF ManagedCode}
function ArrayInsert(var V: WideStringArray; const Idx: Integer; const Count: Integer): Integer;
var I, L, J : Integer;
begin
  L := Length(V);
  if (Idx > L) or (Idx + Count <= 0) or (Count <= 0) then
    begin
      Result := -1;
      exit;
    end;
  SetLength(V, L + Count);
  I := Idx;
  if I < 0 then
    I := 0;
  for J := 0 to L - I - 1 do
    V[I + Count + J] := V[I + J];
  for J := 0 to Count - 1 do
    V[I + J] := '';
  Result := I;
end;
{$ELSE}
function ArrayInsert(var V: WideStringArray; const Idx: Integer; const Count: Integer): Integer;
var I, L : Integer;
    P    : Pointer;
begin
  L := Length(V);
  if (Idx > L) or (Idx + Count <= 0) or (Count <= 0) then
    begin
      Result := -1;
      exit;
    end;
  SetLength(V, L + Count);
  I := Idx;
  if I < 0 then
    I := 0;
  P := @V[I];
  if I < L then
    Move(P^, V[I + Count], (L - I) * Sizeof(WideString));
  FillChar(P^, Count * Sizeof(WideString), #0);
  Result := I;
end;
{$ENDIF}

{$IFNDEF ManagedCode}
{$IFDEF ManagedCode}
function ArrayInsert(var V: PointerArray; const Idx: Integer; const Count: Integer): Integer;
var I, L, J : Integer;
begin
  L := Length(V);
  if (Idx > L) or (Idx + Count <= 0) or (Count <= 0) then
    begin
      Result := -1;
      exit;
    end;
  SetLength(V, L + Count);
  I := Idx;
  if I < 0 then
    I := 0;
  for J := 0 to L - I - 1 do
    V[I + Count + J] := V[I + J];
  for J := 0 to Count - 1 do
    V[I + J] := nil;
  Result := I;
end;
{$ELSE}
function ArrayInsert(var V: PointerArray; const Idx: Integer; const Count: Integer): Integer;
var I, L : Integer;
    P    : Pointer;
begin
  L := Length(V);
  if (Idx > L) or (Idx + Count <= 0) or (Count <= 0) then
    begin
      Result := -1;
      exit;
    end;
  SetLength(V, L + Count);
  I := Idx;
  if I < 0 then
    I := 0;
  P := @V[I];
  if I < L then
    Move(P^, V[I + Count], (L - I) * Sizeof(Pointer));
  FillChar(P^, Count * Sizeof(Pointer), #0);
  Result := I;
end;
{$ENDIF}

{$IFDEF ManagedCode}
function ArrayInsert(var V: ObjectArray; const Idx: Integer; const Count: Integer): Integer;
var I, L, J : Integer;
begin
  L := Length(V);
  if (Idx > L) or (Idx + Count <= 0) or (Count <= 0) then
    begin
      Result := -1;
      exit;
    end;
  SetLength(V, L + Count);
  I := Idx;
  if I < 0 then
    I := 0;
  for J := 0 to L - I - 1 do
    V[I + Count + J] := V[I + J];
  for J := 0 to Count - 1 do
    V[I + J] := nil;
  Result := I;
end;
{$ELSE}
function ArrayInsert(var V: ObjectArray; const Idx: Integer; const Count: Integer): Integer;
var I, L : Integer;
    P    : Pointer;
begin
  L := Length(V);
  if (Idx > L) or (Idx + Count <= 0) or (Count <= 0) then
    begin
      Result := -1;
      exit;
    end;
  SetLength(V, L + Count);
  I := Idx;
  if I < 0 then
    I := 0;
  P := @V[I];
  if I < L then
    Move(P^, V[I + Count], (L - I) * Sizeof(Pointer));
  FillChar(P^, Count * Sizeof(Pointer), #0);
  Result := I;
end;
{$ENDIF}

{$ENDIF}
{$IFDEF ManagedCode}
function ArrayInsert(var V: InterfaceArray; const Idx: Integer; const Count: Integer): Integer;
var I, L, J : Integer;
begin
  L := Length(V);
  if (Idx > L) or (Idx + Count <= 0) or (Count <= 0) then
    begin
      Result := -1;
      exit;
    end;
  SetLength(V, L + Count);
  I := Idx;
  if I < 0 then
    I := 0;
  for J := 0 to L - I - 1 do
    V[I + Count + J] := V[I + J];
  for J := 0 to Count - 1 do
    V[I + J] := nil;
  Result := I;
end;
{$ELSE}
function ArrayInsert(var V: InterfaceArray; const Idx: Integer; const Count: Integer): Integer;
var I, L : Integer;
    P    : Pointer;
begin
  L := Length(V);
  if (Idx > L) or (Idx + Count <= 0) or (Count <= 0) then
    begin
      Result := -1;
      exit;
    end;
  SetLength(V, L + Count);
  I := Idx;
  if I < 0 then
    I := 0;
  P := @V[I];
  if I < L then
    Move(P^, V[I + Count], (L - I) * Sizeof(IInterface));
  FillChar(P^, Count * Sizeof(IInterface), #0);
  Result := I;
end;
{$ENDIF}



{                                                                              }
{ PosNext                                                                      }
{   PosNext finds the next occurance of Find in V, -1 if it was not found.     }
{     Searches from Item[PrevPos + 1], ie PrevPos = -1 to find first           }
{     occurance.                                                               }
{                                                                              }
function PosNext(const Find: Byte; const V: ByteArray; const PrevPos: Integer;
    const IsSortedAscending: Boolean): Integer;
var I, L, H : Integer;
    D       : Byte;
begin
  if IsSortedAscending then // binary search
    begin
      if MaxI(PrevPos + 1, 0) = 0 then // find first
        begin
          L := 0;
          H := Length(V) - 1;
          while L <= H do
            begin
              I := (L + H) div 2;
              D := V[I];
              if Find = D then
                begin
                  while (I > 0) and (V[I - 1] = Find) do
                    Dec(I);
                  Result := I;
                  exit;
                end else
              if D > Find then
                H := I - 1
              else
                L := I + 1;
            end;
          Result := -1;
        end
      else // find next
        if PrevPos >= Length(V) - 1 then
          Result := -1
        else
          if V[PrevPos + 1] = Find then
            Result := PrevPos + 1
          else
            Result := -1;
    end
  else
    begin // linear search
      for I := MaxI(PrevPos + 1, 0) to Length(V) - 1 do
        if V[I] = Find then
          begin
            Result := I;
            exit;
          end;
      Result := -1;
    end;
end;

function PosNext(const Find: Word; const V: WordArray; const PrevPos: Integer;
    const IsSortedAscending: Boolean): Integer;
var I, L, H : Integer;
    D       : Word;
begin
  if IsSortedAscending then // binary search
    begin
      if MaxI(PrevPos + 1, 0) = 0 then // find first
        begin
          L := 0;
          H := Length(V) - 1;
          while L <= H do
            begin
              I := (L + H) div 2;
              D := V[I];
              if Find = D then
                begin
                  while (I > 0) and (V[I - 1] = Find) do
                    Dec(I);
                  Result := I;
                  exit;
                end else
              if D > Find then
                H := I - 1
              else
                L := I + 1;
            end;
          Result := -1;
        end
      else // find next
        if PrevPos >= Length(V) - 1 then
          Result := -1
        else
          if V[PrevPos + 1] = Find then
            Result := PrevPos + 1
          else
            Result := -1;
    end
  else
    begin // linear search
      for I := MaxI(PrevPos + 1, 0) to Length(V) - 1 do
        if V[I] = Find then
          begin
            Result := I;
            exit;
          end;
      Result := -1;
    end;
end;

function PosNext(const Find: LongWord; const V: LongWordArray; const PrevPos: Integer;
    const IsSortedAscending: Boolean): Integer;
var I, L, H : Integer;
    D       : LongWord;
begin
  if IsSortedAscending then // binary search
    begin
      if MaxI(PrevPos + 1, 0) = 0 then // find first
        begin
          L := 0;
          H := Length(V) - 1;
          while L <= H do
            begin
              I := (L + H) div 2;
              D := V[I];
              if Find = D then
                begin
                  while (I > 0) and (V[I - 1] = Find) do
                    Dec(I);
                  Result := I;
                  exit;
                end else
              if D > Find then
                H := I - 1
              else
                L := I + 1;
            end;
          Result := -1;
        end
      else // find next
        if PrevPos >= Length(V) - 1 then
          Result := -1
        else
          if V[PrevPos + 1] = Find then
            Result := PrevPos + 1
          else
            Result := -1;
    end
  else
    begin // linear search
      for I := MaxI(PrevPos + 1, 0) to Length(V) - 1 do
        if V[I] = Find then
          begin
            Result := I;
            exit;
          end;
      Result := -1;
    end;
end;

function PosNext(const Find: ShortInt; const V: ShortIntArray; const PrevPos: Integer;
    const IsSortedAscending: Boolean): Integer;
var I, L, H : Integer;
    D       : ShortInt;
begin
  if IsSortedAscending then // binary search
    begin
      if MaxI(PrevPos + 1, 0) = 0 then // find first
        begin
          L := 0;
          H := Length(V) - 1;
          while L <= H do
            begin
              I := (L + H) div 2;
              D := V[I];
              if Find = D then
                begin
                  while (I > 0) and (V[I - 1] = Find) do
                    Dec(I);
                  Result := I;
                  exit;
                end else
              if D > Find then
                H := I - 1
              else
                L := I + 1;
            end;
          Result := -1;
        end
      else // find next
        if PrevPos >= Length(V) - 1 then
          Result := -1
        else
          if V[PrevPos + 1] = Find then
            Result := PrevPos + 1
          else
            Result := -1;
    end
  else
    begin // linear search
      for I := MaxI(PrevPos + 1, 0) to Length(V) - 1 do
        if V[I] = Find then
          begin
            Result := I;
            exit;
          end;
      Result := -1;
    end;
end;

function PosNext(const Find: SmallInt; const V: SmallIntArray; const PrevPos: Integer;
    const IsSortedAscending: Boolean): Integer;
var I, L, H : Integer;
    D       : SmallInt;
begin
  if IsSortedAscending then // binary search
    begin
      if MaxI(PrevPos + 1, 0) = 0 then // find first
        begin
          L := 0;
          H := Length(V) - 1;
          while L <= H do
            begin
              I := (L + H) div 2;
              D := V[I];
              if Find = D then
                begin
                  while (I > 0) and (V[I - 1] = Find) do
                    Dec(I);
                  Result := I;
                  exit;
                end else
              if D > Find then
                H := I - 1
              else
                L := I + 1;
            end;
          Result := -1;
        end
      else // find next
        if PrevPos >= Length(V) - 1 then
          Result := -1
        else
          if V[PrevPos + 1] = Find then
            Result := PrevPos + 1
          else
            Result := -1;
    end
  else
    begin // linear search
      for I := MaxI(PrevPos + 1, 0) to Length(V) - 1 do
        if V[I] = Find then
          begin
            Result := I;
            exit;
          end;
      Result := -1;
    end;
end;

function PosNext(const Find: LongInt; const V: LongIntArray; const PrevPos: Integer;
    const IsSortedAscending: Boolean): Integer;
var I, L, H : Integer;
    D       : LongInt;
begin
  if IsSortedAscending then // binary search
    begin
      if MaxI(PrevPos + 1, 0) = 0 then // find first
        begin
          L := 0;
          H := Length(V) - 1;
          while L <= H do
            begin
              I := (L + H) div 2;
              D := V[I];
              if Find = D then
                begin
                  while (I > 0) and (V[I - 1] = Find) do
                    Dec(I);
                  Result := I;
                  exit;
                end else
              if D > Find then
                H := I - 1
              else
                L := I + 1;
            end;
          Result := -1;
        end
      else // find next
        if PrevPos >= Length(V) - 1 then
          Result := -1
        else
          if V[PrevPos + 1] = Find then
            Result := PrevPos + 1
          else
            Result := -1;
    end
  else
    begin // linear search
      for I := MaxI(PrevPos + 1, 0) to Length(V) - 1 do
        if V[I] = Find then
          begin
            Result := I;
            exit;
          end;
      Result := -1;
    end;
end;

function PosNext(const Find: Int64; const V: Int64Array; const PrevPos: Integer;
    const IsSortedAscending: Boolean): Integer;
var I, L, H : Integer;
    D       : Int64;
begin
  if IsSortedAscending then // binary search
    begin
      if MaxI(PrevPos + 1, 0) = 0 then // find first
        begin
          L := 0;
          H := Length(V) - 1;
          while L <= H do
            begin
              I := (L + H) div 2;
              D := V[I];
              if Find = D then
                begin
                  while (I > 0) and (V[I - 1] = Find) do
                    Dec(I);
                  Result := I;
                  exit;
                end else
              if D > Find then
                H := I - 1
              else
                L := I + 1;
            end;
          Result := -1;
        end
      else // find next
        if PrevPos >= Length(V) - 1 then
          Result := -1
        else
          if V[PrevPos + 1] = Find then
            Result := PrevPos + 1
          else
            Result := -1;
    end
  else
    begin // linear search
      for I := MaxI(PrevPos + 1, 0) to Length(V) - 1 do
        if V[I] = Find then
          begin
            Result := I;
            exit;
          end;
      Result := -1;
    end;
end;

function PosNext(const Find: Single; const V: SingleArray; const PrevPos: Integer;
    const IsSortedAscending: Boolean): Integer;
var I, L, H : Integer;
    D       : Single;
begin
  if IsSortedAscending then // binary search
    begin
      if MaxI(PrevPos + 1, 0) = 0 then // find first
        begin
          L := 0;
          H := Length(V) - 1;
          while L <= H do
            begin
              I := (L + H) div 2;
              D := V[I];
              if Find = D then
                begin
                  while (I > 0) and (V[I - 1] = Find) do
                    Dec(I);
                  Result := I;
                  exit;
                end else
              if D > Find then
                H := I - 1
              else
                L := I + 1;
            end;
          Result := -1;
        end
      else // find next
        if PrevPos >= Length(V) - 1 then
          Result := -1
        else
          if V[PrevPos + 1] = Find then
            Result := PrevPos + 1
          else
            Result := -1;
    end
  else
    begin // linear search
      for I := MaxI(PrevPos + 1, 0) to Length(V) - 1 do
        if V[I] = Find then
          begin
            Result := I;
            exit;
          end;
      Result := -1;
    end;
end;

function PosNext(const Find: Double; const V: DoubleArray; const PrevPos: Integer;
    const IsSortedAscending: Boolean): Integer;
var I, L, H : Integer;
    D       : Double;
begin
  if IsSortedAscending then // binary search
    begin
      if MaxI(PrevPos + 1, 0) = 0 then // find first
        begin
          L := 0;
          H := Length(V) - 1;
          while L <= H do
            begin
              I := (L + H) div 2;
              D := V[I];
              if Find = D then
                begin
                  while (I > 0) and (V[I - 1] = Find) do
                    Dec(I);
                  Result := I;
                  exit;
                end else
              if D > Find then
                H := I - 1
              else
                L := I + 1;
            end;
          Result := -1;
        end
      else // find next
        if PrevPos >= Length(V) - 1 then
          Result := -1
        else
          if V[PrevPos + 1] = Find then
            Result := PrevPos + 1
          else
            Result := -1;
    end
  else
    begin // linear search
      for I := MaxI(PrevPos + 1, 0) to Length(V) - 1 do
        if V[I] = Find then
          begin
            Result := I;
            exit;
          end;
      Result := -1;
    end;
end;

function PosNext(const Find: Extended; const V: ExtendedArray; const PrevPos: Integer;
    const IsSortedAscending: Boolean): Integer;
var I, L, H : Integer;
    D       : Extended;
begin
  if IsSortedAscending then // binary search
    begin
      if MaxI(PrevPos + 1, 0) = 0 then // find first
        begin
          L := 0;
          H := Length(V) - 1;
          while L <= H do
            begin
              I := (L + H) div 2;
              D := V[I];
              if Find = D then
                begin
                  while (I > 0) and (V[I - 1] = Find) do
                    Dec(I);
                  Result := I;
                  exit;
                end else
              if D > Find then
                H := I - 1
              else
                L := I + 1;
            end;
          Result := -1;
        end
      else // find next
        if PrevPos >= Length(V) - 1 then
          Result := -1
        else
          if V[PrevPos + 1] = Find then
            Result := PrevPos + 1
          else
            Result := -1;
    end
  else
    begin // linear search
      for I := MaxI(PrevPos + 1, 0) to Length(V) - 1 do
        if V[I] = Find then
          begin
            Result := I;
            exit;
          end;
      Result := -1;
    end;
end;

function PosNext(const Find: Boolean; const V: BooleanArray; const PrevPos: Integer;
    const IsSortedAscending: Boolean): Integer;
var I, L, H : Integer;
    D       : Boolean;
begin
  if IsSortedAscending then // binary search
    begin
      if MaxI(PrevPos + 1, 0) = 0 then // find first
        begin
          L := 0;
          H := Length(V) - 1;
          while L <= H do
            begin
              I := (L + H) div 2;
              D := V[I];
              if Find = D then
                begin
                  while (I > 0) and (V[I - 1] = Find) do
                    Dec(I);
                  Result := I;
                  exit;
                end else
              if D > Find then
                H := I - 1
              else
                L := I + 1;
            end;
          Result := -1;
        end
      else // find next
        if PrevPos >= Length(V) - 1 then
          Result := -1
        else
          if V[PrevPos + 1] = Find then
            Result := PrevPos + 1
          else
            Result := -1;
    end
  else
    begin // linear search
      for I := MaxI(PrevPos + 1, 0) to Length(V) - 1 do
        if V[I] = Find then
          begin
            Result := I;
            exit;
          end;
      Result := -1;
    end;
end;

function PosNext(const Find: AnsiString; const V: AnsiStringArray; const PrevPos: Integer;
    const IsSortedAscending: Boolean): Integer;
var I, L, H : Integer;
    D       : AnsiString;
begin
  if IsSortedAscending then // binary search
    begin
      if MaxI(PrevPos + 1, 0) = 0 then // find first
        begin
          L := 0;
          H := Length(V) - 1;
          while L <= H do
            begin
              I := (L + H) div 2;
              D := V[I];
              if Find = D then
                begin
                  while (I > 0) and (V[I - 1] = Find) do
                    Dec(I);
                  Result := I;
                  exit;
                end else
              if D > Find then
                H := I - 1
              else
                L := I + 1;
            end;
          Result := -1;
        end
      else // find next
        if PrevPos >= Length(V) - 1 then
          Result := -1
        else
          if V[PrevPos + 1] = Find then
            Result := PrevPos + 1
          else
            Result := -1;
    end
  else
    begin // linear search
      for I := MaxI(PrevPos + 1, 0) to Length(V) - 1 do
        if V[I] = Find then
          begin
            Result := I;
            exit;
          end;
      Result := -1;
    end;
end;

function PosNext(const Find: WideString; const V: WideStringArray; const PrevPos: Integer;
    const IsSortedAscending: Boolean): Integer;
var I, L, H : Integer;
    D       : WideString;
begin
  if IsSortedAscending then // binary search
    begin
      if MaxI(PrevPos + 1, 0) = 0 then // find first
        begin
          L := 0;
          H := Length(V) - 1;
          while L <= H do
            begin
              I := (L + H) div 2;
              D := V[I];
              if Find = D then
                begin
                  while (I > 0) and (V[I - 1] = Find) do
                    Dec(I);
                  Result := I;
                  exit;
                end else
              if D > Find then
                H := I - 1
              else
                L := I + 1;
            end;
          Result := -1;
        end
      else // find next
        if PrevPos >= Length(V) - 1 then
          Result := -1
        else
          if V[PrevPos + 1] = Find then
            Result := PrevPos + 1
          else
            Result := -1;
    end
  else
    begin // linear search
      for I := MaxI(PrevPos + 1, 0) to Length(V) - 1 do
        if V[I] = Find then
          begin
            Result := I;
            exit;
          end;
      Result := -1;
    end;
end;

function PosNext(const Find: TObject; const V: ObjectArray; const PrevPos: Integer): Integer;
var I : Integer;
begin
  for I := MaxI(PrevPos + 1, 0) to Length(V) - 1 do
    if V[I] = Find then
      begin
        Result := I;
        exit;
       end;
  Result := -1;
end;

function PosNext(const ClassType: TClass; const V: ObjectArray; const PrevPos: Integer): Integer;
var I : Integer;
begin
  for I := MaxI(PrevPos + 1, 0) to Length(V) - 1 do
    if V[I] is ClassType then
      begin
        Result := I;
        exit;
       end;
  Result := -1;
end;

function PosNext(const ClassName: String; const V: ObjectArray; const PrevPos: Integer): Integer;
var I : Integer;
    T : TObject;
begin
  for I := MaxI(PrevPos + 1, 0) to Length(V) - 1 do
    begin
      T := V[I];
      if Assigned(T) and (T.ClassName = ClassName) then
        begin
          Result := I;
          exit;
         end;
    end;
  Result := -1;
end;

{$IFNDEF ManagedCode}
function PosNext(const Find: Pointer; const V: PointerArray; const PrevPos: Integer): Integer;
var I : Integer;
begin
  for I := MaxI(PrevPos + 1, 0) to Length(V) - 1 do
    if V[I] = Find then
      begin
        Result := I;
        exit;
       end;
  Result := -1;
end;
{$ENDIF}



{                                                                              }
{ Count                                                                        }
{                                                                              }
function Count(const Find: Byte; const V: ByteArray; const IsSortedAscending: Boolean = False): Integer;
var I, J : Integer;
begin
  if IsSortedAscending then
    begin
      I := PosNext(Find, V, -1, True);
      if I = -1 then
        Result := 0 else
        begin
          Result := 1;
          J := Length(V);
          while (I + Result < J) and (V[I + Result] = Find) do
            Inc(Result);
        end;
    end
  else
    begin
      J := -1;
      Result := 0;
      repeat
        I := PosNext(Find, V, J, False);
        if I >= 0 then
          begin
            Inc(Result);
            J := I;
          end;
      until I < 0;
    end;
end;

function Count(const Find: Word; const V: WordArray; const IsSortedAscending: Boolean = False): Integer;
var I, J : Integer;
begin
  if IsSortedAscending then
    begin
      I := PosNext(Find, V, -1, True);
      if I = -1 then
        Result := 0 else
        begin
          Result := 1;
          J := Length(V);
          while (I + Result < J) and (V[I + Result] = Find) do
            Inc(Result);
        end;
    end
  else
    begin
      J := -1;
      Result := 0;
      repeat
        I := PosNext(Find, V, J, False);
        if I >= 0 then
          begin
            Inc(Result);
            J := I;
          end;
      until I < 0;
    end;
end;

function Count(const Find: LongWord; const V: LongWordArray; const IsSortedAscending: Boolean = False): Integer;
var I, J : Integer;
begin
  if IsSortedAscending then
    begin
      I := PosNext(Find, V, -1, True);
      if I = -1 then
        Result := 0 else
        begin
          Result := 1;
          J := Length(V);
          while (I + Result < J) and (V[I + Result] = Find) do
            Inc(Result);
        end;
    end
  else
    begin
      J := -1;
      Result := 0;
      repeat
        I := PosNext(Find, V, J, False);
        if I >= 0 then
          begin
            Inc(Result);
            J := I;
          end;
      until I < 0;
    end;
end;

function Count(const Find: ShortInt; const V: ShortIntArray; const IsSortedAscending: Boolean = False): Integer;
var I, J : Integer;
begin
  if IsSortedAscending then
    begin
      I := PosNext(Find, V, -1, True);
      if I = -1 then
        Result := 0 else
        begin
          Result := 1;
          J := Length(V);
          while (I + Result < J) and (V[I + Result] = Find) do
            Inc(Result);
        end;
    end
  else
    begin
      J := -1;
      Result := 0;
      repeat
        I := PosNext(Find, V, J, False);
        if I >= 0 then
          begin
            Inc(Result);
            J := I;
          end;
      until I < 0;
    end;
end;

function Count(const Find: SmallInt; const V: SmallIntArray; const IsSortedAscending: Boolean = False): Integer;
var I, J : Integer;
begin
  if IsSortedAscending then
    begin
      I := PosNext(Find, V, -1, True);
      if I = -1 then
        Result := 0 else
        begin
          Result := 1;
          J := Length(V);
          while (I + Result < J) and (V[I + Result] = Find) do
            Inc(Result);
        end;
    end
  else
    begin
      J := -1;
      Result := 0;
      repeat
        I := PosNext(Find, V, J, False);
        if I >= 0 then
          begin
            Inc(Result);
            J := I;
          end;
      until I < 0;
    end;
end;

function Count(const Find: LongInt; const V: LongIntArray; const IsSortedAscending: Boolean = False): Integer;
var I, J : Integer;
begin
  if IsSortedAscending then
    begin
      I := PosNext(Find, V, -1, True);
      if I = -1 then
        Result := 0 else
        begin
          Result := 1;
          J := Length(V);
          while (I + Result < J) and (V[I + Result] = Find) do
            Inc(Result);
        end;
    end
  else
    begin
      J := -1;
      Result := 0;
      repeat
        I := PosNext(Find, V, J, False);
        if I >= 0 then
          begin
            Inc(Result);
            J := I;
          end;
      until I < 0;
    end;
end;

function Count(const Find: Int64; const V: Int64Array; const IsSortedAscending: Boolean = False): Integer;
var I, J : Integer;
begin
  if IsSortedAscending then
    begin
      I := PosNext(Find, V, -1, True);
      if I = -1 then
        Result := 0 else
        begin
          Result := 1;
          J := Length(V);
          while (I + Result < J) and (V[I + Result] = Find) do
            Inc(Result);
        end;
    end
  else
    begin
      J := -1;
      Result := 0;
      repeat
        I := PosNext(Find, V, J, False);
        if I >= 0 then
          begin
            Inc(Result);
            J := I;
          end;
      until I < 0;
    end;
end;

function Count(const Find: Single; const V: SingleArray; const IsSortedAscending: Boolean = False): Integer;
var I, J : Integer;
begin
  if IsSortedAscending then
    begin
      I := PosNext(Find, V, -1, True);
      if I = -1 then
        Result := 0 else
        begin
          Result := 1;
          J := Length(V);
          while (I + Result < J) and (V[I + Result] = Find) do
            Inc(Result);
        end;
    end
  else
    begin
      J := -1;
      Result := 0;
      repeat
        I := PosNext(Find, V, J, False);
        if I >= 0 then
          begin
            Inc(Result);
            J := I;
          end;
      until I < 0;
    end;
end;

function Count(const Find: Double; const V: DoubleArray; const IsSortedAscending: Boolean = False): Integer;
var I, J : Integer;
begin
  if IsSortedAscending then
    begin
      I := PosNext(Find, V, -1, True);
      if I = -1 then
        Result := 0 else
        begin
          Result := 1;
          J := Length(V);
          while (I + Result < J) and (V[I + Result] = Find) do
            Inc(Result);
        end;
    end
  else
    begin
      J := -1;
      Result := 0;
      repeat
        I := PosNext(Find, V, J, False);
        if I >= 0 then
          begin
            Inc(Result);
            J := I;
          end;
      until I < 0;
    end;
end;

function Count(const Find: Extended; const V: ExtendedArray; const IsSortedAscending: Boolean = False): Integer;
var I, J : Integer;
begin
  if IsSortedAscending then
    begin
      I := PosNext(Find, V, -1, True);
      if I = -1 then
        Result := 0 else
        begin
          Result := 1;
          J := Length(V);
          while (I + Result < J) and (V[I + Result] = Find) do
            Inc(Result);
        end;
    end
  else
    begin
      J := -1;
      Result := 0;
      repeat
        I := PosNext(Find, V, J, False);
        if I >= 0 then
          begin
            Inc(Result);
            J := I;
          end;
      until I < 0;
    end;
end;

function Count(const Find: AnsiString; const V: AnsiStringArray; const IsSortedAscending: Boolean = False): Integer;
var I, J : Integer;
begin
  if IsSortedAscending then
    begin
      I := PosNext(Find, V, -1, True);
      if I = -1 then
        Result := 0 else
        begin
          Result := 1;
          J := Length(V);
          while (I + Result < J) and (V[I + Result] = Find) do
            Inc(Result);
        end;
    end
  else
    begin
      J := -1;
      Result := 0;
      repeat
        I := PosNext(Find, V, J, False);
        if I >= 0 then
          begin
            Inc(Result);
            J := I;
          end;
      until I < 0;
    end;
end;

function Count(const Find: WideString; const V: WideStringArray; const IsSortedAscending: Boolean = False): Integer;
var I, J : Integer;
begin
  if IsSortedAscending then
    begin
      I := PosNext(Find, V, -1, True);
      if I = -1 then
        Result := 0 else
        begin
          Result := 1;
          J := Length(V);
          while (I + Result < J) and (V[I + Result] = Find) do
            Inc(Result);
        end;
    end
  else
    begin
      J := -1;
      Result := 0;
      repeat
        I := PosNext(Find, V, J, False);
        if I >= 0 then
          begin
            Inc(Result);
            J := I;
          end;
      until I < 0;
    end;
end;

function Count(const Find: Boolean; const V: BooleanArray; const IsSortedAscending: Boolean = False): Integer;
var I, J : Integer;
begin
  if IsSortedAscending then
    begin
      I := PosNext(Find, V, -1, True);
      if I = -1 then
        Result := 0 else
        begin
          Result := 1;
          J := Length(V);
          while (I + Result < J) and (V[I + Result] = Find) do
            Inc(Result);
        end;
    end
  else
    begin
      J := -1;
      Result := 0;
      repeat
        I := PosNext(Find, V, J, False);
        if I >= 0 then
          begin
            Inc(Result);
            J := I;
          end;
      until I < 0;
    end;
end;



{                                                                              }
{ RemoveAll                                                                    }
{                                                                              }
procedure RemoveAll(const Find: Byte; var V: ByteArray; const IsSortedAscending: Boolean = False);
var I, J : Integer;
begin
  I := PosNext(Find, V, -1, IsSortedAscending);
  while I >= 0 do
    begin
      J := 1;
      while (I + J < Length(V)) and (V[I + J] = Find) do
        Inc(J);
      Remove(V, I, J);
      I := PosNext(Find, V, I, IsSortedAscending);
    end;
end;

procedure RemoveAll(const Find: Word; var V: WordArray; const IsSortedAscending: Boolean = False);
var I, J : Integer;
begin
  I := PosNext(Find, V, -1, IsSortedAscending);
  while I >= 0 do
    begin
      J := 1;
      while (I + J < Length(V)) and (V[I + J] = Find) do
        Inc(J);
      Remove(V, I, J);
      I := PosNext(Find, V, I, IsSortedAscending);
    end;
end;

procedure RemoveAll(const Find: LongWord; var V: LongWordArray; const IsSortedAscending: Boolean = False);
var I, J : Integer;
begin
  I := PosNext(Find, V, -1, IsSortedAscending);
  while I >= 0 do
    begin
      J := 1;
      while (I + J < Length(V)) and (V[I + J] = Find) do
        Inc(J);
      Remove(V, I, J);
      I := PosNext(Find, V, I, IsSortedAscending);
    end;
end;

procedure RemoveAll(const Find: ShortInt; var V: ShortIntArray; const IsSortedAscending: Boolean = False);
var I, J : Integer;
begin
  I := PosNext(Find, V, -1, IsSortedAscending);
  while I >= 0 do
    begin
      J := 1;
      while (I + J < Length(V)) and (V[I + J] = Find) do
        Inc(J);
      Remove(V, I, J);
      I := PosNext(Find, V, I, IsSortedAscending);
    end;
end;

procedure RemoveAll(const Find: SmallInt; var V: SmallIntArray; const IsSortedAscending: Boolean = False);
var I, J : Integer;
begin
  I := PosNext(Find, V, -1, IsSortedAscending);
  while I >= 0 do
    begin
      J := 1;
      while (I + J < Length(V)) and (V[I + J] = Find) do
        Inc(J);
      Remove(V, I, J);
      I := PosNext(Find, V, I, IsSortedAscending);
    end;
end;

procedure RemoveAll(const Find: LongInt; var V: LongIntArray; const IsSortedAscending: Boolean = False);
var I, J : Integer;
begin
  I := PosNext(Find, V, -1, IsSortedAscending);
  while I >= 0 do
    begin
      J := 1;
      while (I + J < Length(V)) and (V[I + J] = Find) do
        Inc(J);
      Remove(V, I, J);
      I := PosNext(Find, V, I, IsSortedAscending);
    end;
end;

procedure RemoveAll(const Find: Int64; var V: Int64Array; const IsSortedAscending: Boolean = False);
var I, J : Integer;
begin
  I := PosNext(Find, V, -1, IsSortedAscending);
  while I >= 0 do
    begin
      J := 1;
      while (I + J < Length(V)) and (V[I + J] = Find) do
        Inc(J);
      Remove(V, I, J);
      I := PosNext(Find, V, I, IsSortedAscending);
    end;
end;

procedure RemoveAll(const Find: Single; var V: SingleArray; const IsSortedAscending: Boolean = False);
var I, J : Integer;
begin
  I := PosNext(Find, V, -1, IsSortedAscending);
  while I >= 0 do
    begin
      J := 1;
      while (I + J < Length(V)) and (V[I + J] = Find) do
        Inc(J);
      Remove(V, I, J);
      I := PosNext(Find, V, I, IsSortedAscending);
    end;
end;

procedure RemoveAll(const Find: Double; var V: DoubleArray; const IsSortedAscending: Boolean = False);
var I, J : Integer;
begin
  I := PosNext(Find, V, -1, IsSortedAscending);
  while I >= 0 do
    begin
      J := 1;
      while (I + J < Length(V)) and (V[I + J] = Find) do
        Inc(J);
      Remove(V, I, J);
      I := PosNext(Find, V, I, IsSortedAscending);
    end;
end;

procedure RemoveAll(const Find: Extended; var V: ExtendedArray; const IsSortedAscending: Boolean = False);
var I, J : Integer;
begin
  I := PosNext(Find, V, -1, IsSortedAscending);
  while I >= 0 do
    begin
      J := 1;
      while (I + J < Length(V)) and (V[I + J] = Find) do
        Inc(J);
      Remove(V, I, J);
      I := PosNext(Find, V, I, IsSortedAscending);
    end;
end;

procedure RemoveAll(const Find: AnsiString; var V: AnsiStringArray; const IsSortedAscending: Boolean = False);
var I, J : Integer;
begin
  I := PosNext(Find, V, -1, IsSortedAscending);
  while I >= 0 do
    begin
      J := 1;
      while (I + J < Length(V)) and (V[I + J] = Find) do
        Inc(J);
      Remove(V, I, J);
      I := PosNext(Find, V, I, IsSortedAscending);
    end;
end;

procedure RemoveAll(const Find: WideString; var V: WideStringArray; const IsSortedAscending: Boolean = False);
var I, J : Integer;
begin
  I := PosNext(Find, V, -1, IsSortedAscending);
  while I >= 0 do
    begin
      J := 1;
      while (I + J < Length(V)) and (V[I + J] = Find) do
        Inc(J);
      Remove(V, I, J);
      I := PosNext(Find, V, I, IsSortedAscending);
    end;
end;



{                                                                              }
{ Intersection                                                                 }
{   If both arrays are sorted ascending then time is o(n) instead of o(n^2).   }
{                                                                              }
function Intersection(const V1, V2: SingleArray; const IsSortedAscending: Boolean): SingleArray;
var I, J, L, LV : Integer;
begin
  SetLength(Result, 0);
  if IsSortedAscending then
    begin
      I := 0;
      J := 0;
      L := Length(V1);
      LV := Length(V2);
      while (I < L) and (J < LV) do
        begin
          while (I < L) and (V1[I] < V2[J]) do
            Inc(I);
          if I < L then
            begin
              if V1[I] = V2[J] then
                Append(Result, V1[I]);
              while (J < LV) and (V2[J] <= V1[I]) do
                Inc(J);
            end;
        end;
    end
  else
    for I := 0 to Length(V1) - 1 do
      if (PosNext(V1[I], V2) >= 0) and (PosNext(V1[I], Result) = -1) then
        Append(Result, V1[I]);
end;

function Intersection(const V1, V2: DoubleArray; const IsSortedAscending: Boolean): DoubleArray;
var I, J, L, LV : Integer;
begin
  SetLength(Result, 0);
  if IsSortedAscending then
    begin
      I := 0;
      J := 0;
      L := Length(V1);
      LV := Length(V2);
      while (I < L) and (J < LV) do
        begin
          while (I < L) and (V1[I] < V2[J]) do
            Inc(I);
          if I < L then
            begin
              if V1[I] = V2[J] then
                Append(Result, V1[I]);
              while (J < LV) and (V2[J] <= V1[I]) do
                Inc(J);
            end;
        end;
    end
  else
    for I := 0 to Length(V1) - 1 do
      if (PosNext(V1[I], V2) >= 0) and (PosNext(V1[I], Result) = -1) then
        Append(Result, V1[I]);
end;

function Intersection(const V1, V2: ExtendedArray; const IsSortedAscending: Boolean): ExtendedArray;
var I, J, L, LV : Integer;
begin
  SetLength(Result, 0);
  if IsSortedAscending then
    begin
      I := 0;
      J := 0;
      L := Length(V1);
      LV := Length(V2);
      while (I < L) and (J < LV) do
        begin
          while (I < L) and (V1[I] < V2[J]) do
            Inc(I);
          if I < L then
            begin
              if V1[I] = V2[J] then
                Append(Result, V1[I]);
              while (J < LV) and (V2[J] <= V1[I]) do
                Inc(J);
            end;
        end;
    end
  else
    for I := 0 to Length(V1) - 1 do
      if (PosNext(V1[I], V2) >= 0) and (PosNext(V1[I], Result) = -1) then
        Append(Result, V1[I]);
end;

function Intersection(const V1, V2: ByteArray; const IsSortedAscending: Boolean): ByteArray;
var I, J, L, LV : Integer;
begin
  SetLength(Result, 0);
  if IsSortedAscending then
    begin
      I := 0;
      J := 0;
      L := Length(V1);
      LV := Length(V2);
      while (I < L) and (J < LV) do
        begin
          while (I < L) and (V1[I] < V2[J]) do
            Inc(I);
          if I < L then
            begin
              if V1[I] = V2[J] then
                Append(Result, V1[I]);
              while (J < LV) and (V2[J] <= V1[I]) do
                Inc(J);
            end;
        end;
    end
  else
    for I := 0 to Length(V1) - 1 do
      if (PosNext(V1[I], V2) >= 0) and (PosNext(V1[I], Result) = -1) then
        Append(Result, V1[I]);
end;

function Intersection(const V1, V2: WordArray; const IsSortedAscending: Boolean): WordArray;
var I, J, L, LV : Integer;
begin
  SetLength(Result, 0);
  if IsSortedAscending then
    begin
      I := 0;
      J := 0;
      L := Length(V1);
      LV := Length(V2);
      while (I < L) and (J < LV) do
        begin
          while (I < L) and (V1[I] < V2[J]) do
            Inc(I);
          if I < L then
            begin
              if V1[I] = V2[J] then
                Append(Result, V1[I]);
              while (J < LV) and (V2[J] <= V1[I]) do
                Inc(J);
            end;
        end;
    end
  else
    for I := 0 to Length(V1) - 1 do
      if (PosNext(V1[I], V2) >= 0) and (PosNext(V1[I], Result) = -1) then
        Append(Result, V1[I]);
end;

function Intersection(const V1, V2: LongWordArray; const IsSortedAscending: Boolean): LongWordArray;
var I, J, L, LV : Integer;
begin
  SetLength(Result, 0);
  if IsSortedAscending then
    begin
      I := 0;
      J := 0;
      L := Length(V1);
      LV := Length(V2);
      while (I < L) and (J < LV) do
        begin
          while (I < L) and (V1[I] < V2[J]) do
            Inc(I);
          if I < L then
            begin
              if V1[I] = V2[J] then
                Append(Result, V1[I]);
              while (J < LV) and (V2[J] <= V1[I]) do
                Inc(J);
            end;
        end;
    end
  else
    for I := 0 to Length(V1) - 1 do
      if (PosNext(V1[I], V2) >= 0) and (PosNext(V1[I], Result) = -1) then
        Append(Result, V1[I]);
end;

function Intersection(const V1, V2: ShortIntArray; const IsSortedAscending: Boolean): ShortIntArray;
var I, J, L, LV : Integer;
begin
  SetLength(Result, 0);
  if IsSortedAscending then
    begin
      I := 0;
      J := 0;
      L := Length(V1);
      LV := Length(V2);
      while (I < L) and (J < LV) do
        begin
          while (I < L) and (V1[I] < V2[J]) do
            Inc(I);
          if I < L then
            begin
              if V1[I] = V2[J] then
                Append(Result, V1[I]);
              while (J < LV) and (V2[J] <= V1[I]) do
                Inc(J);
            end;
        end;
    end
  else
    for I := 0 to Length(V1) - 1 do
      if (PosNext(V1[I], V2) >= 0) and (PosNext(V1[I], Result) = -1) then
        Append(Result, V1[I]);
end;

function Intersection(const V1, V2: SmallIntArray; const IsSortedAscending: Boolean): SmallIntArray;
var I, J, L, LV : Integer;
begin
  SetLength(Result, 0);
  if IsSortedAscending then
    begin
      I := 0;
      J := 0;
      L := Length(V1);
      LV := Length(V2);
      while (I < L) and (J < LV) do
        begin
          while (I < L) and (V1[I] < V2[J]) do
            Inc(I);
          if I < L then
            begin
              if V1[I] = V2[J] then
                Append(Result, V1[I]);
              while (J < LV) and (V2[J] <= V1[I]) do
                Inc(J);
            end;
        end;
    end
  else
    for I := 0 to Length(V1) - 1 do
      if (PosNext(V1[I], V2) >= 0) and (PosNext(V1[I], Result) = -1) then
        Append(Result, V1[I]);
end;

function Intersection(const V1, V2: LongIntArray; const IsSortedAscending: Boolean): LongIntArray;
var I, J, L, LV : Integer;
begin
  SetLength(Result, 0);
  if IsSortedAscending then
    begin
      I := 0;
      J := 0;
      L := Length(V1);
      LV := Length(V2);
      while (I < L) and (J < LV) do
        begin
          while (I < L) and (V1[I] < V2[J]) do
            Inc(I);
          if I < L then
            begin
              if V1[I] = V2[J] then
                Append(Result, V1[I]);
              while (J < LV) and (V2[J] <= V1[I]) do
                Inc(J);
            end;
        end;
    end
  else
    for I := 0 to Length(V1) - 1 do
      if (PosNext(V1[I], V2) >= 0) and (PosNext(V1[I], Result) = -1) then
        Append(Result, V1[I]);
end;

function Intersection(const V1, V2: Int64Array; const IsSortedAscending: Boolean): Int64Array;
var I, J, L, LV : Integer;
begin
  SetLength(Result, 0);
  if IsSortedAscending then
    begin
      I := 0;
      J := 0;
      L := Length(V1);
      LV := Length(V2);
      while (I < L) and (J < LV) do
        begin
          while (I < L) and (V1[I] < V2[J]) do
            Inc(I);
          if I < L then
            begin
              if V1[I] = V2[J] then
                Append(Result, V1[I]);
              while (J < LV) and (V2[J] <= V1[I]) do
                Inc(J);
            end;
        end;
    end
  else
    for I := 0 to Length(V1) - 1 do
      if (PosNext(V1[I], V2) >= 0) and (PosNext(V1[I], Result) = -1) then
        Append(Result, V1[I]);
end;

function Intersection(const V1, V2: AnsiStringArray; const IsSortedAscending: Boolean): AnsiStringArray;
var I, J, L, LV : Integer;
begin
  SetLength(Result, 0);
  if IsSortedAscending then
    begin
      I := 0;
      J := 0;
      L := Length(V1);
      LV := Length(V2);
      while (I < L) and (J < LV) do
        begin
          while (I < L) and (V1[I] < V2[J]) do
            Inc(I);
          if I < L then
            begin
              if V1[I] = V2[J] then
                Append(Result, V1[I]);
              while (J < LV) and (V2[J] <= V1[I]) do
                Inc(J);
            end;
        end;
    end
  else
    for I := 0 to Length(V1) - 1 do
      if (PosNext(V1[I], V2) >= 0) and (PosNext(V1[I], Result) = -1) then
        Append(Result, V1[I]);
end;

function Intersection(const V1, V2: WideStringArray; const IsSortedAscending: Boolean): WideStringArray;
var I, J, L, LV : Integer;
begin
  SetLength(Result, 0);
  if IsSortedAscending then
    begin
      I := 0;
      J := 0;
      L := Length(V1);
      LV := Length(V2);
      while (I < L) and (J < LV) do
        begin
          while (I < L) and (V1[I] < V2[J]) do
            Inc(I);
          if I < L then
            begin
              if V1[I] = V2[J] then
                Append(Result, V1[I]);
              while (J < LV) and (V2[J] <= V1[I]) do
                Inc(J);
            end;
        end;
    end
  else
    for I := 0 to Length(V1) - 1 do
      if (PosNext(V1[I], V2) >= 0) and (PosNext(V1[I], Result) = -1) then
        Append(Result, V1[I]);
end;



{                                                                              }
{ Difference                                                                   }
{   Returns elements in V1 but not in V2.                                      }
{   If both arrays are sorted ascending then time is o(n) instead of o(n^2).   }
{                                                                              }
function Difference(const V1, V2: SingleArray; const IsSortedAscending: Boolean): SingleArray;
var I, J, L, LV : Integer;
begin
  SetLength(Result, 0);
  if IsSortedAscending then
    begin
      I := 0;
      J := 0;
      L := Length(V1);
      LV := Length(V2);
      while (I < L) and (J < LV) do
        begin
          while (I < L) and (V1[I] < V2[J]) do
            Inc(I);
          if I < L then
            begin
              if V1[I] <> V2[J] then
                Append(Result, V1[I]);
              while (J < LV) and (V2[J] <= V1[I]) do
                Inc(J);
            end;
        end;
    end
  else
    for I := 0 to Length(V1) - 1 do
      if (PosNext(V1[I], V2) = -1) and (PosNext(V1[I], Result) = -1) then
        Append(Result, V1[I]);
end;

function Difference(const V1, V2: DoubleArray; const IsSortedAscending: Boolean): DoubleArray;
var I, J, L, LV : Integer;
begin
  SetLength(Result, 0);
  if IsSortedAscending then
    begin
      I := 0;
      J := 0;
      L := Length(V1);
      LV := Length(V2);
      while (I < L) and (J < LV) do
        begin
          while (I < L) and (V1[I] < V2[J]) do
            Inc(I);
          if I < L then
            begin
              if V1[I] <> V2[J] then
                Append(Result, V1[I]);
              while (J < LV) and (V2[J] <= V1[I]) do
                Inc(J);
            end;
        end;
    end
  else
    for I := 0 to Length(V1) - 1 do
      if (PosNext(V1[I], V2) = -1) and (PosNext(V1[I], Result) = -1) then
        Append(Result, V1[I]);
end;

function Difference(const V1, V2: ExtendedArray; const IsSortedAscending: Boolean): ExtendedArray;
var I, J, L, LV : Integer;
begin
  SetLength(Result, 0);
  if IsSortedAscending then
    begin
      I := 0;
      J := 0;
      L := Length(V1);
      LV := Length(V2);
      while (I < L) and (J < LV) do
        begin
          while (I < L) and (V1[I] < V2[J]) do
            Inc(I);
          if I < L then
            begin
              if V1[I] <> V2[J] then
                Append(Result, V1[I]);
              while (J < LV) and (V2[J] <= V1[I]) do
                Inc(J);
            end;
        end;
    end
  else
    for I := 0 to Length(V1) - 1 do
      if (PosNext(V1[I], V2) = -1) and (PosNext(V1[I], Result) = -1) then
        Append(Result, V1[I]);
end;

function Difference(const V1, V2: ByteArray; const IsSortedAscending: Boolean): ByteArray;
var I, J, L, LV : Integer;
begin
  SetLength(Result, 0);
  if IsSortedAscending then
    begin
      I := 0;
      J := 0;
      L := Length(V1);
      LV := Length(V2);
      while (I < L) and (J < LV) do
        begin
          while (I < L) and (V1[I] < V2[J]) do
            Inc(I);
          if I < L then
            begin
              if V1[I] <> V2[J] then
                Append(Result, V1[I]);
              while (J < LV) and (V2[J] <= V1[I]) do
                Inc(J);
            end;
        end;
    end
  else
    for I := 0 to Length(V1) - 1 do
      if (PosNext(V1[I], V2) = -1) and (PosNext(V1[I], Result) = -1) then
        Append(Result, V1[I]);
end;

function Difference(const V1, V2: WordArray; const IsSortedAscending: Boolean): WordArray;
var I, J, L, LV : Integer;
begin
  SetLength(Result, 0);
  if IsSortedAscending then
    begin
      I := 0;
      J := 0;
      L := Length(V1);
      LV := Length(V2);
      while (I < L) and (J < LV) do
        begin
          while (I < L) and (V1[I] < V2[J]) do
            Inc(I);
          if I < L then
            begin
              if V1[I] <> V2[J] then
                Append(Result, V1[I]);
              while (J < LV) and (V2[J] <= V1[I]) do
                Inc(J);
            end;
        end;
    end
  else
    for I := 0 to Length(V1) - 1 do
      if (PosNext(V1[I], V2) = -1) and (PosNext(V1[I], Result) = -1) then
        Append(Result, V1[I]);
end;

function Difference(const V1, V2: LongWordArray; const IsSortedAscending: Boolean): LongWordArray;
var I, J, L, LV : Integer;
begin
  SetLength(Result, 0);
  if IsSortedAscending then
    begin
      I := 0;
      J := 0;
      L := Length(V1);
      LV := Length(V2);
      while (I < L) and (J < LV) do
        begin
          while (I < L) and (V1[I] < V2[J]) do
            Inc(I);
          if I < L then
            begin
              if V1[I] <> V2[J] then
                Append(Result, V1[I]);
              while (J < LV) and (V2[J] <= V1[I]) do
                Inc(J);
            end;
        end;
    end
  else
    for I := 0 to Length(V1) - 1 do
      if (PosNext(V1[I], V2) = -1) and (PosNext(V1[I], Result) = -1) then
        Append(Result, V1[I]);
end;

function Difference(const V1, V2: ShortIntArray; const IsSortedAscending: Boolean): ShortIntArray;
var I, J, L, LV : Integer;
begin
  SetLength(Result, 0);
  if IsSortedAscending then
    begin
      I := 0;
      J := 0;
      L := Length(V1);
      LV := Length(V2);
      while (I < L) and (J < LV) do
        begin
          while (I < L) and (V1[I] < V2[J]) do
            Inc(I);
          if I < L then
            begin
              if V1[I] <> V2[J] then
                Append(Result, V1[I]);
              while (J < LV) and (V2[J] <= V1[I]) do
                Inc(J);
            end;
        end;
    end
  else
    for I := 0 to Length(V1) - 1 do
      if (PosNext(V1[I], V2) = -1) and (PosNext(V1[I], Result) = -1) then
        Append(Result, V1[I]);
end;

function Difference(const V1, V2: SmallIntArray; const IsSortedAscending: Boolean): SmallIntArray;
var I, J, L, LV : Integer;
begin
  SetLength(Result, 0);
  if IsSortedAscending then
    begin
      I := 0;
      J := 0;
      L := Length(V1);
      LV := Length(V2);
      while (I < L) and (J < LV) do
        begin
          while (I < L) and (V1[I] < V2[J]) do
            Inc(I);
          if I < L then
            begin
              if V1[I] <> V2[J] then
                Append(Result, V1[I]);
              while (J < LV) and (V2[J] <= V1[I]) do
                Inc(J);
            end;
        end;
    end
  else
    for I := 0 to Length(V1) - 1 do
      if (PosNext(V1[I], V2) = -1) and (PosNext(V1[I], Result) = -1) then
        Append(Result, V1[I]);
end;

function Difference(const V1, V2: LongIntArray; const IsSortedAscending: Boolean): LongIntArray;
var I, J, L, LV : Integer;
begin
  SetLength(Result, 0);
  if IsSortedAscending then
    begin
      I := 0;
      J := 0;
      L := Length(V1);
      LV := Length(V2);
      while (I < L) and (J < LV) do
        begin
          while (I < L) and (V1[I] < V2[J]) do
            Inc(I);
          if I < L then
            begin
              if V1[I] <> V2[J] then
                Append(Result, V1[I]);
              while (J < LV) and (V2[J] <= V1[I]) do
                Inc(J);
            end;
        end;
    end
  else
    for I := 0 to Length(V1) - 1 do
      if (PosNext(V1[I], V2) = -1) and (PosNext(V1[I], Result) = -1) then
        Append(Result, V1[I]);
end;

function Difference(const V1, V2: Int64Array; const IsSortedAscending: Boolean): Int64Array;
var I, J, L, LV : Integer;
begin
  SetLength(Result, 0);
  if IsSortedAscending then
    begin
      I := 0;
      J := 0;
      L := Length(V1);
      LV := Length(V2);
      while (I < L) and (J < LV) do
        begin
          while (I < L) and (V1[I] < V2[J]) do
            Inc(I);
          if I < L then
            begin
              if V1[I] <> V2[J] then
                Append(Result, V1[I]);
              while (J < LV) and (V2[J] <= V1[I]) do
                Inc(J);
            end;
        end;
    end
  else
    for I := 0 to Length(V1) - 1 do
      if (PosNext(V1[I], V2) = -1) and (PosNext(V1[I], Result) = -1) then
        Append(Result, V1[I]);
end;

function Difference(const V1, V2: AnsiStringArray; const IsSortedAscending: Boolean): AnsiStringArray;
var I, J, L, LV : Integer;
begin
  SetLength(Result, 0);
  if IsSortedAscending then
    begin
      I := 0;
      J := 0;
      L := Length(V1);
      LV := Length(V2);
      while (I < L) and (J < LV) do
        begin
          while (I < L) and (V1[I] < V2[J]) do
            Inc(I);
          if I < L then
            begin
              if V1[I] <> V2[J] then
                Append(Result, V1[I]);
              while (J < LV) and (V2[J] <= V1[I]) do
                Inc(J);
            end;
        end;
    end
  else
    for I := 0 to Length(V1) - 1 do
      if (PosNext(V1[I], V2) = -1) and (PosNext(V1[I], Result) = -1) then
        Append(Result, V1[I]);
end;

function Difference(const V1, V2: WideStringArray; const IsSortedAscending: Boolean): WideStringArray;
var I, J, L, LV : Integer;
begin
  SetLength(Result, 0);
  if IsSortedAscending then
    begin
      I := 0;
      J := 0;
      L := Length(V1);
      LV := Length(V2);
      while (I < L) and (J < LV) do
        begin
          while (I < L) and (V1[I] < V2[J]) do
            Inc(I);
          if I < L then
            begin
              if V1[I] <> V2[J] then
                Append(Result, V1[I]);
              while (J < LV) and (V2[J] <= V1[I]) do
                Inc(J);
            end;
        end;
    end
  else
    for I := 0 to Length(V1) - 1 do
      if (PosNext(V1[I], V2) = -1) and (PosNext(V1[I], Result) = -1) then
        Append(Result, V1[I]);
end;



{                                                                              }
{ Reverse                                                                      }
{                                                                              }
procedure Reverse(var V: ByteArray);
var I, L : Integer;
begin
  L := Length(V);
  for I := 1 to L div 2 do
    Swap(V[I - 1], V[L - I]);
end;

procedure Reverse(var V: WordArray);
var I, L : Integer;
begin
  L := Length(V);
  for I := 1 to L div 2 do
    Swap(V[I - 1], V[L - I]);
end;

procedure Reverse(var V: LongWordArray);
var I, L : Integer;
begin
  L := Length(V);
  for I := 1 to L div 2 do
    Swap(V[I - 1], V[L - I]);
end;

procedure Reverse(var V: ShortIntArray);
var I, L : Integer;
begin
  L := Length(V);
  for I := 1 to L div 2 do
    Swap(V[I - 1], V[L - I]);
end;

procedure Reverse(var V: SmallIntArray);
var I, L : Integer;
begin
  L := Length(V);
  for I := 1 to L div 2 do
    Swap(V[I - 1], V[L - I]);
end;

procedure Reverse(var V: LongIntArray);
var I, L : Integer;
begin
  L := Length(V);
  for I := 1 to L div 2 do
    Swap(V[I - 1], V[L - I]);
end;

procedure Reverse(var V: Int64Array);
var I, L : Integer;
begin
  L := Length(V);
  for I := 1 to L div 2 do
    Swap(V[I - 1], V[L - I]);
end;

procedure Reverse(var V: AnsiStringArray);
var I, L : Integer;
begin
  L := Length(V);
  for I := 1 to L div 2 do
    Swap(V[I - 1], V[L - I]);
end;

procedure Reverse(var V: WideStringArray);
var I, L : Integer;
begin
  L := Length(V);
  for I := 1 to L div 2 do
    Swap(V[I - 1], V[L - I]);
end;

{$IFNDEF ManagedCode}
procedure Reverse(var V: PointerArray);
var I, L : Integer;
begin
  L := Length(V);
  for I := 1 to L div 2 do
    Swap(V[I - 1], V[L - I]);
end;

{$ENDIF}
procedure Reverse(var V: ObjectArray);
var I, L : Integer;
begin
  L := Length(V);
  for I := 1 to L div 2 do
    Swap(V[I - 1], V[L - I]);
end;

procedure Reverse(var V: SingleArray);
var I, L : Integer;
begin
  L := Length(V);
  for I := 1 to L div 2 do
    Swap(V[I - 1], V[L - I]);
end;

procedure Reverse(var V: DoubleArray);
var I, L : Integer;
begin
  L := Length(V);
  for I := 1 to L div 2 do
    Swap(V[I - 1], V[L - I]);
end;

procedure Reverse(var V: ExtendedArray);
var I, L : Integer;
begin
  L := Length(V);
  for I := 1 to L div 2 do
    Swap(V[I - 1], V[L - I]);
end;



{                                                                              }
{ Returns an open array (V) as a dynamic array.                                }
{                                                                              }
function AsBooleanArray(const V: array of Boolean): BooleanArray;
var I : Integer;
begin
  SetLength(Result, High(V) + 1);
  for I := 0 to High(V) do
    Result[I] := V[I];
end;

function AsByteArray(const V: array of Byte): ByteArray;
var I : Integer;
begin
  SetLength(Result, High(V) + 1);
  for I := 0 to High(V) do
    Result[I] := V[I];
end;

function AsWordArray(const V: array of Word): WordArray;
var I : Integer;
begin
  SetLength(Result, High(V) + 1);
  for I := 0 to High(V) do
    Result[I] := V[I];
end;

function AsLongWordArray(const V: array of LongWord): LongWordArray;
var I : Integer;
begin
  SetLength(Result, High(V) + 1);
  for I := 0 to High(V) do
    Result[I] := V[I];
end;

function AsCardinalArray(const V: array of Cardinal): CardinalArray;
var I : Integer;
begin
  SetLength(Result, High(V) + 1);
  for I := 0 to High(V) do
    Result[I] := V[I];
end;

function AsShortIntArray(const V: array of ShortInt): ShortIntArray;
var I : Integer;
begin
  SetLength(Result, High(V) + 1);
  for I := 0 to High(V) do
    Result[I] := V[I];
end;

function AsSmallIntArray(const V: array of SmallInt): SmallIntArray;
var I : Integer;
begin
  SetLength(Result, High(V) + 1);
  for I := 0 to High(V) do
    Result[I] := V[I];
end;

function AsLongIntArray(const V: array of LongInt): LongIntArray;
var I : Integer;
begin
  SetLength(Result, High(V) + 1);
  for I := 0 to High(V) do
    Result[I] := V[I];
end;

function AsIntegerArray(const V: array of Integer): IntegerArray;
var I : Integer;
begin
  SetLength(Result, High(V) + 1);
  for I := 0 to High(V) do
    Result[I] := V[I];
end;

function AsInt64Array(const V: array of Int64): Int64Array;
var I : Integer;
begin
  SetLength(Result, High(V) + 1);
  for I := 0 to High(V) do
    Result[I] := V[I];
end;

function AsSingleArray(const V: array of Single): SingleArray;
var I : Integer;
begin
  SetLength(Result, High(V) + 1);
  for I := 0 to High(V) do
    Result[I] := V[I];
end;

function AsDoubleArray(const V: array of Double): DoubleArray;
var I : Integer;
begin
  SetLength(Result, High(V) + 1);
  for I := 0 to High(V) do
    Result[I] := V[I];
end;

function AsExtendedArray(const V: array of Extended): ExtendedArray;
var I : Integer;
begin
  SetLength(Result, High(V) + 1);
  for I := 0 to High(V) do
    Result[I] := V[I];
end;

function AsCurrencyArray(const V: array of Currency): CurrencyArray;
var I : Integer;
begin
  SetLength(Result, High(V) + 1);
  for I := 0 to High(V) do
    Result[I] := V[I];
end;

function AsAnsiStringArray(const V: array of AnsiString): AnsiStringArray;
var I : Integer;
begin
  SetLength(Result, High(V) + 1);
  for I := 0 to High(V) do
    Result[I] := V[I];
end;

function AsWideStringArray(const V: array of WideString): WideStringArray;
var I : Integer;
begin
  SetLength(Result, High(V) + 1);
  for I := 0 to High(V) do
    Result[I] := V[I];
end;

function AsStringArray(const V: array of String): StringArray;
var I : Integer;
begin
  SetLength(Result, High(V) + 1);
  for I := 0 to High(V) do
    Result[I] := V[I];
end;

{$IFNDEF ManagedCode}
function AsPointerArray(const V: array of Pointer): PointerArray;
var I : Integer;
begin
  SetLength(Result, High(V) + 1);
  for I := 0 to High(V) do
    Result[I] := V[I];
end;

{$ENDIF}
function AsCharSetArray(const V: array of CharSet): CharSetArray;
var I : Integer;
begin
  SetLength(Result, High(V) + 1);
  for I := 0 to High(V) do
    Result[I] := V[I];
end;

function AsObjectArray(const V: array of TObject): ObjectArray;
var I : Integer;
begin
  SetLength(Result, High(V) + 1);
  for I := 0 to High(V) do
    Result[I] := V[I];
end;

function AsInterfaceArray(const V: array of IInterface): InterfaceArray;
var I : Integer;
begin
  SetLength(Result, High(V) + 1);
  for I := 0 to High(V) do
    Result[I] := V[I];
end;



function RangeByte(const First: Byte; const Count: Integer; const Increment: Byte): ByteArray;
var I : Integer;
    J : Byte;
begin
  SetLength(Result, Count);
  J := First;
  for I := 0 to Count - 1 do
    begin
      Result[I] := J;
      J := J + Increment;
    end;
end;

function RangeWord(const First: Word; const Count: Integer; const Increment: Word): WordArray;
var I : Integer;
    J : Word;
begin
  SetLength(Result, Count);
  J := First;
  for I := 0 to Count - 1 do
    begin
      Result[I] := J;
      J := J + Increment;
    end;
end;

function RangeLongWord(const First: LongWord; const Count: Integer; const Increment: LongWord): LongWordArray;
var I : Integer;
    J : LongWord;
begin
  SetLength(Result, Count);
  J := First;
  for I := 0 to Count - 1 do
    begin
      Result[I] := J;
      J := J + Increment;
    end;
end;

function RangeCardinal(const First: Cardinal; const Count: Integer; const Increment: Cardinal): CardinalArray;
var I : Integer;
    J : Cardinal;
begin
  SetLength(Result, Count);
  J := First;
  for I := 0 to Count - 1 do
    begin
      Result[I] := J;
      J := J + Increment;
    end;
end;

function RangeShortInt(const First: ShortInt; const Count: Integer; const Increment: ShortInt): ShortIntArray;
var I : Integer;
    J : ShortInt;
begin
  SetLength(Result, Count);
  J := First;
  for I := 0 to Count - 1 do
    begin
      Result[I] := J;
      J := J + Increment;
    end;
end;

function RangeSmallInt(const First: SmallInt; const Count: Integer; const Increment: SmallInt): SmallIntArray;
var I : Integer;
    J : SmallInt;
begin
  SetLength(Result, Count);
  J := First;
  for I := 0 to Count - 1 do
    begin
      Result[I] := J;
      J := J + Increment;
    end;
end;

function RangeLongInt(const First: LongInt; const Count: Integer; const Increment: LongInt): LongIntArray;
var I : Integer;
    J : LongInt;
begin
  SetLength(Result, Count);
  J := First;
  for I := 0 to Count - 1 do
    begin
      Result[I] := J;
      J := J + Increment;
    end;
end;

function RangeInteger(const First: Integer; const Count: Integer; const Increment: Integer): IntegerArray;
var I : Integer;
    J : Integer;
begin
  SetLength(Result, Count);
  J := First;
  for I := 0 to Count - 1 do
    begin
      Result[I] := J;
      J := J + Increment;
    end;
end;

function RangeInt64(const First: Int64; const Count: Integer; const Increment: Int64): Int64Array;
var I : Integer;
    J : Int64;
begin
  SetLength(Result, Count);
  J := First;
  for I := 0 to Count - 1 do
    begin
      Result[I] := J;
      J := J + Increment;
    end;
end;

function RangeSingle(const First: Single; const Count: Integer; const Increment: Single): SingleArray;
var I : Integer;
    J : Single;
begin
  SetLength(Result, Count);
  J := First;
  for I := 0 to Count - 1 do
    begin
      Result[I] := J;
      J := J + Increment;
    end;
end;

function RangeDouble(const First: Double; const Count: Integer; const Increment: Double): DoubleArray;
var I : Integer;
    J : Double;
begin
  SetLength(Result, Count);
  J := First;
  for I := 0 to Count - 1 do
    begin
      Result[I] := J;
      J := J + Increment;
    end;
end;

function RangeExtended(const First: Extended; const Count: Integer; const Increment: Extended): ExtendedArray;
var I : Integer;
    J : Extended;
begin
  SetLength(Result, Count);
  J := First;
  for I := 0 to Count - 1 do
    begin
      Result[I] := J;
      J := J + Increment;
    end;
end;



{                                                                              }
{ Dup                                                                          }
{                                                                              }
{$IFDEF ManagedCode}
function DupByte(const V: Byte; const Count: Integer): ByteArray;
var I : Integer;
begin
  if Count <= 0 then
    begin
      SetLength(Result, 0);
      exit;
    end;
  SetLength(Result, Count);
  for I := 0 to Count - 1 do
    Result[I] := 0;
end;
{$ELSE}
function DupByte(const V: Byte; const Count: Integer): ByteArray;
begin
  if Count <= 0 then
    begin
      SetLength(Result, 0);
      exit;
    end;
  SetLength(Result, Count);
  FillChar(Result[0], Count, V);
end;
{$ENDIF}

function DupWord(const V: Word; const Count: Integer): WordArray;
var I : Integer;
begin
  if Count <= 0 then
    begin
      SetLength(Result, 0);
      exit;
    end;
  SetLength(Result, Count);
  for I := 0 to Count - 1 do
    Result[I] := V;
end;

function DupLongWord(const V: LongWord; const Count: Integer): LongWordArray;
var I : Integer;
begin
  if Count <= 0 then
    begin
      SetLength(Result, 0);
      exit;
    end;
  SetLength(Result, Count);
  for I := 0 to Count - 1 do
    Result[I] := V;
end;

function DupCardinal(const V: Cardinal; const Count: Integer): CardinalArray;
var I : Integer;
begin
  if Count <= 0 then
    begin
      SetLength(Result, 0);
      exit;
    end;
  SetLength(Result, Count);
  for I := 0 to Count - 1 do
    Result[I] := V;
end;

function DupShortInt(const V: ShortInt; const Count: Integer): ShortIntArray;
var I : Integer;
begin
  if Count <= 0 then
    begin
      SetLength(Result, 0);
      exit;
    end;
  SetLength(Result, Count);
  for I := 0 to Count - 1 do
    Result[I] := V;
end;

function DupSmallInt(const V: SmallInt; const Count: Integer): SmallIntArray;
var I : Integer;
begin
  if Count <= 0 then
    begin
      SetLength(Result, 0);
      exit;
    end;
  SetLength(Result, Count);
  for I := 0 to Count - 1 do
    Result[I] := V;
end;

function DupLongInt(const V: LongInt; const Count: Integer): LongIntArray;
var I : Integer;
begin
  if Count <= 0 then
    begin
      SetLength(Result, 0);
      exit;
    end;
  SetLength(Result, Count);
  for I := 0 to Count - 1 do
    Result[I] := V;
end;

function DupInteger(const V: Integer; const Count: Integer): IntegerArray;
var I : Integer;
begin
  if Count <= 0 then
    begin
      SetLength(Result, 0);
      exit;
    end;
  SetLength(Result, Count);
  for I := 0 to Count - 1 do
    Result[I] := V;
end;

function DupInt64(const V: Int64; const Count: Integer): Int64Array;
var I : Integer;
begin
  if Count <= 0 then
    begin
      SetLength(Result, 0);
      exit;
    end;
  SetLength(Result, Count);
  for I := 0 to Count - 1 do
    Result[I] := V;
end;

function DupSingle(const V: Single; const Count: Integer): SingleArray;
var I : Integer;
begin
  if Count <= 0 then
    begin
      SetLength(Result, 0);
      exit;
    end;
  SetLength(Result, Count);
  for I := 0 to Count - 1 do
    Result[I] := V;
end;

function DupDouble(const V: Double; const Count: Integer): DoubleArray;
var I : Integer;
begin
  if Count <= 0 then
    begin
      SetLength(Result, 0);
      exit;
    end;
  SetLength(Result, Count);
  for I := 0 to Count - 1 do
    Result[I] := V;
end;

function DupExtended(const V: Extended; const Count: Integer): ExtendedArray;
var I : Integer;
begin
  if Count <= 0 then
    begin
      SetLength(Result, 0);
      exit;
    end;
  SetLength(Result, Count);
  for I := 0 to Count - 1 do
    Result[I] := V;
end;

function DupCurrency(const V: Currency; const Count: Integer): CurrencyArray;
var I : Integer;
begin
  if Count <= 0 then
    begin
      SetLength(Result, 0);
      exit;
    end;
  SetLength(Result, Count);
  for I := 0 to Count - 1 do
    Result[I] := V;
end;

function DupAnsiString(const V: AnsiString; const Count: Integer): AnsiStringArray;
var I : Integer;
begin
  if Count <= 0 then
    begin
      SetLength(Result, 0);
      exit;
    end;
  SetLength(Result, Count);
  for I := 0 to Count - 1 do
    Result[I] := V;
end;

function DupWideString(const V: WideString; const Count: Integer): WideStringArray;
var I : Integer;
begin
  if Count <= 0 then
    begin
      SetLength(Result, 0);
      exit;
    end;
  SetLength(Result, Count);
  for I := 0 to Count - 1 do
    Result[I] := V;
end;

function DupString(const V: String; const Count: Integer): StringArray;
var I : Integer;
begin
  if Count <= 0 then
    begin
      SetLength(Result, 0);
      exit;
    end;
  SetLength(Result, Count);
  for I := 0 to Count - 1 do
    Result[I] := V;
end;

function DupCharSet(const V: CharSet; const Count: Integer): CharSetArray;
var I : Integer;
begin
  if Count <= 0 then
    begin
      SetLength(Result, 0);
      exit;
    end;
  SetLength(Result, Count);
  for I := 0 to Count - 1 do
    Result[I] := V;
end;

function DupObject(const V: TObject; const Count: Integer): ObjectArray;
var I : Integer;
begin
  if Count <= 0 then
    begin
      SetLength(Result, 0);
      exit;
    end;
  SetLength(Result, Count);
  for I := 0 to Count - 1 do
    Result[I] := V;
end;



{                                                                              }
{ SetLengthAndZero                                                             }
{                                                                              }
{$IFDEF ManagedCode}
procedure SetLengthAndZero(var V: ByteArray; const NewLength: Integer);
var OldLen, NewLen, I : Integer;
begin
  NewLen := NewLength;
  if NewLen < 0 then
    NewLen := 0;
  OldLen := Length(V);
  if OldLen = NewLen then
    exit;
  SetLength(V, NewLen);
  if OldLen > NewLen then
    exit;
  for I := 0 to NewLen - OldLen - 1 do
    V[OldLen + I] := 0;
end;
{$ELSE}
procedure SetLengthAndZero(var V: ByteArray; const NewLength: Integer);
var OldLen, NewLen : Integer;
begin
  NewLen := NewLength;
  if NewLen < 0 then
    NewLen := 0;
  OldLen := Length(V);
  if OldLen = NewLen then
    exit;
  SetLength(V, NewLen);
  if OldLen > NewLen then
    exit;
  FillChar(Pointer(@V[OldLen])^, Sizeof(Byte) * (NewLen - OldLen), #0);
end;
{$ENDIF}

{$IFDEF ManagedCode}
procedure SetLengthAndZero(var V: WordArray; const NewLength: Integer);
var OldLen, NewLen, I : Integer;
begin
  NewLen := NewLength;
  if NewLen < 0 then
    NewLen := 0;
  OldLen := Length(V);
  if OldLen = NewLen then
    exit;
  SetLength(V, NewLen);
  if OldLen > NewLen then
    exit;
  for I := 0 to NewLen - OldLen - 1 do
    V[OldLen + I] := 0;
end;
{$ELSE}
procedure SetLengthAndZero(var V: WordArray; const NewLength: Integer);
var OldLen, NewLen : Integer;
begin
  NewLen := NewLength;
  if NewLen < 0 then
    NewLen := 0;
  OldLen := Length(V);
  if OldLen = NewLen then
    exit;
  SetLength(V, NewLen);
  if OldLen > NewLen then
    exit;
  FillChar(Pointer(@V[OldLen])^, Sizeof(Word) * (NewLen - OldLen), #0);
end;
{$ENDIF}

{$IFDEF ManagedCode}
procedure SetLengthAndZero(var V: LongWordArray; const NewLength: Integer);
var OldLen, NewLen, I : Integer;
begin
  NewLen := NewLength;
  if NewLen < 0 then
    NewLen := 0;
  OldLen := Length(V);
  if OldLen = NewLen then
    exit;
  SetLength(V, NewLen);
  if OldLen > NewLen then
    exit;
  for I := 0 to NewLen - OldLen - 1 do
    V[OldLen + I] := 0;
end;
{$ELSE}
procedure SetLengthAndZero(var V: LongWordArray; const NewLength: Integer);
var OldLen, NewLen : Integer;
begin
  NewLen := NewLength;
  if NewLen < 0 then
    NewLen := 0;
  OldLen := Length(V);
  if OldLen = NewLen then
    exit;
  SetLength(V, NewLen);
  if OldLen > NewLen then
    exit;
  FillChar(Pointer(@V[OldLen])^, Sizeof(LongWord) * (NewLen - OldLen), #0);
end;
{$ENDIF}

{$IFDEF ManagedCode}
procedure SetLengthAndZero(var V: ShortIntArray; const NewLength: Integer);
var OldLen, NewLen, I : Integer;
begin
  NewLen := NewLength;
  if NewLen < 0 then
    NewLen := 0;
  OldLen := Length(V);
  if OldLen = NewLen then
    exit;
  SetLength(V, NewLen);
  if OldLen > NewLen then
    exit;
  for I := 0 to NewLen - OldLen - 1 do
    V[OldLen + I] := 0;
end;
{$ELSE}
procedure SetLengthAndZero(var V: ShortIntArray; const NewLength: Integer);
var OldLen, NewLen : Integer;
begin
  NewLen := NewLength;
  if NewLen < 0 then
    NewLen := 0;
  OldLen := Length(V);
  if OldLen = NewLen then
    exit;
  SetLength(V, NewLen);
  if OldLen > NewLen then
    exit;
  FillChar(Pointer(@V[OldLen])^, Sizeof(ShortInt) * (NewLen - OldLen), #0);
end;
{$ENDIF}

{$IFDEF ManagedCode}
procedure SetLengthAndZero(var V: SmallIntArray; const NewLength: Integer);
var OldLen, NewLen, I : Integer;
begin
  NewLen := NewLength;
  if NewLen < 0 then
    NewLen := 0;
  OldLen := Length(V);
  if OldLen = NewLen then
    exit;
  SetLength(V, NewLen);
  if OldLen > NewLen then
    exit;
  for I := 0 to NewLen - OldLen - 1 do
    V[OldLen + I] := 0;
end;
{$ELSE}
procedure SetLengthAndZero(var V: SmallIntArray; const NewLength: Integer);
var OldLen, NewLen : Integer;
begin
  NewLen := NewLength;
  if NewLen < 0 then
    NewLen := 0;
  OldLen := Length(V);
  if OldLen = NewLen then
    exit;
  SetLength(V, NewLen);
  if OldLen > NewLen then
    exit;
  FillChar(Pointer(@V[OldLen])^, Sizeof(SmallInt) * (NewLen - OldLen), #0);
end;
{$ENDIF}

{$IFDEF ManagedCode}
procedure SetLengthAndZero(var V: LongIntArray; const NewLength: Integer);
var OldLen, NewLen, I : Integer;
begin
  NewLen := NewLength;
  if NewLen < 0 then
    NewLen := 0;
  OldLen := Length(V);
  if OldLen = NewLen then
    exit;
  SetLength(V, NewLen);
  if OldLen > NewLen then
    exit;
  for I := 0 to NewLen - OldLen - 1 do
    V[OldLen + I] := 0;
end;
{$ELSE}
procedure SetLengthAndZero(var V: LongIntArray; const NewLength: Integer);
var OldLen, NewLen : Integer;
begin
  NewLen := NewLength;
  if NewLen < 0 then
    NewLen := 0;
  OldLen := Length(V);
  if OldLen = NewLen then
    exit;
  SetLength(V, NewLen);
  if OldLen > NewLen then
    exit;
  FillChar(Pointer(@V[OldLen])^, Sizeof(LongInt) * (NewLen - OldLen), #0);
end;
{$ENDIF}

{$IFDEF ManagedCode}
procedure SetLengthAndZero(var V: Int64Array; const NewLength: Integer);
var OldLen, NewLen, I : Integer;
begin
  NewLen := NewLength;
  if NewLen < 0 then
    NewLen := 0;
  OldLen := Length(V);
  if OldLen = NewLen then
    exit;
  SetLength(V, NewLen);
  if OldLen > NewLen then
    exit;
  for I := 0 to NewLen - OldLen - 1 do
    V[OldLen + I] := 0;
end;
{$ELSE}
procedure SetLengthAndZero(var V: Int64Array; const NewLength: Integer);
var OldLen, NewLen : Integer;
begin
  NewLen := NewLength;
  if NewLen < 0 then
    NewLen := 0;
  OldLen := Length(V);
  if OldLen = NewLen then
    exit;
  SetLength(V, NewLen);
  if OldLen > NewLen then
    exit;
  FillChar(Pointer(@V[OldLen])^, Sizeof(Int64) * (NewLen - OldLen), #0);
end;
{$ENDIF}

{$IFDEF ManagedCode}
procedure SetLengthAndZero(var V: SingleArray; const NewLength: Integer);
var OldLen, NewLen, I : Integer;
begin
  NewLen := NewLength;
  if NewLen < 0 then
    NewLen := 0;
  OldLen := Length(V);
  if OldLen = NewLen then
    exit;
  SetLength(V, NewLen);
  if OldLen > NewLen then
    exit;
  for I := 0 to NewLen - OldLen - 1 do
    V[OldLen + I] := 0.0;
end;
{$ELSE}
procedure SetLengthAndZero(var V: SingleArray; const NewLength: Integer);
var OldLen, NewLen : Integer;
begin
  NewLen := NewLength;
  if NewLen < 0 then
    NewLen := 0;
  OldLen := Length(V);
  if OldLen = NewLen then
    exit;
  SetLength(V, NewLen);
  if OldLen > NewLen then
    exit;
  FillChar(Pointer(@V[OldLen])^, Sizeof(Single) * (NewLen - OldLen), #0);
end;
{$ENDIF}

{$IFDEF ManagedCode}
procedure SetLengthAndZero(var V: DoubleArray; const NewLength: Integer);
var OldLen, NewLen, I : Integer;
begin
  NewLen := NewLength;
  if NewLen < 0 then
    NewLen := 0;
  OldLen := Length(V);
  if OldLen = NewLen then
    exit;
  SetLength(V, NewLen);
  if OldLen > NewLen then
    exit;
  for I := 0 to NewLen - OldLen - 1 do
    V[OldLen + I] := 0.0;
end;
{$ELSE}
procedure SetLengthAndZero(var V: DoubleArray; const NewLength: Integer);
var OldLen, NewLen : Integer;
begin
  NewLen := NewLength;
  if NewLen < 0 then
    NewLen := 0;
  OldLen := Length(V);
  if OldLen = NewLen then
    exit;
  SetLength(V, NewLen);
  if OldLen > NewLen then
    exit;
  FillChar(Pointer(@V[OldLen])^, Sizeof(Double) * (NewLen - OldLen), #0);
end;
{$ENDIF}

{$IFDEF ManagedCode}
procedure SetLengthAndZero(var V: ExtendedArray; const NewLength: Integer);
var OldLen, NewLen, I : Integer;
begin
  NewLen := NewLength;
  if NewLen < 0 then
    NewLen := 0;
  OldLen := Length(V);
  if OldLen = NewLen then
    exit;
  SetLength(V, NewLen);
  if OldLen > NewLen then
    exit;
  for I := 0 to NewLen - OldLen - 1 do
    V[OldLen + I] := 0.0;
end;
{$ELSE}
procedure SetLengthAndZero(var V: ExtendedArray; const NewLength: Integer);
var OldLen, NewLen : Integer;
begin
  NewLen := NewLength;
  if NewLen < 0 then
    NewLen := 0;
  OldLen := Length(V);
  if OldLen = NewLen then
    exit;
  SetLength(V, NewLen);
  if OldLen > NewLen then
    exit;
  FillChar(Pointer(@V[OldLen])^, Sizeof(Extended) * (NewLen - OldLen), #0);
end;
{$ENDIF}

{$IFDEF ManagedCode}
procedure SetLengthAndZero(var V: CurrencyArray; const NewLength: Integer);
var OldLen, NewLen, I : Integer;
begin
  NewLen := NewLength;
  if NewLen < 0 then
    NewLen := 0;
  OldLen := Length(V);
  if OldLen = NewLen then
    exit;
  SetLength(V, NewLen);
  if OldLen > NewLen then
    exit;
  for I := 0 to NewLen - OldLen - 1 do
    V[OldLen + I] := 0.0;
end;
{$ELSE}
procedure SetLengthAndZero(var V: CurrencyArray; const NewLength: Integer);
var OldLen, NewLen : Integer;
begin
  NewLen := NewLength;
  if NewLen < 0 then
    NewLen := 0;
  OldLen := Length(V);
  if OldLen = NewLen then
    exit;
  SetLength(V, NewLen);
  if OldLen > NewLen then
    exit;
  FillChar(Pointer(@V[OldLen])^, Sizeof(Currency) * (NewLen - OldLen), #0);
end;
{$ENDIF}

{$IFDEF ManagedCode}
procedure SetLengthAndZero(var V: CharSetArray; const NewLength: Integer);
var OldLen, NewLen, I : Integer;
begin
  NewLen := NewLength;
  if NewLen < 0 then
    NewLen := 0;
  OldLen := Length(V);
  if OldLen = NewLen then
    exit;
  SetLength(V, NewLen);
  if OldLen > NewLen then
    exit;
  for I := 0 to NewLen - OldLen - 1 do
    V[OldLen + I] := [];
end;
{$ELSE}
procedure SetLengthAndZero(var V: CharSetArray; const NewLength: Integer);
var OldLen, NewLen : Integer;
begin
  NewLen := NewLength;
  if NewLen < 0 then
    NewLen := 0;
  OldLen := Length(V);
  if OldLen = NewLen then
    exit;
  SetLength(V, NewLen);
  if OldLen > NewLen then
    exit;
  FillChar(Pointer(@V[OldLen])^, Sizeof(CharSet) * (NewLen - OldLen), #0);
end;
{$ENDIF}

{$IFDEF ManagedCode}
procedure SetLengthAndZero(var V: BooleanArray; const NewLength: Integer);
var OldLen, NewLen, I : Integer;
begin
  NewLen := NewLength;
  if NewLen < 0 then
    NewLen := 0;
  OldLen := Length(V);
  if OldLen = NewLen then
    exit;
  SetLength(V, NewLen);
  if OldLen > NewLen then
    exit;
  for I := 0 to NewLen - OldLen - 1 do
    V[OldLen + I] := False;
end;
{$ELSE}
procedure SetLengthAndZero(var V: BooleanArray; const NewLength: Integer);
var OldLen, NewLen : Integer;
begin
  NewLen := NewLength;
  if NewLen < 0 then
    NewLen := 0;
  OldLen := Length(V);
  if OldLen = NewLen then
    exit;
  SetLength(V, NewLen);
  if OldLen > NewLen then
    exit;
  FillChar(Pointer(@V[OldLen])^, Sizeof(Boolean) * (NewLen - OldLen), #0);
end;
{$ENDIF}

{$IFNDEF Managedcode}
{$IFDEF ManagedCode}
procedure SetLengthAndZero(var V: PointerArray; const NewLength: Integer);
var OldLen, NewLen, I : Integer;
begin
  NewLen := NewLength;
  if NewLen < 0 then
    NewLen := 0;
  OldLen := Length(V);
  if OldLen = NewLen then
    exit;
  SetLength(V, NewLen);
  if OldLen > NewLen then
    exit;
  for I := 0 to NewLen - OldLen - 1 do
    V[OldLen + I] := nil;
end;
{$ELSE}
procedure SetLengthAndZero(var V: PointerArray; const NewLength: Integer);
var OldLen, NewLen : Integer;
begin
  NewLen := NewLength;
  if NewLen < 0 then
    NewLen := 0;
  OldLen := Length(V);
  if OldLen = NewLen then
    exit;
  SetLength(V, NewLen);
  if OldLen > NewLen then
    exit;
  FillChar(Pointer(@V[OldLen])^, Sizeof(Pointer) * (NewLen - OldLen), #0);
end;
{$ENDIF}

{$ENDIF}
procedure SetLengthAndZero(var V: ObjectArray; const NewLength: Integer;
    const FreeObjects: Boolean);
var I, L : Integer;
begin
  L := Length(V);
  if L = NewLength then
    exit;
  if (L > NewLength) and FreeObjects then
    for I := NewLength to L - 1 do
      FreeAndNil(V[I]);
  SetLength(V, NewLength);
  if L > NewLength then
    exit;
  {$IFDEF ManagedCode}
  for I := 0 to NewLength - L - 1 do
    V[L + I] := nil;
  {$ELSE}
  FillChar(V[L], Sizeof(Pointer) * (NewLength - L), #0);
  {$ENDIF}
end;



{                                                                              }
{ IsEqual                                                                      }
{                                                                              }
{$IFDEF ManagedCode}
function IsEqual(const V1, V2: ByteArray): Boolean;
var I, L : Integer;
begin
  L := Length(V1);
  if L <> Length(V2) then
    begin
      Result := False;
      exit;
    end;
  for I := 0 to L - 1 do
    if V1[I] <> V2[I] then
      begin
        Result := False;
        exit;
      end;
  Result := True;
end;
{$ELSE}
function IsEqual(const V1, V2: ByteArray): Boolean;
var L : Integer;
begin
  L := Length(V1);
  if L <> Length(V2) then
    begin
      Result := False;
      exit;
    end;
  Result := CompareMem(Pointer(V1)^, Pointer(V2)^, Sizeof(Byte) * L);
end;
{$ENDIF}

{$IFDEF ManagedCode}
function IsEqual(const V1, V2: WordArray): Boolean;
var I, L : Integer;
begin
  L := Length(V1);
  if L <> Length(V2) then
    begin
      Result := False;
      exit;
    end;
  for I := 0 to L - 1 do
    if V1[I] <> V2[I] then
      begin
        Result := False;
        exit;
      end;
  Result := True;
end;
{$ELSE}
function IsEqual(const V1, V2: WordArray): Boolean;
var L : Integer;
begin
  L := Length(V1);
  if L <> Length(V2) then
    begin
      Result := False;
      exit;
    end;
  Result := CompareMem(Pointer(V1)^, Pointer(V2)^, Sizeof(Word) * L);
end;
{$ENDIF}

{$IFDEF ManagedCode}
function IsEqual(const V1, V2: LongWordArray): Boolean;
var I, L : Integer;
begin
  L := Length(V1);
  if L <> Length(V2) then
    begin
      Result := False;
      exit;
    end;
  for I := 0 to L - 1 do
    if V1[I] <> V2[I] then
      begin
        Result := False;
        exit;
      end;
  Result := True;
end;
{$ELSE}
function IsEqual(const V1, V2: LongWordArray): Boolean;
var L : Integer;
begin
  L := Length(V1);
  if L <> Length(V2) then
    begin
      Result := False;
      exit;
    end;
  Result := CompareMem(Pointer(V1)^, Pointer(V2)^, Sizeof(LongWord) * L);
end;
{$ENDIF}

{$IFDEF ManagedCode}
function IsEqual(const V1, V2: ShortIntArray): Boolean;
var I, L : Integer;
begin
  L := Length(V1);
  if L <> Length(V2) then
    begin
      Result := False;
      exit;
    end;
  for I := 0 to L - 1 do
    if V1[I] <> V2[I] then
      begin
        Result := False;
        exit;
      end;
  Result := True;
end;
{$ELSE}
function IsEqual(const V1, V2: ShortIntArray): Boolean;
var L : Integer;
begin
  L := Length(V1);
  if L <> Length(V2) then
    begin
      Result := False;
      exit;
    end;
  Result := CompareMem(Pointer(V1)^, Pointer(V2)^, Sizeof(ShortInt) * L);
end;
{$ENDIF}

{$IFDEF ManagedCode}
function IsEqual(const V1, V2: SmallIntArray): Boolean;
var I, L : Integer;
begin
  L := Length(V1);
  if L <> Length(V2) then
    begin
      Result := False;
      exit;
    end;
  for I := 0 to L - 1 do
    if V1[I] <> V2[I] then
      begin
        Result := False;
        exit;
      end;
  Result := True;
end;
{$ELSE}
function IsEqual(const V1, V2: SmallIntArray): Boolean;
var L : Integer;
begin
  L := Length(V1);
  if L <> Length(V2) then
    begin
      Result := False;
      exit;
    end;
  Result := CompareMem(Pointer(V1)^, Pointer(V2)^, Sizeof(SmallInt) * L);
end;
{$ENDIF}

{$IFDEF ManagedCode}
function IsEqual(const V1, V2: LongIntArray): Boolean;
var I, L : Integer;
begin
  L := Length(V1);
  if L <> Length(V2) then
    begin
      Result := False;
      exit;
    end;
  for I := 0 to L - 1 do
    if V1[I] <> V2[I] then
      begin
        Result := False;
        exit;
      end;
  Result := True;
end;
{$ELSE}
function IsEqual(const V1, V2: LongIntArray): Boolean;
var L : Integer;
begin
  L := Length(V1);
  if L <> Length(V2) then
    begin
      Result := False;
      exit;
    end;
  Result := CompareMem(Pointer(V1)^, Pointer(V2)^, Sizeof(LongInt) * L);
end;
{$ENDIF}

{$IFDEF ManagedCode}
function IsEqual(const V1, V2: Int64Array): Boolean;
var I, L : Integer;
begin
  L := Length(V1);
  if L <> Length(V2) then
    begin
      Result := False;
      exit;
    end;
  for I := 0 to L - 1 do
    if V1[I] <> V2[I] then
      begin
        Result := False;
        exit;
      end;
  Result := True;
end;
{$ELSE}
function IsEqual(const V1, V2: Int64Array): Boolean;
var L : Integer;
begin
  L := Length(V1);
  if L <> Length(V2) then
    begin
      Result := False;
      exit;
    end;
  Result := CompareMem(Pointer(V1)^, Pointer(V2)^, Sizeof(Int64) * L);
end;
{$ENDIF}

{$IFDEF ManagedCode}
function IsEqual(const V1, V2: SingleArray): Boolean;
var I, L : Integer;
begin
  L := Length(V1);
  if L <> Length(V2) then
    begin
      Result := False;
      exit;
    end;
  for I := 0 to L - 1 do
    if V1[I] <> V2[I] then
      begin
        Result := False;
        exit;
      end;
  Result := True;
end;
{$ELSE}
function IsEqual(const V1, V2: SingleArray): Boolean;
var L : Integer;
begin
  L := Length(V1);
  if L <> Length(V2) then
    begin
      Result := False;
      exit;
    end;
  Result := CompareMem(Pointer(V1)^, Pointer(V2)^, Sizeof(Single) * L);
end;
{$ENDIF}

{$IFDEF ManagedCode}
function IsEqual(const V1, V2: DoubleArray): Boolean;
var I, L : Integer;
begin
  L := Length(V1);
  if L <> Length(V2) then
    begin
      Result := False;
      exit;
    end;
  for I := 0 to L - 1 do
    if V1[I] <> V2[I] then
      begin
        Result := False;
        exit;
      end;
  Result := True;
end;
{$ELSE}
function IsEqual(const V1, V2: DoubleArray): Boolean;
var L : Integer;
begin
  L := Length(V1);
  if L <> Length(V2) then
    begin
      Result := False;
      exit;
    end;
  Result := CompareMem(Pointer(V1)^, Pointer(V2)^, Sizeof(Double) * L);
end;
{$ENDIF}

{$IFDEF ManagedCode}
function IsEqual(const V1, V2: ExtendedArray): Boolean;
var I, L : Integer;
begin
  L := Length(V1);
  if L <> Length(V2) then
    begin
      Result := False;
      exit;
    end;
  for I := 0 to L - 1 do
    if V1[I] <> V2[I] then
      begin
        Result := False;
        exit;
      end;
  Result := True;
end;
{$ELSE}
function IsEqual(const V1, V2: ExtendedArray): Boolean;
var L : Integer;
begin
  L := Length(V1);
  if L <> Length(V2) then
    begin
      Result := False;
      exit;
    end;
  Result := CompareMem(Pointer(V1)^, Pointer(V2)^, Sizeof(Extended) * L);
end;
{$ENDIF}

{$IFDEF ManagedCode}
function IsEqual(const V1, V2: CurrencyArray): Boolean;
var I, L : Integer;
begin
  L := Length(V1);
  if L <> Length(V2) then
    begin
      Result := False;
      exit;
    end;
  for I := 0 to L - 1 do
    if V1[I] <> V2[I] then
      begin
        Result := False;
        exit;
      end;
  Result := True;
end;
{$ELSE}
function IsEqual(const V1, V2: CurrencyArray): Boolean;
var L : Integer;
begin
  L := Length(V1);
  if L <> Length(V2) then
    begin
      Result := False;
      exit;
    end;
  Result := CompareMem(Pointer(V1)^, Pointer(V2)^, Sizeof(Currency) * L);
end;
{$ENDIF}

function IsEqual(const V1, V2: AnsiStringArray): Boolean;
var I, L : Integer;
begin
  L := Length(V1);
  if L <> Length(V2) then
    begin
      Result := False;
      exit;
    end;
  for I := 0 to L - 1 do
    if V1[I] <> V2[I] then
      begin
        Result := False;
        exit;
      end;
  Result := True;
end;

function IsEqual(const V1, V2: WideStringArray): Boolean;
var I, L : Integer;
begin
  L := Length(V1);
  if L <> Length(V2) then
    begin
      Result := False;
      exit;
    end;
  for I := 0 to L - 1 do
    if V1[I] <> V2[I] then
      begin
        Result := False;
        exit;
      end;
  Result := True;
end;

function IsEqual(const V1, V2: CharSetArray): Boolean;
var I, L : Integer;
begin
  L := Length(V1);
  if L <> Length(V2) then
    begin
      Result := False;
      exit;
    end;
  for I := 0 to L - 1 do
    if V1[I] <> V2[I] then
      begin
        Result := False;
        exit;
      end;
  Result := True;
end;



{                                                                              }
{ Dynamic array to Dynamic array                                               }
{                                                                              }
function ByteArrayToLongIntArray(const V: ByteArray): LongIntArray;
var I, L : Integer;
begin
  L := Length(V);
  SetLength(Result, L);
  for I := 0 to L - 1 do
    Result[I] := V[I];
end;

function WordArrayToLongIntArray(const V: WordArray): LongIntArray;
var I, L : Integer;
begin
  L := Length(V);
  SetLength(Result, L);
  for I := 0 to L - 1 do
    Result[I] := V[I];
end;

function ShortIntArrayToLongIntArray(const V: ShortIntArray): LongIntArray;
var I, L : Integer;
begin
  L := Length(V);
  SetLength(Result, L);
  for I := 0 to L - 1 do
    Result[I] := V[I];
end;

function SmallIntArrayToLongIntArray(const V: SmallIntArray): LongIntArray;
var I, L : Integer;
begin
  L := Length(V);
  SetLength(Result, L);
  for I := 0 to L - 1 do
    Result[I] := V[I];
end;

function LongIntArrayToInt64Array(const V: LongIntArray): Int64Array;
var I, L : Integer;
begin
  L := Length(V);
  SetLength(Result, L);
  for I := 0 to L - 1 do
    Result[I] := V[I];
end;

function LongIntArrayToSingleArray(const V: LongIntArray): SingleArray;
var I, L : Integer;
begin
  L := Length(V);
  SetLength(Result, L);
  for I := 0 to L - 1 do
    Result[I] := V[I];
end;

function LongIntArrayToDoubleArray(const V: LongIntArray): DoubleArray;
var I, L : Integer;
begin
  L := Length(V);
  SetLength(Result, L);
  for I := 0 to L - 1 do
    Result[I] := V[I];
end;

function LongIntArrayToExtendedArray(const V: LongIntArray): ExtendedArray;
var I, L : Integer;
begin
  L := Length(V);
  SetLength(Result, L);
  for I := 0 to L - 1 do
    Result[I] := V[I];
end;

function SingleArrayToDoubleArray(const V: SingleArray): DoubleArray;
var I, L : Integer;
begin
  L := Length(V);
  SetLength(Result, L);
  for I := 0 to L - 1 do
    Result[I] := V[I];
end;

function SingleArrayToExtendedArray(const V: SingleArray): ExtendedArray;
var I, L : Integer;
begin
  L := Length(V);
  SetLength(Result, L);
  for I := 0 to L - 1 do
    Result[I] := V[I];
end;

function SingleArrayToCurrencyArray(const V: SingleArray): CurrencyArray;
var I, L : Integer;
begin
  L := Length(V);
  SetLength(Result, L);
  for I := 0 to L - 1 do
    Result[I] := V[I];
end;

function SingleArrayToLongIntArray(const V: SingleArray): LongIntArray;
var I, L : Integer;
begin
  L := Length(V);
  SetLength(Result, L);
  for I := 0 to L - 1 do
    Result[I] := LongInt(Trunc(V[I]));
end;

function SingleArrayToInt64Array(const V: SingleArray): Int64Array;
var I, L : Integer;
begin
  L := Length(V);
  SetLength(Result, L);
  for I := 0 to L - 1 do
    Result[I] := Trunc(V[I]);
end;

function DoubleArrayToExtendedArray(const V: DoubleArray): ExtendedArray;
var I, L : Integer;
begin
  L := Length(V);
  SetLength(Result, L);
  for I := 0 to L - 1 do
    Result[I] := V[I];
end;

function DoubleArrayToCurrencyArray(const V: DoubleArray): CurrencyArray;
var I, L : Integer;
begin
  L := Length(V);
  SetLength(Result, L);
  for I := 0 to L - 1 do
    Result[I] := V[I];
end;

function DoubleArrayToLongIntArray(const V: DoubleArray): LongIntArray;
var I, L : Integer;
begin
  L := Length(V);
  SetLength(Result, L);
  for I := 0 to L - 1 do
    Result[I] := LongInt(Trunc(V[I]));
end;

function DoubleArrayToInt64Array(const V: DoubleArray): Int64Array;
var I, L : Integer;
begin
  L := Length(V);
  SetLength(Result, L);
  for I := 0 to L - 1 do
    Result[I] := Trunc(V[I]);
end;

function ExtendedArrayToCurrencyArray(const V: ExtendedArray): CurrencyArray;
var I, L : Integer;
begin
  L := Length(V);
  SetLength(Result, L);
  for I := 0 to L - 1 do
    Result[I] := V[I];
end;

function ExtendedArrayToLongIntArray(const V: ExtendedArray): LongIntArray;
var I, L : Integer;
begin
  L := Length(V);
  SetLength(Result, L);
  for I := 0 to L - 1 do
    Result[I] := LongInt(Trunc(V[I]));
end;

function ExtendedArrayToInt64Array(const V: ExtendedArray): Int64Array;
var I, L : Integer;
begin
  L := Length(V);
  SetLength(Result, L);
  for I := 0 to L - 1 do
    Result[I] := Trunc(V[I]);
end;



{                                                                              }
{ Array from indexes                                                           }
{                                                                              }
function ByteArrayFromIndexes(const V: ByteArray; const Indexes: IntegerArray): ByteArray;
var I, L : Integer;
begin
  L := Length(Indexes);
  SetLength(Result, L);
  for I := 0 to L - 1 do
    Result[I] := V[Indexes[I]];
end;

function WordArrayFromIndexes(const V: WordArray; const Indexes: IntegerArray): WordArray;
var I, L : Integer;
begin
  L := Length(Indexes);
  SetLength(Result, L);
  for I := 0 to L - 1 do
    Result[I] := V[Indexes[I]];
end;

function LongWordArrayFromIndexes(const V: LongWordArray; const Indexes: IntegerArray): LongWordArray;
var I, L : Integer;
begin
  L := Length(Indexes);
  SetLength(Result, L);
  for I := 0 to L - 1 do
    Result[I] := V[Indexes[I]];
end;

function CardinalArrayFromIndexes(const V: CardinalArray; const Indexes: IntegerArray): CardinalArray;
var I, L : Integer;
begin
  L := Length(Indexes);
  SetLength(Result, L);
  for I := 0 to L - 1 do
    Result[I] := V[Indexes[I]];
end;

function ShortIntArrayFromIndexes(const V: ShortIntArray; const Indexes: IntegerArray): ShortIntArray;
var I, L : Integer;
begin
  L := Length(Indexes);
  SetLength(Result, L);
  for I := 0 to L - 1 do
    Result[I] := V[Indexes[I]];
end;

function SmallIntArrayFromIndexes(const V: SmallIntArray; const Indexes: IntegerArray): SmallIntArray;
var I, L : Integer;
begin
  L := Length(Indexes);
  SetLength(Result, L);
  for I := 0 to L - 1 do
    Result[I] := V[Indexes[I]];
end;

function LongIntArrayFromIndexes(const V: LongIntArray; const Indexes: IntegerArray): LongIntArray;
var I, L : Integer;
begin
  L := Length(Indexes);
  SetLength(Result, L);
  for I := 0 to L - 1 do
    Result[I] := V[Indexes[I]];
end;

function IntegerArrayFromIndexes(const V: IntegerArray; const Indexes: IntegerArray): IntegerArray;
var I, L : Integer;
begin
  L := Length(Indexes);
  SetLength(Result, L);
  for I := 0 to L - 1 do
    Result[I] := V[Indexes[I]];
end;

function Int64ArrayFromIndexes(const V: Int64Array; const Indexes: IntegerArray): Int64Array;
var I, L : Integer;
begin
  L := Length(Indexes);
  SetLength(Result, L);
  for I := 0 to L - 1 do
    Result[I] := V[Indexes[I]];
end;

function SingleArrayFromIndexes(const V: SingleArray; const Indexes: IntegerArray): SingleArray;
var I, L : Integer;
begin
  L := Length(Indexes);
  SetLength(Result, L);
  for I := 0 to L - 1 do
    Result[I] := V[Indexes[I]];
end;

function DoubleArrayFromIndexes(const V: DoubleArray; const Indexes: IntegerArray): DoubleArray;
var I, L : Integer;
begin
  L := Length(Indexes);
  SetLength(Result, L);
  for I := 0 to L - 1 do
    Result[I] := V[Indexes[I]];
end;

function ExtendedArrayFromIndexes(const V: ExtendedArray; const Indexes: IntegerArray): ExtendedArray;
var I, L : Integer;
begin
  L := Length(Indexes);
  SetLength(Result, L);
  for I := 0 to L - 1 do
    Result[I] := V[Indexes[I]];
end;

function StringArrayFromIndexes(const V: StringArray; const Indexes: IntegerArray): StringArray;
var I, L : Integer;
begin
  L := Length(Indexes);
  SetLength(Result, L);
  for I := 0 to L - 1 do
    Result[I] := V[Indexes[I]];
end;



{                                                                              }
{ Dynamic array sort                                                           }
{                                                                              }
{$IFDEF ManagedCode}
procedure Sort(const V: ByteArray);

  procedure QuickSort(L, R: Integer);
  var I, J, M : Integer;
      W, T    : Byte;
  begin
    repeat
      I := L;
      J := R;
      M := (L + R) shr 1;
      W := V[M];
      repeat
        while V[I] < W do
          Inc(I);
        while V[J] > W do
          Dec(J);
        if I <= J then
          begin
            T := V[I];
            V[I] := V[J];
            V[J] := T;
            if M = I then
              begin
                M := J;
                W := V[J];
              end else
              if M = J then
                begin
                  M := I;
                  W := V[I];
                end;
            Inc(I);
            Dec(J);
          end;
      until I > J;
      if L < J then
        QuickSort(L, J);
      L := I;
    until I >= R;
  end;

var I : Integer;
begin
  I := Length(V);
  if I > 0 then
    QuickSort(0, I - 1);
end;
{$ELSE}
procedure Sort(const V: ByteArray);

  procedure QuickSort(L, R: Integer);
  var I, J, M : Integer;
      W, T    : Byte;
      P, Q    : PByte;
  begin
    repeat
      I := L;
      P := @V[I];
      J := R;
      Q := @V[J];
      M := (L + R) shr 1;
      W := V[M];
      repeat
        while P^ < W do
          begin
            Inc(P);
            Inc(I);
          end;
        while Q^ > W do
          begin
            Dec(Q);
            Dec(J);
          end;
        if I <= J then
          begin
            T := P^;
            P^ := Q^;
            Q^ := T;
            if M = I then
              begin
                M := J;
                W := Q^;
              end else
              if M = J then
                begin
                  M := I;
                  W := P^;
                end;
            Inc(P);
            Inc(I);
            Dec(Q);
            Dec(J);
          end;
      until I > J;
      if L < J then
        QuickSort(L, J);
      L := I;
    until I >= R;
  end;

var I : Integer;
begin
  I := Length(V);
  if I > 0 then
    QuickSort(0, I - 1);
end;
{$ENDIF}

{$IFDEF ManagedCode}
procedure Sort(const V: WordArray);

  procedure QuickSort(L, R: Integer);
  var I, J, M : Integer;
      W, T    : Word;
  begin
    repeat
      I := L;
      J := R;
      M := (L + R) shr 1;
      W := V[M];
      repeat
        while V[I] < W do
          Inc(I);
        while V[J] > W do
          Dec(J);
        if I <= J then
          begin
            T := V[I];
            V[I] := V[J];
            V[J] := T;
            if M = I then
              begin
                M := J;
                W := V[J];
              end else
              if M = J then
                begin
                  M := I;
                  W := V[I];
                end;
            Inc(I);
            Dec(J);
          end;
      until I > J;
      if L < J then
        QuickSort(L, J);
      L := I;
    until I >= R;
  end;

var I : Integer;
begin
  I := Length(V);
  if I > 0 then
    QuickSort(0, I - 1);
end;
{$ELSE}
procedure Sort(const V: WordArray);

  procedure QuickSort(L, R: Integer);
  var I, J, M : Integer;
      W, T    : Word;
      P, Q    : PWord;
  begin
    repeat
      I := L;
      P := @V[I];
      J := R;
      Q := @V[J];
      M := (L + R) shr 1;
      W := V[M];
      repeat
        while P^ < W do
          begin
            Inc(P);
            Inc(I);
          end;
        while Q^ > W do
          begin
            Dec(Q);
            Dec(J);
          end;
        if I <= J then
          begin
            T := P^;
            P^ := Q^;
            Q^ := T;
            if M = I then
              begin
                M := J;
                W := Q^;
              end else
              if M = J then
                begin
                  M := I;
                  W := P^;
                end;
            Inc(P);
            Inc(I);
            Dec(Q);
            Dec(J);
          end;
      until I > J;
      if L < J then
        QuickSort(L, J);
      L := I;
    until I >= R;
  end;

var I : Integer;
begin
  I := Length(V);
  if I > 0 then
    QuickSort(0, I - 1);
end;
{$ENDIF}

{$IFDEF ManagedCode}
procedure Sort(const V: LongWordArray);

  procedure QuickSort(L, R: Integer);
  var I, J, M : Integer;
      W, T    : LongWord;
  begin
    repeat
      I := L;
      J := R;
      M := (L + R) shr 1;
      W := V[M];
      repeat
        while V[I] < W do
          Inc(I);
        while V[J] > W do
          Dec(J);
        if I <= J then
          begin
            T := V[I];
            V[I] := V[J];
            V[J] := T;
            if M = I then
              begin
                M := J;
                W := V[J];
              end else
              if M = J then
                begin
                  M := I;
                  W := V[I];
                end;
            Inc(I);
            Dec(J);
          end;
      until I > J;
      if L < J then
        QuickSort(L, J);
      L := I;
    until I >= R;
  end;

var I : Integer;
begin
  I := Length(V);
  if I > 0 then
    QuickSort(0, I - 1);
end;
{$ELSE}
procedure Sort(const V: LongWordArray);

  procedure QuickSort(L, R: Integer);
  var I, J, M : Integer;
      W, T    : LongWord;
      P, Q    : PLongWord;
  begin
    repeat
      I := L;
      P := @V[I];
      J := R;
      Q := @V[J];
      M := (L + R) shr 1;
      W := V[M];
      repeat
        while P^ < W do
          begin
            Inc(P);
            Inc(I);
          end;
        while Q^ > W do
          begin
            Dec(Q);
            Dec(J);
          end;
        if I <= J then
          begin
            T := P^;
            P^ := Q^;
            Q^ := T;
            if M = I then
              begin
                M := J;
                W := Q^;
              end else
              if M = J then
                begin
                  M := I;
                  W := P^;
                end;
            Inc(P);
            Inc(I);
            Dec(Q);
            Dec(J);
          end;
      until I > J;
      if L < J then
        QuickSort(L, J);
      L := I;
    until I >= R;
  end;

var I : Integer;
begin
  I := Length(V);
  if I > 0 then
    QuickSort(0, I - 1);
end;
{$ENDIF}

{$IFDEF ManagedCode}
procedure Sort(const V: ShortIntArray);

  procedure QuickSort(L, R: Integer);
  var I, J, M : Integer;
      W, T    : ShortInt;
  begin
    repeat
      I := L;
      J := R;
      M := (L + R) shr 1;
      W := V[M];
      repeat
        while V[I] < W do
          Inc(I);
        while V[J] > W do
          Dec(J);
        if I <= J then
          begin
            T := V[I];
            V[I] := V[J];
            V[J] := T;
            if M = I then
              begin
                M := J;
                W := V[J];
              end else
              if M = J then
                begin
                  M := I;
                  W := V[I];
                end;
            Inc(I);
            Dec(J);
          end;
      until I > J;
      if L < J then
        QuickSort(L, J);
      L := I;
    until I >= R;
  end;

var I : Integer;
begin
  I := Length(V);
  if I > 0 then
    QuickSort(0, I - 1);
end;
{$ELSE}
procedure Sort(const V: ShortIntArray);

  procedure QuickSort(L, R: Integer);
  var I, J, M : Integer;
      W, T    : ShortInt;
      P, Q    : PShortInt;
  begin
    repeat
      I := L;
      P := @V[I];
      J := R;
      Q := @V[J];
      M := (L + R) shr 1;
      W := V[M];
      repeat
        while P^ < W do
          begin
            Inc(P);
            Inc(I);
          end;
        while Q^ > W do
          begin
            Dec(Q);
            Dec(J);
          end;
        if I <= J then
          begin
            T := P^;
            P^ := Q^;
            Q^ := T;
            if M = I then
              begin
                M := J;
                W := Q^;
              end else
              if M = J then
                begin
                  M := I;
                  W := P^;
                end;
            Inc(P);
            Inc(I);
            Dec(Q);
            Dec(J);
          end;
      until I > J;
      if L < J then
        QuickSort(L, J);
      L := I;
    until I >= R;
  end;

var I : Integer;
begin
  I := Length(V);
  if I > 0 then
    QuickSort(0, I - 1);
end;
{$ENDIF}

{$IFDEF ManagedCode}
procedure Sort(const V: SmallIntArray);

  procedure QuickSort(L, R: Integer);
  var I, J, M : Integer;
      W, T    : SmallInt;
  begin
    repeat
      I := L;
      J := R;
      M := (L + R) shr 1;
      W := V[M];
      repeat
        while V[I] < W do
          Inc(I);
        while V[J] > W do
          Dec(J);
        if I <= J then
          begin
            T := V[I];
            V[I] := V[J];
            V[J] := T;
            if M = I then
              begin
                M := J;
                W := V[J];
              end else
              if M = J then
                begin
                  M := I;
                  W := V[I];
                end;
            Inc(I);
            Dec(J);
          end;
      until I > J;
      if L < J then
        QuickSort(L, J);
      L := I;
    until I >= R;
  end;

var I : Integer;
begin
  I := Length(V);
  if I > 0 then
    QuickSort(0, I - 1);
end;
{$ELSE}
procedure Sort(const V: SmallIntArray);

  procedure QuickSort(L, R: Integer);
  var I, J, M : Integer;
      W, T    : SmallInt;
      P, Q    : PSmallInt;
  begin
    repeat
      I := L;
      P := @V[I];
      J := R;
      Q := @V[J];
      M := (L + R) shr 1;
      W := V[M];
      repeat
        while P^ < W do
          begin
            Inc(P);
            Inc(I);
          end;
        while Q^ > W do
          begin
            Dec(Q);
            Dec(J);
          end;
        if I <= J then
          begin
            T := P^;
            P^ := Q^;
            Q^ := T;
            if M = I then
              begin
                M := J;
                W := Q^;
              end else
              if M = J then
                begin
                  M := I;
                  W := P^;
                end;
            Inc(P);
            Inc(I);
            Dec(Q);
            Dec(J);
          end;
      until I > J;
      if L < J then
        QuickSort(L, J);
      L := I;
    until I >= R;
  end;

var I : Integer;
begin
  I := Length(V);
  if I > 0 then
    QuickSort(0, I - 1);
end;
{$ENDIF}

{$IFDEF ManagedCode}
procedure Sort(const V: LongIntArray);

  procedure QuickSort(L, R: Integer);
  var I, J, M : Integer;
      W, T    : LongInt;
  begin
    repeat
      I := L;
      J := R;
      M := (L + R) shr 1;
      W := V[M];
      repeat
        while V[I] < W do
          Inc(I);
        while V[J] > W do
          Dec(J);
        if I <= J then
          begin
            T := V[I];
            V[I] := V[J];
            V[J] := T;
            if M = I then
              begin
                M := J;
                W := V[J];
              end else
              if M = J then
                begin
                  M := I;
                  W := V[I];
                end;
            Inc(I);
            Dec(J);
          end;
      until I > J;
      if L < J then
        QuickSort(L, J);
      L := I;
    until I >= R;
  end;

var I : Integer;
begin
  I := Length(V);
  if I > 0 then
    QuickSort(0, I - 1);
end;
{$ELSE}
procedure Sort(const V: LongIntArray);

  procedure QuickSort(L, R: Integer);
  var I, J, M : Integer;
      W, T    : LongInt;
      P, Q    : PLongInt;
  begin
    repeat
      I := L;
      P := @V[I];
      J := R;
      Q := @V[J];
      M := (L + R) shr 1;
      W := V[M];
      repeat
        while P^ < W do
          begin
            Inc(P);
            Inc(I);
          end;
        while Q^ > W do
          begin
            Dec(Q);
            Dec(J);
          end;
        if I <= J then
          begin
            T := P^;
            P^ := Q^;
            Q^ := T;
            if M = I then
              begin
                M := J;
                W := Q^;
              end else
              if M = J then
                begin
                  M := I;
                  W := P^;
                end;
            Inc(P);
            Inc(I);
            Dec(Q);
            Dec(J);
          end;
      until I > J;
      if L < J then
        QuickSort(L, J);
      L := I;
    until I >= R;
  end;

var I : Integer;
begin
  I := Length(V);
  if I > 0 then
    QuickSort(0, I - 1);
end;
{$ENDIF}

{$IFDEF ManagedCode}
procedure Sort(const V: Int64Array);

  procedure QuickSort(L, R: Integer);
  var I, J, M : Integer;
      W, T    : Int64;
  begin
    repeat
      I := L;
      J := R;
      M := (L + R) shr 1;
      W := V[M];
      repeat
        while V[I] < W do
          Inc(I);
        while V[J] > W do
          Dec(J);
        if I <= J then
          begin
            T := V[I];
            V[I] := V[J];
            V[J] := T;
            if M = I then
              begin
                M := J;
                W := V[J];
              end else
              if M = J then
                begin
                  M := I;
                  W := V[I];
                end;
            Inc(I);
            Dec(J);
          end;
      until I > J;
      if L < J then
        QuickSort(L, J);
      L := I;
    until I >= R;
  end;

var I : Integer;
begin
  I := Length(V);
  if I > 0 then
    QuickSort(0, I - 1);
end;
{$ELSE}
procedure Sort(const V: Int64Array);

  procedure QuickSort(L, R: Integer);
  var I, J, M : Integer;
      W, T    : Int64;
      P, Q    : PInt64;
  begin
    repeat
      I := L;
      P := @V[I];
      J := R;
      Q := @V[J];
      M := (L + R) shr 1;
      W := V[M];
      repeat
        while P^ < W do
          begin
            Inc(P);
            Inc(I);
          end;
        while Q^ > W do
          begin
            Dec(Q);
            Dec(J);
          end;
        if I <= J then
          begin
            T := P^;
            P^ := Q^;
            Q^ := T;
            if M = I then
              begin
                M := J;
                W := Q^;
              end else
              if M = J then
                begin
                  M := I;
                  W := P^;
                end;
            Inc(P);
            Inc(I);
            Dec(Q);
            Dec(J);
          end;
      until I > J;
      if L < J then
        QuickSort(L, J);
      L := I;
    until I >= R;
  end;

var I : Integer;
begin
  I := Length(V);
  if I > 0 then
    QuickSort(0, I - 1);
end;
{$ENDIF}

{$IFDEF ManagedCode}
procedure Sort(const V: SingleArray);

  procedure QuickSort(L, R: Integer);
  var I, J, M : Integer;
      W, T    : Single;
  begin
    repeat
      I := L;
      J := R;
      M := (L + R) shr 1;
      W := V[M];
      repeat
        while V[I] < W do
          Inc(I);
        while V[J] > W do
          Dec(J);
        if I <= J then
          begin
            T := V[I];
            V[I] := V[J];
            V[J] := T;
            if M = I then
              begin
                M := J;
                W := V[J];
              end else
              if M = J then
                begin
                  M := I;
                  W := V[I];
                end;
            Inc(I);
            Dec(J);
          end;
      until I > J;
      if L < J then
        QuickSort(L, J);
      L := I;
    until I >= R;
  end;

var I : Integer;
begin
  I := Length(V);
  if I > 0 then
    QuickSort(0, I - 1);
end;
{$ELSE}
procedure Sort(const V: SingleArray);

  procedure QuickSort(L, R: Integer);
  var I, J, M : Integer;
      W, T    : Single;
      P, Q    : PSingle;
  begin
    repeat
      I := L;
      P := @V[I];
      J := R;
      Q := @V[J];
      M := (L + R) shr 1;
      W := V[M];
      repeat
        while P^ < W do
          begin
            Inc(P);
            Inc(I);
          end;
        while Q^ > W do
          begin
            Dec(Q);
            Dec(J);
          end;
        if I <= J then
          begin
            T := P^;
            P^ := Q^;
            Q^ := T;
            if M = I then
              begin
                M := J;
                W := Q^;
              end else
              if M = J then
                begin
                  M := I;
                  W := P^;
                end;
            Inc(P);
            Inc(I);
            Dec(Q);
            Dec(J);
          end;
      until I > J;
      if L < J then
        QuickSort(L, J);
      L := I;
    until I >= R;
  end;

var I : Integer;
begin
  I := Length(V);
  if I > 0 then
    QuickSort(0, I - 1);
end;
{$ENDIF}

{$IFDEF ManagedCode}
procedure Sort(const V: DoubleArray);

  procedure QuickSort(L, R: Integer);
  var I, J, M : Integer;
      W, T    : Double;
  begin
    repeat
      I := L;
      J := R;
      M := (L + R) shr 1;
      W := V[M];
      repeat
        while V[I] < W do
          Inc(I);
        while V[J] > W do
          Dec(J);
        if I <= J then
          begin
            T := V[I];
            V[I] := V[J];
            V[J] := T;
            if M = I then
              begin
                M := J;
                W := V[J];
              end else
              if M = J then
                begin
                  M := I;
                  W := V[I];
                end;
            Inc(I);
            Dec(J);
          end;
      until I > J;
      if L < J then
        QuickSort(L, J);
      L := I;
    until I >= R;
  end;

var I : Integer;
begin
  I := Length(V);
  if I > 0 then
    QuickSort(0, I - 1);
end;
{$ELSE}
procedure Sort(const V: DoubleArray);

  procedure QuickSort(L, R: Integer);
  var I, J, M : Integer;
      W, T    : Double;
      P, Q    : PDouble;
  begin
    repeat
      I := L;
      P := @V[I];
      J := R;
      Q := @V[J];
      M := (L + R) shr 1;
      W := V[M];
      repeat
        while P^ < W do
          begin
            Inc(P);
            Inc(I);
          end;
        while Q^ > W do
          begin
            Dec(Q);
            Dec(J);
          end;
        if I <= J then
          begin
            T := P^;
            P^ := Q^;
            Q^ := T;
            if M = I then
              begin
                M := J;
                W := Q^;
              end else
              if M = J then
                begin
                  M := I;
                  W := P^;
                end;
            Inc(P);
            Inc(I);
            Dec(Q);
            Dec(J);
          end;
      until I > J;
      if L < J then
        QuickSort(L, J);
      L := I;
    until I >= R;
  end;

var I : Integer;
begin
  I := Length(V);
  if I > 0 then
    QuickSort(0, I - 1);
end;
{$ENDIF}

{$IFDEF ManagedCode}
procedure Sort(const V: ExtendedArray);

  procedure QuickSort(L, R: Integer);
  var I, J, M : Integer;
      W, T    : Extended;
  begin
    repeat
      I := L;
      J := R;
      M := (L + R) shr 1;
      W := V[M];
      repeat
        while V[I] < W do
          Inc(I);
        while V[J] > W do
          Dec(J);
        if I <= J then
          begin
            T := V[I];
            V[I] := V[J];
            V[J] := T;
            if M = I then
              begin
                M := J;
                W := V[J];
              end else
              if M = J then
                begin
                  M := I;
                  W := V[I];
                end;
            Inc(I);
            Dec(J);
          end;
      until I > J;
      if L < J then
        QuickSort(L, J);
      L := I;
    until I >= R;
  end;

var I : Integer;
begin
  I := Length(V);
  if I > 0 then
    QuickSort(0, I - 1);
end;
{$ELSE}
procedure Sort(const V: ExtendedArray);

  procedure QuickSort(L, R: Integer);
  var I, J, M : Integer;
      W, T    : Extended;
      P, Q    : PExtended;
  begin
    repeat
      I := L;
      P := @V[I];
      J := R;
      Q := @V[J];
      M := (L + R) shr 1;
      W := V[M];
      repeat
        while P^ < W do
          begin
            Inc(P);
            Inc(I);
          end;
        while Q^ > W do
          begin
            Dec(Q);
            Dec(J);
          end;
        if I <= J then
          begin
            T := P^;
            P^ := Q^;
            Q^ := T;
            if M = I then
              begin
                M := J;
                W := Q^;
              end else
              if M = J then
                begin
                  M := I;
                  W := P^;
                end;
            Inc(P);
            Inc(I);
            Dec(Q);
            Dec(J);
          end;
      until I > J;
      if L < J then
        QuickSort(L, J);
      L := I;
    until I >= R;
  end;

var I : Integer;
begin
  I := Length(V);
  if I > 0 then
    QuickSort(0, I - 1);
end;
{$ENDIF}

{$IFDEF ManagedCode}
procedure Sort(const V: AnsiStringArray);

  procedure QuickSort(L, R: Integer);
  var I, J, M : Integer;
      W, T    : AnsiString;
  begin
    repeat
      I := L;
      J := R;
      M := (L + R) shr 1;
      W := V[M];
      repeat
        while V[I] < W do
          Inc(I);
        while V[J] > W do
          Dec(J);
        if I <= J then
          begin
            T := V[I];
            V[I] := V[J];
            V[J] := T;
            if M = I then
              begin
                M := J;
                W := V[J];
              end else
              if M = J then
                begin
                  M := I;
                  W := V[I];
                end;
            Inc(I);
            Dec(J);
          end;
      until I > J;
      if L < J then
        QuickSort(L, J);
      L := I;
    until I >= R;
  end;

var I : Integer;
begin
  I := Length(V);
  if I > 0 then
    QuickSort(0, I - 1);
end;
{$ELSE}
procedure Sort(const V: AnsiStringArray);

  procedure QuickSort(L, R: Integer);
  var I, J, M : Integer;
      W, T    : AnsiString;
      P, Q    : PAnsiString;
  begin
    repeat
      I := L;
      P := @V[I];
      J := R;
      Q := @V[J];
      M := (L + R) shr 1;
      W := V[M];
      repeat
        while P^ < W do
          begin
            Inc(P);
            Inc(I);
          end;
        while Q^ > W do
          begin
            Dec(Q);
            Dec(J);
          end;
        if I <= J then
          begin
            T := P^;
            P^ := Q^;
            Q^ := T;
            if M = I then
              begin
                M := J;
                W := Q^;
              end else
              if M = J then
                begin
                  M := I;
                  W := P^;
                end;
            Inc(P);
            Inc(I);
            Dec(Q);
            Dec(J);
          end;
      until I > J;
      if L < J then
        QuickSort(L, J);
      L := I;
    until I >= R;
  end;

var I : Integer;
begin
  I := Length(V);
  if I > 0 then
    QuickSort(0, I - 1);
end;
{$ENDIF}

{$IFDEF ManagedCode}
procedure Sort(const V: WideStringArray);

  procedure QuickSort(L, R: Integer);
  var I, J, M : Integer;
      W, T    : WideString;
  begin
    repeat
      I := L;
      J := R;
      M := (L + R) shr 1;
      W := V[M];
      repeat
        while V[I] < W do
          Inc(I);
        while V[J] > W do
          Dec(J);
        if I <= J then
          begin
            T := V[I];
            V[I] := V[J];
            V[J] := T;
            if M = I then
              begin
                M := J;
                W := V[J];
              end else
              if M = J then
                begin
                  M := I;
                  W := V[I];
                end;
            Inc(I);
            Dec(J);
          end;
      until I > J;
      if L < J then
        QuickSort(L, J);
      L := I;
    until I >= R;
  end;

var I : Integer;
begin
  I := Length(V);
  if I > 0 then
    QuickSort(0, I - 1);
end;
{$ELSE}
procedure Sort(const V: WideStringArray);

  procedure QuickSort(L, R: Integer);
  var I, J, M : Integer;
      W, T    : WideString;
      P, Q    : PWideString;
  begin
    repeat
      I := L;
      P := @V[I];
      J := R;
      Q := @V[J];
      M := (L + R) shr 1;
      W := V[M];
      repeat
        while P^ < W do
          begin
            Inc(P);
            Inc(I);
          end;
        while Q^ > W do
          begin
            Dec(Q);
            Dec(J);
          end;
        if I <= J then
          begin
            T := P^;
            P^ := Q^;
            Q^ := T;
            if M = I then
              begin
                M := J;
                W := Q^;
              end else
              if M = J then
                begin
                  M := I;
                  W := P^;
                end;
            Inc(P);
            Inc(I);
            Dec(Q);
            Dec(J);
          end;
      until I > J;
      if L < J then
        QuickSort(L, J);
      L := I;
    until I >= R;
  end;

var I : Integer;
begin
  I := Length(V);
  if I > 0 then
    QuickSort(0, I - 1);
end;
{$ENDIF}



{$IFDEF ManagedCode}
procedure Sort(const Key: IntegerArray; const Data: IntegerArray);

  procedure QuickSort(L, R: Integer);
  var I, J, M : Integer;
      W, T    : Integer;
      A       : Integer;
  begin
    repeat
      I := L;
      J := R;
      M := (L + R) shr 1;
      W := Key[M];
      repeat
        while Key[I] < W do
          Inc(I);
        while Key[J] > W do
          Dec(J);
        if I <= J then
          begin
            T := Key[I];
            Key[I] := Key[J];
            Key[J] := T;
            A := Data[I];
            Data[I] := Data[J];
            Data[J] := A;
            if M = I then
              begin
                M := J;
                W := Key[J];
              end else
              if M = J then
                begin
                  M := I;
                  W := Key[I];
                end;
            Inc(I);
            Dec(J);
          end;
      until I > J;
      if L < J then
        QuickSort(L, J);
      L := I;
    until I >= R;
  end;

var I : Integer;
begin
  Assert(Length(Key) = Length(Data));
  I := Length(Key);
  if I > 0 then
    QuickSort(0, I - 1);
end;
{$ELSE}
procedure Sort(const Key: IntegerArray; const Data: IntegerArray);

  procedure QuickSort(L, R: Integer);
  var I, J, M : Integer;
      W, T    : Integer;
      P, Q    : PInteger;
      A       : Integer;
  begin
    repeat
      I := L;
      P := @Key[I];
      J := R;
      Q := @Key[J];
      M := (L + R) shr 1;
      W := Key[M];
      repeat
        while P^ < W do
          begin
            Inc(P);
            Inc(I);
          end;
        while Q^ > W do
          begin
            Dec(Q);
            Dec(J);
          end;
        if I <= J then
          begin
            T := P^;
            P^ := Q^;
            Q^ := T;
            A := Data[I];
            Data[I] := Data[J];
            Data[J] := A;
            if M = I then
              begin
                M := J;
                W := Q^;
              end else
              if M = J then
                begin
                  M := I;
                  W := P^;
                end;
            Inc(P);
            Inc(I);
            Dec(Q);
            Dec(J);
          end;
      until I > J;
      if L < J then
        QuickSort(L, J);
      L := I;
    until I >= R;
  end;

var I : Integer;
begin
  Assert(Length(Key) = Length(Data));
  I := Length(Key);
  if I > 0 then
    QuickSort(0, I - 1);
end;
{$ENDIF}

{$IFDEF ManagedCode}
procedure Sort(const Key: IntegerArray; const Data: Int64Array);

  procedure QuickSort(L, R: Integer);
  var I, J, M : Integer;
      W, T    : Integer;
      A       : Int64;
  begin
    repeat
      I := L;
      J := R;
      M := (L + R) shr 1;
      W := Key[M];
      repeat
        while Key[I] < W do
          Inc(I);
        while Key[J] > W do
          Dec(J);
        if I <= J then
          begin
            T := Key[I];
            Key[I] := Key[J];
            Key[J] := T;
            A := Data[I];
            Data[I] := Data[J];
            Data[J] := A;
            if M = I then
              begin
                M := J;
                W := Key[J];
              end else
              if M = J then
                begin
                  M := I;
                  W := Key[I];
                end;
            Inc(I);
            Dec(J);
          end;
      until I > J;
      if L < J then
        QuickSort(L, J);
      L := I;
    until I >= R;
  end;

var I : Integer;
begin
  Assert(Length(Key) = Length(Data));
  I := Length(Key);
  if I > 0 then
    QuickSort(0, I - 1);
end;
{$ELSE}
procedure Sort(const Key: IntegerArray; const Data: Int64Array);

  procedure QuickSort(L, R: Integer);
  var I, J, M : Integer;
      W, T    : Integer;
      P, Q    : PInteger;
      A       : Int64;
  begin
    repeat
      I := L;
      P := @Key[I];
      J := R;
      Q := @Key[J];
      M := (L + R) shr 1;
      W := Key[M];
      repeat
        while P^ < W do
          begin
            Inc(P);
            Inc(I);
          end;
        while Q^ > W do
          begin
            Dec(Q);
            Dec(J);
          end;
        if I <= J then
          begin
            T := P^;
            P^ := Q^;
            Q^ := T;
            A := Data[I];
            Data[I] := Data[J];
            Data[J] := A;
            if M = I then
              begin
                M := J;
                W := Q^;
              end else
              if M = J then
                begin
                  M := I;
                  W := P^;
                end;
            Inc(P);
            Inc(I);
            Dec(Q);
            Dec(J);
          end;
      until I > J;
      if L < J then
        QuickSort(L, J);
      L := I;
    until I >= R;
  end;

var I : Integer;
begin
  Assert(Length(Key) = Length(Data));
  I := Length(Key);
  if I > 0 then
    QuickSort(0, I - 1);
end;
{$ENDIF}

{$IFDEF ManagedCode}
procedure Sort(const Key: IntegerArray; const Data: AnsiStringArray);

  procedure QuickSort(L, R: Integer);
  var I, J, M : Integer;
      W, T    : Integer;
      A       : AnsiString;
  begin
    repeat
      I := L;
      J := R;
      M := (L + R) shr 1;
      W := Key[M];
      repeat
        while Key[I] < W do
          Inc(I);
        while Key[J] > W do
          Dec(J);
        if I <= J then
          begin
            T := Key[I];
            Key[I] := Key[J];
            Key[J] := T;
            A := Data[I];
            Data[I] := Data[J];
            Data[J] := A;
            if M = I then
              begin
                M := J;
                W := Key[J];
              end else
              if M = J then
                begin
                  M := I;
                  W := Key[I];
                end;
            Inc(I);
            Dec(J);
          end;
      until I > J;
      if L < J then
        QuickSort(L, J);
      L := I;
    until I >= R;
  end;

var I : Integer;
begin
  Assert(Length(Key) = Length(Data));
  I := Length(Key);
  if I > 0 then
    QuickSort(0, I - 1);
end;
{$ELSE}
procedure Sort(const Key: IntegerArray; const Data: AnsiStringArray);

  procedure QuickSort(L, R: Integer);
  var I, J, M : Integer;
      W, T    : Integer;
      P, Q    : PInteger;
      A       : AnsiString;
  begin
    repeat
      I := L;
      P := @Key[I];
      J := R;
      Q := @Key[J];
      M := (L + R) shr 1;
      W := Key[M];
      repeat
        while P^ < W do
          begin
            Inc(P);
            Inc(I);
          end;
        while Q^ > W do
          begin
            Dec(Q);
            Dec(J);
          end;
        if I <= J then
          begin
            T := P^;
            P^ := Q^;
            Q^ := T;
            A := Data[I];
            Data[I] := Data[J];
            Data[J] := A;
            if M = I then
              begin
                M := J;
                W := Q^;
              end else
              if M = J then
                begin
                  M := I;
                  W := P^;
                end;
            Inc(P);
            Inc(I);
            Dec(Q);
            Dec(J);
          end;
      until I > J;
      if L < J then
        QuickSort(L, J);
      L := I;
    until I >= R;
  end;

var I : Integer;
begin
  Assert(Length(Key) = Length(Data));
  I := Length(Key);
  if I > 0 then
    QuickSort(0, I - 1);
end;
{$ENDIF}

{$IFDEF ManagedCode}
procedure Sort(const Key: IntegerArray; const Data: ExtendedArray);

  procedure QuickSort(L, R: Integer);
  var I, J, M : Integer;
      W, T    : Integer;
      A       : Extended;
  begin
    repeat
      I := L;
      J := R;
      M := (L + R) shr 1;
      W := Key[M];
      repeat
        while Key[I] < W do
          Inc(I);
        while Key[J] > W do
          Dec(J);
        if I <= J then
          begin
            T := Key[I];
            Key[I] := Key[J];
            Key[J] := T;
            A := Data[I];
            Data[I] := Data[J];
            Data[J] := A;
            if M = I then
              begin
                M := J;
                W := Key[J];
              end else
              if M = J then
                begin
                  M := I;
                  W := Key[I];
                end;
            Inc(I);
            Dec(J);
          end;
      until I > J;
      if L < J then
        QuickSort(L, J);
      L := I;
    until I >= R;
  end;

var I : Integer;
begin
  Assert(Length(Key) = Length(Data));
  I := Length(Key);
  if I > 0 then
    QuickSort(0, I - 1);
end;
{$ELSE}
procedure Sort(const Key: IntegerArray; const Data: ExtendedArray);

  procedure QuickSort(L, R: Integer);
  var I, J, M : Integer;
      W, T    : Integer;
      P, Q    : PInteger;
      A       : Extended;
  begin
    repeat
      I := L;
      P := @Key[I];
      J := R;
      Q := @Key[J];
      M := (L + R) shr 1;
      W := Key[M];
      repeat
        while P^ < W do
          begin
            Inc(P);
            Inc(I);
          end;
        while Q^ > W do
          begin
            Dec(Q);
            Dec(J);
          end;
        if I <= J then
          begin
            T := P^;
            P^ := Q^;
            Q^ := T;
            A := Data[I];
            Data[I] := Data[J];
            Data[J] := A;
            if M = I then
              begin
                M := J;
                W := Q^;
              end else
              if M = J then
                begin
                  M := I;
                  W := P^;
                end;
            Inc(P);
            Inc(I);
            Dec(Q);
            Dec(J);
          end;
      until I > J;
      if L < J then
        QuickSort(L, J);
      L := I;
    until I >= R;
  end;

var I : Integer;
begin
  Assert(Length(Key) = Length(Data));
  I := Length(Key);
  if I > 0 then
    QuickSort(0, I - 1);
end;
{$ENDIF}

{$IFNDEF ManagedCode}
{$IFDEF ManagedCode}
procedure Sort(const Key: IntegerArray; const Data: PointerArray);

  procedure QuickSort(L, R: Integer);
  var I, J, M : Integer;
      W, T    : Integer;
      A       : Pointer;
  begin
    repeat
      I := L;
      J := R;
      M := (L + R) shr 1;
      W := Key[M];
      repeat
        while Key[I] < W do
          Inc(I);
        while Key[J] > W do
          Dec(J);
        if I <= J then
          begin
            T := Key[I];
            Key[I] := Key[J];
            Key[J] := T;
            A := Data[I];
            Data[I] := Data[J];
            Data[J] := A;
            if M = I then
              begin
                M := J;
                W := Key[J];
              end else
              if M = J then
                begin
                  M := I;
                  W := Key[I];
                end;
            Inc(I);
            Dec(J);
          end;
      until I > J;
      if L < J then
        QuickSort(L, J);
      L := I;
    until I >= R;
  end;

var I : Integer;
begin
  Assert(Length(Key) = Length(Data));
  I := Length(Key);
  if I > 0 then
    QuickSort(0, I - 1);
end;
{$ELSE}
procedure Sort(const Key: IntegerArray; const Data: PointerArray);

  procedure QuickSort(L, R: Integer);
  var I, J, M : Integer;
      W, T    : Integer;
      P, Q    : PInteger;
      A       : Pointer;
  begin
    repeat
      I := L;
      P := @Key[I];
      J := R;
      Q := @Key[J];
      M := (L + R) shr 1;
      W := Key[M];
      repeat
        while P^ < W do
          begin
            Inc(P);
            Inc(I);
          end;
        while Q^ > W do
          begin
            Dec(Q);
            Dec(J);
          end;
        if I <= J then
          begin
            T := P^;
            P^ := Q^;
            Q^ := T;
            A := Data[I];
            Data[I] := Data[J];
            Data[J] := A;
            if M = I then
              begin
                M := J;
                W := Q^;
              end else
              if M = J then
                begin
                  M := I;
                  W := P^;
                end;
            Inc(P);
            Inc(I);
            Dec(Q);
            Dec(J);
          end;
      until I > J;
      if L < J then
        QuickSort(L, J);
      L := I;
    until I >= R;
  end;

var I : Integer;
begin
  Assert(Length(Key) = Length(Data));
  I := Length(Key);
  if I > 0 then
    QuickSort(0, I - 1);
end;
{$ENDIF}

{$ENDIF}
{$IFDEF ManagedCode}
procedure Sort(const Key: AnsiStringArray; const Data: IntegerArray);

  procedure QuickSort(L, R: Integer);
  var I, J, M : Integer;
      W, T    : AnsiString;
      A       : Integer;
  begin
    repeat
      I := L;
      J := R;
      M := (L + R) shr 1;
      W := Key[M];
      repeat
        while Key[I] < W do
          Inc(I);
        while Key[J] > W do
          Dec(J);
        if I <= J then
          begin
            T := Key[I];
            Key[I] := Key[J];
            Key[J] := T;
            A := Data[I];
            Data[I] := Data[J];
            Data[J] := A;
            if M = I then
              begin
                M := J;
                W := Key[J];
              end else
              if M = J then
                begin
                  M := I;
                  W := Key[I];
                end;
            Inc(I);
            Dec(J);
          end;
      until I > J;
      if L < J then
        QuickSort(L, J);
      L := I;
    until I >= R;
  end;

var I : Integer;
begin
  Assert(Length(Key) = Length(Data));
  I := Length(Key);
  if I > 0 then
    QuickSort(0, I - 1);
end;
{$ELSE}
procedure Sort(const Key: AnsiStringArray; const Data: IntegerArray);

  procedure QuickSort(L, R: Integer);
  var I, J, M : Integer;
      W, T    : AnsiString;
      P, Q    : PAnsiString;
      A       : Integer;
  begin
    repeat
      I := L;
      P := @Key[I];
      J := R;
      Q := @Key[J];
      M := (L + R) shr 1;
      W := Key[M];
      repeat
        while P^ < W do
          begin
            Inc(P);
            Inc(I);
          end;
        while Q^ > W do
          begin
            Dec(Q);
            Dec(J);
          end;
        if I <= J then
          begin
            T := P^;
            P^ := Q^;
            Q^ := T;
            A := Data[I];
            Data[I] := Data[J];
            Data[J] := A;
            if M = I then
              begin
                M := J;
                W := Q^;
              end else
              if M = J then
                begin
                  M := I;
                  W := P^;
                end;
            Inc(P);
            Inc(I);
            Dec(Q);
            Dec(J);
          end;
      until I > J;
      if L < J then
        QuickSort(L, J);
      L := I;
    until I >= R;
  end;

var I : Integer;
begin
  Assert(Length(Key) = Length(Data));
  I := Length(Key);
  if I > 0 then
    QuickSort(0, I - 1);
end;
{$ENDIF}

{$IFDEF ManagedCode}
procedure Sort(const Key: AnsiStringArray; const Data: Int64Array);

  procedure QuickSort(L, R: Integer);
  var I, J, M : Integer;
      W, T    : AnsiString;
      A       : Int64;
  begin
    repeat
      I := L;
      J := R;
      M := (L + R) shr 1;
      W := Key[M];
      repeat
        while Key[I] < W do
          Inc(I);
        while Key[J] > W do
          Dec(J);
        if I <= J then
          begin
            T := Key[I];
            Key[I] := Key[J];
            Key[J] := T;
            A := Data[I];
            Data[I] := Data[J];
            Data[J] := A;
            if M = I then
              begin
                M := J;
                W := Key[J];
              end else
              if M = J then
                begin
                  M := I;
                  W := Key[I];
                end;
            Inc(I);
            Dec(J);
          end;
      until I > J;
      if L < J then
        QuickSort(L, J);
      L := I;
    until I >= R;
  end;

var I : Integer;
begin
  Assert(Length(Key) = Length(Data));
  I := Length(Key);
  if I > 0 then
    QuickSort(0, I - 1);
end;
{$ELSE}
procedure Sort(const Key: AnsiStringArray; const Data: Int64Array);

  procedure QuickSort(L, R: Integer);
  var I, J, M : Integer;
      W, T    : AnsiString;
      P, Q    : PAnsiString;
      A       : Int64;
  begin
    repeat
      I := L;
      P := @Key[I];
      J := R;
      Q := @Key[J];
      M := (L + R) shr 1;
      W := Key[M];
      repeat
        while P^ < W do
          begin
            Inc(P);
            Inc(I);
          end;
        while Q^ > W do
          begin
            Dec(Q);
            Dec(J);
          end;
        if I <= J then
          begin
            T := P^;
            P^ := Q^;
            Q^ := T;
            A := Data[I];
            Data[I] := Data[J];
            Data[J] := A;
            if M = I then
              begin
                M := J;
                W := Q^;
              end else
              if M = J then
                begin
                  M := I;
                  W := P^;
                end;
            Inc(P);
            Inc(I);
            Dec(Q);
            Dec(J);
          end;
      until I > J;
      if L < J then
        QuickSort(L, J);
      L := I;
    until I >= R;
  end;

var I : Integer;
begin
  Assert(Length(Key) = Length(Data));
  I := Length(Key);
  if I > 0 then
    QuickSort(0, I - 1);
end;
{$ENDIF}

{$IFDEF ManagedCode}
procedure Sort(const Key: AnsiStringArray; const Data: AnsiStringArray);

  procedure QuickSort(L, R: Integer);
  var I, J, M : Integer;
      W, T    : AnsiString;
      A       : AnsiString;
  begin
    repeat
      I := L;
      J := R;
      M := (L + R) shr 1;
      W := Key[M];
      repeat
        while Key[I] < W do
          Inc(I);
        while Key[J] > W do
          Dec(J);
        if I <= J then
          begin
            T := Key[I];
            Key[I] := Key[J];
            Key[J] := T;
            A := Data[I];
            Data[I] := Data[J];
            Data[J] := A;
            if M = I then
              begin
                M := J;
                W := Key[J];
              end else
              if M = J then
                begin
                  M := I;
                  W := Key[I];
                end;
            Inc(I);
            Dec(J);
          end;
      until I > J;
      if L < J then
        QuickSort(L, J);
      L := I;
    until I >= R;
  end;

var I : Integer;
begin
  Assert(Length(Key) = Length(Data));
  I := Length(Key);
  if I > 0 then
    QuickSort(0, I - 1);
end;
{$ELSE}
procedure Sort(const Key: AnsiStringArray; const Data: AnsiStringArray);

  procedure QuickSort(L, R: Integer);
  var I, J, M : Integer;
      W, T    : AnsiString;
      P, Q    : PAnsiString;
      A       : AnsiString;
  begin
    repeat
      I := L;
      P := @Key[I];
      J := R;
      Q := @Key[J];
      M := (L + R) shr 1;
      W := Key[M];
      repeat
        while P^ < W do
          begin
            Inc(P);
            Inc(I);
          end;
        while Q^ > W do
          begin
            Dec(Q);
            Dec(J);
          end;
        if I <= J then
          begin
            T := P^;
            P^ := Q^;
            Q^ := T;
            A := Data[I];
            Data[I] := Data[J];
            Data[J] := A;
            if M = I then
              begin
                M := J;
                W := Q^;
              end else
              if M = J then
                begin
                  M := I;
                  W := P^;
                end;
            Inc(P);
            Inc(I);
            Dec(Q);
            Dec(J);
          end;
      until I > J;
      if L < J then
        QuickSort(L, J);
      L := I;
    until I >= R;
  end;

var I : Integer;
begin
  Assert(Length(Key) = Length(Data));
  I := Length(Key);
  if I > 0 then
    QuickSort(0, I - 1);
end;
{$ENDIF}

{$IFDEF ManagedCode}
procedure Sort(const Key: AnsiStringArray; const Data: ExtendedArray);

  procedure QuickSort(L, R: Integer);
  var I, J, M : Integer;
      W, T    : AnsiString;
      A       : Extended;
  begin
    repeat
      I := L;
      J := R;
      M := (L + R) shr 1;
      W := Key[M];
      repeat
        while Key[I] < W do
          Inc(I);
        while Key[J] > W do
          Dec(J);
        if I <= J then
          begin
            T := Key[I];
            Key[I] := Key[J];
            Key[J] := T;
            A := Data[I];
            Data[I] := Data[J];
            Data[J] := A;
            if M = I then
              begin
                M := J;
                W := Key[J];
              end else
              if M = J then
                begin
                  M := I;
                  W := Key[I];
                end;
            Inc(I);
            Dec(J);
          end;
      until I > J;
      if L < J then
        QuickSort(L, J);
      L := I;
    until I >= R;
  end;

var I : Integer;
begin
  Assert(Length(Key) = Length(Data));
  I := Length(Key);
  if I > 0 then
    QuickSort(0, I - 1);
end;
{$ELSE}
procedure Sort(const Key: AnsiStringArray; const Data: ExtendedArray);

  procedure QuickSort(L, R: Integer);
  var I, J, M : Integer;
      W, T    : AnsiString;
      P, Q    : PAnsiString;
      A       : Extended;
  begin
    repeat
      I := L;
      P := @Key[I];
      J := R;
      Q := @Key[J];
      M := (L + R) shr 1;
      W := Key[M];
      repeat
        while P^ < W do
          begin
            Inc(P);
            Inc(I);
          end;
        while Q^ > W do
          begin
            Dec(Q);
            Dec(J);
          end;
        if I <= J then
          begin
            T := P^;
            P^ := Q^;
            Q^ := T;
            A := Data[I];
            Data[I] := Data[J];
            Data[J] := A;
            if M = I then
              begin
                M := J;
                W := Q^;
              end else
              if M = J then
                begin
                  M := I;
                  W := P^;
                end;
            Inc(P);
            Inc(I);
            Dec(Q);
            Dec(J);
          end;
      until I > J;
      if L < J then
        QuickSort(L, J);
      L := I;
    until I >= R;
  end;

var I : Integer;
begin
  Assert(Length(Key) = Length(Data));
  I := Length(Key);
  if I > 0 then
    QuickSort(0, I - 1);
end;
{$ENDIF}

{$IFNDEF Managedcode}
{$IFDEF ManagedCode}
procedure Sort(const Key: AnsiStringArray; const Data: PointerArray);

  procedure QuickSort(L, R: Integer);
  var I, J, M : Integer;
      W, T    : AnsiString;
      A       : Pointer;
  begin
    repeat
      I := L;
      J := R;
      M := (L + R) shr 1;
      W := Key[M];
      repeat
        while Key[I] < W do
          Inc(I);
        while Key[J] > W do
          Dec(J);
        if I <= J then
          begin
            T := Key[I];
            Key[I] := Key[J];
            Key[J] := T;
            A := Data[I];
            Data[I] := Data[J];
            Data[J] := A;
            if M = I then
              begin
                M := J;
                W := Key[J];
              end else
              if M = J then
                begin
                  M := I;
                  W := Key[I];
                end;
            Inc(I);
            Dec(J);
          end;
      until I > J;
      if L < J then
        QuickSort(L, J);
      L := I;
    until I >= R;
  end;

var I : Integer;
begin
  Assert(Length(Key) = Length(Data));
  I := Length(Key);
  if I > 0 then
    QuickSort(0, I - 1);
end;
{$ELSE}
procedure Sort(const Key: AnsiStringArray; const Data: PointerArray);

  procedure QuickSort(L, R: Integer);
  var I, J, M : Integer;
      W, T    : AnsiString;
      P, Q    : PAnsiString;
      A       : Pointer;
  begin
    repeat
      I := L;
      P := @Key[I];
      J := R;
      Q := @Key[J];
      M := (L + R) shr 1;
      W := Key[M];
      repeat
        while P^ < W do
          begin
            Inc(P);
            Inc(I);
          end;
        while Q^ > W do
          begin
            Dec(Q);
            Dec(J);
          end;
        if I <= J then
          begin
            T := P^;
            P^ := Q^;
            Q^ := T;
            A := Data[I];
            Data[I] := Data[J];
            Data[J] := A;
            if M = I then
              begin
                M := J;
                W := Q^;
              end else
              if M = J then
                begin
                  M := I;
                  W := P^;
                end;
            Inc(P);
            Inc(I);
            Dec(Q);
            Dec(J);
          end;
      until I > J;
      if L < J then
        QuickSort(L, J);
      L := I;
    until I >= R;
  end;

var I : Integer;
begin
  Assert(Length(Key) = Length(Data));
  I := Length(Key);
  if I > 0 then
    QuickSort(0, I - 1);
end;
{$ENDIF}

{$ENDIF}
{$IFDEF ManagedCode}
procedure Sort(const Key: ExtendedArray; const Data: IntegerArray);

  procedure QuickSort(L, R: Integer);
  var I, J, M : Integer;
      W, T    : Extended;
      A       : Integer;
  begin
    repeat
      I := L;
      J := R;
      M := (L + R) shr 1;
      W := Key[M];
      repeat
        while Key[I] < W do
          Inc(I);
        while Key[J] > W do
          Dec(J);
        if I <= J then
          begin
            T := Key[I];
            Key[I] := Key[J];
            Key[J] := T;
            A := Data[I];
            Data[I] := Data[J];
            Data[J] := A;
            if M = I then
              begin
                M := J;
                W := Key[J];
              end else
              if M = J then
                begin
                  M := I;
                  W := Key[I];
                end;
            Inc(I);
            Dec(J);
          end;
      until I > J;
      if L < J then
        QuickSort(L, J);
      L := I;
    until I >= R;
  end;

var I : Integer;
begin
  Assert(Length(Key) = Length(Data));
  I := Length(Key);
  if I > 0 then
    QuickSort(0, I - 1);
end;
{$ELSE}
procedure Sort(const Key: ExtendedArray; const Data: IntegerArray);

  procedure QuickSort(L, R: Integer);
  var I, J, M : Integer;
      W, T    : Extended;
      P, Q    : PExtended;
      A       : Integer;
  begin
    repeat
      I := L;
      P := @Key[I];
      J := R;
      Q := @Key[J];
      M := (L + R) shr 1;
      W := Key[M];
      repeat
        while P^ < W do
          begin
            Inc(P);
            Inc(I);
          end;
        while Q^ > W do
          begin
            Dec(Q);
            Dec(J);
          end;
        if I <= J then
          begin
            T := P^;
            P^ := Q^;
            Q^ := T;
            A := Data[I];
            Data[I] := Data[J];
            Data[J] := A;
            if M = I then
              begin
                M := J;
                W := Q^;
              end else
              if M = J then
                begin
                  M := I;
                  W := P^;
                end;
            Inc(P);
            Inc(I);
            Dec(Q);
            Dec(J);
          end;
      until I > J;
      if L < J then
        QuickSort(L, J);
      L := I;
    until I >= R;
  end;

var I : Integer;
begin
  Assert(Length(Key) = Length(Data));
  I := Length(Key);
  if I > 0 then
    QuickSort(0, I - 1);
end;
{$ENDIF}

{$IFDEF ManagedCode}
procedure Sort(const Key: ExtendedArray; const Data: Int64Array);

  procedure QuickSort(L, R: Integer);
  var I, J, M : Integer;
      W, T    : Extended;
      A       : Int64;
  begin
    repeat
      I := L;
      J := R;
      M := (L + R) shr 1;
      W := Key[M];
      repeat
        while Key[I] < W do
          Inc(I);
        while Key[J] > W do
          Dec(J);
        if I <= J then
          begin
            T := Key[I];
            Key[I] := Key[J];
            Key[J] := T;
            A := Data[I];
            Data[I] := Data[J];
            Data[J] := A;
            if M = I then
              begin
                M := J;
                W := Key[J];
              end else
              if M = J then
                begin
                  M := I;
                  W := Key[I];
                end;
            Inc(I);
            Dec(J);
          end;
      until I > J;
      if L < J then
        QuickSort(L, J);
      L := I;
    until I >= R;
  end;

var I : Integer;
begin
  Assert(Length(Key) = Length(Data));
  I := Length(Key);
  if I > 0 then
    QuickSort(0, I - 1);
end;
{$ELSE}
procedure Sort(const Key: ExtendedArray; const Data: Int64Array);

  procedure QuickSort(L, R: Integer);
  var I, J, M : Integer;
      W, T    : Extended;
      P, Q    : PExtended;
      A       : Int64;
  begin
    repeat
      I := L;
      P := @Key[I];
      J := R;
      Q := @Key[J];
      M := (L + R) shr 1;
      W := Key[M];
      repeat
        while P^ < W do
          begin
            Inc(P);
            Inc(I);
          end;
        while Q^ > W do
          begin
            Dec(Q);
            Dec(J);
          end;
        if I <= J then
          begin
            T := P^;
            P^ := Q^;
            Q^ := T;
            A := Data[I];
            Data[I] := Data[J];
            Data[J] := A;
            if M = I then
              begin
                M := J;
                W := Q^;
              end else
              if M = J then
                begin
                  M := I;
                  W := P^;
                end;
            Inc(P);
            Inc(I);
            Dec(Q);
            Dec(J);
          end;
      until I > J;
      if L < J then
        QuickSort(L, J);
      L := I;
    until I >= R;
  end;

var I : Integer;
begin
  Assert(Length(Key) = Length(Data));
  I := Length(Key);
  if I > 0 then
    QuickSort(0, I - 1);
end;
{$ENDIF}

{$IFDEF ManagedCode}
procedure Sort(const Key: ExtendedArray; const Data: AnsiStringArray);

  procedure QuickSort(L, R: Integer);
  var I, J, M : Integer;
      W, T    : Extended;
      A       : AnsiString;
  begin
    repeat
      I := L;
      J := R;
      M := (L + R) shr 1;
      W := Key[M];
      repeat
        while Key[I] < W do
          Inc(I);
        while Key[J] > W do
          Dec(J);
        if I <= J then
          begin
            T := Key[I];
            Key[I] := Key[J];
            Key[J] := T;
            A := Data[I];
            Data[I] := Data[J];
            Data[J] := A;
            if M = I then
              begin
                M := J;
                W := Key[J];
              end else
              if M = J then
                begin
                  M := I;
                  W := Key[I];
                end;
            Inc(I);
            Dec(J);
          end;
      until I > J;
      if L < J then
        QuickSort(L, J);
      L := I;
    until I >= R;
  end;

var I : Integer;
begin
  Assert(Length(Key) = Length(Data));
  I := Length(Key);
  if I > 0 then
    QuickSort(0, I - 1);
end;
{$ELSE}
procedure Sort(const Key: ExtendedArray; const Data: AnsiStringArray);

  procedure QuickSort(L, R: Integer);
  var I, J, M : Integer;
      W, T    : Extended;
      P, Q    : PExtended;
      A       : AnsiString;
  begin
    repeat
      I := L;
      P := @Key[I];
      J := R;
      Q := @Key[J];
      M := (L + R) shr 1;
      W := Key[M];
      repeat
        while P^ < W do
          begin
            Inc(P);
            Inc(I);
          end;
        while Q^ > W do
          begin
            Dec(Q);
            Dec(J);
          end;
        if I <= J then
          begin
            T := P^;
            P^ := Q^;
            Q^ := T;
            A := Data[I];
            Data[I] := Data[J];
            Data[J] := A;
            if M = I then
              begin
                M := J;
                W := Q^;
              end else
              if M = J then
                begin
                  M := I;
                  W := P^;
                end;
            Inc(P);
            Inc(I);
            Dec(Q);
            Dec(J);
          end;
      until I > J;
      if L < J then
        QuickSort(L, J);
      L := I;
    until I >= R;
  end;

var I : Integer;
begin
  Assert(Length(Key) = Length(Data));
  I := Length(Key);
  if I > 0 then
    QuickSort(0, I - 1);
end;
{$ENDIF}

{$IFDEF ManagedCode}
procedure Sort(const Key: ExtendedArray; const Data: ExtendedArray);

  procedure QuickSort(L, R: Integer);
  var I, J, M : Integer;
      W, T    : Extended;
      A       : Extended;
  begin
    repeat
      I := L;
      J := R;
      M := (L + R) shr 1;
      W := Key[M];
      repeat
        while Key[I] < W do
          Inc(I);
        while Key[J] > W do
          Dec(J);
        if I <= J then
          begin
            T := Key[I];
            Key[I] := Key[J];
            Key[J] := T;
            A := Data[I];
            Data[I] := Data[J];
            Data[J] := A;
            if M = I then
              begin
                M := J;
                W := Key[J];
              end else
              if M = J then
                begin
                  M := I;
                  W := Key[I];
                end;
            Inc(I);
            Dec(J);
          end;
      until I > J;
      if L < J then
        QuickSort(L, J);
      L := I;
    until I >= R;
  end;

var I : Integer;
begin
  Assert(Length(Key) = Length(Data));
  I := Length(Key);
  if I > 0 then
    QuickSort(0, I - 1);
end;
{$ELSE}
procedure Sort(const Key: ExtendedArray; const Data: ExtendedArray);

  procedure QuickSort(L, R: Integer);
  var I, J, M : Integer;
      W, T    : Extended;
      P, Q    : PExtended;
      A       : Extended;
  begin
    repeat
      I := L;
      P := @Key[I];
      J := R;
      Q := @Key[J];
      M := (L + R) shr 1;
      W := Key[M];
      repeat
        while P^ < W do
          begin
            Inc(P);
            Inc(I);
          end;
        while Q^ > W do
          begin
            Dec(Q);
            Dec(J);
          end;
        if I <= J then
          begin
            T := P^;
            P^ := Q^;
            Q^ := T;
            A := Data[I];
            Data[I] := Data[J];
            Data[J] := A;
            if M = I then
              begin
                M := J;
                W := Q^;
              end else
              if M = J then
                begin
                  M := I;
                  W := P^;
                end;
            Inc(P);
            Inc(I);
            Dec(Q);
            Dec(J);
          end;
      until I > J;
      if L < J then
        QuickSort(L, J);
      L := I;
    until I >= R;
  end;

var I : Integer;
begin
  Assert(Length(Key) = Length(Data));
  I := Length(Key);
  if I > 0 then
    QuickSort(0, I - 1);
end;
{$ENDIF}

{$IFNDEF ManagedCode}
{$IFDEF ManagedCode}
procedure Sort(const Key: ExtendedArray; const Data: PointerArray);

  procedure QuickSort(L, R: Integer);
  var I, J, M : Integer;
      W, T    : Extended;
      A       : Pointer;
  begin
    repeat
      I := L;
      J := R;
      M := (L + R) shr 1;
      W := Key[M];
      repeat
        while Key[I] < W do
          Inc(I);
        while Key[J] > W do
          Dec(J);
        if I <= J then
          begin
            T := Key[I];
            Key[I] := Key[J];
            Key[J] := T;
            A := Data[I];
            Data[I] := Data[J];
            Data[J] := A;
            if M = I then
              begin
                M := J;
                W := Key[J];
              end else
              if M = J then
                begin
                  M := I;
                  W := Key[I];
                end;
            Inc(I);
            Dec(J);
          end;
      until I > J;
      if L < J then
        QuickSort(L, J);
      L := I;
    until I >= R;
  end;

var I : Integer;
begin
  Assert(Length(Key) = Length(Data));
  I := Length(Key);
  if I > 0 then
    QuickSort(0, I - 1);
end;
{$ELSE}
procedure Sort(const Key: ExtendedArray; const Data: PointerArray);

  procedure QuickSort(L, R: Integer);
  var I, J, M : Integer;
      W, T    : Extended;
      P, Q    : PExtended;
      A       : Pointer;
  begin
    repeat
      I := L;
      P := @Key[I];
      J := R;
      Q := @Key[J];
      M := (L + R) shr 1;
      W := Key[M];
      repeat
        while P^ < W do
          begin
            Inc(P);
            Inc(I);
          end;
        while Q^ > W do
          begin
            Dec(Q);
            Dec(J);
          end;
        if I <= J then
          begin
            T := P^;
            P^ := Q^;
            Q^ := T;
            A := Data[I];
            Data[I] := Data[J];
            Data[J] := A;
            if M = I then
              begin
                M := J;
                W := Q^;
              end else
              if M = J then
                begin
                  M := I;
                  W := P^;
                end;
            Inc(P);
            Inc(I);
            Dec(Q);
            Dec(J);
          end;
      until I > J;
      if L < J then
        QuickSort(L, J);
      L := I;
    until I >= R;
  end;

var I : Integer;
begin
  Assert(Length(Key) = Length(Data));
  I := Length(Key);
  if I > 0 then
    QuickSort(0, I - 1);
end;
{$ENDIF}

{$ENDIF}



{$IFNDEF CLR}
{                                                                              }
{ Generic quick sort algorithm                                                 }
{                                                                              }
procedure GenericQuickSort(const Data: Pointer; const Count: Integer;
          const CompareFunc: TQuickSortCompareFunction;
          const SwapFunc: TQuickSortSwapFunction);

  procedure QuickSort(L, R: Integer);
  var I, J, M : Integer;
  begin
    repeat
      I := L;
      J := R;
      M := (L + R) shr 1;
      repeat
        while CompareFunc(Data, I, M) = crLess do
          Inc(I);
        while CompareFunc(Data, J, M) = crGreater do
          Dec(J);
        if I <= J then
          begin
            SwapFunc(Data, I, J);
            if M = I then
              M := J
            else
              if M = J then
                M := I;
            Inc(I);
            Dec(J);
          end;
      until I > J;
      if L < J then
        QuickSort(L, J);
      L := I;
    until I >= R;
  end;

begin
  if Count > 0 then
    QuickSort(0, Count - 1);
end;



{                                                                              }
{ Generic binary search algorithm                                              }
{                                                                              }
function GenericBinarySearch(const Data: Pointer; const Count: Integer;
         const Item: Pointer;
         const CompareFunc: TBinarySearchCompareFunction): Integer;
var L, H, I : Integer;
begin
  L := 0;
  H := Count - 1;
  while L <= H do
    begin
      I := (L + H) div 2;
      case CompareFunc(Data, I, Item) of
        crEqual :
          begin
            while (I > 0) and (CompareFunc(Data, I - 1, Item) = crEqual) do
              Dec(I);
            Result := I;
            exit;
          end;
        crGreater : H := I - 1;
        crLess    : L := I + 1;
      end;
    end;
  Result := -1;
end;
{$ENDIF}



{                                                                              }
{ Test cases                                                                   }
{                                                                              }
{$IFDEF UTILS_SELFTEST}
{$ASSERTIONS ON}
procedure Test_Misc;
var L, H : Cardinal;
    A, B : Byte;
    C, D : LongWord;
    P, Q : TObject;
    {$IFNDEF CLR}
    S    : AnsiString;
    {$ENDIF}
begin
  // Integer types
  {$IFNDEF ManagedCode}
  Assert(Sizeof(SmallIntRec) = Sizeof(SmallInt), 'SmallIntRec');
  Assert(Sizeof(LongIntRec) = Sizeof(LongInt),   'LongIntRec');
  {$ENDIF}

  // Min / Max
  Assert(MinI(-1, 1) = -1, 'MinI');
  Assert(MaxI(-1, 1) = 1, 'MaxI');
  Assert(MinC(1, 2) = 1, 'MinC');
  Assert(MaxC(1, 2) = 2, 'MaxC');
  Assert(MaxC($FFFFFFFF, 0) = $FFFFFFFF, 'MaxC');
  Assert(MinC($FFFFFFFF, 0) = 0, 'MinC');
  Assert(MinF(-1.0, 1.0) = -1.0, 'MinF');
  Assert(MaxF(-1.0, 1.0) = 1.0, 'MaxF');

  // Clip
  Assert(Clip(10, 5, 12) = 10,                            'Clip');
  Assert(Clip(3, 5, 12) = 5,                              'Clip');
  Assert(Clip(15, 5, 12) = 12,                            'Clip');
  Assert(ClipByte(256) = 255,                             'ClipByte');
  Assert(ClipWord(-5) = 0,                                'ClipWord');
  Assert(ClipLongWord($100000000) = $FFFFFFFF,            'ClipWord');
  Assert(SumClipI(1, 2) = 3,                              'SumClipI');
  Assert(SumClipI(1, -2) = -1,                            'SumClipI');
  Assert(SumClipI(MaxInteger - 1, 0) = MaxInteger - 1,    'SumClipI');
  Assert(SumClipI(MaxInteger - 1, 1) = MaxInteger,        'SumClipI');
  Assert(SumClipI(MaxInteger - 1, 2) = MaxInteger,        'SumClipI');
  Assert(SumClipI(MinInteger + 1, 0) = MinInteger + 1,    'SumClipI');
  Assert(SumClipI(MinInteger + 1, -1) = MinInteger,       'SumClipI');
  Assert(SumClipI(MinInteger + 1, -2) = MinInteger,       'SumClipI');
  Assert(SumClipC(1, 2) = 3,                              'SumClipC');
  Assert(SumClipC(3, -2) = 1,                             'SumClipC');
  Assert(SumClipC(MaxCardinal - 1, 0) = MaxCardinal - 1,  'SumClipC');
  Assert(SumClipC(MaxCardinal - 1, 1) = MaxCardinal,      'SumClipC');
  Assert(SumClipC(MaxCardinal - 1, 2) = MaxCardinal,      'SumClipC');
  Assert(SumClipC(1, 0) = 1,                              'SumClipC');
  Assert(SumClipC(1, -1) = 0,                             'SumClipC');
  Assert(SumClipC(1, -2) = 0,                             'SumClipC');
  Assert(not InByteRange(-1),                             'InByteRange');
  Assert(not InByteRange(256),                            'InByteRange');
  Assert(InByteRange(255),                                'InByteRange');
  Assert(InWordRange($FFFF),                              'InWordRange');
  Assert(not InWordRange($10000),                         'InWordRange');
  Assert(InShortIntRange(-1),                             'InShortIntRange');

  // Swap
  A := $11; B := $22;
  Swap(A, B);
  Assert((A = $22) and (B = $11),              'Swap');
  C := $11111111; D := $22222222;
  Swap(C, D);
  Assert((C = $22222222) and (D = $11111111),  'Swap');
  P := TObject.Create;
  Q := nil;
  SwapObjects(P, Q);
  Assert(Assigned(Q) and not Assigned(P),      'SwapObjects');
  Q.Free;

  // Ranges
  L := 10;
  H := 20;
  Assert(CardRangeIncludeElementRange(L, H, 10, 20),     'RangeInclude');
  Assert((L = 10) and (H = 20),                          'RangeInclude');
  Assert(CardRangeIncludeElementRange(L, H, 9, 21),      'RangeInclude');
  Assert((L = 9) and (H = 21),                           'RangeInclude');
  Assert(CardRangeIncludeElementRange(L, H, 7, 10),      'RangeInclude');
  Assert((L = 7) and (H = 21),                           'RangeInclude');
  Assert(CardRangeIncludeElementRange(L, H, 5, 6),       'RangeInclude');
  Assert((L = 5) and (H = 21),                           'RangeInclude');
  Assert(not CardRangeIncludeElementRange(L, H, 1, 3),   'RangeInclude');
  Assert((L = 5) and (H = 21),                           'RangeInclude');
  Assert(CardRangeIncludeElementRange(L, H, 20, 22),     'RangeInclude');
  Assert((L = 5) and (H = 22),                           'RangeInclude');
  Assert(CardRangeIncludeElementRange(L, H, 23, 24),     'RangeInclude');
  Assert((L = 5) and (H = 24),                           'RangeInclude');
  Assert(not CardRangeIncludeElementRange(L, H, 26, 27), 'RangeInclude');
  Assert((L = 5) and (H = 24),                               'RangeInclude');

  // iif
  Assert(iif(True, 1, 2) = 1,         'iif');
  Assert(iif(False, 1, 2) = 2,        'iif');
  Assert(iif(True, -1, -2) = -1,      'iif');
  Assert(iif(False, -1, -2) = -2,     'iif');
  Assert(iif(True, '1', '2') = '1',   'iif');
  Assert(iif(False, '1', '2') = '2',  'iif');
  Assert(iifW(True, '1', '2') = '1',  'iif');
  Assert(iifW(False, '1', '2') = '2', 'iif');
  Assert(iif(True, 1.1, 2.2) = 1.1,   'iif');
  Assert(iif(False, 1.1, 2.2) = 2.2,  'iif');

  // CharSet
  Assert(CharCount([]) = 0,           'CharCount');
  Assert(CharCount(['a'..'z']) = 26,  'CharCount');
  Assert(CharCount([#0, #255]) = 2,   'CharCount');

  // Compare
  Assert(Compare(1, 1) = crEqual,          'Compare');
  Assert(Compare(1, 2) = crLess,           'Compare');
  Assert(Compare(1, 0) = crGreater,        'Compare');
  Assert(Compare(1.0, 1.0) = crEqual,      'Compare');
  Assert(Compare(1.0, 1.1) = crLess,       'Compare');
  Assert(Compare(1.0, 0.9) = crGreater,    'Compare');
  Assert(Compare(False, False) = crEqual,  'Compare');
  Assert(Compare(True, True) = crEqual,    'Compare');
  Assert(Compare(False, True) = crLess,    'Compare');
  Assert(Compare(True, False) = crGreater, 'Compare');
  Assert(Compare('', '') = crEqual,        'Compare');
  Assert(Compare('a', 'a') = crEqual,      'Compare');
  Assert(Compare('a', 'b') = crLess,       'Compare');
  Assert(Compare('b', 'a') = crGreater,    'Compare');
  Assert(Compare('', 'a') = crLess,        'Compare');
  Assert(Compare('a', '') = crGreater,     'Compare');
  Assert(Compare('aa', 'a') = crGreater,   'Compare');

  Assert(Sign(1) = 1,     'Sign');
  Assert(Sign(0) = 0,     'Sign');
  Assert(Sign(-1) = -1,   'Sign');
  Assert(Sign(2) = 1,     'Sign');
  Assert(Sign(-2) = -1,   'Sign');
  Assert(Sign(-1.5) = -1, 'Sign');
  Assert(Sign(1.5) = 1,   'Sign');
  Assert(Sign(0.0) = 0,   'Sign');

  Assert(not FloatZero(1e-1, 1e-2),   'FloatZero');
  Assert(FloatZero(1e-2, 1e-2),       'FloatZero');
  Assert(not FloatZero(1e-1, 1e-9),   'FloatZero');
  Assert(not FloatZero(1e-8, 1e-9),   'FloatZero');
  Assert(FloatZero(1e-9, 1e-9),       'FloatZero');
  Assert(FloatZero(1e-10, 1e-9),      'FloatZero');
  Assert(not FloatZero(0.2, 1e-1),    'FloatZero');
  Assert(FloatZero(0.09, 1e-1),       'FloatZero');

  Assert(FloatOne(1.0, 1e-1),         'FloatOne');
  Assert(FloatOne(1.09999, 1e-1),     'FloatOne');
  Assert(FloatOne(0.90001, 1e-1),     'FloatOne');
  Assert(not FloatOne(1.10001, 1e-1), 'FloatOne');
  Assert(not FloatOne(1.2, 1e-1),     'FloatOne');
  Assert(not FloatOne(0.89999, 1e-1), 'FloatOne');

  Assert(not FloatsEqual(2.0, -2.0, 1e-1),             'FloatsEqual');
  Assert(not FloatsEqual(1.0, 0.0, 1e-1),              'FloatsEqual');
  Assert(FloatsEqual(2.0, 2.0, 1e-1),                  'FloatsEqual');
  Assert(FloatsEqual(2.0, 2.09, 1e-1),                 'FloatsEqual');
  Assert(FloatsEqual(2.0, 1.90000001, 1e-1),           'FloatsEqual');
  Assert(not FloatsEqual(2.0, 2.10001, 1e-1),          'FloatsEqual');
  Assert(not FloatsEqual(2.0, 2.2, 1e-1),              'FloatsEqual');
  Assert(not FloatsEqual(2.0, 1.8999999, 1e-1),        'FloatsEqual');
  Assert(FloatsEqual(2.00000000011, 2.0, 1e-2),        'FloatsEqual');
  Assert(FloatsEqual(2.00000000011, 2.0, 1e-9),        'FloatsEqual');
  Assert(not FloatsEqual(2.00000000011, 2.0, 1e-10),   'FloatsEqual');
  Assert(not FloatsEqual(2.00000000011, 2.0, 1e-11),   'FloatsEqual');

  {$IFNDEF CLR}
  Assert(FloatsCompare(0.0, 0.0, MinExtended) = crEqual,  'FloatsCompare');
  Assert(FloatsCompare(1.2, 1.2, MinExtended) = crEqual,  'FloatsCompare');
  Assert(FloatsCompare(1.23456789e-300, 1.23456789e-300, MinExtended) = crEqual, 'FloatsCompare');
  Assert(FloatsCompare(1.23456780e-300, 1.23456789e-300, MinExtended) = crLess,  'FloatsCompare');
  {$ENDIF}
  Assert(FloatsCompare(1.4e-5, 1.5e-5, 1e-4) = crEqual,   'FloatsCompare');
  Assert(FloatsCompare(1.4e-5, 1.5e-5, 1e-5) = crEqual,   'FloatsCompare');
  Assert(FloatsCompare(1.4e-5, 1.5e-5, 1e-6) = crLess,    'FloatsCompare');
  Assert(FloatsCompare(1.4e-5, 1.5e-5, 1e-7) = crLess,    'FloatsCompare');
  Assert(FloatsCompare(0.5003, 0.5001, 1e-1) = crEqual,   'FloatsCompare');
  Assert(FloatsCompare(0.5003, 0.5001, 1e-2) = crEqual,   'FloatsCompare');
  Assert(FloatsCompare(0.5003, 0.5001, 1e-3) = crEqual,   'FloatsCompare');
  Assert(FloatsCompare(0.5003, 0.5001, 1e-4) = crGreater, 'FloatsCompare');
  Assert(FloatsCompare(0.5003, 0.5001, 1e-5) = crGreater, 'FloatsCompare');

  {$IFNDEF CLR}
  Assert(ApproxEqual(0.0, 0.0),                                'ApproxEqual');
  Assert(not ApproxEqual(0.0, 1e-100, 1e-10),                  'ApproxEqual');
  Assert(not ApproxEqual(1.0, 1e-100, 1e-10),                  'ApproxEqual');
  Assert(ApproxEqual(1.0, 1.0),                                'ApproxEqual');
  Assert(ApproxEqual(-1.0, -1.0),                              'ApproxEqual');
  Assert(not ApproxEqual(1.0, -1.0),                           'ApproxEqual');
  Assert(ApproxEqual(1e-100, 1e-100, 1e-10),                   'ApproxEqual');
  Assert(not ApproxEqual(0.0, 1.0, 1e-9),                      'ApproxEqual');
  Assert(not ApproxEqual(-1.0, 1.0, 1e-9),                     'ApproxEqual');
  Assert(ApproxEqual(0.12345, 0.12349, 1e-3),                  'ApproxEqual');
  Assert(not ApproxEqual(0.12345, 0.12349, 1e-4),              'ApproxEqual');
  Assert(not ApproxEqual(0.12345, 0.12349, 1e-5),              'ApproxEqual');
  Assert(ApproxEqual(1.2345e+100, 1.2349e+100, 1e-3),          'ApproxEqual');
  Assert(not ApproxEqual(1.2345e+100, 1.2349e+100, 1e-4),      'ApproxEqual');
  Assert(not ApproxEqual(1.2345e+100, 1.2349e+100, 1e-5),      'ApproxEqual');
  Assert(ApproxEqual(1.2345e-100, 1.2349e-100, 1e-3),          'ApproxEqual');
  Assert(not ApproxEqual(1.2345e-100, 1.2349e-100, 1e-4),      'ApproxEqual');
  Assert(not ApproxEqual(1.2345e-100, 1.2349e-100, 1e-5),      'ApproxEqual');
  Assert(not ApproxEqual(1.0e+20, 1.00000001E+20, 1e-8),       'ApproxEqual');
  Assert(ApproxEqual(1.0e+20, 1.000000001E+20, 1e-8),          'ApproxEqual');
  Assert(not ApproxEqual(1.0e+20, 1.000000001E+20, 1e-9),      'ApproxEqual');
  Assert(ApproxEqual(1.0e+20, 1.0000000001E+20, 1e-9),         'ApproxEqual');
  Assert(not ApproxEqual(1.0e+20, 1.0000000001E+20, 1e-10),    'ApproxEqual');

  Assert(ApproxCompare(0.0, 0.0) = crEqual,                         'ApproxCompare');
  Assert(ApproxCompare(0.0, 1.0) = crLess,                          'ApproxCompare');
  Assert(ApproxCompare(1.0, 0.0) = crGreater,                       'ApproxCompare');
  Assert(ApproxCompare(-1.0, 1.0) = crLess,                         'ApproxCompare');
  Assert(ApproxCompare(1.2345e+10, 1.2349e+10, 1e-3) = crEqual,     'ApproxCompare');
  Assert(ApproxCompare(1.2345e+10, 1.2349e+10, 1e-4) = crLess,      'ApproxCompare');
  Assert(ApproxCompare(-1.2345e-10, -1.2349e-10, 1e-3) = crEqual,   'ApproxCompare');
  Assert(ApproxCompare(-1.2345e-10, -1.2349e-10, 1e-4) = crGreater, 'ApproxCompare');
  {$ENDIF}

  Assert(ReverseCompareResult(crLess) = crGreater, 'ReverseCompareResult');
  Assert(ReverseCompareResult(crGreater) = crLess, 'ReverseCompareResult');

  Assert(AnsiStringToInt('0') = 0,       'AnsiStringToInt');
  Assert(AnsiStringToInt('1') = 1,       'AnsiStringToInt');
  Assert(AnsiStringToInt('-1') = -1,     'AnsiStringToInt');
  Assert(AnsiStringToInt('10') = 10,     'AnsiStringToInt');
  Assert(AnsiStringToInt('01') = 1,      'AnsiStringToInt');
  Assert(AnsiStringToInt('-10') = -10,   'AnsiStringToInt');
  Assert(AnsiStringToInt('-01') = -1,    'AnsiStringToInt');
  Assert(AnsiStringToInt('123') = 123,   'AnsiStringToInt');
  Assert(AnsiStringToInt('-123') = -123, 'AnsiStringToInt');

  Assert(WideStringToInt('321') = 321,   'WideStringToInt');
  Assert(WideStringToInt('-321') = -321, 'WideStringToInt');

  Assert(IntToAnsiString(0) = '0',       'IntToAnsiString');
  Assert(IntToAnsiString(1) = '1',       'IntToAnsiString');
  Assert(IntToAnsiString(-1) = '-1',     'IntToAnsiString');
  Assert(IntToAnsiString(10) = '10',     'IntToAnsiString');
  Assert(IntToAnsiString(-10) = '-10',   'IntToAnsiString');
  Assert(IntToAnsiString(123) = '123',   'IntToAnsiString');
  Assert(IntToAnsiString(-123) = '-123', 'IntToAnsiString');

  // Hash
  Assert(HashStr('Fundamentals') = $3FB7796E, 'HashStr');
  Assert(HashStr('0') = $B2420DE, 'HashStr');
  Assert(HashStr('Fundamentals', 0, False) = HashStr('FUNdamentals', 0, False), 'HashStr');
  Assert(HashStr('Fundamentals', 0, True) <> HashStr('FUNdamentals', 0, True), 'HashStr');
  {$IFNDEF CLR}
  S := 'Fundamentals';
  Assert(HashStrBuf(Pointer(S), Length(S), 0) = $3FB7796E, 'HashStrBuf');
  {$ENDIF}
end;

{$IFNDEF ManagedCode}
procedure Test_Memory;
var I, J : Integer;
    A, B : AnsiString;
begin
  for I := -1 to 33 do
    begin
      A := '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ';
      B := '                                    ';
      MoveMem(A[1], B[1], I);
      for J := 1 to MinI(I, 10) do
        Assert(B[J] = AnsiChar(48 + J - 1),     'MoveMem');
      for J := 11 to MinI(I, 36) do
        Assert(B[J] = AnsiChar(65 + J - 11),    'MoveMem');
      for J := MaxI(I + 1, 1) to 36 do
        Assert(B[J] = ' ',                  'MoveMem');
      Assert(CompareMem(A[1], B[1], I),     'CompareMem');
    end;

  for J := 1000 to 1500 do
    begin
      SetLength(A, 4096);
      for I := 1 to 4096 do
        A[I] := 'A';
      SetLength(B, 4096);
      for I := 1 to 4096 do
        B[I] := 'B';
      MoveMem(A[1], B[1], J);
      for I := 1 to J do
        Assert(B[I] = 'A', 'MoveMem');
      for I := J + 1 to 4096 do
        Assert(B[I] = 'B', 'MoveMem');
      Assert(CompareMem(A[1], B[1], J),     'CompareMem');
    end;

  B := '1234567890';
  MoveMem(B[1], B[3], 4);
  Assert(B = '1212347890', 'MoveMem');
  MoveMem(B[3], B[2], 4);
  Assert(B = '1123447890', 'MoveMem');
  MoveMem(B[1], B[3], 2);
  Assert(B = '1111447890', 'MoveMem');
  MoveMem(B[5], B[7], 3);
  Assert(B = '1111444470', 'MoveMem');
  MoveMem(B[9], B[10], 1);
  Assert(B = '1111444477', 'MoveMem');

  for I := -1 to 33 do
    begin
      A := '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ';
      ZeroMem(A[1], I);
      for J := 1 to I do
        Assert(A[J] = #0,                       'ZeroMem');
      for J := MaxI(I + 1, 1) to 10 do
        Assert(A[J] = AnsiChar(48 + J - 1),     'ZeroMem');
      for J := MaxI(I + 1, 11) to 36 do
        Assert(A[J] = AnsiChar(65 + J - 11),    'ZeroMem');
    end;

  for I := -1 to 33 do
    begin
      A := '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ';
      FillMem(A[1], I, Ord('!'));
      for J := 1 to I do
        Assert(A[J] = '!',                      'FillMem');
      for J := MaxI(I + 1, 1) to 10 do
        Assert(A[J] = AnsiChar(48 + J - 1),     'FillMem');
      for J := MaxI(I + 1, 11) to 36 do
        Assert(A[J] = AnsiChar(65 + J - 11),    'FillMem');
    end;
end;
{$ENDIF}

procedure Test_BaseConversion;
var V : Boolean;
begin
  Assert(HexCharToInt('A') = 10,                        'HexCharToInt');
  Assert(HexCharToInt('a') = 10,                        'HexCharToInt');
  Assert(HexCharToInt('1') = 1,                         'HexCharToInt');
  Assert(HexCharToInt('0') = 0,                         'HexCharToInt');
  Assert(HexCharToInt('F') = 15,                        'HexCharToInt');
  Assert(HexCharToInt('G') = -1,                        'HexCharToInt');

  Assert(LongWordToStr(123) = '123',                    'LongWordToStr');
  Assert(LongWordToStr(0) = '0',                        'LongWordToStr');
  Assert(LongWordToStr($FFFFFFFF) = '4294967295',       'LongWordToStr');
  Assert(LongWordToStr(10000) = '10000',                'LongWordToStr');
  Assert(LongWordToStr(99999) = '99999',                'LongWordToStr');
  Assert(LongWordToStr(1, 1) = '1',                     'LongWordToStr');
  Assert(LongWordToStr(1, 3) = '001',                   'LongWordToStr');
  Assert(LongWordToStr(1234, 3) = '1234',               'LongWordToStr');

  Assert(DecStrToLongWord('', V) = 0,                   'DecStrToLongWord');
  Assert(V = False,                                     'DecStrToLongWord');
  Assert(DecStrToLongWord('123', V) = 123,              'DecStrToLongWord');
  Assert(V = True,                                      'DecStrToLongWord');
  Assert(DecStrToLongWord('4294967295', V) = $FFFFFFFF, 'DecStrToLongWord');
  Assert(V = True,                                      'DecStrToLongWord');
  Assert(DecStrToLongWord('99999', V) = 99999,          'DecStrToLongWord');

  Assert(LongWordToHex(0) = '0',                        'LongWordToHex');
  Assert(LongWordToHex($FFFFFFFF) = 'FFFFFFFF',         'LongWordToHex');
  Assert(LongWordToHex($10000) = '10000',               'LongWordToHex');
  Assert(LongWordToHex($12345678) = '12345678',         'LongWordToHex');
  Assert(LongWordToHex($AB, 4) = '00AB',                'LongWordToHex');
  Assert(LongWordToHex($ABCD, 8) = '0000ABCD',          'LongWordToHex');
  Assert(LongWordToHex(0, 8) = '00000000',              'LongWordToHex');
  Assert(LongWordToHex($CDEF, 2) = 'CDEF',              'LongWordToHex');

  Assert(HexStrToLongWord('FFFFFFFF', V) = $FFFFFFFF,   'HexStrToLongWord');
  Assert(V = True,                                      'HexStrToLongWord');
  Assert(HexStrToLongWord('0', V) = 0,                  'HexStrToLongWord');
  Assert(V = True,                                      'HexStrToLongWord');
  Assert(HexStrToLongWord('123456', V) = $123456,       'HexStrToLongWord');
  Assert(HexStrToLongWord('ABC', V) = $ABC,             'HexStrToLongWord');
  Assert(HexStrToLongWord('', V) = 0,                   'HexStrToLongWord');
  Assert(V = False,                                     'HexStrToLongWord');
  Assert(HexStrToLongWord('x', V) = 0,                  'HexStrToLongWord');
  Assert(V = False,                                     'HexStrToLongWord');
  Assert(HexStrToLongWord('1000', V) = $1000,           'HexStrToLongWord');
end;

procedure Test_BitFunctions;
begin
  Assert(SetBit($100F, 5) = $102F,            'SetBit');
  Assert(ClearBit($102F, 5) = $100F,          'ClearBit');
  Assert(ToggleBit($102F, 5) = $100F,         'ToggleBit');
  Assert(ToggleBit($100F, 5) = $102F,         'ToggleBit');
  Assert(IsBitSet($102F, 5),                  'IsBitSet');
  Assert(not IsBitSet($100F, 5),              'IsBitSet');
  Assert(IsHighBitSet($80000000),             'IsHighBitSet');
  Assert(not IsHighBitSet($00000001),         'IsHighBitSet');
  Assert(not IsHighBitSet($7FFFFFFF),         'IsHighBitSet');

  Assert(SetBitScanForward(0) = -1,           'SetBitScanForward');
  Assert(SetBitScanForward($1020) = 5,        'SetBitScanForward');
  Assert(SetBitScanReverse($1020) = 12,       'SetBitScanForward');
  Assert(SetBitScanForward($1020, 6) = 12,    'SetBitScanForward');
  Assert(SetBitScanReverse($1020, 11) = 5,    'SetBitScanForward');
  Assert(ClearBitScanForward($FFFFFFFF) = -1, 'ClearBitScanForward');
  Assert(ClearBitScanForward($1020) = 0,      'ClearBitScanForward');
  Assert(ClearBitScanReverse($1020) = 31,     'ClearBitScanForward');
  Assert(ClearBitScanForward($1020, 5) = 6,   'ClearBitScanForward');
  Assert(ClearBitScanReverse($1020, 12) = 11, 'ClearBitScanForward');

  Assert(ReverseBits($12345678) = $1E6A2C48,  'ReverseBits');
  Assert(ReverseBits($1) = $80000000,         'ReverseBits');
  Assert(ReverseBits($80000000) = $1,         'ReverseBits');
  Assert(SwapEndian($12345678) = $78563412,   'SwapEndian');

  Assert(BitCount($12341234) = 10,            'BitCount');
  Assert(IsPowerOfTwo(1),                     'IsPowerOfTwo');
  Assert(IsPowerOfTwo(2),                     'IsPowerOfTwo');
  Assert(not IsPowerOfTwo(3),                 'IsPowerOfTwo');

  Assert(RotateLeftBits32(0, 1) = 0,          'RotateLeftBits32');
  Assert(RotateLeftBits32(1, 0) = 1,          'RotateLeftBits32');
  Assert(RotateLeftBits32(1, 1) = 2,          'RotateLeftBits32');
  Assert(RotateLeftBits32($80000000, 1) = 1,  'RotateLeftBits32');
  Assert(RotateLeftBits32($80000001, 1) = 3,  'RotateLeftBits32');
  Assert(RotateLeftBits32(1, 2) = 4,          'RotateLeftBits32');
  Assert(RotateLeftBits32(1, 31) = $80000000, 'RotateLeftBits32');
  Assert(RotateLeftBits32(5, 2) = 20,         'RotateLeftBits32');
  Assert(RotateRightBits32(0, 1) = 0,         'RotateRightBits32');
  Assert(RotateRightBits32(1, 0) = 1,         'RotateRightBits32');
  Assert(RotateRightBits32(1, 1) = $80000000, 'RotateRightBits32');
  Assert(RotateRightBits32(2, 1) = 1,         'RotateRightBits32');
  Assert(RotateRightBits32(4, 2) = 1,         'RotateRightBits32');

  Assert(LowBitMask(10) = $3FF,               'LowBitMask');
  Assert(HighBitMask(28) = $F0000000,         'HighBitMask');
  Assert(RangeBitMask(2, 6) = $7C,            'RangeBitMask');

  Assert(SetBitRange($101, 2, 6) = $17D,      'SetBitRange');
  Assert(ClearBitRange($17D, 2, 6) = $101,    'ClearBitRange');
  Assert(ToggleBitRange($17D, 2, 6) = $101,   'ToggleBitRange');
  Assert(IsBitRangeSet($17D, 2, 6),           'IsBitRangeSet');
  Assert(not IsBitRangeSet($101, 2, 6),       'IsBitRangeSet');
  Assert(not IsBitRangeClear($17D, 2, 6),     'IsBitRangeClear');
  Assert(IsBitRangeClear($101, 2, 6),         'IsBitRangeClear');
end;

procedure Test_IntegerArray;
var S, T : IntegerArray;
    F    : Integer;
begin
  S := nil;
  for F := 1 to 100 do
    begin
      Append(S, F);
      Assert(Length(S) = F,                 'Append');
      Assert(S[F - 1] = F,                  'Append');
    end;

  T := Copy(S);
  AppendIntegerArray(S, T);
  for F := 1 to 100 do
    Assert(S[F + 99] = F,                   'Append');
  Assert(PosNext(60, S) = 59,               'PosNext');
  Assert(PosNext(60, T) = 59,               'PosNext');
  Assert(PosNext(60, S, 59) = 159,          'PosNext');
  Assert(PosNext(60, T, 59) = -1,           'PosNext');
  Assert(PosNext(60, T, -1, True) = 59,     'PosNext');
  Assert(PosNext(60, T, 59, True) = -1,     'PosNext');

  for F := 1 to 100 do
    begin
      Remove(S, PosNext(F, S), 1);
      Assert(Length(S) = 200 - F,           'Remove');
    end;
  for F := 99 downto 0 do
    begin
      Remove(S, PosNext(F xor 3 + 1, S), 1);
      Assert(Length(S) = F,                 'Remove');
    end;

  S := AsIntegerArray([3, 1, 2, 5, 4]);
  Sort(S);
  Assert(S[0] = 1, 'Sort');
  Assert(S[1] = 2, 'Sort');
  Assert(S[2] = 3, 'Sort');
  Assert(S[3] = 4, 'Sort');
  Assert(S[4] = 5, 'Sort');

  S := AsIntegerArray([3, 5, 5, 2, 5, 5, 1]);
  Sort(S);
  Assert(S[0] = 1, 'Sort');
  Assert(S[1] = 2, 'Sort');
  Assert(S[2] = 3, 'Sort');
  Assert(S[3] = 5, 'Sort');
  Assert(S[4] = 5, 'Sort');
  Assert(S[5] = 5, 'Sort');
  Assert(S[6] = 5, 'Sort');

  SetLength(S, 1000);
  for F := 0 to 999 do
    S[F] := F mod 5;
  Sort(S);
  for F := 0 to 999 do
    Assert(S[F] = F div 200, 'Sort');

  S := AsIntegerArray([6, 3, 5, 1]);
  T := AsIntegerArray([1, 2, 3, 4]);
  Sort(S, T);
  Assert(S[0] = 1, 'Sort');
  Assert(S[1] = 3, 'Sort');
  Assert(S[2] = 5, 'Sort');
  Assert(S[3] = 6, 'Sort');
  Assert(T[0] = 4, 'Sort');
  Assert(T[1] = 2, 'Sort');
  Assert(T[2] = 3, 'Sort');
  Assert(T[3] = 1, 'Sort');
end;

procedure Test_ObjectArray;
var S, T : ObjectArray;
    F    : Integer;
    V    : TObject;
begin
  S := nil;
  V := TObject.Create;
  try
    for F := 1 to 100 do
      begin
        Append(S, V);
        Assert(Length(S) = F,            'Append');
        Assert(S[F - 1] = V,             'Append');
      end;
    T := Copy(S);
    for F := 1 to 10 do
      begin
        Remove(S, F - 1, 1, False);
        Assert(Length(S) = 100 - F,      'Remove');
      end;
    Remove(S, 89, 1, False);
    Assert(Length(S) = 89,               'Remove');
    Remove(S, 87, 1, False);
    Assert(Length(S) = 88,               'Remove');
    AppendObjectArray(S, T);
    Assert(Length(S) = 188,              'AppendObjectArray');
    Remove(S, 10, 88, False);
    Assert(Length(S) = 100,              'Remove');
    Remove(S, 0, 100, False);
    Assert(Length(S) = 0,                'Remove');
  finally
    V.Free;
  end;
end;

procedure SelfTest;
begin
  {$IFDEF CPU_INTEL386}
  Set8087CW(Default8087CW);
  {$ENDIF}
  Test_Misc;
  {$IFNDEF ManagedCode}
  Test_Memory;
  {$ENDIF}
  Test_BaseConversion;
  Test_BitFunctions;
  Test_IntegerArray;
  Test_ObjectArray;
end;
{$ENDIF}



end.

