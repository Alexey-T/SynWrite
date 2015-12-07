{******************************************************************************}
{                                                                              }
{   Library:          Fundamentals 4.00                                        }
{   File name:        cStrings.pas                                             }
{   File version:     4.52                                                     }
{   Description:      String utility functions                                 }
{                                                                              }
{   Copyright:        Copyright © 1999-2011, David J Butler                    }
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
{   E-mail:           fundamentalslib@gmail.com                                }
{                                                                              }
{ Revision history:                                                            }
{                                                                              }
{   1999/10/19  0.01  Split from Maths unit.                                   }
{   1999/10/26  0.02  Revision.                                                }
{   1999/10/30  0.03  Added Count, Reverse.                                    }
{   1999/10/31  0.04  Improved Match.                                          }
{                     Added Replace, Count, PadInside.                         }
{   1999/11/06  1.05  Added Remove, TrimEllipse.                               }
{   1999/11/09  1.06  Added Pack functions.                                    }
{   1999/11/17  1.07  Added PosN, Before, After, Between and Split.            }
{   1999/11/22  1.08  Added Join.                                              }
{   1999/11/23  1.09  Added Translate.                                         }
{   1999/12/02  1.10  Fixed bugs in Replace and Match reported by daiqingbo.   }
{   1999/12/27  1.11  Added SelfTest procedure and Bug fixes.                  }
{   2000/01/04  1.12  Added InsensitiveCharSet.                                }
{   2000/01/08  1.13  Added Append.                                            }
{   2000/05/08  1.14  Revision.                                                }
{   2000/07/20  1.15  Bug fixes.                                               }
{   2000/08/30  1.16  Bug fixes.                                               }
{   2000/09/04  1.17  Added MatchFileMask.                                     }
{   2000/09/31  1.18  Added HexEscapeText and HexUnescapeText.                 }
{   2000/12/04  1.19  Changes to CopyRange, CopyLeft to avoid memory           }
{                     allocation in specific cases.                            }
{   2001/04/22  1.20  Added CaseSensitive parameter to Match, PosNext, PosN    }
{   2001/04/25  1.21  Added CopyEx, MatchLeft and MatchRight.                  }
{   2001/04/28  1.22  Refactoring.                                             }
{                     Replaced PosNext and PosPrev with Pos.                   }
{   2001/04/29  1.23  Improvements.                                            }
{   2001/05/13  1.24  Added simple regular expression matching.                }
{                     Added CharClassStr conversion routines.                  }
{   2001/06/01  1.25  Added TQuickLexer                                        }
{   2001/07/07  1.26  Optimizations.                                           }
{   2001/07/30  1.27  Revision.                                                }
{   2001/08/22  1.28  Revision.                                                }
{   2001/11/11  2.29  Revision.                                                }
{   2002/02/14  2.30  Added MatchPattern.                                      }
{   2002/04/03  3.31  Added string functions from cUtils.                      }
{   2002/04/14  3.32  Moved TQuickLexer to unit cQuickLexer.                   }
{   2002/12/14  3.33  Major revision. Removed rarely used functions.           }
{   2003/07/28  3.34  Minor changes.                                           }
{   2003/08/04  3.35  Changed parameters of StrMatch functions to be           }
{                     consistent with other string functions.                  }
{                     Changed StrCompare functions to return integer result.   }
{   2003/09/06  3.36  Removed dependancy on Delphi's Math and Variant units.   }
{                     This saves about 25K when used in a DLL.                 }
{   2003/11/07  3.37  Compilable with FreePascal 1.90 Win32 i386.              }
{   2004/07/31  3.38  Improved StrReplace function to efficiently handle       }
{                     cases where millions of matches are found.               }
{   2004/08/01  3.39  Added ToLongWord conversion functions.                   }
{   2005/06/10  4.40  Compilable with FreePascal 2 Win32 i386.                 }
{   2005/09/20  4.41  Added TStringBuilder class.                              }
{   2005/09/21  4.42  Revised for Fundamentals 4.                              }
{   2007/06/08  4.43  Compilable with FreePascal 2.0.4 Win32 i386              }
{   2008/08/18  4.44  StrP functions; added Str prefix to some functions.      }
{   2009/01/04  4.45  Added AsciiChar and AsciiString.                         }
{                     Initial update for Delphi 2009.                          }
{   2009/10/09  4.46  Compilable with Delphi 2009 Win32/.NET.                  }
{   2010/06/27  4.47  Compilable with FreePascal 2.4.0 OSX x86-64              }
{   2011/03/17  4.48  Compilable with Delphi 5.                                }
{   2011/05/28  4.49  Fix in TWideStringBuilder.                               }
{   2011/06/14  4.50  Added Append(BufPtr) method to TStringBuilder.           }
{   2011/09/30  4.51  Improved UnicodeString support.                          }
{   2011/10/17  4.52  WideString functions.                                    }
{                                                                              }
{ Supported compilers:                                                         }
{                                                                              }
{   Delphi 5 Win32 i386                 4.48  2011/03/17                       }
{   Delphi 6 Win32 i386                                                        }
{   Delphi 7 Win32 i386                 4.46  2009/10/09                       }
{   Delphi 2005 Win32 i386                                                     }
{   Delphi 2006 Win32 i386                                                     }
{   Delphi 2007 Win32 i386              4.45                                   }
{   Delphi 2009 Win32 i386              4.50  2011/09/27                       }
{   Delphi 2009 .NET                    4.46  2009/10/09                       }
{   FreePascal 2.0.4 Linux i386         4.45  2009/06/06                       }
{   FreePascal 2.2.4 OSX i386           4.47  2010/07/09                       }
{   FreePascal 2.4.0 OSX x86-64         4.47  2010/06/27                       }
{                                                                              }
{******************************************************************************}

{$INCLUDE cDefines.inc}

{$IFDEF FREEPASCAL}
  {$WARNINGS OFF}
  {$HINTS OFF}
{$ENDIF}

{$IFDEF DEBUG}
{$IFDEF SELFTEST}
  {$DEFINE STRINGS_SELFTEST}
{$ENDIF}
{$ENDIF}

unit cStrings;

interface

uses
  { System }
  SysUtils,
  {$IFDEF CLR}
  Borland.Vcl.StrUtils,
  {$ENDIF}

  { SynWrite }
  ecStrUtils,
  unSearch,

  { Fundamentals }
  cUtils;



{                                                                              }
{ Exceptions                                                                   }
{                                                                              }
type
  EStringError = class(Exception);
  EStrInvalidArgument = class(EStringError);



{                                                                              }
{ AnsiString                                                                   }
{   AnsiChar is a byte character.                                              }
{   AnsiString is a reference counted, code page aware, byte string.           }
{                                                                              }
procedure SetLengthAndZero(var S: AnsiString; const NewLength: Integer); overload;
{$IFNDEF ManagedCode}
function  StrPasP(const Buf; const BufSize: Integer): AnsiString;
{$ENDIF}



{                                                                              }
{ WideString                                                                   }
{   WideChar is a 16-bit character.                                            }
{   WideString is not reference counted.                                       }
{                                                                              }
{$IFNDEF SupportWideChar}
type
  WideChar = type Word;
  PWideChar = ^WideChar;
{$ENDIF}



{                                                                              }
{ UCS4String                                                                   }
{   UCS4Char is a 32-bit character from the Unicode character set.             }
{   UCS4String is a reference counted string of UCS4Char characters.           }
{                                                                              }
type
  {$IFNDEF SupportUCS4String}
  UCS4Char = type LongWord;
  PUCS4Char = ^UCS4Char;
  UCS4String = array of UCS4Char;
  {$ENDIF}
  UCS4StringArray = array of UCS4String;



{                                                                              }
{ AsciiString                                                                  }
{   AsciiString is an alias for AnsiString where all bytes are from Ascii.     }
{                                                                              }
type
  AsciiChar = AnsiChar;
  PAsciiChar = ^AsciiChar;
  AsciiString = AnsiString;
  AsciiCharSet = set of AsciiChar;
  AsciiStringArray = array of AsciiString;



{                                                                              }
{ RawByteString                                                                }
{   RawByteString is an alias for AnsiString where all bytes are raw bytes     }
{   that do not undergo any character set translation.                         }
{   Under Delphi 2009 RawByteString is defined as "type AnsiString($FFFF)".    }
{                                                                              }
type
  RawByteChar = AnsiChar;
  PRawByteChar = ^RawByteChar;
  {$IFNDEF SupportRawByteString}
  RawByteString = AnsiString;
  {$ENDIF}
  RawByteCharSet = set of RawByteChar;
  RawByteStringArray = array of RawByteString;



{                                                                              }
{ UTF8String                                                                   }
{   UTF8String is a variable character length encoding for Unicode strings.    }
{   For Ascii values, a UTF8String is the same as a AsciiString.               }
{   Under Delphi 2009 UTF8String is defined as "type AnsiString($FDE9)"        }
{                                                                              }
type
  {$IFNDEF SupportUTF8String}
  UTF8Char = AnsiChar;
  PUTF8Char = ^UTF8Char;
  UTF8String = type AnsiString;
  {$ENDIF}
  UTF8StringArray = array of UTF8String;



{                                                                              }
{ UnicodeString                                                                }
{   UnicodeString in Delphi 2009 is reference counted, code page aware,        }
{   variable character length unicode string. Defaults to UTF-16 encoding.     }
{   WideString is not reference counted.                                       }
{                                                                              }
type
  UnicodeChar = UCS4Char;
  {$IFNDEF SupportUnicodeString}
  UnicodeString = WideString;
  {$ENDIF}
  UnicodeStringArray = array of UnicodeString;



{                                                                              }
{ Zero terminated string pointer                                               }
{                                                                              }
{$IFNDEF ManagedCode}
type
  PStrAZ = PAnsiChar;
  PStrWZ = PWideChar;
  PStrZ = PChar;
{$ENDIF}



{                                                                              }
{ ASCII constants                                                              }
{                                                                              }
const
  AsciiNULL = AsciiChar(#0);
  AsciiSOH  = AsciiChar(#1);
  AsciiSTX  = AsciiChar(#2);
  AsciiETX  = AsciiChar(#3);
  AsciiEOT  = AsciiChar(#4);
  AsciiENQ  = AsciiChar(#5);
  AsciiACK  = AsciiChar(#6);
  AsciiBEL  = AsciiChar(#7);
  AsciiBS   = AsciiChar(#8);
  AsciiHT   = AsciiChar(#9);
  AsciiLF   = AsciiChar(#10);
  AsciiVT   = AsciiChar(#11);
  AsciiFF   = AsciiChar(#12);
  AsciiCR   = AsciiChar(#13);
  AsciiSO   = AsciiChar(#14);
  AsciiSI   = AsciiChar(#15);
  AsciiDLE  = AsciiChar(#16);
  AsciiDC1  = AsciiChar(#17);
  AsciiDC2  = AsciiChar(#18);
  AsciiDC3  = AsciiChar(#19);
  AsciiDC4  = AsciiChar(#20);
  AsciiNAK  = AsciiChar(#21);
  AsciiSYN  = AsciiChar(#22);
  AsciiETB  = AsciiChar(#23);
  AsciiCAN  = AsciiChar(#24);
  AsciiEM   = AsciiChar(#25);
  AsciiEOF  = AsciiChar(#26);
  AsciiESC  = AsciiChar(#27);
  AsciiFS   = AsciiChar(#28);
  AsciiGS   = AsciiChar(#29);
  AsciiRS   = AsciiChar(#30);
  AsciiUS   = AsciiChar(#31);
  AsciiSP   = AsciiChar(#32);
  AsciiDEL  = AsciiChar(#127);
  AsciiXON  = AsciiDC1;
  AsciiXOFF = AsciiDC3;

  AsciiCRLF = AsciiCR + AsciiLF;

  AsciiDecimalPoint = AsciiChar(#46);
  AsciiComma        = AsciiChar(#44);
  AsciiBackSlash    = AsciiChar(#92);
  AsciiForwardSlash = AsciiChar(#47);
  AsciiPercent      = AsciiChar(#37);
  AsciiAmpersand    = AsciiChar(#38);
  AsciiPlus         = AsciiChar(#43);
  AsciiMinus        = AsciiChar(#45);
  AsciiEqualSign    = AsciiChar(#61);
  AsciiSingleQuote  = AsciiChar(#39);
  AsciiDoubleQuote  = AsciiChar(#34);

  AsciiDigit0 = AsciiChar(#48);
  AsciiDigit9 = AsciiChar(#57);
  AsciiUpperA = AsciiChar(#65);
  AsciiUpperZ = AsciiChar(#90);
  AsciiLowerA = AsciiChar(#97);
  AsciiLowerZ = AsciiChar(#122);

  AsciiLowCaseLookup: Array[AsciiChar] of AsciiChar = (
    #$00, #$01, #$02, #$03, #$04, #$05, #$06, #$07,
    #$08, #$09, #$0A, #$0B, #$0C, #$0D, #$0E, #$0F,
    #$10, #$11, #$12, #$13, #$14, #$15, #$16, #$17,
    #$18, #$19, #$1A, #$1B, #$1C, #$1D, #$1E, #$1F,
    #$20, #$21, #$22, #$23, #$24, #$25, #$26, #$27,
    #$28, #$29, #$2A, #$2B, #$2C, #$2D, #$2E, #$2F,
    #$30, #$31, #$32, #$33, #$34, #$35, #$36, #$37,
    #$38, #$39, #$3A, #$3B, #$3C, #$3D, #$3E, #$3F,
    #$40, #$61, #$62, #$63, #$64, #$65, #$66, #$67,
    #$68, #$69, #$6A, #$6B, #$6C, #$6D, #$6E, #$6F,
    #$70, #$71, #$72, #$73, #$74, #$75, #$76, #$77,
    #$78, #$79, #$7A, #$5B, #$5C, #$5D, #$5E, #$5F,
    #$60, #$61, #$62, #$63, #$64, #$65, #$66, #$67,
    #$68, #$69, #$6A, #$6B, #$6C, #$6D, #$6E, #$6F,
    #$70, #$71, #$72, #$73, #$74, #$75, #$76, #$77,
    #$78, #$79, #$7A, #$7B, #$7C, #$7D, #$7E, #$7F,
    #$80, #$81, #$82, #$83, #$84, #$85, #$86, #$87,
    #$88, #$89, #$8A, #$8B, #$8C, #$8D, #$8E, #$8F,
    #$90, #$91, #$92, #$93, #$94, #$95, #$96, #$97,
    #$98, #$99, #$9A, #$9B, #$9C, #$9D, #$9E, #$9F,
    #$A0, #$A1, #$A2, #$A3, #$A4, #$A5, #$A6, #$A7,
    #$A8, #$A9, #$AA, #$AB, #$AC, #$AD, #$AE, #$AF,
    #$B0, #$B1, #$B2, #$B3, #$B4, #$B5, #$B6, #$B7,
    #$B8, #$B9, #$BA, #$BB, #$BC, #$BD, #$BE, #$BF,
    #$C0, #$C1, #$C2, #$C3, #$C4, #$C5, #$C6, #$C7,
    #$C8, #$C9, #$CA, #$CB, #$CC, #$CD, #$CE, #$CF,
    #$D0, #$D1, #$D2, #$D3, #$D4, #$D5, #$D6, #$D7,
    #$D8, #$D9, #$DA, #$DB, #$DC, #$DD, #$DE, #$DF,
    #$E0, #$E1, #$E2, #$E3, #$E4, #$E5, #$E6, #$E7,
    #$E8, #$E9, #$EA, #$EB, #$EC, #$ED, #$EE, #$EF,
    #$F0, #$F1, #$F2, #$F3, #$F4, #$F5, #$F6, #$F7,
    #$F8, #$F9, #$FA, #$FB, #$FC, #$FD, #$FE, #$FF);



{                                                                              }
{ AnsiChar constants                                                           }
{                                                                              }
const
  { Common characters }
  chTab          = AsciiHT;
  chSpace        = AsciiSP;
  chDecimalPoint = AnsiChar('.');
  chComma        = AnsiChar(',');
  chBackSlash    = AnsiChar('\');
  chForwardSlash = AnsiChar('/');
  chPercent      = AnsiChar('%');
  chAmpersand    = AnsiChar('&');
  chPlus         = AnsiChar('+');
  chMinus        = AnsiChar('-');
  chEqual        = AnsiChar('=');
  chLessThan     = AnsiChar('<');
  chGreaterThan  = AnsiChar('>');
  chSingleQuote  = AnsiChar('''');
  chDoubleQuote  = AnsiChar('"');
  chExclamation  = AnsiChar('!');
  chHash         = AnsiChar('#');
  chDollar       = AnsiChar('$');
  chCaret        = AnsiChar('^');
  chAsterisk     = AnsiChar('*');

  { Common sequences }
  CRLF        = AsciiCR + AsciiLF;
  LFCR        = AsciiLF + AsciiCR;
  DosNewLine  = CRLF;
  UnixNewLine = AsciiLF;

  { Character sets }
  csComplete        = [#0..#255];
  csAnsi            = [#0..#255];
  csAscii           = [#0..#127];
  csNotAscii        = csComplete - csAscii;
  csAsciiCtl        = [#0..#31];
  csAsciiText       = [#32..#127];
  csAlphaLow        = ['a'..'z'];
  csAlphaUp         = ['A'..'Z'];
  csAlpha           = csAlphaLow + csAlphaUp;
  csNotAlpha        = csComplete - csAlpha;
  csNumeric         = ['0'..'9'];
  csNotNumeric      = csComplete - csNumeric;
  csAlphaNumeric    = csNumeric + csAlpha;
  csNotAlphaNumeric = csComplete - csAlphaNumeric;
  csWhiteSpace      = csAsciiCtl + [AsciiSP];
  csSign            = [chPlus, chMinus];
  csExponent        = ['E', 'e'];
  csBinaryDigit     = ['0'..'1'];
  csOctalDigit      = ['0'..'7'];
  csHexDigitLow     = csNumeric + ['a'..'f'];
  csHexDigitUp      = csNumeric + ['A'..'F'];
  csHexDigit        = csNumeric + ['A'..'F', 'a'..'f'];
  csQuotes          = [chSingleQuote, chDoubleQuote];
  csParentheses     = ['(', ')'];
  csCurlyBrackets   = ['{', '}'];
  csBlockBrackets   = ['[', ']'];
  csPunctuation     = ['.', ',', ':', '/', '?', '<', '>', ';', '"', '''',
                       '[', ']', '{', '}', '+', '=', '-', '\', '(', ')',
                       '*', '&', '^', '%', '$', '#', '@', '!', '`', '~'];
  csSlash           = [chBackSlash, chForwardSlash];



{                                                                              }
{ WideChar constants                                                           }
{                                                                              }
const
  WideNULL = WideChar(#0);
  WideSOH  = WideChar(#1);
  WideSTX  = WideChar(#2);
  WideETX  = WideChar(#3);
  WideEOT  = WideChar(#4);
  WideENQ  = WideChar(#5);
  WideACK  = WideChar(#6);
  WideBEL  = WideChar(#7);
  WideBS   = WideChar(#8);
  WideHT   = WideChar(#9);
  WideLF   = WideChar(#10);
  WideVT   = WideChar(#11);
  WideFF   = WideChar(#12);
  WideCR   = WideChar(#13);
  WideSO   = WideChar(#14);
  WideSI   = WideChar(#15);
  WideDLE  = WideChar(#16);
  WideDC1  = WideChar(#17);
  WideDC2  = WideChar(#18);
  WideDC3  = WideChar(#19);
  WideDC4  = WideChar(#20);
  WideNAK  = WideChar(#21);
  WideSYN  = WideChar(#22);
  WideETB  = WideChar(#23);
  WideCAN  = WideChar(#24);
  WideEM   = WideChar(#25);
  WideEOF  = WideChar(#26);
  WideESC  = WideChar(#27);
  WideFS   = WideChar(#28);
  WideGS   = WideChar(#29);
  WideRS   = WideChar(#30);
  WideUS   = WideChar(#31);
  WideSP   = WideChar(#32);
  WideDEL  = WideChar(#127);
  WideXON  = WideDC1;
  WideXOFF = WideDC3;
  {$IFNDEF DELPHI5}
  // Both definitions below for WideCRLF fail with Delphi 5
  {$IFDEF DELPHI7_DOWN}
  WideCRLF = WideString(WideCR) + WideString(WideLF);
  {$ELSE}
  WideCRLF = WideCR + WideLF;
  {$ENDIF}{$ENDIF}

  WideNoBreakSpace       = WideChar(#$00A0);
  WideLineSeparator      = WideChar(#$2028);
  WideParagraphSeparator = WideChar(#$2029);

  WideBOM_MSB_First      = WideChar(#$FFFE);
  WideBOM_LSB_First      = WideChar(#$FEFF);

  WideObjectReplacement  = WideChar(#$FFFC);
  WideCharReplacement    = WideChar(#$FFFD);
  WideInvalid            = WideChar(#$FFFF);

  WideCopyrightSign      = WideChar(#$00A9);
  WideRegisteredSign     = WideChar(#$00AE);

  WideHighSurrogateFirst        = WideChar(#$D800);
  WideHighSurrogateLast         = WideChar(#$DB7F);
  WideLowSurrogateFirst         = WideChar(#$DC00);
  WideLowSurrogateLast          = WideChar(#$DFFF);
  WidePrivateHighSurrogateFirst = WideChar(#$DB80);
  WidePrivateHighSurrogateLast  = WideChar(#$DBFF);



{                                                                              }
{ UCS4 constants                                                               }
{                                                                              }
const
  Ucs4NULL             = UCS4Char(AsciiNULL);
  Ucs4HT               = UCS4Char(AsciiHT);
  Ucs4LF               = UCS4Char(AsciiLF);
  Ucs4CR               = UCS4Char(AsciiCR);
  Ucs4StringTerminator = UCS4Char($9C);



{                                                                              }
{ Zero terminated string pointer                                               }
{                                                                              }
{$IFNDEF ManagedCode}
function  StrZLenA(const S: PAnsiChar): Integer;
function  StrZLenW(const S: PWideChar): Integer;
{$ENDIF}



{                                                                              }
{ ASCII case conversion                                                        }
{                                                                              }
function  AsciiLowCaseA(const C: AnsiChar): AnsiChar;
function  AsciiLowCaseW(const C: WideChar): WideChar;

function  AsciiUpCaseA(const C: AnsiChar): AnsiChar;
function  AsciiUpCaseW(const C: WideChar): WideChar;

procedure AsciiConvertUpperA(var S: AnsiString);
procedure AsciiConvertUpperW(var S: WideString);

procedure AsciiConvertLowerA(var S: AnsiString);
procedure AsciiConvertLowerW(var S: WideString);

procedure AsciiConvertFirstUp(var S: AsciiString);
function  AsciiFirstUp(const S: AsciiString): AsciiString;

procedure AsciiConvertArrayUpper(var S: AsciiStringArray);
procedure AsciiConvertArrayLower(var S: AsciiStringArray);



{                                                                              }
{ ASCII string                                                                 }
{                                                                              }
function  IsAsciiCharA(const C: AnsiChar): Boolean; {$IFDEF UseInline}inline;{$ENDIF}
function  IsAsciiCharW(const C: WideChar): Boolean; {$IFDEF UseInline}inline;{$ENDIF}

function  IsAsciiStringA(const S: AnsiString): Boolean;
function  IsAsciiStringW(const S: WideString): Boolean;
function  IsAsciiString(const S: String): Boolean; {$IFDEF UseInline}inline;{$ENDIF}



{                                                                              }
{ Compare                                                                      }
{                                                                              }
{   Returns  -1  if A < B                                                      }
{             0  if A = B                                                      }
{             1  if A > B                                                      }
{                                                                              }
function  CharCompareA(const A, B: AnsiChar): Integer; {$IFDEF UseInline}inline;{$ENDIF}
function  CharCompareW(const A, B: WideChar): Integer; {$IFDEF UseInline}inline;{$ENDIF}
function  CharCompare(const A, B: Char): Integer;      {$IFDEF UseInline}inline;{$ENDIF}

function  CharCompareNoAsciiCaseA(const A, B: AnsiChar): Integer; {$IFDEF UseInline}inline;{$ENDIF}
function  CharCompareNoAsciiCaseW(const A, B: WideChar): Integer; {$IFDEF UseInline}inline;{$ENDIF}

function  CharEqualNoAsciiCaseA(const A, B: AnsiChar): Boolean;  {$IFDEF UseInline}inline;{$ENDIF}
function  CharEqualNoAsciiCaseW(const A, B: WideChar): Boolean;  {$IFDEF UseInline}inline;{$ENDIF}

{$IFDEF ManagedCode}
function  StrPCompareA(const A, B: AnsiString; const Len: Integer): Integer;
function  StrPCompareNoAsciiCaseA(const A, B: AnsiString; const Len: Integer): Integer;
{$ELSE}
function  StrPCompareA(const A, B: PAnsiChar; const Len: Integer): Integer;
function  StrPCompareW(const A, B: PWideChar; const Len: Integer): Integer;

function  StrPCompareNoAsciiCaseA(const A, B: PAnsiChar; const Len: Integer): Integer;
function  StrPCompareNoAsciiCaseW(const A, B: PWideChar; const Len: Integer): Integer;
{$ENDIF}

function  StrCompareA(const A, B: AnsiString): Integer;
function  StrCompareW(const A, B: WideString): Integer;

function  StrCompareNoAsciiCaseA(const A, B: AnsiString): Integer;
function  StrCompareNoAsciiCaseW(const A, B: WideString): Integer;



{                                                                              }
{ Match                                                                        }
{                                                                              }
function  CharMatchNoAsciiCaseA(const A, B: AnsiChar): Boolean;
function  CharMatchNoAsciiCaseW(const A, B: WideChar): Boolean;

function  CharMatchA(const A, B: AnsiChar; const AsciiCaseSensitive: Boolean = True): Boolean;
function  CharMatchW(const A, B: WideChar; const AsciiCaseSensitive: Boolean = True): Boolean;

function  CharSetMatchCharA(const A: CharSet; const B: AnsiChar; const AsciiCaseSensitive: Boolean = True): Boolean;

{$IFNDEF ManagedCode}
function  StrPMatchA(const A, B: PAnsiChar; const Len: Integer): Boolean; overload;
function  StrPMatchW(const A, B: PWideChar; const Len: Integer): Boolean; overload;

function  StrPMatchA(const S, M: PAnsiChar; const LenS, LenM: Integer): Boolean; overload;
function  StrPMatchW(const S, M: PWideChar; const LenS, LenM: Integer): Boolean; overload;

function  StrPMatchStr(const S: PAnsiChar; const Len: Integer; const M: AnsiString): Boolean;

function  StrPMatchNoAsciiCaseA(const A, B: PAnsiChar; const Len: Integer): Boolean;
function  StrPMatchNoAsciiCaseW(const A, B: PWideChar; const Len: Integer): Boolean;

function  StrPMatchLenA(const P: PAnsiChar; const Len: Integer; const M: CharSet): Integer;
function  StrPMatchLenW(const P: PWideChar; const Len: Integer; const M: CharSet): Integer;

function  StrPMatchCharA(const P: PAnsiChar; const Len: Integer; const M: CharSet): Boolean;
function  StrPMatchCharW(const P: PWideChar; const Len: Integer; const M: CharSet): Boolean;

function  StrZMatchStr(const P: PAnsiChar; const M: AnsiString): Boolean; overload;
function  StrZMatchStrNoCase(const P: PAnsiChar; const M: AnsiString): Boolean;
function  StrZMatchStr(const P: PAnsiChar; const M: AnsiString; const AsciiCaseSensitive: Boolean): Boolean; overload;
{$ENDIF}

function  StrMatchA(const S, M: AnsiString; const Index: Integer = 1): Boolean;
function  StrMatchW(const S, M: WideString; const Index: Integer): Boolean;
function  StrMatch(const S, M: String; const Index: Integer): Boolean;

function  StrMatchNoAsciiCaseA(const S, M: AnsiString; const Index: Integer = 1): Boolean;
function  StrMatchNoAsciiCaseW(const S, M: WideString; const Index: Integer = 1): Boolean;

function  StrMatchLeftA(const S, M: AnsiString; const AsciiCaseSensitive: Boolean = True): Boolean;
function  StrMatchLeftW(const S, M: WideString; const AsciiCaseSensitive: Boolean = True): Boolean;

function  StrMatchRightA(const S, M: AnsiString; const AsciiCaseSensitive: Boolean = True): Boolean;
function  StrMatchRightW(const S, M: WideString; const AsciiCaseSensitive: Boolean = True): Boolean;

function  StrMatchLenA(const S: AnsiString; const M: CharSet; const Index: Integer = 1): Integer;
function  StrMatchLenW(const S: WideString; const M: CharSet; const Index: Integer = 1): Integer;

function  StrMatchCharA(const S: AnsiString; const M: CharSet): Boolean;
function  StrMatchCharW(const S: WideString; const M: CharSet): Boolean;



{                                                                              }
{ Equal                                                                        }
{                                                                              }
{$IFNDEF ManagedCode}
function  StrPEqual(const P1, P2: PAnsiChar; const Len1, Len2: Integer; const AsciiCaseSensitive: Boolean = True): Boolean;
function  StrPEqualStr(const P: PAnsiChar; const Len: Integer; const S: AnsiString; const AsciiCaseSensitive: Boolean = True): Boolean;
{$ENDIF}

function  StrEqualA(const A, B: AnsiString; const AsciiCaseSensitive: Boolean = True): Boolean;
function  StrEqualW(const A, B: WideString; const AsciiCaseSensitive: Boolean = True): Boolean;
function  StrEqual(const A, B: String; const AsciiCaseSensitive: Boolean = True): Boolean;

function  StrEqualNoAsciiCaseA(const A, B: AnsiString): Boolean;
function  StrEqualNoAsciiCaseW(const A, B: WideString): Boolean;
function  StrEqualNoAsciiCase(const A, B: String): Boolean; {$IFDEF UseInline}inline;{$ENDIF}



{                                                                              }
{ Validation                                                                   }
{                                                                              }
function  StrIsNumeric(const S: AnsiString): Boolean;
function  StrIsHex(const S: AnsiString): Boolean;
function  StrIsAlpha(const S: AnsiString): Boolean;
function  StrIsAlphaNumeric(const S: AnsiString): Boolean;
function  StrIsInteger(const S: AnsiString): Boolean;



{                                                                              }
{ Pos                                                                          }
{                                                                              }
{$IFNDEF ManagedCode}
function  StrPPosChar(const F: AnsiChar; const S: PAnsiChar; const Len: Integer): Integer; overload;
function  StrPPosChar(const F: CharSet; const S: PAnsiChar; const Len: Integer): Integer; overload;
function  StrPPos(const F, S: PAnsiChar; const LenF, LenS: Integer): Integer;
function  StrPPosStr(const F: String; const S: PAnsiChar; const Len: Integer): Integer;

function  StrZPosChar(const F: AnsiChar; const S: PAnsiChar): Integer;
{$ENDIF}

function  PosCharA(const F: AnsiChar; const S: AnsiString; const Index: Integer = 1): Integer;
function  PosCharW(const F: WideChar; const S: WideString; const Index: Integer = 1): Integer;
function  PosChar(const F: Char; const S: String; const Index: Integer = 1): Integer;

function  PosCharSetA(const F: CharSet; const S: AnsiString; const Index: Integer = 1): Integer;
function  PosCharSetW(const F: CharSet; const S: WideString; const Index: Integer = 1): Integer;

function  PosNotCharA(const F: AnsiChar; const S: AnsiString; const Index: Integer = 1): Integer;
function  PosNotCharW(const F: WideChar; const S: WideString; const Index: Integer): Integer;
function  PosNotChar(const F: Char; const S: String; const Index: Integer): Integer;

function  PosNotCharSetA(const F: CharSet; const S: AnsiString; const Index: Integer = 1): Integer;

function  PosCharRevA(const F: AnsiChar; const S: AnsiString; const Index: Integer = 1): Integer;
function  PosCharRevW(const F: WideChar; const S: WideString; const Index: Integer): Integer;
function  PosCharRev(const F: Char; const S: String; const Index: Integer): Integer;

function  PosCharSetRevA(const F: CharSet; const S: AnsiString; const Index: Integer = 1): Integer;
function  PosCharSetRevW(const F: CharSet; const S: WideString; const Index: Integer = 1): Integer;

function  PosStrA(const F, S: AnsiString; const Index: Integer = 1; const AsciiCaseSensitive: Boolean = True): Integer;
function  PosStrW(const F, S: WideString; const Index: Integer = 1; 
  const AsciiCaseSensitive: Boolean = True;
  const WholeWords: Boolean = False): Integer; //AT

function  PosStrRevA(const F, S: AnsiString; const Index: Integer = 1; const AsciiCaseSensitive: Boolean = True): Integer;
function  PosStrRevW(const F, S: WideString; const Index: Integer = 1; const AsciiCaseSensitive: Boolean = True): Integer;

function  PosStrRevIdxA(const F, S: AnsiString; const Index: Integer = 1; const AsciiCaseSensitive: Boolean = True): Integer;

function  PosNStrA(const F, S: AnsiString; const N: Integer; const Index: Integer = 1; const AsciiCaseSensitive: Boolean = True): Integer;



{                                                                              }
{ Copy                                                                         }
{                                                                              }
{   Out-of-range values of StartIndex, StopIndex and Count are clipped.        }
{   These variants return a reference to the existing string if possible.      }
{                                                                              }
function  CopyRangeW(const S: WideString; const StartIndex, StopIndex: Integer): WideString;
function  CopyRangeA(const S: AnsiString; const StartIndex, StopIndex: Integer): AnsiString;
function  CopyRange(const S: String; const StartIndex, StopIndex: Integer): String;

function  CopyFromW(const S: WideString; const Index: Integer): WideString;
function  CopyFromA(const S: AnsiString; const Index: Integer): AnsiString;
function  CopyFrom(const S: String; const Index: Integer): String;

function  CopyLeftW(const S: WideString; const Count: Integer): WideString;
function  CopyLeftA(const S: AnsiString; const Count: Integer): AnsiString;
function  CopyLeft(const S: String; const Count: Integer): String;

function  CopyRightW(const S: WideString; const Count: Integer): WideString;
function  CopyRightA(const S: AnsiString; const Count: Integer): AnsiString;
function  CopyRight(const S: String; const Count: Integer): String;

function  CopyLeftEllipsed(const S: AnsiString; const Count: Integer): AnsiString;



{                                                                              }
{ CopyEx                                                                       }
{                                                                              }
{   CopyEx functions extend Copy so that negative Start/Stop values reference  }
{   indexes from the end of the string, eg. -2 will reference the second last  }
{   character in the string.                                                   }
{                                                                              }
function  CopyExA(const S: AnsiString; const Start, Count: Integer): AnsiString;
function  CopyExW(const S: String; const Start, Count: Integer): String;
function  CopyEx(const S: String; const Start, Count: Integer): String;

function  CopyRangeEx(const S: String; const Start, Stop: Integer): String;
function  CopyRangeExA(const S: AnsiString; const Start, Stop: Integer): AnsiString;
function  CopyRangeExW(const S: WideString; const Start, Stop: Integer): WideString;

function  CopyFromExA(const S: AnsiString; const Start: Integer): AnsiString;
function  CopyFromExW(const S: WideString; const Start: Integer): WideString;
function  CopyFromEx(const S: String; const Start: Integer): String;



{                                                                              }
{ Trim                                                                         }
{                                                                              }
function  StrTrimLeftA(const S: AnsiString; const C: CharSet{$IFNDEF CLR} = csWhiteSpace{$ENDIF}): AnsiString;
function  StrTrimLeftW(const S: WideString; const C: CharSet{$IFNDEF CLR} = csWhiteSpace{$ENDIF}): WideString;
function  StrTrimLeft(const S: String;      const C: CharSet{$IFNDEF CLR} = csWhiteSpace{$ENDIF}): String;

procedure StrTrimLeftInPlace(var S: AnsiString; const C: CharSet{$IFNDEF CLR} = csWhiteSpace{$ENDIF});

function  StrTrimLeftStrNoCase(const S: AnsiString; const TrimStr: AnsiString): AnsiString;

function  StrTrimRightA(const S: AnsiString; const C: CharSet{$IFNDEF CLR} = csWhiteSpace{$ENDIF}): AnsiString;
function  StrTrimRightW(const S: WideString; const C: CharSet{$IFNDEF CLR} = csWhiteSpace{$ENDIF}): WideString;
function  StrTrimRight(const S: String;      const C: CharSet{$IFNDEF CLR} = csWhiteSpace{$ENDIF}): String;

procedure StrTrimRightInPlace(var S: AnsiString; const C: CharSet{$IFNDEF CLR} = csWhiteSpace{$ENDIF});

function  StrTrimRightStrNoCase(const S: AnsiString; const TrimStr: AnsiString): AnsiString;

function  StrTrimA(const S: AnsiString; const C: CharSet): AnsiString;
function  StrTrimW(const S: WideString; const C: CharSet): WideString;
function  StrTrim(const S: String; const C: CharSet): String; overload;

procedure StrTrimInPlace(var S: AnsiString; const C: CharSet{$IFNDEF CLR} = csWhiteSpace{$ENDIF});

procedure TrimStrings(var S: AnsiStringArray; const C: CharSet{$IFNDEF CLR} = csWhiteSpace{$ENDIF}); overload;



{                                                                              }
{ Duplicate                                                                    }
{                                                                              }
{$IFNDEF CLR}
function  BufToStrA(const Buf; const BufSize: Integer): AnsiString;
function  BufToStrW(const Buf; const BufSize: Integer): WideString;

function  DupBufA(const Buf; const BufSize: Integer; const Count: Integer): AnsiString;
function  DupBufW(const Buf; const BufSize: Integer; const Count: Integer): WideString;
{$ENDIF}

function  DupStrA(const S: AnsiString; const Count: Integer): AnsiString;
function  DupStrW(const S: WideString; const Count: Integer): WideString;

function  DupCharA(const Ch: AnsiChar; const Count: Integer): AnsiString;
function  DupCharW(const Ch: WideChar; const Count: Integer): WideString;
function  DupChar(const Ch: Char; const Count: Integer): String;

function  DupSpaceA(const Count: Integer): AnsiString;
function  DupSpaceW(const Count: Integer): WideString;
function  DupSpace(const Count: Integer): String;



{                                                                              }
{ Pad                                                                          }
{                                                                              }
function  StrPadA(const S: AnsiString; const PadChar: AnsiChar; const Len: Integer;
          const Cut: Boolean = False): AnsiString;
function  StrPadW(const S: WideString; const PadChar: WideChar; const Len: Integer;
          const Cut: Boolean = False): WideString;
function  StrPad(const S: String; const PadChar: Char; const Len: Integer;
          const Cut: Boolean = False): String;

function  StrPadLeftA(const S: AnsiString; const PadChar: AnsiChar;
          const Len: Integer; const Cut: Boolean = False): AnsiString;

function  StrPadRightA(const S: AnsiString; const PadChar: AnsiChar;
          const Len: Integer; const Cut: Boolean = False): AnsiString;



{                                                                              }
{ Delimited                                                                    }
{                                                                              }
function  StrBetweenChar(const S: AnsiString;
          const FirstDelim, SecondDelim: AnsiChar;
          const FirstOptional: Boolean = False;
          const SecondOptional: Boolean = False): AnsiString; overload;
function  StrBetweenChar(const S: AnsiString;
          const FirstDelim, SecondDelim: CharSet;
          const FirstOptional: Boolean = False;
          const SecondOptional: Boolean = False): AnsiString; overload;
function  StrBetween(const S: AnsiString;
          const FirstDelim: AnsiString; const SecondDelim: CharSet;
          const FirstOptional: Boolean = False;
          const SecondOptional: Boolean = False;
          const FirstDelimAsciiCaseSensitive: Boolean = True): AnsiString; overload;
function  StrBetween(const S: AnsiString;
          const FirstDelim, SecondDelim: AnsiString;
          const FirstOptional: Boolean = False;
          const SecondOptional: Boolean = False;
          const FirstDelimAsciiCaseSensitive: Boolean = True;
          const SecondDelimAsciiCaseSensitive: Boolean = True): AnsiString; overload;
function  StrBefore(const S, D: AnsiString;
          const Optional: Boolean = True;
          const AsciiCaseSensitive: Boolean = True): AnsiString;
function  StrBeforeRev(const S, D: AnsiString;
          const Optional: Boolean = True;
          const AsciiCaseSensitive: Boolean = True): AnsiString;
function  StrBeforeChar(const S: AnsiString; const D: AnsiChar;
          const Optional: Boolean = True): AnsiString; overload;
function  StrBeforeChar(const S: AnsiString; const D: CharSet;
          const Optional: Boolean = True): AnsiString; overload;
function  StrBeforeCharRev(const S: AnsiString; const D: CharSet;
          const Optional: Boolean = True): AnsiString;
function  StrAfter(const S, D: AnsiString;
          const Optional: Boolean = False): AnsiString;
function  StrAfterRev(const S, D: AnsiString;
          const Optional: Boolean = False): AnsiString;
function  StrAfterChar(const S: AnsiString;
          const D: CharSet): AnsiString; overload;
function  StrAfterChar(const S: AnsiString;
          const D: AnsiChar): AnsiString; overload;

function  StrCopyToChar(const S: AnsiString; const D: CharSet;
          const Optional: Boolean = True): AnsiString; overload;
function  StrCopyToChar(const S: AnsiString; const D: AnsiChar;
          const Optional: Boolean = True): AnsiString; overload;
function  StrCopyFromChar(const S: AnsiString;
          const D: CharSet): AnsiString; overload;
function  StrCopyFromChar(const S: AnsiString;
          const D: AnsiChar): AnsiString; overload;

function  StrRemoveCharDelimited(var S: AnsiString;
          const FirstDelim, SecondDelim: AnsiChar): AnsiString;



{                                                                              }
{ Count                                                                        }
{                                                                              }
function  StrCountChar(const S: AnsiString; const C: AnsiChar): Integer; overload;
function  StrCountChar(const S: AnsiString; const C: CharSet): Integer; overload;



{                                                                              }
{ Replace                                                                      }
{                                                                              }
function  StrReplaceCharA(const Find, Replace: AnsiChar; const S: AnsiString): AnsiString; overload;
function  StrReplaceCharW(const Find, Replace: WideChar; const S: WideString): WideString; overload;
function  StrReplaceChar(const Find, Replace: Char; const S: String): String;

function  StrReplaceCharA(const Find: CharSet; const Replace: AnsiChar; const S: AnsiString): AnsiString; overload;
function  StrReplaceCharW(const Find: CharSet; const Replace: WideChar; const S: WideString): WideString; overload;

function  StrReplaceA(const Find, Replace, S: AnsiString; const AsciiCaseSensitive: Boolean = True): AnsiString; overload;
//AT
function  StrReplaceW(const Find, Replace, S: WideString): Widestring; overload;
function  StrReplaceW(const Find, Replace, S: WideString;
  const AsciiCaseSensitive: Boolean;
  const WholeWords: Boolean;
  FromPos: integer;
  var ReplaceCnt: integer): WideString; overload;

{$IFNDEF CLR}
function  StrReplaceA(const Find: CharSet; const Replace, S: AnsiString): AnsiString; overload;
function  StrReplaceW(const Find: CharSet; const Replace, S: WideString): WideString; overload;
{$ENDIF}

function  StrRemoveDup(const S: AnsiString; const C: AnsiChar): AnsiString;

function  StrRemoveCharA(const S: AnsiString; const C: AnsiChar): AnsiString;

{$IFNDEF CLR}
function  StrRemoveCharSetA(const S: AnsiString; const C: CharSet): AnsiString;
{$ENDIF}



{                                                                              }
{ Split                                                                        }
{                                                                              }
function  StrSplitAtA(const S: AnsiString; const C: AnsiString;
          var Left, Right: AnsiString;
          const AsciiCaseSensitive: Boolean = True;
          const Optional: Boolean = True): Boolean;
function  StrSplitAtW(const S: WideString; const C: WideString;
          var Left, Right: WideString;
          const AsciiCaseSensitive: Boolean = True;
          const Optional: Boolean = True): Boolean;

function  StrSplitAtCharA(const S: AnsiString; const C: AnsiChar;
          var Left, Right: AnsiString;
          const Optional: Boolean = True): Boolean;
function  StrSplitAtCharW(const S: WideString; const C: WideChar;
          var Left, Right: WideString;
          const Optional: Boolean = True): Boolean;

function  StrSplitAtCharSetA(const S: AnsiString; const C: CharSet;
          var Left, Right: AnsiString;
          const Optional: Boolean = True): Boolean;

function  StrSplitA(const S, D: AnsiString): AnsiStringArray;
function  StrSplitW(const S, D: WideString): WideStringArray;

function  StrSplitCharA(const S: AnsiString; const D: AnsiChar): AnsiStringArray;
function  StrSplitCharW(const S: WideString; const D: WideChar): WideStringArray;

function  StrSplitCharSetA(const S: AnsiString; const D: CharSet): AnsiStringArray;
function  StrSplitCharSetW(const S: WideString; const D: CharSet): WideStringArray;

{$IFNDEF CLR}
function  StrSplitWords(const S: AnsiString; const C: CharSet): AnsiStringArray;
{$ENDIF}

function  StrJoinA(const S: Array of AnsiString; const D: AnsiString): AnsiString;
function  StrJoinW(const S: Array of WideString; const D: WideString): WideString;

function  StrJoinCharA(const S: Array of AnsiString; const D: AnsiChar): AnsiString;
function  StrJoinCharW(const S: Array of WideString; const D: WideChar): WideString;



{                                                                              }
{ Quoting                                                                      }
{                                                                              }
{   QuoteText, UnquoteText converts text where the string is enclosed in a     }
{   pair of the same quote characters, and two consequetive occurance of the   }
{   quote character inside the quotes indicate a quote character in the text.  }
{   Examples:                                                                  }
{                                                                              }
{     StrQuote ('abc', '"') = '"abc"'                                          }
{     StrQuote ('a"b"c', '"') = '"a""b""c"'                                    }
{     StrUnquote ('"a""b""c"') = 'a"b"c'                                       }
{                                                                              }
function  StrHasSurroundingQuotesA(const S: AnsiString;
          const Quotes: CharSet{$IFNDEF CLR} = csQuotes{$ENDIF}): Boolean;
function  StrHasSurroundingQuotesW(const S: WideString;
          const Quotes: CharSet{$IFNDEF CLR} = csQuotes{$ENDIF}): Boolean;

function  StrRemoveSurroundingQuotesA(const S: AnsiString;
          const Quotes: CharSet{$IFNDEF CLR} = csQuotes{$ENDIF}): AnsiString;
function  StrRemoveSurroundingQuotesW(const S: WideString;
          const Quotes: CharSet{$IFNDEF CLR} = csQuotes{$ENDIF}): WideString;

function  StrQuoteA(const S: AnsiString; const Quote: AnsiChar = '"'): AnsiString;
function  StrQuoteW(const S: WideString; const Quote: WideChar = '"'): WideString;

function  StrUnquoteA(const S: AnsiString): AnsiString;
function  StrUnquoteW(const S: WideString): WideString;

function  StrMatchQuotedStr(const S: AnsiString;
          const ValidQuotes: CharSet{$IFNDEF CLR} = csQuotes{$ENDIF};
          const Index: Integer = 1): Integer;

function  StrIsQuotedStr(const S: AnsiString;
          const ValidQuotes: CharSet{$IFNDEF CLR} = csQuotes{$ENDIF}): Boolean;

function  StrFindClosingQuote(const S: AnsiString;
          const OpenQuotePos: Integer): Integer;



{                                                                              }
{ Bracketing                                                                   }
{                                                                              }
function  StrFindClosingBracket(const S: AnsiString;
          const OpenBracketPos: Integer; const CloseBracket: AnsiChar): Integer;



{                                                                              }
{ Escaping                                                                     }
{                                                                              }
function  StrHexEscape(const S: AnsiString; const C: CharSet;
          const EscPrefix: AnsiString = '\x'; const EscSuffix: AnsiString = '';
          const UpperHex: Boolean = True;
          const TwoDigitHex: Boolean = True): AnsiString;
function  StrHexUnescape(const S: AnsiString; const EscPrefix: AnsiString = '\x';
          const AsciiCaseSensitive: Boolean = True): AnsiString;

function  StrCharEscape(const S: AnsiString; const C: Array of AnsiChar;
          const EscPrefix: AnsiString;
          const EscSeq: Array of AnsiString): AnsiString;
function  StrCharUnescape(const S: AnsiString; const EscPrefix: AnsiString;
          const C: Array of AnsiChar; const Replace: Array of AnsiString;
          const PrefixAsciiCaseSensitive: Boolean = True;
          const AlwaysDropPrefix: Boolean = True): AnsiString;

function  StrCStyleEscape(const S: AnsiString): AnsiString;
function  StrCStyleUnescape(const S: AnsiString): AnsiString;



{                                                                              }
{ Prefix and Suffix                                                            }
{                                                                              }
function  StrInclPrefixA(const S: AnsiString; const Prefix: AnsiString;
          const AsciiCaseSensitive: Boolean = True): AnsiString;
function  StrInclPrefixW(const S: WideString; const Prefix: WideString;
          const AsciiCaseSensitive: Boolean = True): WideString;

function  StrInclSuffixA(const S: AnsiString; const Suffix: AnsiString;
          const AsciiCaseSensitive: Boolean = True): AnsiString;
function  StrInclSuffixW(const S: WideString; const Suffix: WideString;
          const AsciiCaseSensitive: Boolean = True): WideString;

function  StrExclPrefixA(const S: AnsiString; const Prefix: AnsiString;
          const AsciiCaseSensitive: Boolean = True): AnsiString;
function  StrExclPrefixW(const S: WideString; const Prefix: WideString;
          const AsciiCaseSensitive: Boolean = True): WideString;

function  StrExclSuffixA(const S: AnsiString; const Suffix: AnsiString;
          const AsciiCaseSensitive: Boolean = True): AnsiString;
function  StrExclSuffixW(const S: WideString; const Suffix: WideString;
          const AsciiCaseSensitive: Boolean = True): WideString;

procedure StrEnsurePrefixA(var S: AnsiString; const Prefix: AnsiString;
          const AsciiCaseSensitive: Boolean = True);
procedure StrEnsurePrefixW(var S : WideString; const Prefix: WideString;
          const AsciiCaseSensitive: Boolean = True);

procedure StrEnsureSuffixA(var S: AnsiString; const Suffix: AnsiString;
          const AsciiCaseSensitive: Boolean = True);
procedure StrEnsureSuffixW(var S : WideString; const Suffix: WideString;
          const AsciiCaseSensitive: Boolean = True);

procedure StrEnsureNoPrefixA(var S: AnsiString; const Prefix: AnsiString;
          const AsciiCaseSensitive: Boolean = True);
procedure StrEnsureNoPrefixW(var S : WideString; const Prefix: WideString;
          const AsciiCaseSensitive: Boolean = True);

procedure StrEnsureNoSuffixA(var S: AnsiString; const Suffix: AnsiString;
          const AsciiCaseSensitive: Boolean = True);
procedure StrEnsureNoSuffixW(var S : WideString; const Suffix: WideString;
          const AsciiCaseSensitive: Boolean = True);



{                                                                              }
{ Skip                                                                         }
{                                                                              }
{$IFNDEF ManagedCode}
function  StrZSkipChar(var P: PAnsiChar; const C: AnsiChar): Boolean; overload;
function  StrZSkipChar(var P: PAnsiChar; const C: CharSet): Boolean; overload;
function  StrZSkipAll(var P: PAnsiChar; const C: AnsiChar): Integer; overload;
function  StrZSkipAll(var P: PAnsiChar; const C: CharSet): Integer; overload;
function  StrZSkipToChar(var P: PAnsiChar; const C: CharSet): Integer;
function  StrZSkipToStr(var P: PAnsiChar; const S: AnsiString;
          const AsciiCaseSensitive: Boolean = True): Integer;
function  StrZSkip2CharSeq(var P: PAnsiChar; const S1, S2: CharSet): Boolean;
function  StrZSkip3CharSeq(var P: PAnsiChar; const S1, S2, S3: CharSet): Boolean;
function  StrZSkipStr(var P: PAnsiChar; const S: AnsiString;
          const AsciiCaseSensitive: Boolean = True): Boolean;
{$ENDIF}



{                                                                              }
{ Extract (Zero terminated string pointers)                                    }
{                                                                              }
{$IFNDEF ManagedCode}
function  StrZExtractAll(var P: PAnsiChar; const C: AnsiChar): AnsiString; overload;
function  StrZExtractAll(var P: PAnsiChar; const C: CharSet): AnsiString; overload;
function  StrZExtractTo(var P: PAnsiChar; const C: CharSet): AnsiString;
function  StrZExtractToStr(var P: PAnsiChar; const S: AnsiString;
          const CaseSensitive: Boolean = True): AnsiString;
function  StrZExtractQuoted(var P: PAnsiChar): AnsiString;
{$ENDIF}



{                                                                              }
{ Reverse                                                                      }
{                                                                              }
function  StrReverseA(const S: AnsiString): AnsiString;
function  StrReverseW(const S: WideString): WideString;



{                                                                              }
{ Base conversion                                                              }
{                                                                              }
function  BinToLongWord(const S: AnsiString): LongWord;
function  OctToLongWord(const S: AnsiString): LongWord;
function  StrToLongWord(const S: AnsiString): LongWord;
function  StrToLongWordDef(const S: AnsiString; const Default: LongWord): LongWord;
function  HexToLongWord(const S: AnsiString): LongWord;
function  HexToLongWordDef(const S: AnsiString; const Default: LongWord): LongWord;



{                                                                              }
{ Type conversion                                                              }
{                                                                              }
function  StrToFloatDef(const S: String; const Default: Extended): Extended;

function  BooleanToStrW(const B: Boolean): WideString;
function  BooleanToStrA(const B: Boolean): AnsiString;
function  BooleanToStr(const B: Boolean): String;

function  StrToBooleanA(const S: AnsiString): Boolean;
function  StrToBooleanW(const S: WideString): Boolean;



{                                                                              }
{ Fast abbreviated regular expression matcher                                  }
{                                                                              }
{   Matches regular expressions of the form: (<charset><quant>)*               }
{     where <charset> is a character set and <quant> is one of the quantifiers }
{     (mnOnce, mnOptional = ?, mnAny = *, mnLeastOnce = +).                    }
{                                                                              }
{   Supports deterministic/non-deterministic, greedy/non-greedy matching.      }
{   Returns first MatchPos (as opposed to longest).                            }
{   Uses an NFA (Non-deterministic Finite Automata).                           }
{                                                                              }
{   For example:                                                               }
{     I := 1                                                                   }
{     S := 'a123'                                                              }
{     MatchQuantSeq(I, [['a'..'z'], ['0'..9']], [mqOnce, mqAny], S) = True     }
{                                                                              }
{     is the same as matching the regular expression [a-z][0-9]*               }
{                                                                              }
{$IFNDEF CLR}
type
  TMatchQuantifier = (
      mqOnce,
      mqAny,
      mqLeastOnce,
      mqOptional);
  TMatchQuantSeqOptions = Set of (
      moDeterministic,
      moNonGreedy);

function  MatchQuantSeq(var MatchPos: Integer;
          const MatchSeq: Array of CharSet; const Quant: Array of TMatchQuantifier;
          const S: AnsiString; const MatchOptions: TMatchQuantSeqOptions = [];
          const StartIndex: Integer = 1; const StopIndex: Integer = -1): Boolean;
{$ENDIF}



{                                                                              }
{ Fast Pattern Matcher                                                         }
{                                                                              }
{   Matches a subset of regular expressions (* ? and [])                       }
{   Matching is non-determistic (ie does backtracking) / non-greedy (ie lazy)  }
{       '*' Matches zero or more of any character                              }
{       '?' Matches exactly one character                                      }
{       [<char set>] Matches character from <char set>                         }
{       [^<char set>] Matches character not in <char set>                      }
{       where <char set> can include multiple ranges and escaped characters    }
{         '\n' matches NewLine (#10), '\r' matches Return (#13)                }
{         '\\' matches a slash ('\'), '\]' matches a close bracket (']'), etc. }
{                                                                              }
{   Examples:                                                                  }
{       MatchPattern('[a-z0-9_]bc?*c', 'abcabc') = True                        }
{       MatchPattern('[\\][\r][\n]', '\'#13#10) = True                         }
{                                                                              }
{$IFNDEF CLR}
function  MatchPatternZ(M, S: PAnsiChar): Boolean;
function  MatchPattern(M, S: AnsiString): Boolean;
{$ENDIF}



{                                                                              }
{ File Mask Matcher                                                            }
{                                                                              }
{   Matches classic file mask type regular expressions.                        }
{     ? = matches one character (or zero if at end of mask)                    }
{     * = matches zero or more characters                                      }
{                                                                              }
function  MatchFileMask(const Mask, Key: AnsiString;
          const AsciiCaseSensitive: Boolean = False): Boolean;



{                                                                              }
{ Character class strings                                                      }
{                                                                              }
{   Perl-like character class string representation of character sets, eg      }
{   the set ['0', 'A'..'Z'] is presented as [0A-Z]. Negated classes are also   }
{   supported, eg '[^A-Za-z]' is all non-alpha characters. The empty and       }
{   complete sets have special representations; '[]' and '.' respectively.     }
{                                                                              }
function  CharSetToCharClassStr(const C: CharSet): AnsiString;
{$IFNDEF CLR}
function  CharClassStrToCharSet(const S: AnsiString): CharSet;
{$ENDIF}



{                                                                              }
{ Dynamic array functions                                                      }
{                                                                              }
function  StringsTotalLengthA(const S: Array of AnsiString): Integer;
function  StringsTotalLengthW(const S: Array of WideString): Integer;

function  PosNextNoCase(const Find: AnsiString; const V: Array of AnsiString;
          const PrevPos: Integer = -1;
          const IsSortedAscending: Boolean = False): Integer;



{                                                                              }
{ Natural language                                                             }
{                                                                              }
function  StorageSize(const Bytes: Int64;
          const ShortFormat: Boolean = False): String;
function  TransferRate(const Bytes, MillisecondsElapsed: Int64;
          const ShortFormat: Boolean = False): String;



{$IFNDEF ManagedCode}
{                                                                              }
{ String Builder                                                               }
{                                                                              }
{   Class to help construct a string.                                          }
{   The String Builder class is used to efficiently construct a long string    }
{   from multiple shorter strings.                                             }
{                                                                              }
type
  TAnsiStringBuilder = class
  protected
    FString : AnsiString;
    FLength : Integer;

    procedure EnsureCapacity(const L: Integer);

    function  GetAsAnsiString: AnsiString;
    procedure SetAsAnsiString(const S: AnsiString);
    function  GetAsString: String;

  public
    constructor Create(const S: AnsiString = ''); overload;
    constructor Create(const Capacity: Integer); overload;

    property  Length: Integer read FLength;
    property  AsAnsiString: AnsiString read GetAsAnsiString write SetAsAnsiString;
    property  AsString: String read GetAsString;

    procedure Clear;
    procedure Assign(const S: TAnsiStringBuilder);

    procedure Append(const S: AnsiString); overload;
    procedure Append(const S: AnsiString; const Count: Integer); overload;
    procedure Append(const C: AnsiChar); overload;
    procedure Append(const C: AnsiChar; const Count: Integer); overload;
    procedure Append(const BufPtr: Pointer; const Size: Integer); overload;
    procedure Append(const S: TAnsiStringBuilder); overload;

    procedure Pack;
  end;

  TWideStringBuilder = class
  protected
    FString : WideString;
    FLength : Integer;

    procedure EnsureCapacity(const L: Integer);
    function  GetAsWideString: WideString;
    procedure SetAsWideString(const S: WideString);

  public
    constructor Create(const S: WideString = ''); overload;
    constructor Create(const Capacity: Integer); overload;

    property  Length: Integer read FLength;
    property  AsWideString: WideString read GetAsWideString write SetAsWideString;

    procedure Clear;
    procedure Assign(const S: TWideStringBuilder);

    procedure Append(const S: WideString); overload;
    procedure Append(const S: WideString; const Count: Integer); overload;
    procedure Append(const C: WideChar); overload;
    procedure Append(const C: WideChar; const Count: Integer); overload;
    procedure Append(const S: TWideStringBuilder); overload;

    procedure Pack;
  end;

  {$IFDEF CharIsWide}
  TStringBuilder = TWideStringBuilder;
  {$ELSE}
  TStringBuilder = TAnsiStringBuilder;
  {$ENDIF}
{$ENDIF}



{                                                                              }
{ Test cases                                                                   }
{                                                                              }
{$IFDEF STRINGS_SELFTEST}
procedure SelfTest;
{$ENDIF}

var
  FundFinder: TSynFinder = nil;

implementation


{                                                                              }
{ Miscellaneous functions                                                      }
{                                                                              }
{$IFDEF ManagedCode}
procedure SetLengthAndZero(var S: AnsiString; const NewLength: Integer);
var L, I : Integer;
begin
  L := Length(S);
  if L = NewLength then
    exit;
  SetLength(S, NewLength);
  if L > NewLength then
    exit;
  for I := L + 1 to NewLength do
    S[I] := AnsiChar(#0);
end;
{$ELSE}
procedure SetLengthAndZero(var S: AnsiString; const NewLength: Integer);
var L : Integer;
    P : PAnsiChar;
begin
  L := Length(S);
  if L = NewLength then
    exit;
  SetLength(S, NewLength);
  if L > NewLength then
    exit;
  P := Pointer(S);
  Inc(P, L);
  ZeroMem(P^, NewLength - L);
end;
{$ENDIF}

{$IFNDEF ManagedCode}
function StrPasP(const Buf; const BufSize: Integer): AnsiString;
begin
  if BufSize <= 0 then
    Result := ''
  else
    begin
      SetLength(Result, BufSize);
      Move(Buf, Pointer(Result)^, BufSize);
    end;
end;
{$ENDIF}



{                                                                              }
{ Zero terminated string functions                                             }
{                                                                              }
{$IFNDEF ManagedCode}
function StrZLenA(const S: PAnsiChar): Integer;
var P : PAnsiChar;
begin
  if not Assigned(S) then
    Result := 0
  else
    begin
      Result := 0;
      P := S;
      while P^ <> #0 do
        begin
          Inc(Result);
          Inc(P);
        end;
    end;
end;

function StrZLenW(const S: PWideChar): Integer;
var P : PWideChar;
begin
  if not Assigned(S) then
    Result := 0
  else
    begin
      Result := 0;
      P := S;
      while P^ <> #0 do
        begin
          Inc(Result);
          Inc(P);
        end;
    end;
end;
{$ENDIF}



{                                                                              }
{ ASCII case conversion                                                        }
{                                                                              }
const
  AsciiCaseDiff = Byte(AsciiLowerA) - Byte(AsciiUpperA);

{$IFDEF ASM386_DELPHI}
function AsciiLowCaseA(const C: AnsiChar): AnsiChar; register; assembler;
asm
      CMP     AL, AsciiUpperA
      JB      @@exit
      CMP     AL, AsciiUpperZ
      JA      @@exit
      ADD     AL, AsciiCaseDiff
@@exit:
end;
{$ELSE}
function AsciiLowCaseA(const C: AnsiChar): AnsiChar;
begin
  if C in [AsciiUpperA..AsciiUpperZ] then
    Result := AsciiChar(Byte(C) + AsciiCaseDiff)
  else
    Result := C;
end;
{$ENDIF}

function AsciiLowCaseW(const C: WideChar): WideChar;
begin
  case Ord(C) of
    Ord(AsciiUpperA)..Ord(AsciiUpperZ) : Result := WideChar(Ord(C) + AsciiCaseDiff)
  else
    Result := C;
  end;
end;

{$IFDEF ASM386_DELPHI}
function AsciiUpCaseA(const C: AnsiChar): AnsiChar; register; assembler;
asm
      CMP     AL, AsciiLowerA
      JB      @@exit
      CMP     AL, AsciiLowerZ
      JA      @@exit
      SUB     AL, AsciiLowerA - AsciiUpperA
@@exit:
end;
{$ELSE}
function AsciiUpCaseA(const C: AnsiChar): AnsiChar;
begin
  if C in [AsciiLowerA..AsciiLowerZ] then
    Result := AsciiChar(Byte(C) - AsciiCaseDiff)
  else
    Result := C;
end;
{$ENDIF}

function AsciiUpCaseW(const C: WideChar): WideChar;
begin
  case Ord(C) of
    Ord(AsciiLowerA)..Ord(AsciiLowerZ) : Result := WideChar(Ord(C) - AsciiCaseDiff)
  else
    Result := C;
  end;
end;

{$IFDEF ASM386_DELPHI}
procedure AsciiConvertUpperA(var S: AnsiString);
asm
      OR      EAX, EAX
      JZ      @Exit
      PUSH    EAX
      MOV     EAX, [EAX]
      OR      EAX, EAX
      JZ      @ExitP
      MOV     ECX, [EAX - 4]
      OR      ECX, ECX
      JZ      @ExitP
      XOR     DH, DH
  @L2:
      DEC     ECX
      MOV     DL, [EAX + ECX]
      CMP     DL, AsciiLowerA
      JB      @L1
      CMP     DL, AsciiLowerZ
      JA      @L1
      OR      DH, DH
      JZ      @Uniq
  @L3:
      SUB     DL, AsciiCaseDiff
      MOV     [EAX + ECX], DL
  @L1:
      OR      ECX, ECX
      JNZ     @L2
      OR      DH, DH
      JNZ     @Exit
  @ExitP:
      POP     EAX
  @Exit:
      RET
  @Uniq:
      POP     EAX
      PUSH    ECX
      PUSH    EDX
      CALL    UniqueString
      POP     EDX
      POP     ECX
      MOV     DH, 1
      JMP     @L3
end;
{$ELSE}
procedure AsciiConvertUpperA(var S: AnsiString);
var F : Integer;
begin
  for F := 1 to Length(S) do
    if S[F] in [AsciiLowerA..AsciiLowerZ] then
      S[F] := AnsiChar(Ord(S[F]) - AsciiCaseDiff);
end;
{$ENDIF}

procedure AsciiConvertUpperW(var S: WideString);
var F : Integer;
    C : WideChar;
begin
  for F := 1 to Length(S) do
    begin
      C := S[F];
      if Ord(C) <= $FF then
        if AnsiChar(Ord(C)) in [AsciiLowerA..AsciiLowerZ] then
          S[F] := WideChar(Ord(C) - AsciiCaseDiff);
    end;
end;

{$IFDEF ASM386_DELPHI}
procedure AsciiConvertLowerA(var S: AsciiString);
asm
      OR      EAX, EAX
      JZ      @Exit
      PUSH    EAX
      MOV     EAX, [EAX]
      OR      EAX, EAX
      JZ      @ExitP
      MOV     ECX, [EAX - 4]
      OR      ECX, ECX
      JZ      @ExitP
      XOR     DH, DH
  @L2:
      DEC     ECX
      MOV     DL, [EAX + ECX]
      CMP     DL, AsciiUpperA
      JB      @L1
      CMP     DL, AsciiUpperZ
      JA      @L1
      OR      DH, DH
      JZ      @Uniq
  @L3:
      ADD     DL, AsciiCaseDiff
      MOV     [EAX + ECX], DL
  @L1:
      OR      ECX, ECX
      JNZ     @L2
      OR      DH, DH
      JNZ     @Exit
  @ExitP:
      POP     EAX
  @Exit:
      RET
  @Uniq:
      POP     EAX
      PUSH    ECX
      PUSH    EDX
      CALL    UniqueString
      POP     EDX
      POP     ECX
      MOV     DH, 1
      JMP     @L3
end;
{$ELSE}
procedure AsciiConvertLowerA(var S: AnsiString);
var F : Integer;
begin
  for F := 1 to Length(S) do
    if S[F] in [AsciiUpperA..AsciiUpperZ] then
      S[F] := AnsiChar(Ord(S[F]) + AsciiCaseDiff);
end;
{$ENDIF}

procedure AsciiConvertLowerW(var S: WideString);
var F : Integer;
    C : WideChar;
begin
  for F := 1 to Length(S) do
    begin
      C := S[F];
      if Ord(C) <= $FF then
        if AnsiChar(Ord(C)) in [AsciiUpperA..AsciiUpperZ] then
          S[F] := WideChar(Ord(C) + AsciiCaseDiff);
    end;
end;

{$IFDEF ASM386_DELPHI}
procedure AsciiConvertFirstUp(var S: AsciiString);
asm
      TEST    EAX, EAX
      JZ      @Exit
      MOV     EDX, [EAX]
      TEST    EDX, EDX
      JZ      @Exit
      MOV     ECX, [EDX - 4]
      OR      ECX, ECX
      JZ      @Exit
      MOV     DL, [EDX]
      CMP     DL, AsciiLowerA
      JB      @Exit
      CMP     DL, AsciiLowerZ
      JA      @Exit
      CALL    UniqueString
      SUB     BYTE PTR [EAX], AsciiCaseDiff
  @Exit:
end;
{$ELSE}
procedure AsciiConvertFirstUp(var S: AsciiString);
var C : AsciiChar;
begin
  if S <> '' then
    begin
      C := S[1];
      if C in [AsciiLowerA..AsciiLowerZ] then
        S[1] := UpCase(C);
    end;
end;
{$ENDIF}

function AsciiFirstUp(const S: AsciiString): AsciiString;
begin
  Result := S;
  AsciiConvertFirstUp(Result);
end;

procedure AsciiConvertArrayUpper(var S: AsciiStringArray);
var I : Integer;
begin
  for I := 0 to Length(S) - 1 do
    AsciiConvertUpperA(S[I]);
end;

procedure AsciiConvertArrayLower(var S: AsciiStringArray);
var I : Integer;
begin
  for I := 0 to Length(S) - 1 do
    AsciiConvertLowerA(S[I]);
end;



{                                                                              }
{ ASCII string                                                                 }
{                                                                              }
function IsAsciiCharA(const C: AnsiChar): Boolean;
begin
  Result := C in [#0..#127];
end;

function IsAsciiCharW(const C: WideChar): Boolean;
begin
  Result := Ord(C) <= 127;
end;

function IsAsciiStringA(const S: AnsiString): Boolean;
var I : Integer;
begin
  for I := 1 to Length(S) do
    if not IsAsciiCharA(S[I]) then
      begin
        Result := False;
        exit;
      end;
  Result := True;
end;

function IsAsciiStringW(const S: WideString): Boolean;
var I : Integer;
begin
  for I := 1 to Length(S) do
    if not IsAsciiCharW(S[I]) then
      begin
        Result := False;
        exit;
      end;
  Result := True;
end;

function IsAsciiString(const S: String): Boolean;
begin
  {$IFDEF StringIsUnicode}
  Result := IsAsciiStringW(S);
  {$ELSE}
  Result := IsAsciiStringA(S);
  {$ENDIF}
end;



{                                                                              }
{ Compare                                                                      }
{                                                                              }
function CharCompareA(const A, B: AnsiChar): Integer;
begin
  if Ord(A) < Ord(B) then
    Result := -1 else
    if Ord(A) > Ord(B) then
      Result := 1
    else
      Result := 0;
end;

function CharCompareW(const A, B: WideChar): Integer;
begin
  if Ord(A) < Ord(B) then
    Result := -1 else
    if Ord(A) > Ord(B) then
      Result := 1
    else
      Result := 0;
end;

function CharCompare(const A, B: Char): Integer;
begin
  {$IFDEF CharIsWide}
  Result := CharCompareW(A, B);
  {$ELSE}
  Result := CharCompareA(A, B);
  {$ENDIF}
end;

function CharCompareNoAsciiCaseA(const A, B: AnsiChar): Integer;
var C, D : AnsiChar;
begin
  C := AsciiUpCaseA(A);
  D := AsciiUpCaseA(B);
  if Ord(C) < Ord(D) then
    Result := -1 else
    if Ord(C) > Ord(D) then
      Result := 1
    else
      Result := 0;
end;

function CharCompareNoAsciiCaseW(const A, B: WideChar): Integer;
var C, D : WideChar;
begin
  C := AsciiUpCaseW(A);
  D := AsciiUpCaseW(B);
  if Ord(C) < Ord(D) then
    Result := -1 else
    if Ord(C) > Ord(D) then
      Result := 1
    else
      Result := 0;
end;

function CharEqualNoAsciiCaseA(const A, B: AnsiChar): Boolean;
begin
  Result := AsciiUpCaseA(A) = AsciiUpCaseA(B);
end;

function CharEqualNoAsciiCaseW(const A, B: WideChar): Boolean;
begin
  Result := AsciiUpCaseW(A) = AsciiUpCaseW(B);
end;

{$IFDEF CLR}
function StrPCompareA(const A, B: AnsiString; const Len: Integer): Integer;
var C, D : Integer;
    I    : Integer;
begin
  for I := 1 to Len do
    begin
      C := Ord(A[I]);
      D := Ord(B[I]);
      if C <> D then
        begin
          if C < D then
            Result := -1
          else
            Result := 1;
          exit;
        end;
    end;
  Result := 0;
end;

function StrPCompareNoAsciiCaseA(const A, B: AnsiString; const Len: Integer): Integer;
var C, D : Integer;
    I    : Integer;
begin
  for I := 1 to Len do
    begin
      C := Ord(AsciiLowCaseLookup[A[I]]);
      D := Ord(AsciiLowCaseLookup[B[I]]);
      if C <> D then
        begin
          if C < D then
            Result := -1
          else
            Result := 1;
          exit;
        end;
    end;
  Result := 0;
end;
{$ELSE}
function StrPCompareA(const A, B: PAnsiChar; const Len: Integer): Integer;
var P, Q : PAnsiChar;
    I    : Integer;
begin
  P := A;
  Q := B;
  if P <> Q then
    for I := 1 to Len do
      if P^ = Q^ then
        begin
          Inc(P);
          Inc(Q);
        end
      else
        begin
          if Ord(P^) < Ord(Q^) then
            Result := -1
          else
            Result := 1;
          exit;
        end;
  Result := 0;
end;

function StrPCompareW(const A, B: PWideChar; const Len: Integer): Integer;
var P, Q : PWideChar;
    I    : Integer;
begin
  P := A;
  Q := B;
  if P <> Q then
    for I := 1 to Len do
      if Ord(P^) = Ord(Q^) then
        begin
          Inc(P);
          Inc(Q);
        end
      else
        begin
          if Ord(P^) < Ord(Q^) then
            Result := -1
          else
            Result := 1;
          exit;
        end;
  Result := 0;
end;

function StrPCompareNoAsciiCaseA(const A, B: PAnsiChar; const Len: Integer): Integer;
var P, Q : PAnsiChar;
    C, D : Integer;
    I    : Integer;
begin
  P := A;
  Q := B;
  if P <> Q then
    for I := 1 to Len do
      begin
        C := Integer(AsciiLowCaseLookup[P^]);
        D := Integer(AsciiLowCaseLookup[Q^]);
        if C = D then
          begin
            Inc(P);
            Inc(Q);
          end
        else
          begin
            if Ord(C) < Ord(D) then
              Result := -1
            else
              Result := 1;
            exit;
          end;
      end;
  Result := 0;
end;

function StrPCompareNoAsciiCaseW(const A, B: PWideChar; const Len: Integer): Integer;
var P, Q : PWideChar;
    C, D : Integer;
    I    : Integer;
begin
  P := A;
  Q := B;
  if P <> Q then
    for I := 1 to Len do
      begin
        C := Ord(P^);
        D := Ord(Q^);
        if C <= $7F then
          C := Integer(AsciiLowCaseLookup[AnsiChar(Byte(C))]);
        if D <= $7F then
          D := Integer(AsciiLowCaseLookup[AnsiChar(Byte(D))]);
        if C = D then
          begin
            Inc(P);
            Inc(Q);
          end
        else
          begin
            if C < D then
              Result := -1
            else
              Result := 1;
            exit;
          end;
      end;
  Result := 0;
end;
{$ENDIF}

{$IFDEF CLR}
function StrCompare(const A, B: AnsiString): Integer;
var L, M, I: Integer;
begin
  L := Length(A);
  M := Length(B);
  if L < M then
    I := L
  else
    I := M;
  Result := StrPCompareA(A, B, I);
  if Result <> 0 then
    exit;
  if L = M then
    Result := 0 else
  if L < M then
    Result := -1
  else
    Result := 1;
end;

function StrCompareNoCase(const A, B: AnsiString): Integer;
var L, M, I: Integer;
begin
  L := Length(A);
  M := Length(B);
  if L < M then
    I := L
  else
    I := M;
  Result := StrPCompareNoAsciiCaseA(A, B, I);
  if Result <> 0 then
    exit;
  if L = M then
    Result := 0 else
  if L < M then
    Result := -1
  else
    Result := 1;
end;
{$ELSE}
function StrCompareA(const A, B: AnsiString): Integer;
var L, M, I: Integer;
begin
  L := Length(A);
  M := Length(B);
  if L < M then
    I := L
  else
    I := M;
  Result := StrPCompareA(Pointer(A), Pointer(B), I);
  if Result <> 0 then
    exit;
  if L = M then
    Result := 0 else
  if L < M then
    Result := -1
  else
    Result := 1;
end;

function StrCompareW(const A, B: WideString): Integer;
var L, M, I: Integer;
begin
  L := Length(A);
  M := Length(B);
  if L < M then
    I := L
  else
    I := M;
  Result := StrPCompareW(Pointer(A), Pointer(B), I);
  if Result <> 0 then
    exit;
  if L = M then
    Result := 0 else
  if L < M then
    Result := -1
  else
    Result := 1;
end;

function StrCompareNoAsciiCaseA(const A, B: AnsiString): Integer;
var L, M, I: Integer;
begin
  L := Length(A);
  M := Length(B);
  if L < M then
    I := L
  else
    I := M;
  Result := StrPCompareNoAsciiCaseA(Pointer(A), Pointer(B), I);
  if Result <> 0 then
    exit;
  if L = M then
    Result := 0 else
  if L < M then
    Result := -1
  else
    Result := 1;
end;

function StrCompareNoAsciiCaseW(const A, B: WideString): Integer;
var L, M, I: Integer;
begin
  L := Length(A);
  M := Length(B);
  if L < M then
    I := L
  else
    I := M;
  Result := StrPCompareNoAsciiCaseW(Pointer(A), Pointer(B), I);
  if Result <> 0 then
    exit;
  if L = M then
    Result := 0 else
  if L < M then
    Result := -1
  else
    Result := 1;
end;
{$ENDIF}



{                                                                              }
{ Match                                                                        }
{                                                                              }
{$IFDEF ASM386_DELPHI}
function CharMatchNoAsciiCaseA(const A, B: AnsiChar): Boolean;
asm
      AND     EAX, $000000FF
      AND     EDX, $000000FF
      MOV     AL, BYTE PTR [AsciiLowCaseLookup + EAX]
      CMP     AL, BYTE PTR [AsciiLowCaseLookup + EDX]
      SETZ    AL
end;
{$ELSE}
function CharMatchNoAsciiCaseA(const A, B: AnsiChar): Boolean;
begin
  Result := AsciiLowCaseLookup[A] = AsciiLowCaseLookup[B];
end;
{$ENDIF}

function CharMatchNoAsciiCaseW(const A, B: WideChar): Boolean;
begin
  Result:= ecUpCase(A)=ecUpCase(B); //AT use Widechar api
  { //std code no need
  if (Ord(A) <= $7F) and (Ord(B) <= $7F) then
    Result := AsciiLowCaseLookup[AnsiChar(Ord(A))] = AsciiLowCaseLookup[AnsiChar(Ord(B))]
  else
    Result := Ord(A) = Ord(B);
    }
end;

{$IFDEF ASM386_DELPHI}
function CharMatchA(const A, B: AnsiChar; const AsciiCaseSensitive: Boolean): Boolean;
asm
      OR      CL, CL
      JZ      CharMatchNoAsciiCaseA
      CMP     AL, DL
      SETZ    AL
end;
{$ELSE}
function CharMatchA(const A, B: AnsiChar; const AsciiCaseSensitive: Boolean): Boolean;
begin
  if AsciiCaseSensitive then
    Result := A = B
  else
    Result := AsciiLowCaseLookup[A] = AsciiLowCaseLookup[B];
end;
{$ENDIF}

function CharMatchW(const A, B: WideChar; const AsciiCaseSensitive: Boolean = True): Boolean;
begin
  if AsciiCaseSensitive then
    Result := A = B
  else
    if (Ord(A) <= $FF) and (Ord(B) <= $FF) then
      Result := AsciiLowCaseLookup[AnsiChar(Ord(A))] = AsciiLowCaseLookup[AnsiChar(Ord(B))]
    else
      Result := A = B;
end;

function CharSetMatchCharA(const A: CharSet; const B: AnsiChar; const AsciiCaseSensitive: Boolean): Boolean;
begin
  if AsciiCaseSensitive then
    Result := B in A
  else
    Result := (UpCase(B) in A) or (AsciiLowCaseA(B) in A);
end;

{$IFDEF CLR}
function StrPMatchA(const A, B: AnsiString; const Len: Integer): Boolean;
var I : Integer;
begin
  for I := 1 to Len do
    if A[I] <> B[I] then
      begin
        Result := False;
        exit;
      end;
  Result := True;
end;
{$ELSE}
function StrPMatchA(const A, B: PAnsiChar; const Len: Integer): Boolean;
var P, Q : PAnsiChar;
    I    : Integer;
begin
  P := A;
  Q := B;
  if P <> Q then
    for I := 1 to Len do
      if P^ = Q^ then
        begin
          Inc(P);
          Inc(Q);
        end else
        begin
          Result := False;
          exit;
        end;
  Result := True;
end;

function StrPMatchW(const A, B: PWideChar; const Len: Integer): Boolean;
var P, Q : PWideChar;
    I    : Integer;
begin
  P := A;
  Q := B;
  if P <> Q then
    for I := 1 to Len do
      if P^ = Q^ then
        begin
          Inc(P);
          Inc(Q);
        end else
        begin
          Result := False;
          exit;
        end;
  Result := True;
end;
{$ENDIF}

{$IFNDEF ManagedCode}
function StrPMatchA(const S, M: PAnsiChar; const LenS, LenM: Integer): Boolean;
var P, Q : PAnsiChar;
    I    : Integer;
begin
  if LenM = 0 then
    begin
      Result := True;
      exit;
    end;
  if LenM > LenS then
    begin
      Result := False;
      exit;
    end;
  if Pointer(S) = Pointer(M) then
    begin
      Result := True;
      exit;
    end;
  P := S;
  Q := M;
  for I := 1 to LenM do
    if P^ = Q^ then
      begin
        Inc(P);
        Inc(Q);
      end else
      begin
        Result := False;
        exit;
      end;
  Result := True;
end;

function StrPMatchW(const S, M: PWideChar; const LenS, LenM: Integer): Boolean;
var P, Q : PWideChar;
    I    : Integer;
begin
  if LenM = 0 then
    begin
      Result := True;
      exit;
    end;
  if LenM > LenS then
    begin
      Result := False;
      exit;
    end;
  if Pointer(S) = Pointer(M) then
    begin
      Result := True;
      exit;
    end;
  P := S;
  Q := M;
  for I := 1 to LenM do
    if P^ = Q^ then
      begin
        Inc(P);
        Inc(Q);
      end else
      begin
        Result := False;
        exit;
      end;
  Result := True;
end;

function StrPMatchStr(const S: PAnsiChar; const Len: Integer; const M: AnsiString): Boolean;
begin
  Result := StrPMatchA(S, Pointer(M), Len, Length(M));
end;
{$ENDIF}

{$IFDEF CLR}
function StrPMatchNoAsciiCaseA(const A, B: AnsiString; const Len: Integer): Boolean;
var C, D : Integer;
    I    : Integer;
begin
  for I := 1 to Len do
    begin
      C := Integer(AsciiLowCaseLookup[A[I]]);
      D := Integer(AsciiLowCaseLookup[B[I]]);
      if C <> D then
        begin
          Result := False;
          exit;
        end;
    end;
  Result := True;
end;
{$ELSE}
function StrPMatchNoAsciiCaseA(const A, B: PAnsiChar; const Len: Integer): Boolean;
var P, Q : PAnsiChar;
    C, D : Integer;
    I    : Integer;
begin
  P := A;
  Q := B;
  if P <> Q then
    for I := 1 to Len do
      begin
        C := Integer(AsciiLowCaseLookup[P^]);
        D := Integer(AsciiLowCaseLookup[Q^]);
        if C = D then
          begin
            Inc(P);
            Inc(Q);
          end else
          begin
            Result := False;
            exit;
          end;
      end;
  Result := True;
end;

function StrPMatchNoAsciiCaseW(const A, B: PWideChar; const Len: Integer): Boolean;
var P, Q : PWideChar;
    I    : Integer;
begin
  P := A;
  Q := B;
  if P <> Q then
    for I := 1 to Len do
      begin
        if CharMatchNoAsciiCaseW(P^, Q^) then
          begin
            Inc(P);
            Inc(Q);
          end else
          begin
            Result := False;
            exit;
          end;
      end;
  Result := True;
end;
{$ENDIF}

{$IFNDEF CLR}
function StrPMatchLenA(const P: PAnsiChar; const Len: Integer; const M: CharSet): Integer;
var Q : PAnsiChar;
    L : Integer;
begin
  Q := P;
  L := Len;
  Result := 0;
  while L > 0 do
    if Q^ in M then
      begin
        Inc(Q);
        Dec(L);
        Inc(Result);
      end
    else
      exit;
end;

function StrPMatchLenW(const P: PWideChar; const Len: Integer; const M: CharSet): Integer;
var Q : PWideChar;
    C : WideChar;
    L : Integer;
begin
  Q := P;
  L := Len;
  Result := 0;
  while L > 0 do
    begin
      C := Q^;
      if Ord(C) <= $FF then
        if AnsiChar(Ord(C)) in M then
          begin
            Inc(Q);
            Dec(L);
            Inc(Result);
          end
        else
          exit;
    end;
end;

function StrPMatchCharA(const P: PAnsiChar; const Len: Integer; const M: CharSet): Boolean;
begin
  Result := StrPMatchLenA(P, Len, M) = Len;
end;

function StrPMatchCharW(const P: PWideChar; const Len: Integer; const M: CharSet): Boolean;
begin
  Result := StrPMatchLenW(P, Len, M) = Len;
end;
{$ENDIF}

{$IFDEF CLR}
function StrMatchA(const S, M: AnsiString; const Index: Integer): Boolean;
var N, T, I : Integer;
begin
  N := Length(M);
  T := Length(S);
  if (N = 0) or (T = 0) or (Index < 1) or (Index + N - 1 > T) then
    begin
      Result := False;
      exit;
    end;
  for I := 1 to N do
    if M[I] <> S[I + Index - 1] then
      begin
        Result := False;
        exit;
      end;
  Result := True;
end;
{$ELSE}
function StrMatchA(const S, M: AnsiString; const Index: Integer): Boolean;
var N, T : Integer;
    Q    : PAnsiChar;
begin
  N := Length(M);
  T := Length(S);
  if (N = 0) or (T = 0) or (Index < 1) or (Index + N - 1 > T) then
    begin
      Result := False;
      exit;
    end;
  Q := Pointer(S);
  Inc(Q, Index - 1);
  Result := StrPMatchA(Pointer(M), Q, N);
end;
{$ENDIF}

function StrMatchW(const S, M: WideString; const Index: Integer): Boolean;
var N, T, I : Integer;
begin
  N := Length(M);
  T := Length(S);
  if (N = 0) or (T = 0) or (Index < 1) or (Index + N - 1 > T) then
    begin
      Result := False;
      exit;
    end;
  for I := 1 to N do
    if M[I] <> S[I + Index - 1] then
      begin
        Result := False;
        exit;
      end;
  Result := True;
end;

function StrMatch(const S, M: String; const Index: Integer): Boolean;
var N, T, I : Integer;
begin
  N := Length(M);
  T := Length(S);
  if (N = 0) or (T = 0) or (Index < 1) or (Index + N - 1 > T) then
    begin
      Result := False;
      exit;
    end;
  for I := 1 to N do
    if M[I] <> S[I + Index - 1] then
      begin
        Result := False;
        exit;
      end;
  Result := True;
end;

{$IFDEF CLR}
function StrMatchNoCase(const S, M: AnsiString; const Index: Integer): Boolean;
var N, T, I : Integer;
begin
  N := Length(M);
  T := Length(S);
  if (N = 0) or (T = 0) or (Index < 1) or (Index + N - 1 > T) then
    begin
      Result := False;
      exit;
    end;
  for I := 1 to N do
    if AsciiLowCaseLookup[M[I]] <> AsciiLowCaseLookup[S[I + Index - 1]] then
      begin
        Result := False;
        exit;
      end;
  Result := True;
end;
{$ELSE}
function StrMatchNoAsciiCaseA(const S, M: AnsiString; const Index: Integer): Boolean;
var N, T : Integer;
    Q    : PAnsiChar;
begin
  N := Length(M);
  T := Length(S);
  if (N = 0) or (T = 0) or (Index < 1) or (Index + N - 1 > T) then
    begin
      Result := False;
      exit;
    end;
  Q := Pointer(S);
  Inc(Q, Index - 1);
  Result := StrPMatchNoAsciiCaseA(Pointer(M), Q, N);
end;

function StrMatchNoAsciiCaseW(const S, M: WideString; const Index: Integer = 1): Boolean;
var N, T : Integer;
    Q    : PWideChar;
begin
  N := Length(M);
  T := Length(S);
  if (N = 0) or (T = 0) or (Index < 1) or (Index + N - 1 > T) then
    begin
      Result := False;
      exit;
    end;
  Q := Pointer(S);
  Inc(Q, Index - 1);
  Result := StrPMatchNoAsciiCaseW(Pointer(M), Q, N);
end;
{$ENDIF}

function StrMatchLeftA(const S, M: AnsiString; const AsciiCaseSensitive: Boolean): Boolean;
begin
  if AsciiCaseSensitive then
    Result := StrMatchA(S, M, 1)
  else
    Result := StrMatchNoAsciiCaseA(S, M, 1);
end;

function StrMatchLeftW(const S, M: WideString; const AsciiCaseSensitive: Boolean): Boolean;
begin
  if AsciiCaseSensitive then
    Result := StrMatchW(S, M, 1)
  else
    Result := StrMatchNoAsciiCaseW(S, M, 1);
end;

function StrMatchRightA(const S, M: AnsiString; const AsciiCaseSensitive: Boolean): Boolean;
var I: Integer;
begin
  I := Length(S) - Length(M) + 1;
  if AsciiCaseSensitive then
    Result := StrMatchA(S, M, I)
  else
    Result := StrMatchNoAsciiCaseA(S, M, I);
end;

function StrMatchRightW(const S, M: WideString; const AsciiCaseSensitive: Boolean): Boolean;
var I: Integer;
begin
  I := Length(S) - Length(M) + 1;
  if AsciiCaseSensitive then
    Result := StrMatchW(S, M, I)
  else
    Result := StrMatchNoAsciiCaseW(S, M, I);
end;

{$IFDEF CLR}
function StrMatchLen(const S: AnsiString; const M: CharSet;
    const Index: Integer): Integer;
var L, I : Integer;
    J    : Integer;
begin
  I := Index;
  if I <= 0 then
    I := 1;
  L := Length(S);
  if I > L then
    Result := 0
  else
    begin
      Result := 0;
      for J := 1 to L - I + 1 do
        if S[I + J - 1] in M then
          Inc(Result)
        else
          exit;
    end;
end;
{$ELSE}
function StrMatchLenA(const S: AnsiString; const M: CharSet; const Index: Integer): Integer;
var P    : PAnsiChar;
    L, I : Integer;
begin
  I := Index;
  if I <= 0 then
    I := 1;
  L := Length(S);
  if I > L then
    Result := 0
  else
    begin
      P := Pointer(S);
      Dec(I);
      Inc(P, I);
      Result := StrPMatchLenA(P, L - I, M);
    end;
end;

function StrMatchLenW(const S: WideString; const M: CharSet; const Index: Integer): Integer;
var P    : PWideChar;
    L, I : Integer;
begin
  I := Index;
  if I <= 0 then
    I := 1;
  L := Length(S);
  if I > L then
    Result := 0
  else
    begin
      P := Pointer(S);
      Dec(I);
      Inc(P, I);
      Result := StrPMatchLenW(P, L - I, M);
    end;
end;
{$ENDIF}

{$IFDEF CLR}
function StrMatchCharA(const S: AnsiString; const M: CharSet): Boolean;
var L: Integer;
begin
  L := Length(S);
  Result := (L > 0) and (StrMatchLen(S, M, 1) = L);
end;
{$ELSE}
function StrMatchCharA(const S: AnsiString; const M: CharSet): Boolean;
var L: Integer;
begin
  L := Length(S);
  Result := (L > 0) and (StrPMatchLenA(Pointer(S), L, M) = L);
end;

function StrMatchCharW(const S: WideString; const M: CharSet): Boolean;
var L: Integer;
begin
  L := Length(S);
  Result := (L > 0) and (StrPMatchLenW(Pointer(S), L, M) = L);
end;
{$ENDIF}

{$IFNDEF CLR}
function StrZMatchStr(const P: PAnsiChar; const M: AnsiString): Boolean;
var T, Q : PAnsiChar;
    I, L : Integer;
    C    : AnsiChar;
begin
  L := Length(M);
  if L = 0 then
    begin
      Result := False;
      exit;
    end;
  T := P;
  Q := Pointer(M);
  for I := 1 to L do
    begin
      C := T^;
      if (C = #0) or (C <> Q^) then
        begin
          Result := False;
          exit;
        end else
        begin
          Inc(T);
          Inc(Q);
        end;
    end;
  Result := True;
end;

function StrZMatchStrNoCase(const P: PAnsiChar; const M: AnsiString): Boolean;
var T, Q : PAnsiChar;
    I, L : Integer;
    C, D : AnsiChar;
begin
  L := Length(M);
  if L = 0 then
    begin
      Result := False;
      exit;
    end;
  T := P;
  Q := Pointer(M);
  for I := 1 to L do
    begin
      C := AsciiLowCaseLookup[T^];
      D := AsciiLowCaseLookup[Q^];
      if (C = #0) or (C <> D) then
        begin
          Result := False;
          exit;
        end else
        begin
          Inc(T);
          Inc(Q);
        end;
    end;
  Result := True;
end;

function StrZMatchStr(const P: PAnsiChar; const M: AnsiString;
    const AsciiCaseSensitive: Boolean): Boolean;
begin
  if AsciiCaseSensitive then
    Result := StrZMatchStr(P, M)
  else
    Result := StrZMatchStrNoCase(P, M);
end;
{$ENDIF}



{                                                                              }
{ Equal                                                                        }
{                                                                              }
{$IFNDEF CLR}
function StrPEqual(const P1, P2: PAnsiChar; const Len1, Len2: Integer;
         const AsciiCaseSensitive: Boolean): Boolean;
begin
  Result := Len1 = Len2;
  if not Result or (Len1 = 0) then
    exit;
  if AsciiCaseSensitive then
    Result := StrPMatchA(P1, P2, Len1)
  else
    Result := StrPMatchNoAsciiCaseA(P1, P2, Len1);
end;

function StrPEqualStr(const P: PAnsiChar; const Len: Integer; const S: AnsiString;
         const AsciiCaseSensitive: Boolean): Boolean;
begin
  Result := Len = Length(S);
  if not Result or (Len = 0) then
    exit;
  if AsciiCaseSensitive then
    Result := StrPMatchA(P, Pointer(S), Len)
  else
    Result := StrPMatchNoAsciiCaseA(P, Pointer(S), Len);
end;
{$ENDIF}

{$IFDEF CLR}
function StrEqual(const A, B: AnsiString; const CaseSensitive: Boolean): Boolean;
var L1, L2 : Integer;
begin
  L1 := Length(A);
  L2 := Length(B);
  Result := L1 = L2;
  if not Result or (L1 = 0) then
    exit;
  if CaseSensitive then
    Result := StrPMatchA(A, B, L1)
  else
    Result := StrPMatchNoAsciiCaseA(A, B, L1);
end;
{$ELSE}
function StrEqualA(const A, B: AnsiString; const AsciiCaseSensitive: Boolean): Boolean;
var L1, L2 : Integer;
begin
  L1 := Length(A);
  L2 := Length(B);
  Result := L1 = L2;
  if not Result or (L1 = 0) then
    exit;
  if AsciiCaseSensitive then
    Result := StrPMatchA(Pointer(A), Pointer(B), L1)
  else
    Result := StrPMatchNoAsciiCaseA(Pointer(A), Pointer(B), L1);
end;

function StrEqualW(const A, B: WideString; const AsciiCaseSensitive: Boolean): Boolean;
var L1, L2 : Integer;
begin
  L1 := Length(A);
  L2 := Length(B);
  Result := L1 = L2;
  if not Result or (L1 = 0) then
    exit;
  if AsciiCaseSensitive then
    Result := StrPMatchW(Pointer(A), Pointer(B), L1)
  else
    Result := StrPMatchNoAsciiCaseW(Pointer(A), Pointer(B), L1);
end;

function StrEqual(const A, B: String; const AsciiCaseSensitive: Boolean): Boolean;
begin
  {$IFDEF StringIsUnicode}
  Result := StrEqualW(A, B, AsciiCaseSensitive);
  {$ELSE}
  Result := StrEqualA(A, B, AsciiCaseSensitive);
  {$ENDIF}
end;
{$ENDIF}

{$IFDEF CLR}
function StrEqualNoCase(const A, B: AnsiString): Boolean;
var L : Integer;
begin
  L := Length(A);
  Result := L = Length(B);
  if not Result or (L = 0) then
    exit;
  Result := StrPMatchNoAsciiCaseA(A, B, L);
end;
{$ELSE}
function StrEqualNoAsciiCaseA(const A, B: AnsiString): Boolean;
var L, M : Integer;
begin
  L := Length(A);
  M := Length(B);
  Result := L = M;
  if not Result or (L = 0) then
    exit;
  Result := StrPMatchNoAsciiCaseA(Pointer(A), Pointer(B), L);
end;

function StrEqualNoAsciiCaseW(const A, B: WideString): Boolean;
var L, M : Integer;
begin
  L := Length(A);
  M := Length(B);
  Result := L = M;
  if not Result or (L = 0) then
    exit;
  Result := StrPMatchNoAsciiCaseW(Pointer(A), Pointer(B), L);
end;

function StrEqualNoAsciiCase(const A, B: String): Boolean;
begin
  {$IFDEF StringIsUnicode}
  Result := StrEqualNoAsciiCaseW(A, B);
  {$ELSE}
  Result := StrEqualNoAsciiCaseA(A, B);
  {$ENDIF}
end;
{$ENDIF}



{                                                                              }
{ Validation                                                                   }
{                                                                              }
function StrIsNumeric(const S: AnsiString): Boolean;
begin
  Result := StrMatchCharA(S, csNumeric);
end;

function StrIsHex(const S: AnsiString): Boolean;
begin
  Result := StrMatchCharA(S, csHexDigit);
end;

function StrIsAlpha(const S: AnsiString): Boolean;
begin
  Result := StrMatchCharA(S, csAlpha);
end;

function StrIsAlphaNumeric(const S: AnsiString): Boolean;
begin
  Result := StrMatchCharA(S, csAlphaNumeric);
end;

{$IFDEF CLR}
function StrIsInteger(const S: AnsiString): Boolean;
var L : Integer;
    P : Integer;
begin
  L := Length(S);
  Result := L > 0;
  if not Result then
    exit;
  P := 1;
  if S[P] in csSign then
    begin
      Inc(P);
      Dec(L);
    end;
  Result := (L > 0) and (StrMatchLen(S, csNumeric, P) = L);
end;
{$ELSE}
function StrIsInteger(const S: AnsiString): Boolean;
var L: Integer;
    P: PAnsiChar;
begin
  L := Length(S);
  Result := L > 0;
  if not Result then
    exit;
  P := Pointer(S);
  if P^ in csSign then
    begin
      Inc(P);
      Dec(L);
    end;
  Result := (L > 0) and (StrPMatchLenA(P, L, csNumeric) = L);
end;
{$ENDIF}



{                                                                              }
{ Pos                                                                          }
{                                                                              }

{$IFNDEF ManagedCode}
function StrPPosChar(const F: AnsiChar; const S: PAnsiChar; const Len: Integer): Integer;
var I : Integer;
    P : PAnsiChar;
begin
  if Len <= 0 then
    begin
      Result := -1;
      exit;
    end;
  P := S;
  for I := 0 to Len - 1 do
    if P^ = F then
      begin
        Result := I;
        exit;
      end
    else
      Inc(P);
  Result := -1;
end;

function StrPPosChar(const F: CharSet; const S: PAnsiChar; const Len: Integer): Integer;
var I : Integer;
    P : PAnsiChar;
begin
  if Len <= 0 then
    begin
      Result := -1;
      exit;
    end;
  P := S;
  for I := 0 to Len - 1 do
    if P^ in F then
      begin
        Result := I;
        exit;
      end
    else
      Inc(P);
  Result := -1;
end;

function StrPPos(const F, S: PAnsiChar; const LenF, LenS: Integer): Integer;
var I : Integer;
    P : PAnsiChar;
begin
  if (LenF <= 0) or (LenS <= 0) or (LenF > LenS) then
    begin
      Result := -1;
      exit;
    end;
  P := S;
  for I := 0 to LenS - LenF do
    if StrPMatchA(P, F, LenF) then
      begin
        Result := I;
        exit;
      end
    else
      Inc(P);
  Result := -1;
end;

function StrPPosStr(const F: String; const S: PAnsiChar; const Len: Integer): Integer;
begin
  Result := StrPPos(Pointer(F), S, Length(F), Len);
end;

function StrZPosChar(const F: AnsiChar; const S: PAnsiChar): Integer;
var C : AnsiChar;
    P : PAnsiChar;
begin
  if not Assigned(S) then
    Result := -1
  else
    begin
      Result := 0;
      P := S;
      C := P^;
      while C <> F do
        if C = #0 then
          begin
            Result := -1;
            exit;
          end
        else
          begin
            Inc(Result);
            Inc(P);
            C := P^;
          end;
    end;
end;
{$ENDIF}

{$IFDEF CLR}
function PosCharA(const F: AnsiChar; const S: AnsiString; const Index: Integer): Integer;
var L, I : Integer;
begin
  L := Length(S);
  if (L = 0) or (Index > L) then
    begin
      Result := 0;
      exit;
    end;
  if Index < 1 then
    I := 1
  else
    I := Index;
  while I <= L do
    if S[I] = F then
      begin
        Result := I;
        exit;
      end
    else
      Inc(I);
  Result := 0;
end;
{$ELSE}
function PosCharA(const F: AnsiChar; const S: AnsiString; const Index: Integer): Integer;
var P    : PAnsiChar;
    L, I : Integer;
begin
  L := Length(S);
  if (L = 0) or (Index > L) then
    begin
      Result := 0;
      exit;
    end;
  if Index < 1 then
    I := 1
  else
    I := Index;
  P := Pointer(S);
  Inc(P, I - 1);
  while I <= L do
    if P^ = F then
      begin
        Result := I;
        exit;
      end else
      begin
        Inc(P);
        Inc(I);
      end;
  Result := 0;
end;
{$ENDIF}

function PosCharW(const F: WideChar; const S: WideString; const Index: Integer): Integer;
var L, I : Integer;
begin
  L := Length(S);
  if (L = 0) or (Index > L) then
    begin
      Result := 0;
      exit;
    end;
  if Index < 1 then
    I := 1
  else
    I := Index;
  while I <= L do
    if S[I] = F then
      begin
        Result := I;
        exit;
      end
    else
      Inc(I);
  Result := 0;
end;

function PosChar(const F: Char; const S: String; const Index: Integer): Integer;
var L, I : Integer;
begin
  L := Length(S);
  if (L = 0) or (Index > L) then
    begin
      Result := 0;
      exit;
    end;
  if Index < 1 then
    I := 1
  else
    I := Index;
  while I <= L do
    if S[I] = F then
      begin
        Result := I;
        exit;
      end
    else
      Inc(I);
  Result := 0;
end;

{$IFDEF CLR}
function PosCharSetA(const F: CharSet; const S: AnsiString; const Index: Integer): Integer;
var L, I : Integer;
begin
  L := Length(S);
  if (L = 0) or (Index > L) then
    begin
      Result := 0;
      exit;
    end;
  if Index < 1 then
    I := 1
  else
    I := Index;
  while I <= L do
    if S[I] in F then
      begin
        Result := I;
        exit;
      end
    else
      Inc(I);
  Result := 0;
end;
{$ELSE}
function PosCharSetA(const F: CharSet; const S: AnsiString; const Index: Integer): Integer;
var P    : PAnsiChar;
    L, I : Integer;
begin
  L := Length(S);
  if (L = 0) or (Index > L) then
    begin
      Result := 0;
      exit;
    end;
  if Index < 1 then
    I := 1
  else
    I := Index;
  P := Pointer(S);
  Inc(P, I - 1);
  while I <= L do
    if P^ in F then
      begin
        Result := I;
        exit;
      end else
      begin
        Inc(P);
        Inc(I);
      end;
  Result := 0;
end;

function PosCharSetW(const F: CharSet; const S: WideString;
    const Index: Integer): Integer;
var P    : PWideChar;
    C    : WideChar;
    L, I : Integer;
begin
  L := Length(S);
  if (L = 0) or (Index > L) then
    begin
      Result := 0;
      exit;
    end;
  if Index < 1 then
    I := 1
  else
    I := Index;
  P := Pointer(S);
  Inc(P, I - 1);
  while I <= L do
    begin
      C := P^;
      if Ord(C) <= $FF then
        if AnsiChar(Ord(C)) in F then
          begin
            Result := I;
            exit;
          end else
          begin
            Inc(P);
            Inc(I);
          end;
    end;
  Result := 0;
end;
{$ENDIF}

{$IFDEF CLR}
function PosNotCharA(const F: AnsiChar; const S: AnsiString;
    const Index: Integer): Integer;
var L, I : Integer;
begin
  L := Length(S);
  if (L = 0) or (Index > L) then
    begin
      Result := 0;
      exit;
    end;
  if Index < 1 then
    I := 1
  else
    I := Index;
  while I <= L do
    if S[I] <> F then
      begin
        Result := I;
        exit;
      end
    else
      Inc(I);
  Result := 0;
end;
{$ELSE}
function PosNotCharA(const F: AnsiChar; const S: AnsiString;
    const Index: Integer): Integer;
var P    : PAnsiChar;
    L, I : Integer;
begin
  L := Length(S);
  if (L = 0) or (Index > L) then
    begin
      Result := 0;
      exit;
    end;
  if Index < 1 then
    I := 1
  else
    I := Index;
  P := Pointer(S);
  Inc(P, I - 1);
  while I <= L do
    if P^ <> F then
      begin
        Result := I;
        exit;
      end else
      begin
        Inc(P);
        Inc(I);
      end;
  Result := 0;
end;
{$ENDIF}

function PosNotCharW(const F: WideChar; const S: WideString; const Index: Integer): Integer;
var L, I : Integer;
begin
  L := Length(S);
  if (L = 0) or (Index > L) then
    begin
      Result := 0;
      exit;
    end;
  if Index < 1 then
    I := 1
  else
    I := Index;
  while I <= L do
    if S[I] <> F then
      begin
        Result := I;
        exit;
      end
    else
      Inc(I);
  Result := 0;
end;

function PosNotChar(const F: Char; const S: String; const Index: Integer): Integer;
var L, I : Integer;
begin
  L := Length(S);
  if (L = 0) or (Index > L) then
    begin
      Result := 0;
      exit;
    end;
  if Index < 1 then
    I := 1
  else
    I := Index;
  while I <= L do
    if S[I] <> F then
      begin
        Result := I;
        exit;
      end
    else
      Inc(I);
  Result := 0;
end;

{$IFDEF CLR}
function PosNotCharSetA(const F: CharSet; const S: AnsiString;
    const Index: Integer): Integer;
var L, I : Integer;
begin
  L := Length(S);
  if (L = 0) or (Index > L) then
    begin
      Result := 0;
      exit;
    end;
  if Index < 1 then
    I := 1
  else
    I := Index;
  while I <= L do
    if not (S[I] in F) then
      begin
        Result := I;
        exit;
      end
    else
      Inc(I);
  Result := 0;
end;
{$ELSE}
function PosNotCharSetA(const F: CharSet; const S: AnsiString;
    const Index: Integer): Integer;
var P    : PAnsiChar;
    L, I : Integer;
begin
  L := Length(S);
  if (L = 0) or (Index > L) then
    begin
      Result := 0;
      exit;
    end;
  if Index < 1 then
    I := 1
  else
    I := Index;
  P := Pointer(S);
  Inc(P, I - 1);
  while I <= L do
    if not (P^ in F) then
      begin
        Result := I;
        exit;
      end else
      begin
        Inc(P);
        Inc(I);
      end;
  Result := 0;
end;
{$ENDIF}

{$IFDEF CLR}
function PosCharRev(const F: AnsiChar; const S: AnsiString;
    const Index: Integer): Integer;
var L, I, J : Integer;
begin
  L := Length(S);
  if (L = 0) or (Index > L) then
    begin
      Result := 0;
      exit;
    end;
  if Index < 1 then
    I := 1
  else
    I := Index;
  J := L;
  while J >= I do
    if S[J] = F then
      begin
        Result := J;
        exit;
      end
    else
      Dec(J);
  Result := 0;
end;
{$ELSE}
function PosCharRevA(const F: AnsiChar; const S: AnsiString;
    const Index: Integer): Integer;
var P       : PAnsiChar;
    L, I, J : Integer;
begin
  L := Length(S);
  if (L = 0) or (Index > L) then
    begin
      Result := 0;
      exit;
    end;
  if Index < 1 then
    I := 1
  else
    I := Index;
  P := Pointer(S);
  J := L;
  Inc(P, J - 1);
  while J >= I do
    if P^ = F then
      begin
        Result := J;
        exit;
      end else
      begin
        Dec(P);
        Dec(J);
      end;
  Result := 0;
end;
{$ENDIF}

function PosCharRevW(const F: WideChar; const S: WideString; const Index: Integer): Integer;
var L, I, J : Integer;
begin
  L := Length(S);
  if (L = 0) or (Index > L) then
    begin
      Result := 0;
      exit;
    end;
  if Index < 1 then
    I := 1
  else
    I := Index;
  J := L;
  while J >= I do
    if S[J] = F then
      begin
        Result := J;
        exit;
      end
    else
      Dec(J);
  Result := 0;
end;

function PosCharRev(const F: Char; const S: String; const Index: Integer): Integer;
var L, I, J : Integer;
begin
  L := Length(S);
  if (L = 0) or (Index > L) then
    begin
      Result := 0;
      exit;
    end;
  if Index < 1 then
    I := 1
  else
    I := Index;
  J := L;
  while J >= I do
    if S[J] = F then
      begin
        Result := J;
        exit;
      end
    else
      Dec(J);
  Result := 0;
end;

{$IFDEF CLR}
function PosCharSetRevA(const F: CharSet; const S: AnsiString;
    const Index: Integer): Integer;
var L, I, J : Integer;
begin
  L := Length(S);
  if (L = 0) or (Index > L) then
    begin
      Result := 0;
      exit;
    end;
  if Index < 1 then
    I := 1
  else
    I := Index;
  J := L;
  while J >= I do
    if S[J] in F then
      begin
        Result := J;
        exit;
      end
    else
      Dec(J);
  Result := 0;
end;
{$ELSE}
function PosCharSetRevA(const F: CharSet; const S: AnsiString; const Index: Integer): Integer;
var P       : PAnsiChar;
    L, I, J : Integer;
begin
  L := Length(S);
  if (L = 0) or (Index > L) then
    begin
      Result := 0;
      exit;
    end;
  if Index < 1 then
    I := 1
  else
    I := Index;
  P := Pointer(S);
  J := L;
  Inc(P, J - 1);
  while J >= I do
    if P^ in F then
      begin
        Result := J;
        exit;
      end
    else
      begin
        Dec(P);
        Dec(J);
      end;
  Result := 0;
end;

function PosCharSetRevW(const F: CharSet; const S: WideString; const Index: Integer): Integer;
var P       : PWideChar;
    L, I, J : Integer;
    C       : WideChar;
begin
  L := Length(S);
  if (L = 0) or (Index > L) then
    begin
      Result := 0;
      exit;
    end;
  if Index < 1 then
    I := 1
  else
    I := Index;
  P := Pointer(S);
  J := L;
  Inc(P, J - 1);
  while J >= I do
    begin
      C := P^;
      if Ord(C) <= $FF then
        if AnsiChar(Ord(C)) in F then
          begin
            Result := J;
            exit;
          end
        else
          begin
            Dec(P);
            Dec(J);
          end;
    end;
  Result := 0;
end;
{$ENDIF}

{$IFDEF CLR}
function PosStrA(const F, S: AnsiString; const Index: Integer;
    const CaseSensitive: Boolean): Integer;
var L, M, I : Integer;
begin
  L := Length(S);
  M := Length(F);
  if (L = 0) or (Index > L) or (M = 0) or (M > L) then
    begin
      Result := 0;
      exit;
    end;
  if Index < 1 then
    I := 1
  else
    I := Index;
  Dec(L, M - 1);
  if CaseSensitive then
    while I <= L do
      if StrMatch(S, F, I) then
        begin
          Result := I;
          exit;
        end
      else
        Inc(I)
  else
    while I <= L do
      if StrMatchNoCase(S, F, I) then
        begin
          Result := I;
          exit;
        end
      else
        Inc(I);
  Result := 0;
end;
{$ELSE}
function PosStrA(const F, S: AnsiString; const Index: Integer;
    const AsciiCaseSensitive: Boolean): Integer;
var P, Q    : PAnsiChar;
    L, M, I : Integer;
begin
  L := Length(S);
  M := Length(F);
  if (L = 0) or (Index > L) or (M = 0) or (M > L) then
    begin
      Result := 0;
      exit;
    end;
  Q := Pointer(F);
  if Index < 1 then
    I := 1
  else
    I := Index;
  P := Pointer(S);
  Inc(P, I - 1);
  Dec(L, M - 1);
  if AsciiCaseSensitive then
    while I <= L do
      if StrPMatchA(P, Q, M) then
        begin
          Result := I;
          exit;
        end else
        begin
          Inc(P);
          Inc(I);
        end
  else
    while I <= L do
      if StrPMatchNoAsciiCaseA(P, Q, M) then
        begin
          Result := I;
          exit;
        end else
        begin
          Inc(P);
          Inc(I);
        end;
  Result := 0;
end;

//AT
function IsWordOK(const S, F: Widestring; const Index: Integer; WholeWords: boolean): boolean;
begin
  Result := True;
  if not WholeWords then Exit;
  if ((Index=1) or not IsWordChar(S[Index]) or not IsWordChar(S[Index-1])) and
    ((Index>=Length(S)-Length(F)+1) or not IsWordChar(S[Index+Length(F)-1]) or not IsWordChar(S[Index+Length(F)]))
      then Exit;
  Result:= False;
end;

function PosStrW(const F, S: WideString; const Index: Integer;
    const AsciiCaseSensitive: Boolean;
    const WholeWords: Boolean): Integer; //AT
var P, Q    : PWideChar;
    L, M, I : Integer;
begin
  L := Length(S);
  M := Length(F);
  if (L = 0) or (Index > L) or (M = 0) or (M > L) then
    begin
      Result := 0;
      exit;
    end;
  Q := Pointer(F);
  if Index < 1 then
    I := 1
  else
    I := Index;
  P := Pointer(S);
  Inc(P, I - 1);
  Dec(L, M - 1);
  if AsciiCaseSensitive then
    while I <= L do
      if StrPMatchW(P, Q, M) and IsWordOK(S, F, I, WholeWords) then //AT
        begin
          Result := I;
          exit;
        end else
        begin
          Inc(P);
          Inc(I);
        end
  else
    while I <= L do
      if StrPMatchNoAsciiCaseW(P, Q, M) and IsWordOK(S, F, I, WholeWords) then //AT
        begin
          Result := I;
          exit;
        end else
        begin
          Inc(P);
          Inc(I);
        end;
  Result := 0;
end;
{$ENDIF}

{$IFDEF CLR}
function PosStrRev(const F, S: AnsiString; const Index: Integer;
    const CaseSensitive: Boolean): Integer;
var L, M, I, J : Integer;
begin
  L := Length(S);
  M := Length(F);
  if (L = 0) or (Index > L) or (M = 0) or (M > L) then
    begin
      Result := 0;
      exit;
    end;
  if Index < 1 then
    I := 1
  else
    I := Index;
  Dec(L, M - 1);
  J := L;
  if CaseSensitive then
    while J >= I do
      if StrMatch(S, F, J) then
        begin
          Result := J;
          exit;
        end
      else
        Dec(J)
  else
    while J >= I do
      if StrMatchNoCase(S, F, J) then
        begin
          Result := J;
          exit;
        end
      else
        Dec(J);
  Result := 0;
end;
{$ELSE}
function PosStrRevA(const F, S: AnsiString; const Index: Integer;
    const AsciiCaseSensitive: Boolean): Integer;
var P, Q       : PAnsiChar;
    L, M, I, J : Integer;
begin
  L := Length(S);
  M := Length(F);
  if (L = 0) or (Index > L) or (M = 0) or (M > L) then
    begin
      Result := 0;
      exit;
    end;
  Q := Pointer(F);
  if Index < 1 then
    I := 1
  else
    I := Index;
  P := Pointer(S);
  Dec(L, M - 1);
  Inc(P, L - 1);
  J := L;
  if AsciiCaseSensitive then
    while J >= I do
      if StrPMatchA(P, Q, M) then
        begin
          Result := J;
          exit;
        end else
        begin
          Dec(P);
          Dec(J);
        end
  else
    while J >= I do
      if StrPMatchNoAsciiCaseA(P, Q, M) then
        begin
          Result := J;
          exit;
        end else
        begin
          Dec(P);
          Dec(J);
        end;
  Result := 0;
end;

function PosStrRevW(const F, S: WideString; const Index: Integer;
    const AsciiCaseSensitive: Boolean): Integer;
var P, Q       : PWideChar;
    L, M, I, J : Integer;
begin
  L := Length(S);
  M := Length(F);
  if (L = 0) or (Index > L) or (M = 0) or (M > L) then
    begin
      Result := 0;
      exit;
    end;
  Q := Pointer(F);
  if Index < 1 then
    I := 1
  else
    I := Index;
  P := Pointer(S);
  Dec(L, M - 1);
  Inc(P, L - 1);
  J := L;
  if AsciiCaseSensitive then
    while J >= I do
      if StrPMatchW(P, Q, M) then
        begin
          Result := J;
          exit;
        end else
        begin
          Dec(P);
          Dec(J);
        end
  else
    while J >= I do
      if StrPMatchNoAsciiCaseW(P, Q, M) then
        begin
          Result := J;
          exit;
        end else
        begin
          Dec(P);
          Dec(J);
        end;
  Result := 0;
end;
{$ENDIF}

{$IFDEF CLR}
function PosStrRevIdx(const F, S: AnsiString; const Index: Integer;
    const CaseSensitive: Boolean): Integer;
var L, M, I, J : Integer;
begin
  L := Length(S);
  M := Length(F);
  if (L = 0) or (Index > L) or (M = 0) or (M > L) then
    begin
      Result := 0;
      exit;
    end;
  if Index < 1 then
    I := L
  else
    I := Index;
  J := I;
  if CaseSensitive then
    while J >= 1 do
      if StrMatch(S, F, J) then
        begin
          Result := J;
          exit;
        end
      else
        Dec(J)
  else
    while J >= 1 do
      if StrMatchNoCase(S, F, J) then
        begin
          Result := J;
          exit;
        end
      else
        Dec(J);
  Result := 0;
end;
{$ELSE}
function PosStrRevIdxA(const F, S: AnsiString; const Index: Integer;
    const AsciiCaseSensitive: Boolean): Integer;
var P, Q       : PAnsiChar;
    L, M, I, J : Integer;
begin
  L := Length(S);
  M := Length(F);
  if (L = 0) or (Index > L) or (M = 0) or (M > L) then
    begin
      Result := 0;
      exit;
    end;
  Q := Pointer(F);
  if Index < 1 then
    I := L
  else
    I := Index;
  P := Pointer(S);
  Inc(P, I - 1);
  J := I;
  if AsciiCaseSensitive then
    while J >= 1 do
      if StrPMatchA(P, Q, M) then
        begin
          Result := J;
          exit;
        end else
        begin
          Dec(P);
          Dec(J);
        end
  else
    while J >= 1 do
      if StrPMatchNoAsciiCaseA(P, Q, M) then
        begin
          Result := J;
          exit;
        end else
        begin
          Dec(P);
          Dec(J);
        end;
  Result := 0;
end;
{$ENDIF}

function PosNStrA(const F, S: AnsiString; const N: Integer;
    const Index: Integer; const AsciiCaseSensitive: Boolean): Integer;
var I, J, M: Integer;
begin
  Result := 0;
  if N <= 0 then
    exit;
  M := Length(F);
  if M = 0 then
    exit;
  J := Index;
  for I := 1 to N do
    begin
      Result := PosStrA(F, S, J, AsciiCaseSensitive);
      if Result = 0 then
        exit;
      J := Result + M;
    end;
end;



{                                                                              }
{ Copy variations                                                              }
{                                                                              }
function CopyRangeW(const S: WideString; const StartIndex, StopIndex: Integer): WideString;
var L, I : Integer;
begin
  L := Length(S);
  if (StartIndex > StopIndex) or (StopIndex < 1) or (StartIndex > L) or (L = 0) then
    Result := ''
  else
    begin
      if StartIndex <= 1 then
        if StopIndex >= L then
          begin
            Result := S;
            exit;
          end
        else
          I := 1
      else
        I := StartIndex;
      Result := Copy(S, I, StopIndex - I + 1);
    end;
end;

function CopyRangeA(const S: AnsiString; const StartIndex, StopIndex: Integer): AnsiString;
var L, I : Integer;
begin
  L := Length(S);
  if (StartIndex > StopIndex) or (StopIndex < 1) or (StartIndex > L) or (L = 0) then
    Result := ''
  else
    begin
      if StartIndex <= 1 then
        if StopIndex >= L then
          begin
            Result := S;
            exit;
          end
        else
          I := 1
      else
        I := StartIndex;
      Result := Copy(S, I, StopIndex - I + 1);
    end;
end;

function CopyRange(const S: String; const StartIndex, StopIndex: Integer): String;
var L, I : Integer;
begin
  L := Length(S);
  if (StartIndex > StopIndex) or (StopIndex < 1) or (StartIndex > L) or (L = 0) then
    Result := ''
  else
    begin
      if StartIndex <= 1 then
        if StopIndex >= L then
          begin
            Result := S;
            exit;
          end
        else
          I := 1
      else
        I := StartIndex;
      Result := Copy(S, I, StopIndex - I + 1);
    end;
end;

function CopyFromW(const S: WideString; const Index: Integer): WideString;
var L : Integer;
begin
  if Index <= 1 then
    Result := S
  else
    begin
      L := Length(S);
      if (L = 0) or (Index > L) then
        Result := ''
      else
        Result := Copy(S, Index, L - Index + 1);
    end;
end;

function CopyFromA(const S: AnsiString; const Index: Integer): AnsiString;
var L : Integer;
begin
  if Index <= 1 then
    Result := S
  else
    begin
      L := Length(S);
      if (L = 0) or (Index > L) then
        Result := ''
      else
        Result := Copy(S, Index, L - Index + 1);
    end;
end;

function CopyFrom(const S: String; const Index: Integer): String;
var L : Integer;
begin
  if Index <= 1 then
    Result := S
  else
    begin
      L := Length(S);
      if (L = 0) or (Index > L) then
        Result := ''
      else
        Result := Copy(S, Index, L - Index + 1);
    end;
end;

function CopyLeftW(const S: WideString; const Count: Integer): WideString;
var L : Integer;
begin
  L := Length(S);
  if (L = 0) or (Count <= 0) then
    Result := '' else
    if Count >= L then
      Result := S
    else
      Result := Copy(S, 1, Count);
end;

function CopyLeftA(const S: AnsiString; const Count: Integer): AnsiString;
var L : Integer;
begin
  L := Length(S);
  if (L = 0) or (Count <= 0) then
    Result := '' else
    if Count >= L then
      Result := S
    else
      Result := Copy(S, 1, Count);
end;

function CopyLeft(const S: String; const Count: Integer): String;
var L : Integer;
begin
  L := Length(S);
  if (L = 0) or (Count <= 0) then
    Result := '' else
    if Count >= L then
      Result := S
    else
      Result := Copy(S, 1, Count);
end;

function CopyRightW(const S: WideString; const Count: Integer): WideString;
var L : Integer;
begin
  L := Length(S);
  if (L = 0) or (Count <= 0) then
    Result := '' else
    if Count >= L then
      Result := S
    else
      Result := Copy(S, L - Count + 1, Count);
end;

function CopyRightA(const S: AnsiString; const Count: Integer): AnsiString;
var L : Integer;
begin
  L := Length(S);
  if (L = 0) or (Count <= 0) then
    Result := '' else
    if Count >= L then
      Result := S
    else
      Result := Copy(S, L - Count + 1, Count);
end;

function CopyRight(const S: String; const Count: Integer): String;
var L : Integer;
begin
  L := Length(S);
  if (L = 0) or (Count <= 0) then
    Result := '' else
    if Count >= L then
      Result := S
    else
      Result := Copy(S, L - Count + 1, Count);
end;

function CopyLeftEllipsed(const S: AnsiString; const Count: Integer): AnsiString;
var L: Integer;
begin
  if Count < 0 then
    begin
      Result := S;
      exit;
    end;
  if Count = 0 then
    begin
      Result := '';
      exit;
    end;
  L := Length(S);
  if L <= Count then
    begin
      Result := S;
      exit;
    end;
  if Count <= 3 then
    begin
      Result := DupCharA(' ', Count);
      exit;
    end;
  Result := Copy(S, 1, Count - 3) + '...';
end;



{                                                                              }
{ CopyEx                                                                       }
{                                                                              }

{ TranslateStartStop translates Start, Stop parameters (negative values are    }
{ indexed from back of string) into StartIdx and StopIdx (relative to start).  }
{ Returns False if the Start, Stop does not specify a valid range.             }
function TranslateStart(const Len, Start: Integer; var StartIndex : Integer): Boolean;
begin
  if Len = 0 then
    Result := False
  else
    begin
      StartIndex := Start;
      if Start < 0 then
        Inc(StartIndex, Len + 1);
      if StartIndex > Len then
        Result := False
      else
        begin
          if StartIndex < 1 then
            StartIndex := 1;
          Result := True;
        end;
    end;
end;

function TranslateStartStop(const Len, Start, Stop: Integer; var StartIndex, StopIndex: Integer): Boolean;
begin
  if Len = 0 then
    Result := False
  else
    begin
      StartIndex := Start;
      if Start < 0 then
        Inc(StartIndex, Len + 1);
      StopIndex := Stop;
      if StopIndex < 0 then
        Inc(StopIndex, Len + 1);
      if (StopIndex < 1) or (StartIndex > Len) or (StopIndex < StartIndex) then
        Result := False
      else
        begin
          if StopIndex > Len then
            StopIndex:= Len;
          if StartIndex < 1 then
            StartIndex := 1;
          Result := True;
        end;
    end;
end;

function CopyExA(const S: AnsiString; const Start, Count: Integer): AnsiString;
var I, L : Integer;
begin
  L := Length(S);
  if (Count < 0) or not TranslateStart(L, Start, I) then
    Result := '' else
    if (I = 1) and (Count >= L) then
      Result := S
    else
      Result := Copy(S, I, Count);
end;

function CopyExW(const S: String; const Start, Count: Integer): String;
var I, L : Integer;
begin
  L := Length(S);
  if (Count < 0) or not TranslateStart(L, Start, I) then
    Result := '' else
    if (I = 1) and (Count >= L) then
      Result := S
    else
      Result := Copy(S, I, Count);
end;

function CopyEx(const S: String; const Start, Count: Integer): String;
var I, L : Integer;
begin
  L := Length(S);
  if (Count < 0) or not TranslateStart(L, Start, I) then
    Result := '' else
    if (I = 1) and (Count >= L) then
      Result := S
    else
      Result := Copy(S, I, Count);
end;

function CopyRangeExA(const S: AnsiString; const Start, Stop: Integer): AnsiString;
var I, J, L : Integer;
begin
  L := Length(S);
  if not TranslateStartStop(L, Start, Stop, I, J) then
    Result := '' else
    if (I = 1) and (J = L) then
      Result := S
    else
      Result := Copy(S, I, J - I + 1);
end;

function CopyRangeExW(const S: WideString; const Start, Stop: Integer): WideString;
var I, J, L : Integer;
begin
  L := Length(S);
  if not TranslateStartStop(L, Start, Stop, I, J) then
    Result := '' else
    if (I = 1) and (J = L) then
      Result := S
    else
      Result := Copy(S, I, J - I + 1);
end;

function CopyRangeEx(const S: String; const Start, Stop: Integer): String;
var I, J, L : Integer;
begin
  L := Length(S);
  if not TranslateStartStop(L, Start, Stop, I, J) then
    Result := '' else
    if (I = 1) and (J = L) then
      Result := S
    else
      Result := Copy(S, I, J - I + 1);
end;

function CopyFromExA(const S: AnsiString; const Start: Integer): AnsiString;
var I, L : Integer;
begin
  L := Length(S);
  if not TranslateStart(L, Start, I) then
    Result := '' else
    if I <= 1 then
      Result := S
    else
      Result := Copy(S, I, L - I + 1);
end;

function CopyFromExW(const S: WideString; const Start: Integer): WideString;
var I, L : Integer;
begin
  L := Length(S);
  if not TranslateStart(L, Start, I) then
    Result := '' else
    if I <= 1 then
      Result := S
    else
      Result := Copy(S, I, L - I + 1);
end;

function CopyFromEx(const S: String; const Start: Integer): String;
var I, L : Integer;
begin
  L := Length(S);
  if not TranslateStart(L, Start, I) then
    Result := '' else
    if I <= 1 then
      Result := S
    else
      Result := Copy(S, I, L - I + 1);
end;



{                                                                              }
{ Trim                                                                         }
{                                                                              }
function WideCharInCharSet(const A: WideChar; const C: CharSet): Boolean;
begin
  if Ord(A) >= $100 then
    Result := False
  else
    Result := AnsiChar(Ord(A)) in C;
end;

function StrTrimLeftA(const S: AnsiString; const C: CharSet): AnsiString;
var
  F, L : Integer;
begin
  L := Length(S);
  F := 1;
  while (F <= L) and (S[F] in C) do
    Inc(F);
  Result := CopyFromA(S, F);
end;

function StrTrimLeftW(const S: WideString; const C: CharSet): WideString;
var
  F, L : Integer;
begin
  L := Length(S);
  F := 1;
  while (F <= L) and WideCharInCharSet(S[F], C) do
    Inc(F);
  Result := CopyFromW(S, F);
end;

function StrTrimLeft(const S: String; const C: CharSet): String;
begin
  {$IFDEF StringIsUnicode}
  Result := StrTrimLeftW(S, C);
  {$ELSE}
  Result := StrTrimLeftA(S, C);
  {$ENDIF}
end;

{$IFDEF CLR}
procedure StrTrimLeftInPlace(var S : AnsiString; const C: CharSet);
var F, L, I : Integer;
begin
  L := Length(S);
  F := 1;
  while (F <= L) and (S[F] in C) do
    Inc(F);
  if F > L then
    S := '' else
    if F > 1 then
      begin
        L := L - F + 1;
        if L > 0 then
          for I := 1 to L do
            S[I] := S[I + F];
        SetLength(S, L);
      end;
end;
{$ELSE}
procedure StrTrimLeftInPlace(var S : AnsiString; const C: CharSet);
var F, L : Integer;
    P    : PAnsiChar;
begin
  L := Length(S);
  F := 1;
  while (F <= L) and (S[F] in C) do
    Inc(F);
  if F > L then
    S := '' else
    if F > 1 then
      begin
        L := L - F + 1;
        if L > 0 then
          begin
            P := Pointer(S);
            Inc(P, F - 1);
            MoveMem(P^, Pointer(S)^, L);
          end;
        SetLength(S, L);
      end;
end;
{$ENDIF}

function StrTrimLeftStrNoCase(const S: AnsiString; const TrimStr: AnsiString): AnsiString;
var F, L, M : Integer;
begin
  L := Length(TrimStr);
  M := Length(S);
  F := 1;
  while (F <= M) and StrMatchNoAsciiCaseA(S, TrimStr, F) do
    Inc(F, L);
  Result := CopyFromA(S, F);
end;

function StrTrimRightA(const S: AnsiString; const C: CharSet): AnsiString;
var F : Integer;
begin
  F := Length(S);
  while (F >= 1) and (S[F] in C) do
    Dec(F);
  Result := CopyLeftA(S, F);
end;

function StrTrimRightW(const S: WideString; const C: CharSet): WideString;
var F : Integer;
begin
  F := Length(S);
  while (F >= 1) and WideCharInCharSet(S[F], C) do
    Dec(F);
  Result := CopyLeftW(S, F);
end;

function StrTrimRight(const S: String; const C: CharSet): String;
begin
  {$IFDEF StringIsUnicode}
  Result := StrTrimRightW(S, C);
  {$ELSE}
  Result := StrTrimRightA(S, C);
  {$ENDIF}
end;

procedure StrTrimRightInPlace(var S : AnsiString; const C: CharSet);
var F : Integer;
begin
  F := Length(S);
  while (F >= 1) and (S[F] in C) do
    Dec(F);
  if F = 0 then
    S := ''
  else
    SetLength(S, F);
end;

function StrTrimRightStrNoCase(const S: AnsiString; const TrimStr: AnsiString): AnsiString;
var F, L : Integer;
begin
  L := Length(TrimStr);
  F := Length(S) - L  + 1;
  while (F >= 1) and StrMatchNoAsciiCaseA(S, TrimStr, F) do
    Dec(F, L);
  Result := CopyLeftA(S, F + L - 1);
end;

function StrTrimA(const S: AnsiString; const C: CharSet): AnsiString;
var F, G, L : Integer;
begin
  L := Length(S);
  F := 1;
  while (F <= L) and (S[F] in C) do
    Inc(F);
  G := L;
  while (G >= F) and (S[G] in C) do
    Dec(G);
  Result := CopyRangeA(S, F, G);
end;

function StrTrimW(const S: WideString; const C: CharSet): WideString;
var F, G, L : Integer;
begin
  L := Length(S);
  F := 1;
  while (F <= L) and WideCharInCharSet(S[F], C) do
    Inc(F);
  G := L;
  while (G >= F) and WideCharInCharSet(S[G], C) do
    Dec(G);
  Result := CopyRangeW(S, F, G);
end;

function StrTrim(const S: String; const C: CharSet): String;
begin
  {$IFDEF StringIsUnicode}
  Result := StrTrimW(S, C);
  {$ELSE}
  Result := StrTrimA(S, C);
  {$ENDIF}
end;

procedure StrTrimInPlace(var S : AnsiString; const C: CharSet);
begin
  StrTrimLeftInPlace(S, C);
  StrTrimRightInPlace(S, C);
end;

procedure TrimStrings(var S : AnsiStringArray; const C: CharSet);
var I : Integer;
begin
  for I := 0 to Length(S) - 1 do
    StrTrimInPlace(S[I], C);
end;



{                                                                              }
{ Dup                                                                          }
{                                                                              }
{$IFNDEF CLR}
function BufToStrA(const Buf; const BufSize: Integer): AnsiString;
begin
  if BufSize <= 0 then
    Result := ''
  else
    begin
      SetLength(Result, BufSize);
      MoveMem(Buf, Pointer(Result)^, BufSize);
    end;
end;

function BufToStrW(const Buf; const BufSize: Integer): WideString;
var L : Integer;
begin
  if BufSize <= 0 then
    Result := ''
  else
    begin
      L := (BufSize + 1) div 2;
      SetLength(Result, L);
      MoveMem(Buf, Pointer(Result)^, BufSize);
    end;
end;

function DupBufA(const Buf; const BufSize: Integer; const Count: Integer): AnsiString;
var P : PAnsiChar;
    I : Integer;
begin
  if (Count <= 0) or (BufSize <= 0) then
    Result := ''
  else
    begin
      SetLength(Result, Count * BufSize);
      P := Pointer(Result);
      for I := 1 to Count do
        begin
          MoveMem(Buf, P^, BufSize);
          Inc(P, BufSize);
        end;
    end;
end;

function DupBufW(const Buf; const BufSize: Integer; const Count: Integer): WideString;
var P : PWideChar;
    I, L : Integer;
begin
  if (Count <= 0) or (BufSize <= 0) then
    Result := ''
  else
    begin
      Assert(BufSize mod 2 = 0);
      L := BufSize div 2;
      SetLength(Result, Count * L);
      P := Pointer(Result);
      for I := 1 to Count do
        begin
          MoveMem(Buf, P^, BufSize);
          Inc(P, L);
        end;
    end;
end;
{$ENDIF}

{$IFDEF CLR}
function DupStrA(const S: AnsiString; const Count: Integer): AnsiString;
var L, I, J : Integer;
begin
  L := Length(S);
  if L = 0 then
    Result := ''
  else
    begin
      SetLength(Result, Count * L);
      for I := 0 to Count - 1 do
        for J := 1 to L do
          Result[I * L + J] := S[J];
    end;
end;
{$ELSE}
function DupStrA(const S: AnsiString; const Count: Integer): AnsiString;
var L : Integer;
begin
  L := Length(S);
  if L = 0 then
    Result := ''
  else
    Result := DupBufA(Pointer(S)^, L, Count);
end;

function DupStrW(const S: WideString; const Count: Integer): WideString;
var L : Integer;
begin
  L := Length(S);
  if L = 0 then
    Result := ''
  else
    Result := DupBufW(Pointer(S)^, L * 2, Count);
end;
{$ENDIF}

{$IFDEF CLR}
function DupChar(const Ch: AnsiChar; const Count: Integer): AnsiString;
var I : Integer;
begin
  if Count <= 0 then
    begin
      Result := '';
      exit;
    end;
  SetLength(Result, Count);
  for I := 1 to Count do
    Result[I] := Ch;
end;
{$ELSE}
function DupCharA(const Ch: AnsiChar; const Count: Integer): AnsiString;
begin
  if Count <= 0 then
    begin
      Result := '';
      exit;
    end;
  SetLength(Result, Count);
  FillMem(Pointer(Result)^, Count, Ord(Ch));
end;
{$ENDIF}

function DupCharW(const Ch: WideChar; const Count: Integer): WideString;
var I : Integer;
begin
  if Count <= 0 then
    begin
      Result := '';
      exit;
    end;
  SetLength(Result, Count);
  for I := 1 to Count do
    Result[I] := Ch;
end;

function DupChar(const Ch: Char; const Count: Integer): String;
var I : Integer;
begin
  if Count <= 0 then
    begin
      Result := '';
      exit;
    end;
  SetLength(Result, Count);
  for I := 1 to Count do
    Result[I] := Ch;
end;

function DupSpaceA(const Count: Integer): AnsiString;
begin
  Result := DupCharA(AsciiSP, Count);
end;

function DupSpaceW(const Count: Integer): WideString;
begin
  Result := DupCharW(WideSP, Count);
end;

function DupSpace(const Count: Integer): String;
begin
  Result := DupChar(' ', Count);
end;



{                                                                              }
{ Pad                                                                          }
{                                                                              }
{$IFDEF CLR}
function StrPadLeftA(const S: AnsiString; const PadChar: AnsiChar;
    const Len: Integer; const Cut: Boolean): AnsiString;
var L, P, M, I : Integer;
begin
  if Len = 0 then
    begin
      if Cut then
        Result := ''
      else
        Result := S;
      exit;
    end;
  M := Length(S);
  if Len = M then
    begin
      Result := S;
      exit;
    end;
  if Cut then
    L := Len
  else
    L := MaxI(Len, M);
  P := L - M;
  if P < 0 then
    P := 0;
  SetLength(Result, L);
  for I := 1 to P do
    Result[I] := PadChar;
  if L > P then
    for I := 1 to L - P do
      Result[P + I] := S[I];
end;
{$ELSE}
function StrPadLeftA(const S: AnsiString; const PadChar: AnsiChar;
    const Len: Integer; const Cut: Boolean): AnsiString;
var F, L, P, M : Integer;
    I, J       : PAnsiChar;
begin
  if Len = 0 then
    begin
      if Cut then
        Result := ''
      else
        Result := S;
      exit;
    end;
  M := Length(S);
  if Len = M then
    begin
      Result := S;
      exit;
    end;
  if Cut then
    L := Len
  else
    L := MaxI(Len, M);
  P := L - M;
  if P < 0 then
    P := 0;
  SetLength(Result, L);
  if P > 0 then
    FillMem(Pointer(Result)^, P, Ord(PadChar));
  if L > P then
    begin
      I := Pointer(Result);
      J := Pointer(S);
      Inc(I, P);
      for F := 1 to L - P do
        begin
          I^ := J^;
          Inc(I);
          Inc(J);
        end;
    end;
end;
{$ENDIF}

{$IFDEF CLR}
function StrPadRightA(const S: AnsiString; const PadChar: AnsiChar;
    const Len: Integer; const Cut: Boolean): AnsiString;
var L, P, M, I : Integer;
begin
  if Len = 0 then
    begin
      if Cut then
        Result := ''
      else
        Result := S;
      exit;
    end;
  M := Length(S);
  if Len = M then
    begin
      Result := S;
      exit;
    end;
  if Cut then
    L := Len
  else
    L := MaxI(Len, M);
  P := L - M;
  if P < 0 then
    P := 0;
  SetLength(Result, L);
  if L > P then
    for I := 1 to L - P do
      Result[I] := S[I];
  if P > 0 then
    for I := 1 to P do
      Result[L - P + I] := PadChar;
end;
{$ELSE}
function StrPadRightA(const S: AnsiString; const PadChar: AnsiChar;
    const Len: Integer; const Cut: Boolean): AnsiString;
var F, L, P, M : Integer;
    I, J       : PAnsiChar;
begin
  if Len = 0 then
    begin
      if Cut then
        Result := ''
      else
        Result := S;
      exit;
    end;
  M := Length(S);
  if Len = M then
    begin
      Result := S;
      exit;
    end;
  if Cut then
    L := Len
  else
    L := MaxI(Len, M);
  P := L - M;
  if P < 0 then
    P := 0;
  SetLength(Result, L);
  if L > P then
    begin
      I := Pointer(Result);
      J := Pointer(S);
      for F := 1 to L - P do
        begin
          I^ := J^;
          Inc(I);
          Inc(J);
        end;
    end;
  if P > 0 then
    FillMem(Result[L - P + 1], P, Ord(PadChar));
end;
{$ENDIF}

function StrPadA(const S: AnsiString; const PadChar: AnsiChar; const Len: Integer;
    const Cut: Boolean): AnsiString;
var I : Integer;
begin
  I := Len - Length(S);
  Result := DupCharA(PadChar, I div 2) + S + DupCharA(PadChar, (I + 1) div 2);
  if Cut then
    SetLength(Result, Len);
end;

function StrPadW(const S: WideString; const PadChar: WideChar; const Len: Integer;
    const Cut: Boolean): WideString;
var I : Integer;
begin
  I := Len - Length(S);
  Result := DupCharW(PadChar, I div 2) + S + DupCharW(PadChar, (I + 1) div 2);
  if Cut then
    SetLength(Result, Len);
end;

function StrPad(const S: String; const PadChar: Char; const Len: Integer;
    const Cut: Boolean): String;
var I : Integer;
begin
  I := Len - Length(S);
  Result := DupChar(PadChar, I div 2) + S + DupChar(PadChar, (I + 1) div 2);
  if Cut then
    SetLength(Result, Len);
end;



{                                                                              }
{ Delimited                                                                    }
{                                                                              }
function StrBetweenChar(const S: AnsiString;
    const FirstDelim, SecondDelim: AnsiChar;
    const FirstOptional: Boolean; const SecondOptional: Boolean): AnsiString;
var I, J : Integer;
begin
  Result := '';
  I := PosCharA(FirstDelim, S);
  if (I = 0) and not FirstOptional then
    exit;
  J := PosCharA(SecondDelim, S, I + 1);
  if J = 0 then
    if not SecondOptional then
      exit
    else
      J := Length(S) + 1;
  Result := CopyRangeA(S, I + 1, J - 1);
end;

function StrBetweenChar(const S: AnsiString;
    const FirstDelim, SecondDelim: CharSet;
    const FirstOptional: Boolean; const SecondOptional: Boolean): AnsiString;
var I, J : Integer;
begin
  Result := '';
  I := PosCharSetA(FirstDelim, S);
  if (I = 0) and not FirstOptional then
    exit;
  J := PosCharSetA(SecondDelim, S, I + 1);
  if J = 0 then
    if not SecondOptional then
      exit
    else
      J := Length(S) + 1;
  Result := CopyRangeA(S, I + 1, J - 1);
end;

function StrBetween(const S: AnsiString; const FirstDelim: AnsiString;
    const SecondDelim: CharSet; const FirstOptional: Boolean;
    const SecondOptional: Boolean;
    const FirstDelimAsciiCaseSensitive: Boolean): AnsiString;
var I, J : Integer;
begin
  Result := '';
  I := PosStrA(FirstDelim, S, 1, FirstDelimAsciiCaseSensitive);
  if (I = 0) and not FirstOptional then
    exit;
  Inc(I, Length(FirstDelim));
  J := PosCharSetA(SecondDelim, S, I);
  if J = 0 then
    if not SecondOptional then
      exit
    else
      J := Length(S) + 1;
  Result := CopyRangeA(S, I, J - 1);
end;

function StrBetween(const S: AnsiString;
    const FirstDelim, SecondDelim: AnsiString; const FirstOptional: Boolean;
    const SecondOptional: Boolean ; const FirstDelimAsciiCaseSensitive: Boolean;
    const SecondDelimAsciiCaseSensitive: Boolean): AnsiString;
var I, J : Integer;
begin
  Result := '';
  I := PosStrA(FirstDelim, S, 1, FirstDelimAsciiCaseSensitive);
  if (I = 0) and not FirstOptional then
    exit;
  Inc(I, Length(FirstDelim));
  J := PosStrA(SecondDelim, S, I, SecondDelimAsciiCaseSensitive);
  if J = 0 then
    if not SecondOptional then
      exit
    else
      J := Length(S) + 1;
  Result := CopyRangeA(S, I, J - 1);
end;

function StrBefore(const S, D: AnsiString; const Optional: Boolean;
    const AsciiCaseSensitive: Boolean): AnsiString;
var I : Integer;
begin
  I := PosStrA(D, S, 1, AsciiCaseSensitive);
  if I = 0 then
    if Optional then
      Result := S
    else
      Result := ''
  else
    Result := CopyLeftA(S, I - 1);
end;

function StrBeforeRev(const S, D: AnsiString; const Optional: Boolean;
    const AsciiCaseSensitive: Boolean): AnsiString;
var I : Integer;
begin
  I := PosStrRevA(D, S, 1, AsciiCaseSensitive);
  if I = 0 then
    if Optional then
      Result := S
    else
      Result := ''
  else
    Result := CopyLeftA(S, I - 1);
end;

function StrBeforeChar(const S: AnsiString; const D: CharSet;
    const Optional: Boolean): AnsiString;
var I : Integer;
begin
  I := PosCharSetA(D, S);
  if I = 0 then
    if Optional then
      Result := S
    else
      Result := ''
  else
    Result := CopyLeftA(S, I - 1);
end;

function StrBeforeChar(const S: AnsiString; const D: AnsiChar;
    const Optional: Boolean): AnsiString;
var I : Integer;
begin
  I := PosCharA(D, S);
  if I = 0 then
    if Optional then
      Result := S
    else
      Result := ''
  else
    Result := CopyLeftA(S, I - 1);
end;

function StrBeforeCharRev(const S: AnsiString; const D: CharSet;
    const Optional: Boolean): AnsiString;
var I : Integer;
begin
  I := PosCharSetRevA(D, S);
  if I = 0 then
    if Optional then
      Result := S
    else
      Result := ''
  else
    Result := CopyLeftA(S, I - 1);
end;

function StrAfter(const S, D: AnsiString; const Optional: Boolean): AnsiString;
var I : Integer;
begin
  I := PosStrA(D, S);
  if I = 0 then
    if Optional then
      Result := S
    else
      Result := ''
  else
    Result := CopyFromA(S, I + Length(D));
end;

function StrAfterRev(const S, D: AnsiString; const Optional: Boolean): AnsiString;
var I : Integer;
begin
  I := PosStrRevA(D, S);
  if I = 0 then
    if Optional then
      Result := S
    else
      Result := ''
  else
    Result := CopyFromA(S, I + Length(D));
end;

function StrAfterChar(const S: AnsiString; const D: CharSet): AnsiString;
var I : Integer;
begin
  I := PosCharSetA(D, S);
  if I = 0 then
    Result := ''
  else
    Result := CopyFromA(S, I + 1);
end;

function StrAfterChar(const S: AnsiString; const D: AnsiChar): AnsiString;
var I : Integer;
begin
  I := PosCharA(D, S);
  if I = 0 then
    Result := ''
  else
    Result := CopyFromA(S, I + 1);
end;

function StrCopyToChar(const S: AnsiString; const D: CharSet;
    const Optional: Boolean): AnsiString;
var I : Integer;
begin
  I := PosCharSetA(D, S);
  if I = 0 then
    if Optional then
      Result := S
    else
      Result := ''
  else
    Result := CopyLeftA(S, I);
end;

function StrCopyToChar(const S: AnsiString; const D: AnsiChar;
    const Optional: Boolean): AnsiString;
var I : Integer;
begin
  I := PosCharA(D, S);
  if I = 0 then
    if Optional then
      Result := S
    else
      Result := ''
  else
    Result := CopyLeftA(S, I);
end;

function StrCopyFromChar(const S: AnsiString; const D: CharSet): AnsiString;
var I : Integer;
begin
  I := PosCharSetA(D, S);
  if I = 0 then
    Result := ''
  else
    Result := CopyFromA(S, I);
end;

function StrCopyFromChar(const S: AnsiString; const D: AnsiChar): AnsiString;
var I : Integer;
begin
  I := PosCharA(D, S);
  if I = 0 then
    Result := ''
  else
    Result := CopyFromA(S, I);
end;

function StrRemoveCharDelimited(var S: AnsiString;
    const FirstDelim, SecondDelim: AnsiChar): AnsiString;
var I, J : Integer;
begin
  Result := '';
  I := PosCharA(FirstDelim, S);
  if I = 0 then
    exit;
  J := PosCharA(SecondDelim, S, I + 1);
  if J = 0 then
    exit;
  Result := CopyRangeA(S, I + 1, J - 1);
  Delete(S, I, J - I + 1);
end;



{                                                                              }
{ Count                                                                        }
{                                                                              }
{$IFDEF CLR}
function StrCountChar(const S: AnsiString; const C: AnsiChar): Integer;
var I : Integer;
begin
  Result := 0;
  for I := 1 to Length(S) do
    if S[I] = C then
      Inc(Result);
end;
{$ELSE}
function StrCountChar(const S: AnsiString; const C: AnsiChar): Integer;
var P : PAnsiChar;
    I : Integer;
begin
  Result := 0;
  P := Pointer(S);
  for I := 1 to Length(S) do
    begin
      if P^ = C then
        Inc(Result);
      Inc(P);
    end;
end;
{$ENDIF}

{$IFDEF CLR}
function StrCountChar(const S: AnsiString; const C: CharSet): Integer;
var I : Integer;
begin
  Result := 0;
  for I := 1 to Length(S) do
    if S[I] in C then
      Inc(Result);
end;
{$ELSE}
function StrCountChar(const S: AnsiString; const C: CharSet): Integer;
var P : PAnsiChar;
    I : Integer;
begin
  Result := 0;
  P := Pointer(S);
  for I := 1 to Length(S) do
    begin
      if P^ in C then
        Inc(Result);
      Inc(P);
    end;
end;
{$ENDIF}



{                                                                              }
{ Replace                                                                      }
{                                                                              }
{$IFDEF CLR}
function StrReplaceChar(const Find, Replace: AnsiChar;
    const S: AnsiString): AnsiString;
var I, J : Integer;
begin
  Result := S;
  I := PosCharA(Find, S);
  if I = 0 then
    exit;
  for J := I to Length(S) do
    if S[J] = Find then
      Result[J] := Replace;
end;
{$ELSE}
function StrReplaceCharA(const Find, Replace: AnsiChar; const S: AnsiString): AnsiString;
var P, Q : PAnsiChar;
    I, J : Integer;
begin
  Result := S;
  I := PosCharA(Find, S);
  if I = 0 then
    exit;
  UniqueString(Result);
  Q := Pointer(Result);
  Inc(Q, I - 1);
  P := Pointer(S);
  Inc(P, I - 1);
  for J := I to Length(S) do
    begin
      if P^ = Find then
        Q^ := Replace;
      Inc(P);
      Inc(Q);
    end;
end;
{$ENDIF}

function StrReplaceCharW(const Find, Replace: WideChar; const S: WideString): WideString;
var I, J : Integer;
begin
  Result := S;
  I := PosCharW(Find, S);
  if I = 0 then
    exit;
  for J := I to Length(S) do
    if S[J] = Find then
      Result[J] := Replace;
end;

function StrReplaceChar(const Find, Replace: Char; const S: String): String;
var I, J : Integer;
begin
  Result := S;
  I := PosChar(Find, S);
  if I = 0 then
    exit;
  for J := I to Length(S) do
    if S[J] = Find then
      Result[J] := Replace;
end;

{$IFDEF CLR}
function StrReplaceChar(const Find: CharSet; const Replace: AnsiChar;
    const S: AnsiString): AnsiString;
var I, J : Integer;
begin
  Result := S;
  I := PosCharA(Find, S);
  if I = 0 then
    exit;
  for J := I to Length(S) do
    if S[J] in Find then
      Result[J] := Replace;
end;
{$ELSE}
function StrReplaceCharA(const Find: CharSet; const Replace: AnsiChar;
    const S: AnsiString): AnsiString;
var P, Q : PAnsiChar;
    I, J : Integer;
begin
  Result := S;
  I := PosCharSetA(Find, S);
  if I = 0 then
    exit;
  UniqueString(Result);
  Q := Pointer(Result);
  Inc(Q, I - 1);
  P := Pointer(S);
  Inc(P, I - 1);
  for J := I to Length(S) do
    begin
      if P^ in Find then
        Q^ := Replace;
      Inc(P);
      Inc(Q);
    end;
end;

function StrReplaceCharW(const Find: CharSet; const Replace: WideChar;
    const S: WideString): WideString;
var P, Q : PWideChar;
    I, J : Integer;
    C    : WideChar;
begin
  Result := S;
  I := PosCharSetW(Find, S);
  if I = 0 then
    exit;
  UniqueString(Result);
  Q := Pointer(Result);
  Inc(Q, I - 1);
  P := Pointer(S);
  Inc(P, I - 1);
  for J := I to Length(S) do
    begin
      C := P^;
      if Ord(C) <= $FF then
        if AnsiChar(Ord(C)) in Find then
          Q^ := Replace;
      Inc(P);
      Inc(Q);
    end;
end;
{$ENDIF}

{                                                                              }
{ StrReplace operates by replacing in 'batches' of 4096 matches. This has the  }
{ advantage of fewer memory allocations and limited stack usage when there is  }
{ a large number of matches.                                                   }
{                                                                              }
type
  StrReplaceMatchArray = Array[0..4095] of Integer;

{$IFNDEF CLR}
function StrReplaceBlockA( // used by StrReplace
    const FindLen: Integer; const Replace, S: AnsiString;
    const StartIndex, StopIndex: Integer;
    const MatchCount: Integer;
    const Matches: StrReplaceMatchArray): AnsiString;
var StrLen     : Integer;
    ReplaceLen : Integer;
    NewLen     : Integer;
    I, J, F, G : Integer;
    P, Q       : PAnsiChar;
begin
  ReplaceLen := Length(Replace);
  StrLen := StopIndex - StartIndex + 1;
  NewLen := StrLen + (ReplaceLen - FindLen) * MatchCount;
  if NewLen = 0 then
    begin
      Result := '';
      exit;
    end;
  SetString(Result, nil, NewLen);
  P := Pointer(Result);
  Q := Pointer(S);
  F := StartIndex;
  Inc(Q, F - 1);
  for I := 0 to MatchCount - 1 do
    begin
      G := Matches[I];
      J := G - F;
      if J > 0 then
        begin
          MoveMem(Q^, P^, J);
          Inc(P, J);
          Inc(Q, J);
          Inc(F, J);
        end;
      Inc(Q, FindLen);
      Inc(F, FindLen);
      if ReplaceLen > 0 then
        begin
          MoveMem(Pointer(Replace)^, P^, ReplaceLen);
          Inc(P, ReplaceLen);
        end;
    end;
  if F <= StopIndex then
    MoveMem(Q^, P^, StopIndex - F + 1);
end;

function StrReplaceBlockW( // used by StrReplace
    const FindLen: Integer; const Replace, S: WideString;
    const StartIndex, StopIndex: Integer;
    const MatchCount: Integer;
    const Matches: StrReplaceMatchArray): WideString;
var StrLen     : Integer;
    ReplaceLen : Integer;
    NewLen     : Integer;
    I, J, F, G : Integer;
    P, Q       : PWideChar;
begin
  ReplaceLen := Length(Replace);
  StrLen := StopIndex - StartIndex + 1;
  NewLen := StrLen + (ReplaceLen - FindLen) * MatchCount;
  if NewLen = 0 then
    begin
      Result := '';
      exit;
    end;
  SetString(Result, nil, NewLen);
  P := Pointer(Result);
  Q := Pointer(S);
  F := StartIndex;
  Inc(Q, F - 1);
  for I := 0 to MatchCount - 1 do
    begin
      G := Matches[I];
      J := G - F;
      if J > 0 then
        begin
          MoveMem(Q^, P^, J * SizeOf(WideChar));
          Inc(P, J);
          Inc(Q, J);
          Inc(F, J);
        end;
      Inc(Q, FindLen);
      Inc(F, FindLen);
      if ReplaceLen > 0 then
        begin
          MoveMem(Pointer(Replace)^, P^, ReplaceLen * SizeOf(WideChar));
          Inc(P, ReplaceLen);
        end;
    end;
  if F <= StopIndex then
    MoveMem(Q^, P^, (StopIndex - F + 1) * SizeOf(WideChar));
end;
{$ENDIF}

{$IFDEF CLR}
function StrReplaceA(const Find, Replace, S: AnsiString;
    const AsciiCaseSensitive: Boolean): AnsiString;
begin
  Result := Borland.Vcl.StrUtils.AnsiReplaceStr(S, Find, Replace);
end;
{$ELSE}
function StrReplaceA(const Find, Replace, S: AnsiString; const AsciiCaseSensitive: Boolean): AnsiString;
var FindLen    : Integer;
    Matches    : StrReplaceMatchArray;
    C, I, J, K : Integer;
begin
  FindLen := Length(Find);
  if FindLen = 0 then // nothing to find
    begin
      Result := S;
      exit;
    end;
  I := PosStrA(Find, S, 1, AsciiCaseSensitive);
  if I = 0 then // not found
    begin
      Result := S;
      exit;
    end;
  J := 1;
  Result := '';
  repeat
    C := 0;
    repeat
      Matches[C] := I;
      Inc(C);
      Inc(I, FindLen);
      I := PosStrA(Find, S, I, AsciiCaseSensitive);
    until (I = 0) or (C = 4096);
    if I = 0 then
      K := Length(S)
    else
      K := I - 1;
    Result := Result + StrReplaceBlockA(FindLen, Replace, S, J, K, C, Matches);
    J := K + 1;
  until I = 0;
end;

//AT
function IsReplaceOk(StartPos, FindLen: Integer): Boolean;
begin
  Result := True;
  if Assigned(FundFinder) and Assigned(FundFinder.OnCanAccept) then
    FundFinder.OnCanAccept(FundFinder, StartPos, StartPos+FindLen-1, Result);
end;

//AT
function StrReplaceW(const Find, Replace, S: WideString): Widestring;
var
  N: Integer;
begin
  StrReplaceW(Find, Replace, S, True, False, 1, N);
end;

//AT
function StrReplaceW(const Find, Replace, S: WideString;
  const AsciiCaseSensitive: Boolean;
  const WholeWords: Boolean;
  FromPos: integer;
  var ReplaceCnt: integer): WideString;
var FindLen    : Integer;
    Matches    : StrReplaceMatchArray;
    C, I, J, K : Integer;
begin
  ReplaceCnt := 0; //AT
  FindLen := Length(Find);
  if FindLen = 0 then // nothing to find
    begin
      Result := S;
      exit;
    end;
  I := PosStrW(Find, S, FromPos, AsciiCaseSensitive, WholeWords); //AT
  if I = 0 then // not found
    begin
      Result := S;
      exit;
    end;
  J := 1;
  Result := '';
  repeat
    C := 0;
    repeat
      if IsReplaceOK(I, FindLen) then //AT
      begin
        Matches[C] := I;
        Inc(C);
        Inc(ReplaceCnt); //AT
      end;
      Inc(I, FindLen);
      I := PosStrW(Find, S, I, AsciiCaseSensitive, WholeWords); //AT
    until (I = 0) or (C = 4096);
    if I = 0 then
      K := Length(S)
    else
      K := I - 1;
    Result := Result + StrReplaceBlockW(FindLen, Replace, S, J, K, C, Matches);
    J := K + 1;
  until I = 0;
end;
{$ENDIF}

{$IFNDEF CLR}
function StrReplaceA(const Find: CharSet; const Replace, S: AnsiString): AnsiString;
var Matches    : StrReplaceMatchArray;
    C, I, J, K : Integer;
begin
  I := PosCharSetA(Find, S, 1);
  if I = 0 then // not found
    begin
      Result := S;
      exit;
    end;
  J := 1;
  Result := '';
  repeat
    C := 0;
    repeat
      Matches[C] := I;
      Inc(C);
      Inc(I);
      I := PosCharSetA(Find, S, I);
    until (I = 0) or (C = 4096);
    if I = 0 then
      K := Length(S)
    else
      K := I - 1;
    Result := Result + StrReplaceBlockA(1, Replace, S, J, K, C, Matches);
    J := K + 1;
  until I = 0;
end;

function StrReplaceW(const Find: CharSet; const Replace, S: WideString): WideString;
var Matches    : StrReplaceMatchArray;
    C, I, J, K : Integer;
begin
  I := PosCharSetW(Find, S, 1);
  if I = 0 then // not found
    begin
      Result := S;
      exit;
    end;
  J := 1;
  Result := '';
  repeat
    C := 0;
    repeat
      Matches[C] := I;
      Inc(C);
      Inc(I);
      I := PosCharSetW(Find, S, I);
    until (I = 0) or (C = 4096);
    if I = 0 then
      K := Length(S)
    else
      K := I - 1;
    Result := Result + StrReplaceBlockW(1, Replace, S, J, K, C, Matches);
    J := K + 1;
  until I = 0;
end;
{$ENDIF}

{$IFDEF CLR}
function StrRemoveDup(const S: AnsiString; const C: AnsiChar): AnsiString;
begin
  Result := StrReplaceA(DupChar(C, 2), C, S);
end;
{$ELSE}
function StrRemoveDup(const S: AnsiString; const C: AnsiChar): AnsiString;
var P, Q    : PAnsiChar;
    D, E    : AnsiChar;
    I, L, M : Integer;
    R       : Boolean;
begin
  L := Length(S);
  if L <= 1 then
    begin
      Result := S;
      exit;
    end;
  // Check for duplicate
  P := Pointer(S);
  D := P^;
  Inc(P);
  R := False;
  for I := 2 to L do
    if (D = C) and (P^ = C) then
      begin
        R := True;
        break;
      end
    else
      begin
        D := P^;
        Inc(P);
      end;
  if not R then
    begin
      Result := S;
      exit;
    end;
  // Remove duplicates
  Result := S;
  UniqueString(Result);
  P := Pointer(S);
  Q := Pointer(Result);
  D := P^;
  Q^ := D;
  Inc(P);
  Inc(Q);
  M := 1;
  for I := 2 to L do
    begin
      E := P^;
      if (D <> C) or (E <> C) then
        begin
          D := E;
          Q^ := E;
          Inc(M);
          Inc(Q);
        end;
      Inc(P);
    end;
  if M < L then
    SetLength(Result, M);
end;
{$ENDIF}

{$IFDEF CLR}
function StrRemoveChar(const S: AnsiString; const C: AnsiChar): AnsiString;
begin
  Result := StrReplaceA(C, '', S);
end;
{$ELSE}
function StrRemoveCharA(const S: AnsiString; const C: AnsiChar): AnsiString;
var P, Q    : PAnsiChar;
    I, L, M : Integer;
begin
  L := Length(S);
  if L = 0 then
    begin
      Result := '';
      exit;
    end;
  M := 0;
  P := Pointer(S);
  for I := 1 to L do
    begin
      if P^ = C then
        Inc(M);
      Inc(P);
    end;
  if M = 0 then
    begin
      Result := S;
      exit;
    end;
  SetLength(Result, L - M);
  Q := Pointer(Result);
  P := Pointer(S);
  for I := 1 to L do
    begin
      if P^ <> C then
        begin
          Q^ := P^;
          Inc(Q);
        end;
      Inc(P);
    end;
end;

function StrRemoveCharSetA(const S: AnsiString; const C: CharSet): AnsiString;
var P, Q    : PAnsiChar;
    I, L, M : Integer;
begin
  L := Length(S);
  if L = 0 then
    begin
      Result := '';
      exit;
    end;
  M := 0;
  P := Pointer(S);
  for I := 1 to L do
    begin
      if P^ in C then
        Inc(M);
      Inc(P);
    end;
  if M = 0 then
    begin
      Result := S;
      exit;
    end;
  SetLength(Result, L - M);
  Q := Pointer(Result);
  P := Pointer(S);
  for I := 1 to L do
    begin
      if not (P^ in C) then
        begin
          Q^ := P^;
          Inc(Q);
        end;
      Inc(P);
    end;
end;
{$ENDIF}



{                                                                              }
{ Split                                                                        }
{                                                                              }
function StrSplitAtA(const S: AnsiString; const C: AnsiString;
         var Left, Right: AnsiString; const AsciiCaseSensitive: Boolean;
         const Optional: Boolean): Boolean;
var I : Integer;
    T : AnsiString;
begin
  I := PosStrA(C, S, 1, AsciiCaseSensitive);
  Result := I > 0;
  if Result then
    begin
      T := S;
      Left := Copy(T, 1, I - 1);
      Right := CopyFromA(T, I + Length(C));
    end
  else
    begin
      if Optional then
        Left := S
      else
        Left := '';
      Right := '';
    end;
end;

function StrSplitAtW(const S: WideString; const C: WideString;
         var Left, Right: WideString; const AsciiCaseSensitive: Boolean;
         const Optional: Boolean): Boolean;
var I : Integer;
    T : WideString;
begin
  I := PosStrW(C, S, 1, AsciiCaseSensitive);
  Result := I > 0;
  if Result then
    begin
      T := S;
      Left := Copy(T, 1, I - 1);
      Right := CopyFromW(T, I + Length(C));
    end
  else
    begin
      if Optional then
        Left := S
      else
        Left := '';
      Right := '';
    end;
end;

function StrSplitAtCharA(const S: AnsiString; const C: AnsiChar;
         var Left, Right: AnsiString; const Optional: Boolean): Boolean;
var I : Integer;
    T : AnsiString;
begin
  I := PosCharA(C, S);
  Result := I > 0;
  if Result then
    begin
      T := S; // add reference to S (in case it is also Left or Right)
      Left := Copy(T, 1, I - 1);
      Right := CopyFromA(T, I + 1);
    end
  else
    begin
      if Optional then
        Left := S
      else
        Left := '';
      Right := '';
    end;
end;

function StrSplitAtCharW(const S: WideString; const C: WideChar;
         var Left, Right: WideString; const Optional: Boolean): Boolean;
var I : Integer;
    T : WideString;
begin
  I := PosCharW(C, S);
  Result := I > 0;
  if Result then
    begin
      T := S; // add reference to S (in case it is also Left or Right)
      Left := Copy(T, 1, I - 1);
      Right := CopyFromW(T, I + 1);
    end
  else
    begin
      if Optional then
        Left := S
      else
        Left := '';
      Right := '';
    end;
end;

function StrSplitAtCharSetA(const S: AnsiString; const C: CharSet;
         var Left, Right: AnsiString; const Optional: Boolean): Boolean;
var I : Integer;
    T : AnsiString;
begin
  I := PosCharSetA(C, S);
  Result := I > 0;
  if Result then
    begin
      T := S;
      Left := Copy(T, 1, I - 1);
      Right := CopyFromA(T, I + 1);
    end else
    begin
      if Optional then
        Left := S
      else
        Left := '';
      Right := '';
    end;
end;

function StrSplitA(const S, D: AnsiString): AnsiStringArray;
var I, J, L, M : Integer;
begin
  // Check valid parameters
  if S = '' then
    begin
      Result := nil;
      exit;
    end;
  M := Length(D);
  if M = 0 then
    begin
      SetLength(Result, 1);
      Result[0] := S;
      exit;
    end;
  // Count
  L := 0;
  I := 1;
  repeat
    I := PosStrA(D, S, I, True);
    if I = 0 then
      break;
    Inc(L);
    Inc(I, M);
  until False;
  SetLength(Result, L + 1);
  if L = 0 then
    begin
      // No split
      Result[0] := S;
      exit;
    end;
  // Split
  L := 0;
  I := 1;
  repeat
    J := PosStrA(D, S, I, True);
    if J = 0 then
      begin
        Result[L] := CopyFromA(S, I);
        break;
      end;
    Result[L] := CopyRangeA(S, I, J - 1);
    Inc(L);
    I := J + M;
  until False;
end;

function StrSplitW(const S, D: WideString): WideStringArray;
var I, J, L, M : Integer;
begin
  // Check valid parameters
  if S = '' then
    begin
      Result := nil;
      exit;
    end;
  M := Length(D);
  if M = 0 then
    begin
      SetLength(Result, 1);
      Result[0] := S;
      exit;
    end;
  // Count
  L := 0;
  I := 1;
  repeat
    I := PosStrW(D, S, I, True);
    if I = 0 then
      break;
    Inc(L);
    Inc(I, M);
  until False;
  SetLength(Result, L + 1);
  if L = 0 then
    begin
      // No split
      Result[0] := S;
      exit;
    end;
  // Split
  L := 0;
  I := 1;
  repeat
    J := PosStrW(D, S, I, True);
    if J = 0 then
      begin
        Result[L] := CopyFromW(S, I);
        break;
      end;
    Result[L] := CopyRangeW(S, I, J - 1);
    Inc(L);
    I := J + M;
  until False;
end;

function StrSplitCharA(const S: AnsiString; const D: AnsiChar): AnsiStringArray;
var I, J, L : Integer;
begin
  // Check valid parameters
  if S = '' then
    begin
      Result := nil;
      exit;
    end;
  // Count
  L := 0;
  I := 1;
  repeat
    I := PosCharA(D, S, I);
    if I = 0 then
      break;
    Inc(L);
    Inc(I);
  until False;
  SetLength(Result, L + 1);
  if L = 0 then
    begin
      // No split
      Result[0] := S;
      exit;
    end;
  // Split
  L := 0;
  I := 1;
  repeat
    J := PosCharA(D, S, I);
    if J = 0 then
      begin
        Result[L] := CopyFromA(S, I);
        break;
      end;
    Result[L] := CopyRangeA(S, I, J - 1);
    Inc(L);
    I := J + 1;
  until False;
end;

function StrSplitCharW(const S: WideString; const D: WideChar): WideStringArray;
var I, J, L : Integer;
begin
  // Check valid parameters
  if S = '' then
    begin
      Result := nil;
      exit;
    end;
  // Count
  L := 0;
  I := 1;
  repeat
    I := PosCharW(D, S, I);
    if I = 0 then
      break;
    Inc(L);
    Inc(I);
  until False;
  SetLength(Result, L + 1);
  if L = 0 then
    begin
      // No split
      Result[0] := S;
      exit;
    end;
  // Split
  L := 0;
  I := 1;
  repeat
    J := PosCharW(D, S, I);
    if J = 0 then
      begin
        Result[L] := CopyFromW(S, I);
        break;
      end;
    Result[L] := CopyRangeW(S, I, J - 1);
    Inc(L);
    I := J + 1;
  until False;
end;

function StrSplitCharSetA(const S: AnsiString; const D: CharSet): AnsiStringArray;
var I, J, L : Integer;
begin
  // Check valid parameters
  if S = '' then
    begin
      Result := nil;
      exit;
    end;
  // Count
  L := 0;
  I := 1;
  repeat
    I := PosCharSetA(D, S, I);
    if I = 0 then
      break;
    Inc(L);
    Inc(I);
  until False;
  SetLength(Result, L + 1);
  if L = 0 then
    begin
      // No split
      Result[0] := S;
      exit;
    end;
  // Split
  L := 0;
  I := 1;
  repeat
    J := PosCharSetA(D, S, I);
    if J = 0 then
      begin
        Result[L] := CopyFromA(S, I);
        break;
      end;
    Result[L] := CopyRangeA(S, I, J - 1);
    Inc(L);
    I := J + 1;
  until False;
end;

function StrSplitCharSetW(const S: WideString; const D: CharSet): WideStringArray;
var I, J, L : Integer;
begin
  // Check valid parameters
  if S = '' then
    begin
      Result := nil;
      exit;
    end;
  // Count
  L := 0;
  I := 1;
  repeat
    I := PosCharSetW(D, S, I);
    if I = 0 then
      break;
    Inc(L);
    Inc(I);
  until False;
  SetLength(Result, L + 1);
  if L = 0 then
    begin
      // No split
      Result[0] := S;
      exit;
    end;
  // Split
  L := 0;
  I := 1;
  repeat
    J := PosCharSetW(D, S, I);
    if J = 0 then
      begin
        Result[L] := CopyFromW(S, I);
        break;
      end;
    Result[L] := CopyRangeW(S, I, J - 1);
    Inc(L);
    I := J + 1;
  until False;
end;

{$IFNDEF CLR}
function StrSplitWords(const S: AnsiString; const C: CharSet): AnsiStringArray;
var P, Q : PAnsiChar;
    L, M : Integer;
    T    : AnsiString;
begin
  Result := nil;
  L := Length(S);
  P := Pointer(S);
  Q := P;
  M := 0;
  while L > 0 do
    if P^ in C then
      begin
        Inc(P);
        Dec(L);
        Inc(M);
      end else
      begin
        if M > 0 then
          begin
            SetLength(T, M);
            MoveMem(Q^, Pointer(T)^, M);
            Append(Result, T);
          end;
        M := 0;
        Inc(P);
        Dec(L);
        Q := P;
      end;
  if M > 0 then
    begin
      SetLength(T, M);
      MoveMem(Q^, Pointer(T)^, M);
      Append(Result, T);
    end;
end;
{$ENDIF}

{$IFDEF CLR}
function StrJoin(const S: Array of AnsiString; const D: AnsiString): AnsiString;
var L, I : Integer;
begin
  Result := '';
  L := Length(S);
  if L = 0 then
    exit;
  for I := 0 to L - 1 do
    begin
      Result := Result + S[I];
      if I < L - 1 then
        Result := Result + D;
    end;
end;
{$ELSE}
function StrJoinA(const S: Array of AnsiString; const D: AnsiString): AnsiString;
var I, L, M, C : Integer;
    P : PAnsiChar;
    T : AnsiString;
begin
  L := Length(S);
  if L = 0 then
    begin
      Result := '';
      exit;
    end;
  M := Length(D);
  SetLength(Result, StringsTotalLengthA(S) + (L - 1) * M);
  P := Pointer(Result);
  for I := 0 to L - 1 do
    begin
      if (I > 0) and (M > 0) then
        begin
          MoveMem(Pointer(D)^, P^, M);
          Inc(P, M);
        end;
      T := S[I];
      C := Length(T);
      if C > 0 then
        begin
          MoveMem(Pointer(T)^, P^, C);
          Inc(P, C);
        end;
    end;
end;

function StrJoinW(const S: Array of WideString; const D: WideString): WideString;
var I, L, M, C : Integer;
    P : PWideChar;
    T : WideString;
begin
  L := Length(S);
  if L = 0 then
    begin
      Result := '';
      exit;
    end;
  M := Length(D);
  SetLength(Result, StringsTotalLengthW(S) + (L - 1) * M);
  P := Pointer(Result);
  for I := 0 to L - 1 do
    begin
      if (I > 0) and (M > 0) then
        begin
          MoveMem(Pointer(D)^, P^, M * SizeOf(WideChar));
          Inc(P, M);
        end;
      T := S[I];
      C := Length(T);
      if C > 0 then
        begin
          MoveMem(Pointer(T)^, P^, C * SizeOf(WideChar));
          Inc(P, C);
        end;
    end;
end;
{$ENDIF}

{$IFDEF CLR}
function StrJoinChar(const S: Array of AnsiString; const D: AnsiChar): AnsiString;
var L, I : Integer;
begin
  Result := '';
  L := Length(S);
  if L = 0 then
    exit;
  for I := 0 to L - 1 do
    begin
      Result := Result + S[I];
      if I < L - 1 then
        Result := Result + D;
    end;
end;
{$ELSE}
function StrJoinCharA(const S: Array of AnsiString; const D: AnsiChar): AnsiString;
var I, L, C : Integer;
    P : PAnsiChar;
    T : AnsiString;
begin
  L := Length(S);
  if L = 0 then
    begin
      Result := '';
      exit;
    end;
  SetLength(Result, StringsTotalLengthA(S) + L - 1);
  P := Pointer(Result);
  for I := 0 to L - 1 do
    begin
      if I > 0 then
        begin
          P^ := D;
          Inc(P);
        end;
      T := S[I];
      C := Length(T);
      if C > 0 then
        begin
          MoveMem(Pointer(T)^, P^, C);
          Inc(P, C);
        end;
    end;
end;

function StrJoinCharW(const S: Array of WideString; const D: WideChar): WideString;
var I, L, C : Integer;
    P : PWideChar;
    T : WideString;
begin
  L := Length(S);
  if L = 0 then
    begin
      Result := '';
      exit;
    end;
  SetLength(Result, StringsTotalLengthW(S) + L - 1);
  P := Pointer(Result);
  for I := 0 to L - 1 do
    begin
      if I > 0 then
        begin
          P^ := D;
          Inc(P);
        end;
      T := S[I];
      C := Length(T);
      if C > 0 then
        begin
          MoveMem(Pointer(T)^, P^, C * SizeOf(WideChar));
          Inc(P, C);
        end;
    end;
end;
{$ENDIF}



{                                                                              }
{ Quoting                                                                      }
{                                                                              }
{$IFDEF CLR}
function StrHasSurroundingQuotes(const S: AnsiString;
    const Quotes: CharSet): Boolean;
var Q : AnsiChar;
    L : Integer;
begin
  Result := False;
  L := Length(S);
  if L >= 2 then
    begin
      Q := S[1];
      if Q in Quotes then
        if S[L] = Q then
          Result := True;
    end;
end;
{$ElSE}
function StrHasSurroundingQuotesA(const S: AnsiString; const Quotes: CharSet): Boolean;
var P : PAnsiChar;
    Q : AnsiChar;
    L : Integer;
begin
  Result := False;
  L := Length(S);
  if L >= 2 then
    begin
      P := Pointer(S);
      Q := P^;
      if Q in Quotes then
        begin
          Inc(P, L - 1);
          if P^ = Q then
            Result := True;
        end;
    end;
end;

function StrHasSurroundingQuotesW(const S: WideString; const Quotes: CharSet): Boolean;
var P : PWideChar;
    Q : WideChar;
    L : Integer;
begin
  Result := False;
  L := Length(S);
  if L >= 2 then
    begin
      P := Pointer(S);
      Q := P^;
      if Ord(Q) <= $FF then
        if AnsiChar(Byte(Q)) in Quotes then
          begin
            Inc(P, L - 1);
            if P^ = Q then
              Result := True;
          end;
    end;
end;
{$ENDIF}

function StrRemoveSurroundingQuotesA(const S: AnsiString; const Quotes: CharSet): AnsiString;
begin
  if StrHasSurroundingQuotesA(S, Quotes) then
    Result := Copy(S, 2, Length(S) - 2)
  else
    Result := S;
end;

function StrRemoveSurroundingQuotesW(const S: WideString; const Quotes: CharSet): WideString;
begin
  if StrHasSurroundingQuotesW(S, Quotes) then
    Result := Copy(S, 2, Length(S) - 2)
  else
    Result := S;
end;

function StrQuoteA(const S: AnsiString; const Quote: AnsiChar): AnsiString;
begin
  Result := Quote + StrReplaceA(Quote, DupCharA(Quote, 2), S) + Quote;
end;

function StrQuoteW(const S: WideString; const Quote: WideChar): WideString;
begin
  Result := Quote + StrReplaceW(Quote, DupCharW(Quote, 2), S) + Quote;
end;

function StrUnquoteA(const S: AnsiString): AnsiString;
var Quote : AnsiChar;
begin
  if not StrHasSurroundingQuotesA(S, csQuotes) then
    begin
      Result := S;
      exit;
    end;
  {$IFDEF CLR}
  Quote := S[1];
  {$ELSE}
  Quote := PAnsiChar(Pointer(S))^;
  {$ENDIF}
  Result := StrRemoveSurroundingQuotesA(S, csQuotes);
  Result := StrReplaceA(DupCharA(Quote, 2), Quote, Result);
end;

function StrUnquoteW(const S: WideString): WideString;
var Quote : WideChar;
begin
  if not StrHasSurroundingQuotesW(S, csQuotes) then
    begin
      Result := S;
      exit;
    end;
  {$IFDEF CLR}
  Quote := S[1];
  {$ELSE}
  Quote := PWideChar(Pointer(S))^;
  {$ENDIF}
  Result := StrRemoveSurroundingQuotesW(S, csQuotes);
  Result := StrReplaceW(DupCharW(Quote, 2), Quote, Result);
end;

function StrMatchQuotedStr(const S: AnsiString; const ValidQuotes: CharSet;
    const Index: Integer): Integer;
var Quote : AnsiChar;
    I, L  : Integer;
    R     : Boolean;
begin
  L := Length(S);
  if (Index < 1) or (L < Index + 1) or not (S[Index] in ValidQuotes) then
    begin
      Result := 0;
      exit;
    end;
  Quote := S[Index];
  I := Index + 1;
  R := False;
  repeat
    I := PosCharA(Quote, S, I);
    if I = 0 then // no closing quote
      begin
        Result := 0;
        exit;
      end else
      if I = L then // closing quote is last character
        R := True else
        if S[I + 1] <> Quote then // not double quoted
          R := True
        else
          Inc(I, 2);
  until R;
  Result := I - Index + 1;
end;

function StrIsQuotedStr(const S: AnsiString; const ValidQuotes: CharSet): Boolean;
var L : Integer;
begin
  L := Length(S);
  if (L < 2) or (S[1] <> S[L]) or not (S[1] in ValidQuotes) then
    Result := False
  else
    Result := StrMatchQuotedStr(S, ValidQuotes) = L;
end;

function StrFindClosingQuote(const S: AnsiString; const OpenQuotePos: Integer): Integer;
var I : Integer;
    OpenQuote : AnsiChar;
    R : Boolean;
begin
  if (OpenQuotePos <= 0) or (OpenQuotePos > Length(S)) then
    begin
      Result := 0;
      exit;
    end;
  I := OpenQuotePos;
  OpenQuote := S[I];
  repeat
    I := PosCharA(OpenQuote, S, I + 1);
    if I = 0 then
      begin
        Result := 0;
        exit;
      end;
    R := (I = Length(S)) or (S[I + 1] <> OpenQuote);
    if not R then
      Inc(I);
  until R;
  Result := I;
end;



{                                                                              }
{ Bracketing                                                                   }
{                                                                              }
function StrFindClosingBracket(const S: AnsiString;
    const OpenBracketPos: Integer; const CloseBracket: AnsiChar): Integer;
var OpenBracket : AnsiChar;
    Brackets    : CharSet;
    I, C        : Integer;
begin
  Result := 0;
  I := OpenBracketPos;
  if (I <= 0) or (I > Length(S)) then
    exit;
  OpenBracket := S[OpenBracketPos];
  Brackets := [OpenBracket, CloseBracket];
  C := 1;
  repeat
    I := PosCharSetA(Brackets, S, I + 1);
    if I = 0 then
      exit;
    if S[I] = OpenBracket then
      Inc(C)
    else
      Dec(C);
  until C = 0;
  Result := I;
end;



{                                                                              }
{ Escaping                                                                     }
{                                                                              }
function StrHexEscape(const S: AnsiString; const C: CharSet;
    const EscPrefix: AnsiString; const EscSuffix: AnsiString;
    const UpperHex: Boolean; const TwoDigitHex: Boolean): AnsiString;
var I, J   : Integer;
    HexStr : AnsiString;
begin
  Result := '';
  J := 1;
  I := PosCharSetA(C, S);
  while I > 0 do
    begin
      if TwoDigitHex then
        HexStr := LongWordToHex(Ord(S[I]), 2)
      else
        HexStr := LongWordToHex(Ord(S[I]), 1);
      if UpperHex then
        AsciiConvertUpperA(HexStr)
      else
        AsciiConvertLowerA(HexStr);
      Result := Result + CopyRangeA(S, J, I - 1) +
                EscPrefix + HexStr + EscSuffix;
      J := I + 1;
      I := PosCharSetA(C, S, J);
    end;
  if J = 1 then
    Result := S
  else
    Result := Result + CopyFromA(S, J);
end;

function StrHexUnescape(const S: AnsiString; const EscPrefix: AnsiString;
    const AsciiCaseSensitive: Boolean): AnsiString;
var I, J, L, M : Integer;
    V : Byte;
begin
  Result := '';
  L := Length(S);
  if L = 0 then
    exit;
  M := Length(EscPrefix);
  if M = 0 then
    exit;
  // Replace
  J := 1;
  repeat
    I := PosStrA(EscPrefix, S, J, AsciiCaseSensitive);
    if I > 0 then
      begin
        Result := Result + CopyRangeA(S, J, I - 1);
        Inc(I, M);
        if (I <= L) and IsHexAnsiChar(S[I]) then
          begin
            if (I < L) and IsHexAnsiChar(S[I + 1]) then
              begin
                V := HexAnsiCharToInt(S[I]) * 16 + HexAnsiCharToInt(S[I + 1]);
                Inc(I, 2);
              end else
              begin
                V := HexAnsiCharToInt(S[I]);
                Inc(I);
              end;
            Result := Result + AnsiChar(V);
          end;
        J := I;
      end;
  until I = 0;
  if (I = 0) and (J = 0) then
    Result := S
  else
    Result := Result + CopyFromA(S, J);
end;

function StrCharEscape(const S: AnsiString; const C: Array of AnsiChar;
    const EscPrefix: AnsiString; const EscSeq: Array of AnsiString): AnsiString;
var I, J, L : Integer;
    F       : CharSet;
    T       : AnsiChar;
    Lookup  : Array[AnsiChar] of Integer;
begin
  L := Length(C);
  if L = 0 then
    begin
      Result := S;
      exit;
    end;
  if L <> Length(EscSeq) then
    raise EStrInvalidArgument.Create('Invalid arguments');
  // Initialize lookup
  {$IFDEF CLR}
  for T := #0 to #255 do
    Lookup[T] := 0;
  {$ELSE}
  ZeroMem(Lookup, Sizeof(Lookup));
  {$ENDIF}
  F := [];
  for I := 0 to Length(C) - 1 do
    begin
      T := C[I];
      Include(F, T);
      Lookup[T] := I;
    end;
  // Replace
  Result := '';
  J := 1;
  I := PosCharSetA(F, S);
  while I > 0 do
    begin
      Result := Result + CopyRangeA(S, J, I - 1) +
                EscPrefix + EscSeq[Lookup[S[I]]];
      J := I + 1;
      I := PosCharSetA(F, S, J);
    end;
  if J = 1 then
    Result := S
  else
    Result := Result + CopyFromA(S, J);
end;

function StrCharUnescape(const S: AnsiString; const EscPrefix: AnsiString;
    const C: Array of AnsiChar; const Replace: Array of AnsiString;
    const PrefixAsciiCaseSensitive: Boolean; const
    AlwaysDropPrefix: Boolean): AnsiString;
var I, J, L : Integer;
    F, G, M : Integer;
    D       : AnsiChar;
begin
  if High(C) <> High(Replace) then
    raise EStrInvalidArgument.Create('Invalid arguments');
  L := Length(EscPrefix);
  M := Length(S);
  if (L = 0) or (M <= L) then
    begin
      Result := S;
      exit;
    end;
  // Replace
  Result := '';
  J := 1;
  repeat
    I := PosStrA(EscPrefix, S, J, PrefixAsciiCaseSensitive);
    if I > 0 then
      begin
        G := -1;
        if I < Length(S) then
          begin
            D := S[I + L];
            for F := 0 to High(C) do
              if C[F] = D then
                begin
                  G := F;
                  break;
                end;
          end;
        Result := Result + CopyRangeA(S, J, I - 1);
        if G >= 0 then
          Result := Result + Replace[G] else
          if not AlwaysDropPrefix then
            Result := Result + EscPrefix;
        J := I + L + 1;
      end;
  until I = 0;
  if (I = 0) and (J = 0) then
    Result := S
  else
    Result := Result + CopyFromA(S, J);
end;

function StrCStyleEscape(const S: AnsiString): AnsiString;
begin
  Result := StrCharEscape(S,
      [AsciiCR, AsciiLF, AsciiNULL, AsciiBEL, AsciiBS, AsciiESC, AsciiHT,
       AsciiFF, AsciiVT, '\'], '\',
      ['n',     'l',     '0',       'a',      'b',     'e',      't',
       'f',     'v',     '\']);
end;

function StrCStyleUnescape(const S: AnsiString): AnsiString;
begin
  Result := StrCharUnescape(S, '\',
      ['n',     'l',     '0',       'a',      'b',     'e',      't',
       'f',     'v',     '\',     '''',      '"',      '?'],
      [AsciiCR, AsciiLF, AsciiNULL, AsciiBEL, AsciiBS, AsciiESC, AsciiHT,
       AsciiFF, AsciiVT, '\',     '''',      '"',      '?'], True, False);
  Result := StrHexUnescape(Result, '\x', True);
end;



{                                                                              }
{ Prefix and Suffix                                                            }
{                                                                              }
function StrInclPrefixA(const S: AnsiString; const Prefix: AnsiString;
  const AsciiCaseSensitive: Boolean): AnsiString;
begin
  if not StrMatchLeftA(S, Prefix, AsciiCaseSensitive) then
    Result := Prefix + S
  else
    Result := S;
end;

function StrInclPrefixW(const S: WideString; const Prefix: WideString;
  const AsciiCaseSensitive: Boolean): WideString;
begin
  if not StrMatchLeftW(S, Prefix, AsciiCaseSensitive) then
    Result := Prefix + S
  else
    Result := S;
end;

function StrInclSuffixA(const S: AnsiString; const Suffix: AnsiString;
  const AsciiCaseSensitive: Boolean): AnsiString;
begin
  if not StrMatchRightA(S, Suffix, AsciiCaseSensitive) then
    Result := S + Suffix
  else
    Result := S;
end;

function StrInclSuffixW(const S: WideString; const Suffix: WideString;
  const AsciiCaseSensitive: Boolean): WideString;
begin
  if not StrMatchRightW(S, Suffix, AsciiCaseSensitive) then
    Result := S + Suffix
  else
    Result := S;
end;

function StrExclPrefixA(const S: AnsiString; const Prefix: AnsiString;
  const AsciiCaseSensitive: Boolean): AnsiString;
begin
  if StrMatchLeftA(S, Prefix, AsciiCaseSensitive) then
    Result := CopyFromA(S, Length(Prefix) + 1)
  else
    Result := S;
end;

function StrExclPrefixW(const S: WideString; const Prefix: WideString;
  const AsciiCaseSensitive: Boolean): WideString;
begin
  if StrMatchLeftW(S, Prefix, AsciiCaseSensitive) then
    Result := CopyFromW(S, Length(Prefix) + 1)
  else
    Result := S;
end;

function StrExclSuffixA(const S: AnsiString; const Suffix: AnsiString;
  const AsciiCaseSensitive: Boolean): AnsiString;
begin
  if StrMatchRightA(S, Suffix, AsciiCaseSensitive) then
    Result := Copy(S, 1, Length(S) - Length(Suffix))
  else
    Result := S;
end;

function StrExclSuffixW(const S: WideString; const Suffix: WideString;
  const AsciiCaseSensitive: Boolean): WideString;
begin
  if StrMatchRightW(S, Suffix, AsciiCaseSensitive) then
    Result := Copy(S, 1, Length(S) - Length(Suffix))
  else
    Result := S;
end;

{$IFDEF CLR}
procedure StrEnsurePrefixA(var S : AnsiString; const Prefix: AnsiString;
  const AsciiCaseSensitive: Boolean);
begin
  if (Prefix <> '') and not StrMatchLeftA(S, Prefix, AsciiCaseSensitive) then
    S := Prefix + S;
end;
{$ELSE}
procedure StrEnsurePrefixA(var S : AnsiString; const Prefix: AnsiString;
  const AsciiCaseSensitive: Boolean);
var L, M : Integer;
    P : PAnsiChar;
begin
  if (Prefix <> '') and not StrMatchLeftA(S, Prefix, AsciiCaseSensitive) then
    begin
      L := Length(S);
      M := Length(Prefix);
      SetLength(S, L + M);
      if L > 0 then
        begin
          P := Pointer(S);
          Inc(P, M);
          MoveMem(Pointer(S)^, P^, L);
        end;
      MoveMem(Pointer(Prefix)^, Pointer(S)^, M);
    end;
end;

procedure StrEnsurePrefixW(var S : WideString; const Prefix: WideString;
  const AsciiCaseSensitive: Boolean);
begin
  if (Prefix <> '') and not StrMatchLeftW(S, Prefix, AsciiCaseSensitive) then
    S := Prefix + S;
end;
{$ENDIF}

{$IFDEF CLR}
procedure StrEnsureSuffixA(var S : AnsiString; const Suffix: AnsiString;
  const AsciiCaseSensitive: Boolean);
begin
  if (Suffix <> '') and not StrMatchRightA(S, Suffix, AsciiCaseSensitive) then
    S := S + Suffix;
end;
{$ELSE}
procedure StrEnsureSuffixA(var S : AnsiString; const Suffix: AnsiString;
  const AsciiCaseSensitive: Boolean);
var L, M : Integer;
    P : PAnsiChar;
begin
  if (Suffix <> '') and not StrMatchRightA(S, Suffix, AsciiCaseSensitive) then
    begin
      L := Length(S);
      M := Length(Suffix);
      SetLength(S, L + M);
      P := Pointer(S);
      Inc(P, L);
      MoveMem(Pointer(Suffix)^, P^, M);
    end;
end;

procedure StrEnsureSuffixW(var S : WideString; const Suffix: WideString;
  const AsciiCaseSensitive: Boolean);
begin
  if (Suffix <> '') and not StrMatchRightW(S, Suffix, AsciiCaseSensitive) then
    S := S + Suffix;
end;
{$ENDIF}

{$IFDEF CLR}
procedure StrEnsureNoPrefixA(var S : AnsiString; const Prefix: AnsiString;
  const AsciiCaseSensitive: Boolean);
begin
  if StrMatchLeftA(S, Prefix, AsciiCaseSensitive) then
    Delete(S, 1, Length(Prefix));
end;
{$ELSE}
procedure StrEnsureNoPrefixA(var S : AnsiString; const Prefix: AnsiString;
  const AsciiCaseSensitive: Boolean);
var L, M : Integer;
    P : PAnsiChar;
begin
  if StrMatchLeftA(S, Prefix, AsciiCaseSensitive) then
    begin
      L := Length(S);
      M := Length(Prefix);
      P := Pointer(S);
      Inc(P, M);
      MoveMem(P^, Pointer(S)^, L - M);
      SetLength(S, L - M);
    end;
end;

procedure StrEnsureNoPrefixW(var S : WideString; const Prefix: WideString;
  const AsciiCaseSensitive: Boolean);
begin
  if StrMatchLeftW(S, Prefix, AsciiCaseSensitive) then
    Delete(S, 1, Length(Prefix));
end;
{$ENDIF}

procedure StrEnsureNoSuffixA(var S : AnsiString; const Suffix: AnsiString;
  const AsciiCaseSensitive: Boolean);
begin
  if StrMatchRightA(S, Suffix, AsciiCaseSensitive) then
    SetLength(S, Length(S) - Length(Suffix));
end;

procedure StrEnsureNoSuffixW(var S : WideString; const Suffix: WideString;
  const AsciiCaseSensitive: Boolean);
begin
  if StrMatchRightW(S, Suffix, AsciiCaseSensitive) then
    SetLength(S, Length(S) - Length(Suffix));
end;



{                                                                              }
{ Skip                                                                         }
{                                                                              }
{$IFNDEF CLR}
function StrZSkipChar(var P: PAnsiChar; const C: AnsiChar): Boolean;
var Q : PAnsiChar;
    D : AnsiChar;
begin
  Assert(C <> #0);
  Q := P;
  if not Assigned(Q) then
    Result := False
  else
    begin
      D := Q^;
      if D = #0 then
        Result := False else
        if D = C then
          begin
            Inc(P);
            Result := True;
          end
        else
          Result := False;
    end;
end;

function StrZSkipChar(var P: PAnsiChar; const C: CharSet): Boolean;
var Q : PAnsiChar;
    D : AnsiChar;
begin
  Q := P;
  if not Assigned(Q) then
    Result := False
  else
    begin
      D := Q^;
      if D = #0 then
        Result := False else
        if D in C then
          begin
            Inc(P);
            Result := True;
          end
        else
          Result := False;
    end;
end;

function StrZSkipAll(var P: PAnsiChar; const C: AnsiChar): Integer;
var Q : PAnsiChar;
begin
  Assert(C <> #0);
  Result := 0;
  Q := P;
  if not Assigned(Q) then
    exit;
  while (Q^ <> #0) and (Q^ = C) do
    begin
      Inc(Q);
      Inc(Result);
    end;
  P := Q;
end;

function StrZSkipAll(var P: PAnsiChar; const C: CharSet): Integer;
var Q : PAnsiChar;
begin
  Result := 0;
  Q := P;
  if not Assigned(Q) then
    exit;
  while (Q^ <> #0) and (Q^ in C) do
    begin
      Inc(Q);
      Inc(Result);
    end;
  P := Q;
end;

function StrZSkipToChar(var P: PAnsiChar; const C: CharSet): Integer;
var Q : PAnsiChar;
begin
  Result := 0;
  Q := P;
  if not Assigned(Q) then
    exit;
  while (Q^ <> #0) and not (Q^ in C) do
    begin
      Inc(Q);
      Inc(Result);
    end;
  P := Q;
end;

function StrZSkipToStr(var P: PAnsiChar; const S: AnsiString; const AsciiCaseSensitive: Boolean): Integer;
var Q : PAnsiChar;
begin
  Result := 0;
  Q := P;
  if not Assigned(Q) then
    exit;
  while (Q^ <> #0) and not StrZMatchStr(Q, S, AsciiCaseSensitive) do
    begin
      Inc(Q);
      Inc(Result);
    end;
  P := Q;
end;

function StrZSkip2CharSeq(var P: PAnsiChar; const S1, S2: CharSet): Boolean;
var Q : PAnsiChar;
    C : AnsiChar;
begin
  Q := P;
  if not Assigned(Q) then
    begin
      Result := False;
      exit;
    end;
  C := Q^;
  if (C = #0) or not (C in S1) then
    begin
      Result := False;
      exit;
    end;
  Inc(Q);
  C := Q^;
  if (C = #0) or not (C in S2) then
    Result := False
  else
    begin
      Inc(P, 2);
      Result := True;
    end;
end;

function StrZSkip3CharSeq(var P: PAnsiChar; const S1, S2, S3: CharSet): Boolean;
var Q : PAnsiChar;
    C : AnsiChar;
begin
  Q := P;
  if not Assigned(Q) then
    begin
      Result := False;
      exit;
    end;
  C := Q^;
  if (C = #0) or not (C in S1) then
    begin
      Result := False;
      exit;
    end;
  Inc(Q);
  C := Q^;
  if (C = #0) or not (C in S2) then
    begin
      Result := False;
      exit;
    end;
  Inc(Q);
  C := Q^;
  if (C = #0) or not (C in S3) then
    Result := False
  else
    begin
      Inc(P, 3);
      Result := True;
    end;
end;

function StrZSkipStr(var P: PAnsiChar; const S: AnsiString; const AsciiCaseSensitive: Boolean): Boolean;
begin
  Result := StrZMatchStr(P, S, AsciiCaseSensitive);
  if Result then
    Inc(P, Length(S));
end;
{$ENDIF}



{                                                                              }
{ Extract                                                                      }
{                                                                              }
{$IFNDEF CLR}
function StrZExtractAll(var P: PAnsiChar; const C: AnsiChar): AnsiString;
var Q : PAnsiChar;
    I : Integer;
begin
  Q := P;
  I := StrZSkipAll(P, C);
  if I = 0 then
    begin
      Result := '';
      exit;
    end;
  SetLength(Result, I);
  MoveMem(Q^, Pointer(Result)^, I);
end;

function StrZExtractAll(var P: PAnsiChar; const C: CharSet): AnsiString;
var Q : PAnsiChar;
    I : Integer;
begin
  Q := P;
  I := StrZSkipAll(P, C);
  if I = 0 then
    begin
      Result := '';
      exit;
    end;
  SetLength(Result, I);
  MoveMem(Q^, Pointer(Result)^, I);
end;

function StrZExtractTo(var P: PAnsiChar; const C: CharSet): AnsiString;
var Q : PAnsiChar;
    L : Integer;
begin
  L := 0;
  Q := P;
  while (P^ <> #0) and not (P^ in C) do
    begin
      Inc(P);
      Inc(L);
    end;
  SetLength(Result, L);
  MoveMem(Q^, Pointer(Result)^, L);
end;

function StrZExtractToStr(var P: PAnsiChar; const S: AnsiString;
    const CaseSensitive: Boolean): AnsiString;
var Q : PAnsiChar;
    L : Integer;
begin
  Q := P;
  L := 0;
  while (P^ <> #0) and not StrZMatchStr(P, S, CaseSensitive) do
    begin
      Inc(P);
      Inc(L);
    end;
  SetLength(Result, L);
  if L = 0 then
    exit;
  MoveMem(Q^, Pointer(Result)^, L);
end;

function StrZExtractQuoted(var P: PAnsiChar): AnsiString;
var Q    : PAnsiChar;
    C, D : AnsiChar;
    L    : Integer;
begin
  C := P^;
  if not (C in ['"', '''']) then
    begin
      Result := '';
      exit;
    end;
  Inc(P);
  Q := P;
  L := 0;
  repeat
    D := P^;
    if D = #0 then
      break;
    if D = C then
      begin
        Inc(P);
        break;
      end;
    Inc(P);
    Inc(L);
  until False;
  if L > 0 then
    begin
      SetLength(Result, L);
      Move(Q^, Pointer(Result)^, L);
    end
  else
    Result := '';
end;
{$ENDIF}



{                                                                              }
{ Reverse                                                                      }
{                                                                              }
{$IFDEF CLR}
function StrReverse(const S: AnsiString): AnsiString;
var I, L : Integer;
begin
  L := Length(S);
  if L = 0 then
    begin
      Result := '';
      exit;
    end;
  if L = 1 then
    begin
      Result := S;
      exit;
    end;
  SetLength(Result, L);
  for I := 1 to L do
    Result[I] := S[L - I + 1];
end;
{$ELSE}
function StrReverseA(const S: AnsiString): AnsiString;
var I, L : Integer;
    P, Q : PAnsiChar;
begin
  L := Length(S);
  if L = 0 then
    begin
      Result := '';
      exit;
    end;
  if L = 1 then
    begin
      Result := S;
      exit;
    end;
  SetLength(Result, L);
  P := Pointer(S);
  Q := Pointer(Result);
  Inc(Q, L - 1);
  for I := 1 to L do
    begin
      Q^ := P^;
      Dec(Q);
      Inc(P);
    end;
end;

function StrReverseW(const S: WideString): WideString;
var I, L : Integer;
    P, Q : PWideChar;
begin
  L := Length(S);
  if L = 0 then
    begin
      Result := '';
      exit;
    end;
  if L = 1 then
    begin
      Result := S;
      exit;
    end;
  SetLength(Result, L);
  P := Pointer(S);
  Q := Pointer(Result);
  Inc(Q, L - 1);
  for I := 1 to L do
    begin
      Q^ := P^;
      Dec(Q);
      Inc(P);
    end;
end;
{$ENDIF}



{                                                                              }
{ Base conversion                                                              }
{                                                                              }
function BinToLongWord(const S: AnsiString): LongWord;
var Valid : Boolean;
begin
  Result := BinStrToLongWord(S, Valid);
  if not Valid then
    raise EConvertError.Create('Invalid binary string');
end;

function OctToLongWord(const S: AnsiString): LongWord;
var Valid : Boolean;
begin
  Result := OctStrToLongWord(S, Valid);
  if not Valid then
    raise EConvertError.Create('Invalid octal string');
end;

function StrToLongWord(const S: AnsiString): LongWord;
var Valid : Boolean;
begin
  Result := DecStrToLongWord(S, Valid);
  if not Valid then
    raise EConvertError.Create('Invalid decimal string');
end;

function StrToLongWordDef(const S: AnsiString; const Default: LongWord): LongWord;
var Valid : Boolean;
begin
  Result := DecStrToLongWord(S, Valid);
  if not Valid then
    Result := Default;
end;

function HexToLongWord(const S: AnsiString): LongWord;
var Valid : Boolean;
begin
  Result := HexStrToLongWord(S, Valid);
  if not Valid then
    raise EConvertError.Create('Invalid hexadecimal string');
end;

function HexToLongWordDef(const S: AnsiString; const Default: LongWord): LongWord;
var Valid : Boolean;
begin
  Result := HexStrToLongWord(S, Valid);
  if not Valid then
    Result := Default;
end;



{                                                                              }
{ Type conversion                                                              }
{                                                                              }
{$IFDEF DELPHI5}
function StrToFloatDef(const S: String; const Default: Extended): Extended;
begin
  try
    Result := StrToFloat(S);
  except
    Result := Default;
  end;
end;
{$ELSE}
function StrToFloatDef(const S: String; const Default: Extended): Extended;
begin
  if not TryStrToFloat(S, Result) then
    Result := Default;
end;
{$ENDIF}

function BooleanToStrW(const B: Boolean): WideString;
begin
  if B then
    Result := 'True'
  else
    Result := 'False';
end;

function BooleanToStrA(const B: Boolean): AnsiString;
begin
  if B then
    Result := 'True'
  else
    Result := 'False';
end;

function BooleanToStr(const B: Boolean): String;
begin
  if B then
    Result := 'True'
  else
    Result := 'False';
end;

function StrToBooleanA(const S: AnsiString): Boolean;
begin
  Result := StrEqualNoAsciiCaseA(S, 'True');
end;

function StrToBooleanW(const S: WideString): Boolean;
begin
  Result := StrEqualNoAsciiCaseW(S, 'True');
end;



{                                                                              }
{ Abbreviated regular expression matcher                                       }
{                                                                              }
{$IFNDEF CLR}
function MatchQuantSeq(var MatchPos: Integer; const MatchSeq: Array of CharSet;
    const Quant: Array of TMatchQuantifier; const S: AnsiString;
    const MatchOptions: TMatchQuantSeqOptions;
    const StartIndex: Integer; const StopIndex: Integer): Boolean;

var Stop          : Integer;
    Deterministic : Boolean;
    NonGreedy     : Boolean;

  function MatchAt(MPos, SPos: Integer; var MatchPos: Integer): Boolean;

    function MatchAndAdvance: Boolean;
    var I : Integer;
    begin
      I := SPos;
      Result := S[I] in MatchSeq[MPos];
      if Result then
        begin
          MatchPos := I;
          Inc(SPos);
        end;
    end;

    function MatchAndSetResult(var Res: Boolean): Boolean;
    begin
      Result := MatchAndAdvance;
      Res := Result;
      if not Result then
        MatchPos := 0;
    end;

    function MatchAny: Boolean;
    var I, L : Integer;
        P : PAnsiChar;
    begin
      L := Stop;
      if Deterministic then
        begin
          while (SPos <= L) and MatchAndAdvance do ;
          Result := False;
        end else
      if NonGreedy then
        repeat
          Result := MatchAt(MPos + 1, SPos, MatchPos);
          if Result or not MatchAndAdvance then
            exit;
        until SPos > L
      else
        begin
          I := SPos;
          P := Pointer(S);
          Inc(P, I - 1);
          while (I <= L) and (P^ in MatchSeq[MPos]) do
            begin
              Inc(I);
              Inc(P);
            end;
          repeat
            MatchPos := I - 1;
            Result := MatchAt(MPos + 1, I, MatchPos);
            if Result then
              exit;
            Dec(I);
          until SPos > I;
        end;
    end;

  var Q    : TMatchQuantifier;
      L, M : Integer;
  begin
    L := Length(MatchSeq);
    M := Stop;
    while (MPos < L) and (SPos <= M) do
      begin
        Q := Quant[MPos];
        if Q in [mqOnce, mqLeastOnce] then
          if not MatchAndSetResult(Result) then
            exit;
        if (Q = mqAny) or ((Q = mqLeastOnce) and (SPos <= M)) then
          begin
            Result := MatchAny;
            if Result then
              exit;
          end else
        if Q = mqOptional then
          if Deterministic then
            MatchAndAdvance else
            begin
              if NonGreedy then
                begin
                  Result := MatchAt(MPos + 1, SPos, MatchPos);
                  if Result or not MatchAndSetResult(Result) then
                    exit;
                end else
                begin
                  Result := (MatchAndAdvance and MatchAt(MPos + 1, SPos, MatchPos)) or
                            MatchAt(MPos + 1, SPos, MatchPos);
                  exit;
                end;
            end;
        Inc(MPos);
      end;
    while (MPos < L) and (Quant[MPos] in [mqAny, mqOptional]) do
      Inc(MPos);
    Result := MPos = L;
    if not Result then
      MatchPos := 0;
  end;

begin
  Assert(Length(MatchSeq) = Length(Quant));
  if StopIndex < 0 then
    Stop := Length(S)
  else
    Stop := MinI(StopIndex, Length(S));
  MatchPos := 0;
  if (Length(MatchSeq) = 0) or (StartIndex > Stop) or (StartIndex <= 0) then
    begin
      Result := False;
      exit;
    end;
  NonGreedy := moNonGreedy in MatchOptions;
  Deterministic := moDeterministic in MatchOptions;
  Result := MatchAt(0, StartIndex, MatchPos);
end;
{$ENDIF}



{                                                                              }
{ MatchPattern                                                                 }
{   Based on MatchPattern from a Delphi 3000 article by Paramjeet Reen         }
{   (http://www.delphi3000.com/articles/article_1561.asp).                     }
{                                                                              }
{$IFNDEF CLR}
function MatchPatternZ(M, S: PAnsiChar): Boolean;

  function EscapedChar(const C: AnsiChar): AnsiChar;
  begin
    Case C of
      'b' : Result := AsciiBS;
      'e' : Result := AsciiESC;
      'f' : Result := AsciiFF;
      'n' : Result := AsciiLF;
      'r' : Result := AsciiCR;
      't' : Result := AsciiHT;
      'v' : Result := AsciiVT;
      else Result := C;
    end;
  end;

var A, C, D : AnsiChar;
    N       : Boolean;
begin
  repeat
    Case M^ of
      #0 : // end of pattern
        begin
          Result := S^ = #0;
          exit;
        end;
      '?' : // match one
        if S^ = #0 then
          begin
            Result := False;
            exit;
          end else
          begin
            Inc(M);
            Inc(S);
          end;
      '*' :
        begin
          Inc(M);
          if M^ = #0 then // always match at end of mask
            begin
              Result := True;
              exit;
            end else
            while S^ <> #0 do
              if MatchPattern(M, S) then
                begin
                  Result := True;
                  Exit;
                end else
                Inc(S);
          end;
      '[' : // character class
        begin
          A := S^;
          Inc(M);
          C := M^;
          N := C = '^';
          Result := N;
          while C <> ']' do
            begin
              if C = #0 then
                begin
                  Result := False;
                  exit;
                end;
              Inc(M);
              if C = '\' then // escaped character
                begin
                  C := M^;
                  if C = #0 then
                    begin
                      Result := False;
                      exit;
                    end;
                  C := EscapedChar(C);
                  Inc(M);
                end;
              D := M^;
              if D = '-' then // match range
                begin
                  Inc(M);
                  D := M^;
                  if D = #0 then
                    begin
                      Result := False;
                      exit;
                    end;
                  if D = '\' then // escaped character
                    begin
                      Inc(M);
                      D := M^;
                      if D = #0 then
                        begin
                          Result := False;
                          exit;
                        end;
                      D := EscapedChar(D);
                      Inc(M);
                    end;
                  if (A >= C) and (A <= D) then
                    begin
                      Result := not N;
                      break;
                    end;
                  Inc(M);
                  C := M^;
                end else
                begin // match single character
                  if A = C then
                    begin
                      Result := not N;
                      break;
                    end;
                  C := D;
                end;
            end;
          if not Result then
            exit;
          Inc(S);
          // Locate closing bracket
          while M^ <> ']' do
            if M^ = #0 then
              begin
                Result := False;
                exit;
              end else
              Inc(M);
          Inc(M);
        end;
    else // single character match
      if M^ <> S^ then
        begin
          Result := False;
          exit;
        end else
        begin
          Inc(M);
          Inc(S);
        end;
    end;
  until False;
end;

function MatchPattern(M, S: AnsiString): Boolean;
begin
  Result := MatchPatternZ(PAnsiChar(M), PAnsiChar(S));
end;
{$ENDIF}



{                                                                              }
{ MatchFileMask                                                                }
{                                                                              }
function MatchFileMask(const Mask, Key: AnsiString; const AsciiCaseSensitive: Boolean): Boolean;
var ML, KL : Integer;

  function MatchAt(MaskPos, KeyPos: Integer): Boolean;
  begin
    while (MaskPos <= ML) and (KeyPos <= KL) do
      Case Mask[MaskPos] of
        '?' :
          begin
            Inc(MaskPos);
            Inc(KeyPos);
          end;
        '*' :
          begin
            while (MaskPos <= ML) and (Mask[MaskPos] = '*') do
              Inc(MaskPos);
            if MaskPos > ML then
              begin
                Result := True;
                exit;
              end;
            repeat
              if MatchAt(MaskPos, KeyPos) then
                begin
                  Result := True;
                  exit;
                end;
              Inc(KeyPos);
            until KeyPos > KL;
            Result := False;
            exit;
          end;
        else
          if not CharMatchA(Mask[MaskPos], Key[KeyPos], AsciiCaseSensitive) then
            begin
              Result := False;
              exit;
            end else
            begin
              Inc(MaskPos);
              Inc(KeyPos);
            end;
      end;
    while (MaskPos <= ML) and (Mask[MaskPos] in ['?', '*']) do
      Inc(MaskPos);
    if (MaskPos <= ML) or (KeyPos <= KL) then
      begin
        Result := False;
        exit;
      end;
    Result := True;
  end;

begin
  ML := Length(Mask);
  if ML = 0 then
    begin
      Result := True;
      exit;
    end;
  KL := Length(Key);
  Result := MatchAt(1, 1);
end;



{                                                                              }
{ Character class strings                                                      }
{                                                                              }
function CharSetToCharClassStr(const C: CharSet): AnsiString;

  function ChStr(const Ch: AnsiChar): AnsiString;
  begin
    Case Ch of
      '\'       : Result := '\\';
      ']'       : Result := '\]';
      AsciiBEL  : Result := '\a';
      AsciiBS   : Result := '\b';
      AsciiESC  : Result := '\e';
      AsciiFF   : Result := '\f';
      AsciiLF   : Result := '\n';
      AsciiCR   : Result := '\r';
      AsciiHT   : Result := '\t';
      AsciiVT   : Result := '\v';
      else if (Ch < #32) or (Ch > #127) then // non-printable
        Result := '\x' + LongWordToHex(Ord(Ch), 1) else
        Result := Ch;
    end;
  end;

  function SeqStr(const SeqStart, SeqEnd: AnsiChar): AnsiString;
  begin
    Result := ChStr(SeqStart);
    if Ord(SeqEnd) = Ord(SeqStart) + 1 then
      Result := Result + ChStr(SeqEnd) else // consequetive chars
      if SeqEnd > SeqStart then // range
        Result := Result + '-' + ChStr(SeqEnd);
  end;

var CS       : CharSet;
    F        : AnsiChar;
    SeqStart : AnsiChar;
    Seq      : Boolean;

begin
  if IsComplete(C) then
    Result := '.' else
  if IsEmpty(C) then
    Result := '[]' else
    begin
      Result := '[';
      CS := C;
      if (AnsiChar(#0) in C) and (AnsiChar(#255) in C) then
        begin
          ComplementCharSet(CS);
          Result := Result + '^';
        end;
      Seq := False;
      SeqStart := #0;
      for F := #0 to #255 do
        if F in CS then
          begin
            if not Seq then
              begin
                SeqStart := F;
                Seq := True;
              end;
          end else
          if Seq then
            begin
              Result := Result + SeqStr(SeqStart, AnsiChar(Ord(F) - 1));
              Seq := False;
            end;
      if Seq then
        Result := Result + SeqStr(SeqStart, #255);
      Result := Result + ']';
    end;
end;

{$IFNDEF CLR}
function CharClassStrToCharSet(const S: AnsiString): CharSet;
var I, L : Integer;

  function DecodeChar: AnsiChar;
  var J : Integer;
  begin
    if S[I] = '\' then
      if I + 1 = L then
        begin
          Inc(I);
          Result := '\';
        end else
        if not MatchQuantSeq(J, [['x'], csHexDigit, csHexDigit],
            [mqOnce, mqOnce, mqOptional], S, [moDeterministic], I + 1) then
          begin
            Case S[I + 1] of
              '0' : Result := AsciiNULL;
              'a' : Result := AsciiBEL;
              'b' : Result := AsciiBS;
              'e' : Result := AsciiESC;
              'f' : Result := AsciiFF;
              'n' : Result := AsciiLF;
              'r' : Result := AsciiCR;
              't' : Result := AsciiHT;
              'v' : Result := AsciiVT;
              else Result := S[I + 1];
            end;
            Inc(I, 2);
          end else
          begin
            if J = I + 2 then
              Result := AnsiChar(HexAnsiCharToInt(S[J])) else
              Result := AnsiChar(HexAnsiCharToInt(S[J - 1]) * 16 + HexAnsiCharToInt(S[J]));
            I := J + 1;
          end
    else
      begin
        Result := S[I];
        Inc(I);
      end;
  end;

var Neg  : Boolean;
    A, B : AnsiChar;
begin
  L := Length(S);
  if (L = 0) or (S = '[]') then
    Result := [] else
  if L = 1 then
    if S[1] in ['.', '*', '?'] then
      Result := CompleteCharSet else
      Result := [S[1]] else
  if (S[1] <> '[') or (S[L] <> ']') then
    raise EConvertError.Create('Invalid character class string')
  else
    begin
      Neg := S[2] = '^';
      I := iif(Neg, 3, 2);
      Result := [];
      while I < L do
        begin
          A := DecodeChar;
          if (I + 1 < L) and (S[I] = '-') then
            begin
              Inc(I);
              B := DecodeChar;
              Result := Result + [A..B];
            end else
            Include(Result, A);
       end;
      if Neg then
        ComplementCharSet(Result);
    end;
end;
{$ENDIF}



{                                                                              }
{ Dynamic array functions                                                      }
{                                                                              }
function StringsTotalLengthA(const S: Array of AnsiString): Integer;
var I : Integer;
begin
  Result := 0;
  for I := 0 to Length(S) - 1 do
    Inc(Result, Length(S[I]));
end;

function StringsTotalLengthW(const S: Array of WideString): Integer;
var I : Integer;
begin
  Result := 0;
  for I := 0 to Length(S) - 1 do
    Inc(Result, Length(S[I]));
end;

function PosNextNoCase(const Find: AnsiString; const V: Array of AnsiString;
    const PrevPos: Integer; const IsSortedAscending: Boolean): Integer;
var I, L, H : Integer;
begin
  if IsSortedAscending then // binary search
    begin
      if MaxI(PrevPos + 1, 0) = 0 then // find first
        begin
          L := 0;
          H := Length(V) - 1;
          repeat
            I := (L + H) div 2;
            if StrEqualNoAsciiCaseA(V[I], Find) then
              begin
                while (I > 0) and StrEqualNoAsciiCaseA(V[I - 1], Find) do
                  Dec(I);
                Result := I;
                exit;
              end else
            if StrCompareNoAsciiCaseA(V[I], Find) = 1 then
              H := I - 1 else
              L := I + 1;
          until L > H;
          Result := -1;
        end else // find next
        if PrevPos >= Length(V) - 1 then
          Result := -1 else
          if StrEqualNoAsciiCaseA(V[PrevPos + 1], Find) then
            Result := PrevPos + 1 else
            Result := -1;
    end else
    begin // linear search
      for I := MaxI(PrevPos + 1, 0) to Length(V) - 1 do
        if StrEqualNoAsciiCaseA(V[I], Find) then
          begin
            Result := I;
            exit;
          end;
      Result := -1;
    end;
end;



{                                                                              }
{ Natural language                                                             }
{                                                                              }
function StorageSize(const Bytes: Int64; const ShortFormat: Boolean): String;
var Size, Suffix : String;
    Fmt          : String;
    Len          : Integer;
begin
  Fmt := iif(ShortFormat, '%1.0f', '%0.1f');
  if Bytes < 1024 then
    begin
      Size := IntToStr(Bytes);
      Suffix := iif(ShortFormat, 'B', 'bytes');
    end else
  if Bytes < 1024 * 1024 then
    begin
      Size := Format(Fmt, [Bytes / 1024.0]);
      Suffix := iif(ShortFormat, 'K', 'KB');
    end else
  if Bytes < 1024 * 1024 * 1024 then
    begin
      Size := Format(Fmt, [Bytes / (1024.0 * 1024.0)]);
      Suffix := iif(ShortFormat, 'M', 'MB');
    end else
  if Bytes < Int64(1024) * 1024 * 1024 * 1024 then
    begin
      Size := Format(Fmt, [Bytes / (1024.0 * 1024.0 * 1024.0)]);
      Suffix := iif(ShortFormat, 'G', 'GB');
    end else
  if Bytes < Int64(1024) * 1024 * 1024 * 1024 * 1024 then
    begin
      Size := Format(Fmt, [Bytes / (1024.0 * 1024.0 * 1024.0 * 1024.0)]);
      Suffix := iif(ShortFormat, 'T', 'TB');
    end
  else
    begin
      Size := Format(Fmt, [Bytes / (1024.0 * 1024.0 * 1024.0 * 1024.0 * 1024.0)]);
      Suffix := iif(ShortFormat, 'P', 'PB');
    end;
  Len := Length(Size);
  if Copy(Size, Len - 1, 2) = '.0' then
    SetLength(Size, Len - 2);
  Result := Size + ' ' + Suffix;
end;

function TransferRate(const Bytes, MillisecondsElapsed: Int64;
    const ShortFormat: Boolean): String;
begin
  if MillisecondsElapsed <= 0 then
    Result := ''
  else
    Result := StorageSize(Trunc(Bytes / (MillisecondsElapsed / 1000.0)), ShortFormat) + '/s';
end;



{$IFNDEF ManagedCode}
{                                                                              }
{ String Builder                                                               }
{                                                                              }
function StringBuilderNewCapacity(const L, N: Integer): Integer; {$IFDEF UseInline}inline;{$ENDIF}
begin
  // memory allocation strategy
  if N = 0 then        // first allocation is exactly as requested
    Result := L else
  if L < 16 then       // if grow to < 16 then allocate 16
    Result := 16
  else                 // if grow to >= 16 then pre-allocate 1/4
    Result := L + (L shr 2);
end;

{                                                                              }
{ TAnsiStringBuilder                                                           }
{                                                                              }
constructor TAnsiStringBuilder.Create(const S: AnsiString);
begin
  inherited Create;
  SetAsAnsiString(S);
end;

constructor TAnsiStringBuilder.Create(const Capacity: Integer);
begin
  inherited Create;
  EnsureCapacity(Capacity);
end;

procedure TAnsiStringBuilder.EnsureCapacity(const L: Integer);
var N : Integer;
begin
  N := System.Length(FString);
  if L > N then
    begin
      N := StringBuilderNewCapacity(L, N);
      SetLength(FString, N);
    end;
end;

function TAnsiStringBuilder.GetAsAnsiString: AnsiString;
begin
  if FLength = System.Length(FString) then
    Result := FString // return reference instead of copy
  else
    Result := Copy(FString, 1, FLength);
end;

procedure TAnsiStringBuilder.SetAsAnsiString(const S: AnsiString);
begin
  FString := S;
  FLength := System.Length(S);
end;

function TAnsiStringBuilder.GetAsString: String;
begin
  {$IFDEF StringIsUnicode}
  Result := String(GetAsAnsiString);
  {$ELSE}
  Result := GetAsAnsiString;
  {$ENDIF}
end;

procedure TAnsiStringBuilder.Clear;
begin
  FString := '';
  FLength := 0;
end;

procedure TAnsiStringBuilder.Assign(const S: TAnsiStringBuilder);
var L : Integer;
begin
  L := S.FLength;
  FString := Copy(S.FString, 1, L);
  FLength := L;
end;

procedure TAnsiStringBuilder.Append(const S: AnsiString);
var M, L, N : Integer;
    P       : PAnsiChar;
begin
  M := System.Length(S);
  if M = 0 then
    exit;
  N := FLength;
  L := N + M;
  if L > System.Length(FString) then
    EnsureCapacity(L);
  P := Pointer(FString);
  Inc(P, N);
  MoveMem(Pointer(S)^, P^, M);
  FLength := L;
end;

procedure TAnsiStringBuilder.Append(const S: AnsiString; const Count: Integer);
var M, L, N, I : Integer;
    P          : PAnsiChar;
begin
  if Count <= 0 then
    exit;
  M := System.Length(S);
  if M = 0 then
    exit;
  N := FLength;
  L := N + (M * Count);
  if L > System.Length(FString) then
    EnsureCapacity(L);
  P := Pointer(FString);
  Inc(P, N);
  for I := 1 to Count do
    begin
      MoveMem(Pointer(S)^, P^, M);
      Inc(P, M);
    end;
  FLength := L;
end;

procedure TAnsiStringBuilder.Append(const C: AnsiChar);
var L, N : Integer;
    P    : PAnsiChar;
begin
  N := FLength;
  L := N + 1;
  if L > System.Length(FString) then
    EnsureCapacity(L);
  P := Pointer(FString);
  Inc(P, N);
  P^ := C;
  FLength := L;
end;

procedure TAnsiStringBuilder.Append(const C: AnsiChar; const Count: Integer);
var L, N : Integer;
    P    : PAnsiChar;
begin
  if Count <= 0 then
    exit;
  N := FLength;
  L := N + Count;
  if L > System.Length(FString) then
    EnsureCapacity(L);
  P := Pointer(FString);
  Inc(P, N);
  FillMem(P^, Count, Ord(C));
  FLength := L;
end;

procedure TAnsiStringBuilder.Append(const BufPtr: Pointer; const Size: Integer);
var L, N : Integer;
    P    : PAnsiChar;
begin
  if Size <= 0 then
    exit;
  N := FLength;
  L := N + Size;
  if L > System.Length(FString) then
    EnsureCapacity(L);
  P := Pointer(FString);
  Inc(P, N);
  MoveMem(BufPtr^, P^, Size);
  FLength := L;
end;

procedure TAnsiStringBuilder.Append(const S: TAnsiStringBuilder);
var M, L, N : Integer;
    P       : PAnsiChar;
begin
  M := S.FLength;
  if M = 0 then
    exit;
  N := FLength;
  L := N + M;
  if L > System.Length(FString) then
    EnsureCapacity(L);
  P := Pointer(FString);
  Inc(P, N);
  MoveMem(Pointer(S.FString)^, P^, M);
  FLength := L;
end;

procedure TAnsiStringBuilder.Pack;
var L : Integer;
begin
  L := FLength;
  if L = System.Length(FString) then
    exit;
  SetLength(FString, L);
end;



{                                                                              }
{ TWideStringBuilder                                                           }
{                                                                              }
constructor TWideStringBuilder.Create(const S: WideString);
begin
  inherited Create;
  SetAsWideString(S);
end;

constructor TWideStringBuilder.Create(const Capacity: Integer);
begin
  inherited Create;
  EnsureCapacity(Capacity);
end;

procedure TWideStringBuilder.EnsureCapacity(const L: Integer);
var N : Integer;
begin
  N := System.Length(FString);
  if L > N then
    begin
      N := StringBuilderNewCapacity(L, N);
      SetLength(FString, N);
    end;
end;

function TWideStringBuilder.GetAsWideString: WideString;
begin
  if FLength = System.Length(FString) then
    Result := FString // return reference instead of copy
  else
    Result := Copy(FString, 1, FLength);
end;

procedure TWideStringBuilder.SetAsWideString(const S: WideString);
begin
  FString := S;
  FLength := System.Length(S);
end;

procedure TWideStringBuilder.Clear;
begin
  FString := '';
  FLength := 0;
end;

procedure TWideStringBuilder.Assign(const S: TWideStringBuilder);
var L : Integer;
begin
  L := S.FLength;
  FString := Copy(S.FString, 1, L);
  FLength := L;
end;

procedure TWideStringBuilder.Append(const S: WideString);
var M, L, N : Integer;
    P       : PWideChar;
begin
  M := System.Length(S);
  if M = 0 then
    exit;
  N := FLength;
  L := N + M;
  if L > System.Length(FString) then
    EnsureCapacity(L);
  P := Pointer(FString);
  Inc(P, N);
  MoveMem(Pointer(S)^, P^, M * 2);
  FLength := L;
end;

procedure TWideStringBuilder.Append(const S: WideString; const Count: Integer);
var M, L, N, I : Integer;
    P          : PWideChar;
begin
  if Count <= 0 then
    exit;
  M := System.Length(S);
  if M = 0 then
    exit;
  N := FLength;
  L := N + (M * Count);
  if L > System.Length(FString) then
    EnsureCapacity(L);
  P := Pointer(FString);
  Inc(P, N);
  for I := 1 to Count do
    begin
      MoveMem(Pointer(S)^, P^, M * 2);
      Inc(P, M);
    end;
  FLength := L;
end;

procedure TWideStringBuilder.Append(const C: WideChar);
var L, N : Integer;
    P    : PWideChar;
begin
  N := FLength;
  L := N + 1;
  if L > System.Length(FString) then
    EnsureCapacity(L);
  P := Pointer(FString);
  Inc(P, N);
  P^ := C;
  FLength := L;
end;

procedure TWideStringBuilder.Append(const C: WideChar; const Count: Integer);
var L, N, I : Integer;
    P       : PWideChar;
begin
  if Count <= 0 then
    exit;
  N := FLength;
  L := N + Count;
  if L > System.Length(FString) then
    EnsureCapacity(L);
  P := Pointer(FString);
  Inc(P, N);
  for I := 0 to Count - 1 do
    begin
      P^ := C;
      Inc(P);
    end;
  FLength := L;
end;

procedure TWideStringBuilder.Append(const S: TWideStringBuilder);
var M, L, N : Integer;
    P       : PWideChar;
begin
  M := S.FLength;
  if M = 0 then
    exit;
  N := FLength;
  L := N + M;
  if L > System.Length(FString) then
    EnsureCapacity(L);
  P := Pointer(FString);
  Inc(P, N);
  MoveMem(Pointer(S.FString)^, P^, M * 2);
  FLength := L;
end;

procedure TWideStringBuilder.Pack;
var L : Integer;
begin
  L := FLength;
  if L = System.Length(FString) then
    exit;
  SetLength(FString, L);
end;
{$ENDIF}



{                                                                              }
{ Test cases                                                                   }
{                                                                              }
{$IFDEF STRINGS_SELFTEST}
{$ASSERTIONS ON}
procedure SelfTest;
var C    : AnsiChar;
    S, T : AnsiString;
    L    : AnsiStringArray;
    I    : Integer;
begin
  { CharMatch                                                                  }
  Assert(CharMatchA(AnsiChar('A'), AnsiChar('a'), False));
  Assert(CharMatchA(AnsiChar('a'), AnsiChar('A'), False));
  Assert(CharMatchA(AnsiChar('A'), AnsiChar('A'), False));
  Assert(CharSetMatchCharA(['a'..'z'], AnsiChar('a'), False));
  Assert(CharSetMatchCharA(['a'..'z'], AnsiChar('A'), False));
  Assert(not CharSetMatchCharA(['a'..'z'], AnsiChar('-'), False));
  Assert(not CharSetMatchCharA(['a'..'z'], AnsiChar('A'), True));
  Assert(not CharSetMatchCharA([], AnsiChar('A')));

  { Type matching                                                              }
  Assert(StrIsNumeric('1234567890'), 'StrIsNumeric');
  Assert(not StrIsNumeric('1234567890X'), 'StrIsNumeric');
  Assert(not StrIsNumeric(''), 'StrIsNumeric');
  Assert(StrIsInteger('-1234567890'), 'StrIsInteger');
  Assert(StrIsInteger('0'), 'StrIsInteger');
  Assert(not StrIsInteger('-1234567890X'), 'StrIsInteger');
  Assert(not StrIsInteger('-'), 'StrIsInteger');

  { CopyRange                                                                  }
  Assert(CopyRangeA('', 1, 2) =  '', 'CopyRange');
  Assert(CopyRangeA('', -1, -2) = '', 'CopyRange');
  Assert(CopyRangeA('1234567890', 5, 7) = '567', 'CopyRange');
  Assert(CopyRangeA('1234567890', 1, 1) = '1', 'CopyRange');
  Assert(CopyRangeA('1234567890', 0, 11) = '1234567890', 'CopyRange');
  Assert(CopyRangeA('1234567890', 7, 4) = '', 'CopyRange');
  Assert(CopyRangeA('1234567890', 1, 0) = '', 'CopyRange');
  Assert(CopyRangeA('1234567890', -2, 3) = '123', 'CopyRange');
  Assert(CopyRangeA('1234567890', 2, -1) = '', 'CopyRange');
  Assert(CopyRangeA('1234567890', -4, -2) = '', 'CopyRange');

  { CopyFrom                                                                   }
  Assert(CopyFromA('a', 0) = 'a', 'CopyFrom');
  Assert(CopyFromA('a', -1) = 'a', 'CopyFrom');
  Assert(CopyFromA('', 1) = '', 'CopyFrom');
  Assert(CopyFromA('', -2) = '', 'CopyFrom');
  Assert(CopyFromA('1234567890', 8) = '890', 'CopyFrom');
  Assert(CopyFromA('1234567890', 11) = '', 'CopyFrom');
  Assert(CopyFromA('1234567890', 0) = '1234567890', 'CopyFrom');
  Assert(CopyFromA('1234567890', -2) = '1234567890', 'CopyFrom');

  { CopyLeft                                                                   }
  Assert(CopyLeftA('a', 0) = '', 'CopyLeft');
  Assert(CopyLeftA('a', -1) = '', 'CopyLeft');
  Assert(CopyLeftA('', 1) = '', 'CopyLeft');
  Assert(CopyLeftA('b', 1) = 'b', 'CopyLeft');
  Assert(CopyLeftA('', -1) = '', 'CopyLeft');
  Assert(CopyLeftA('1234567890', 3) = '123', 'CopyLeft');
  Assert(CopyLeftA('1234567890', 11) = '1234567890', 'CopyLeft');
  Assert(CopyLeftA('1234567890', 0) = '', 'CopyLeft');
  Assert(CopyLeftA('1234567890', -2) = '', 'CopyLeft');

  { CopyRight                                                                  }
  Assert(CopyRightA('a', 0) = '', 'CopyRight');
  Assert(CopyRightA('a', -1) = '', 'CopyRight');
  Assert(CopyRightA('', 1) = '', 'CopyRight');
  Assert(CopyRightA('', -2) = '', 'CopyRight');
  Assert(CopyRightA('1234567890', 3) = '890', 'CopyRight');
  Assert(CopyRightA('1234567890', 11) = '1234567890', 'CopyRight');
  Assert(CopyRightA('1234567890', 0) = '', 'CopyRight');
  Assert(CopyRightA('1234567890', -2) = '', 'CopyRight');

  { CopyEx                                                               }
  Assert(CopyEx('', 1, 1) = '');
  Assert(CopyEx('', -2, -1) = '');
  Assert(CopyEx('12345', -2, 2) = '45');
  Assert(CopyEx('12345', -1, 2) = '5');
  Assert(CopyEx('12345', -7, 2) = '12');
  Assert(CopyEx('12345', -5, 2) = '12');
  Assert(CopyEx('12345', 2, -2) = '');
  Assert(CopyEx('12345', -4, 0) = '');
  Assert(CopyEx('12345', -4, 7) = '2345');
  Assert(CopyEx('12345', 2, 2) = '23');
  Assert(CopyEx('12345', -7, -6) = '');
  Assert(CopyEx('12345', 0, 2) = '12');
  Assert(CopyEx('12345', 0, 7) = '12345');

  { CopyRangeEx                                                          }
  Assert(CopyRangeEx('', -2, -1) = '');
  Assert(CopyRangeEx('', 0, 0) = '');
  Assert(CopyRangeEx('12345', -2, -1) = '45');
  Assert(CopyRangeEx('12345', -2, -1) = '45');
  Assert(CopyRangeEx('12345', -2, 5) = '45');
  Assert(CopyRangeEx('12345', 2, -2) = '234');
  Assert(CopyRangeEx('12345', 0, -2) = '1234');
  Assert(CopyRangeEx('12345', 1, -7) = '');
  Assert(CopyRangeEx('12345', 7, -1) = '');
  Assert(CopyRangeEx('12345', -10, 2) = '12');
  Assert(CopyRangeEx('12345', -10, -7) = '');
  Assert(CopyRangeEx('12345', 2, -6) = '');
  Assert(CopyRangeEx('12345', 0, -2) = '1234');
  Assert(CopyRangeEx('12345', 2, 0) = '');
  Assert(CopyRangeEx('', -1, 2) = '');

  { CopyFromEx                                                           }
  Assert(CopyFromEx('', 0) = '');
  Assert(CopyFromEx('', -1) = '');
  Assert(CopyFromEx('12345', 0) = '12345');
  Assert(CopyFromEx('12345', 1) = '12345');
  Assert(CopyFromEx('12345', -5) = '12345');
  Assert(CopyFromEx('12345', -6) = '12345');
  Assert(CopyFromEx('12345', 2) = '2345');
  Assert(CopyFromEx('12345', -4) =  '2345');
  Assert(CopyFromEx('12345', 6) = '');

  { Case functions                                                             }
  Assert(AsciiLowCaseA('A') = 'a', 'LowCase');
  Assert(UpCase('a') = 'A', 'UpCase');
  Assert(AsciiLowCaseA('-') = '-', 'LowCase');
  Assert(UpCase('}') = '}', 'UpCase');
  Assert(AsciiFirstUp('abra') = 'Abra', 'FirstUp');
  Assert(AsciiFirstUp('') = '', 'FirstUp');
  {$IFDEF DELPHI2007_DOWN}{$IFNDEF CLR}
  for C := #0 to #255 do
    Assert(AsciiLowCase(C) = LowerCase(C), 'LowCase = LowerCase');
  {$ENDIF}{$ENDIF}
  for C := 'A' to 'Z' do
    Assert(AsciiLowCaseA(C) <> C, 'LowCase');
  for C := 'a' to 'z' do
    Assert(AsciiLowCaseA(C) = C, 'UpCase');
  Assert(CharEqualNoAsciiCaseA('a', 'a'));
  Assert(CharEqualNoAsciiCaseA('B', 'b'));
  Assert(not CharEqualNoAsciiCaseA('C', 'D'));
  S := 'aBcDEfg-123';
  AsciiConvertUpperA(S);
  Assert(S = 'ABCDEFG-123', 'ConvertUpper');
  S := 'aBcDEfg-123';
  AsciiConvertLowerA(S);
  Assert(S = 'abcdefg-123', 'ConvertLower');
  S := '';
  AsciiConvertLowerA(S);
  Assert(S = '', 'ConvertLower');
  S := 'abc';
  AsciiConvertLowerA(S);
  Assert(S = 'abc', 'ConvertLower');
  Assert(StrEqualNoAsciiCaseA('A', 'a'), 'StrEqualNoCase');
  Assert(not StrEqualNoAsciiCaseA('A', 'B'), 'StrEqualNoCase');
  Assert(StrEqualNoAsciiCaseA('@ABCDEFGHIJKLMNOPQRSTUVWXYZ` ', '@abcdefghijklmnopqrstuvwxyz` '), 'StrEqualNoCase');
  Assert(not StrEqualNoAsciiCaseA('@ABCDEFGHIJKLMNOPQRSTUVWXY-` ', '@abcdefghijklmnopqrstuvwxyz` '), 'StrEqualNoCase');

  { StrReverse                                                                 }
  Assert(StrReverseA('12345') = '54321', 'StrReverse');
  Assert(StrReverseA('1234') = '4321', 'StrReverse');

  { Compare                                                                    }
  Assert(StrCompareNoAsciiCaseA('a', 'a') = 0, 'StrCompareNoCase');
  Assert(StrCompareNoAsciiCaseA('a', 'b') = -1, 'StrCompareNoCase');
  Assert(StrCompareNoAsciiCaseA('b', 'a') = 1, 'StrCompareNoCase');
  Assert(StrCompareNoAsciiCaseA('A', 'a') = 0, 'StrCompareNoCase');
  Assert(StrCompareNoAsciiCaseA('A', 'b') = -1, 'StrCompareNoCase');
  Assert(StrCompareNoAsciiCaseA('b', 'A') = 1, 'StrCompareNoCase');
  Assert(StrCompareNoAsciiCaseA('aa', 'a') = 1, 'StrCompareNoCase');
  Assert(StrCompareNoAsciiCaseA('a', 'aa') = -1, 'StrCompareNoCase');
  Assert(StrCompareNoAsciiCaseA('AA', 'b') = -1, 'StrCompareNoCase');
  Assert(StrCompareNoAsciiCaseA('B', 'aa') = 1, 'StrCompareNoCase');
  Assert(StrCompareNoAsciiCaseA('aa', 'Aa') = 0, 'StrCompareNoCase');
  Assert(StrCompareA('A', 'a') = -1, 'StrCompareNoCase');
  Assert(StrCompareA('a', 'A') = 1, 'StrCompareNoCase');
  Assert(StrCompareA('a', 'aa') = -1, 'StrCompareNoCase');
  Assert(StrCompareA('', '') = 0, 'StrCompareNoCase');
  Assert(StrCompareA('', 'a') = -1, 'StrCompareNoCase');
  Assert(StrCompareA('a', '') = 1, 'StrCompareNoCase');

  { Match                                                                      }
  Assert(not StrMatchA('', '', 1), 'StrMatch');
  Assert(not StrMatchA('', 'a', 1), 'StrMatch');
  Assert(not StrMatchA('a', '', 1), 'StrMatch');
  Assert(not StrMatchA('a', 'A', 1), 'StrMatch');
  Assert(StrMatchA('A', 'A', 1), 'StrMatch');
  Assert(not StrMatchA('abcdef', 'xx', 1), 'StrMatch');
  Assert(StrMatchA('xbcdef', 'x', 1), 'StrMatch');
  Assert(StrMatchA('abcdxxxxx', 'xxxxx', 5), 'StrMatch');
  Assert(StrMatchA('abcdef', 'abcdef', 1), 'StrMatch');
  Assert(not StrMatchNoAsciiCaseA('abcdef', 'xx', 1), 'StrMatchNoCase');
  Assert(StrMatchNoAsciiCaseA('xbCDef', 'xBCd', 1), 'StrMatchNoCase');
  Assert(StrMatchNoAsciiCaseA('abcdxxX-xx', 'Xxx-xX', 5), 'StrMatchNoCase');
  Assert(StrMatchA('abcde', 'abcd', 1), 'StrMatch');
  Assert(StrMatchA('abcde', 'abc', 1), 'StrMatch');
  Assert(StrMatchA('abcde', 'ab', 1), 'StrMatch');
  Assert(StrMatchA('abcde', 'a', 1), 'StrMatch');
  Assert(StrMatchNoAsciiCaseA(' abC-Def{', ' AbC-def{', 1), 'StrMatchNoCase');
  Assert(StrMatchLeftA('ABC1D', 'aBc1', False), 'StrMatchLeft');
  Assert(StrMatchLeftA('aBc1D', 'aBc1', True), 'StrMatchLeft');
  Assert(not StrMatchLeftA('AB1D', 'ABc1', False), 'StrMatchLeft');
  Assert(not StrMatchLeftA('aBC1D', 'aBc1', True), 'StrMatchLeft');
  Assert(not StrMatchCharA('', ['a', 'b', 'c']), 'StrMatchChar');
  Assert(StrMatchCharA('a', ['a', 'b', 'c']), 'StrMatchChar');
  Assert(not StrMatchCharA('d', ['a', 'b', 'c']), 'StrMatchChar');
  Assert(StrMatchCharA('acbba', ['a', 'b', 'c']), 'StrMatchChar');
  Assert(not StrMatchCharA('acbd', ['a', 'b', 'c']), 'StrMatchChar');
  Assert(StrMatchLenA('abcd', ['a', 'b', 'c'], 1) = 3, 'StrMatchLen');
  Assert(StrMatchLenA('abcd', ['a', 'b', 'c'], 3) = 1, 'StrMatchLen');
  Assert(StrMatchLenA('abcd', ['a', 'b', 'c'], 4) = 0, 'StrMatchLen');
  Assert(StrMatchLenA('', ['a', 'b', 'c'], 1) = 0, 'StrMatchLen');
  Assert(StrMatchLenA('dcba', ['a', 'b', 'c'], 2) = 3, 'StrMatchLen');
  Assert(StrMatchLenA('dcba', ['a', 'b', 'c'], 1) = 0, 'StrMatchLen');

  { Pos                                                                        }
  Assert(PosStrA('', 'ABCABC') = 0, 'PosStr');
  Assert(PosStrA('', 'a') = 0, 'PosStr');
  Assert(PosStrA('A', '') = 0, 'PosStr');
  Assert(PosStrA('A', 'ABCABC') = 1, 'PosStr');
  Assert(PosStrA('A', 'ABCABC', 2) = 4, 'PosStr');
  Assert(PosStrA('ab', 'a') = 0, 'PosStr');
  Assert(PosStrA('ab', 'ab') = 1, 'PosStr');
  Assert(PosStrA('ab', 'zxab') = 3, 'PosStr');
  Assert(PosStrA('ab', '') = 0, 'PosStr');
  Assert(PosStrA('ab', 'axdba') = 0, 'PosStr');
  Assert(PosStrA('a', 'AbAc', 1, False) = 1, 'PosStr');
  Assert(PosStrA('ba', 'ABAcabac', 1, False) = 2, 'PosStr');
  Assert(PosStrA('a', 'abac', 2) = 3, 'PosStr');
  Assert(PosStrA('ab', 'abacabac', 2) = 5, 'PosStr');
  Assert(PosStrRevA('A', 'ABCABC') = 4, 'PosStrRev');
  Assert(PosStrRevA('A', 'ABCABCA') = 7, 'PosStrRev');
  Assert(PosStrRevA('CA', 'ABCABCA') = 6, 'PosStrRev');
  Assert(PosStrRevA('ab', 'abacabac') = 5, 'PosStrRev');
  Assert(PosNStrA('AB', 'ABCABCDAB', 3) = 8, 'PosNStr');
  Assert(PosCharSetA([], 'a') = 0, 'PosChar');
  Assert(PosCharSetA(['a'], 'a') = 1, 'PosChar');
  Assert(PosCharSetA(['a'], '') = 0, 'PosChar');
  Assert(PosCharSetA(['a'], 'aa') = 1, 'PosChar');
  Assert(PosCharSetA(['a'], 'ba') = 2, 'PosChar');
  Assert(PosCharSetA(['a'], 'zx') = 0, 'PosChar');
  Assert(PosCharA(AnsiChar('a'), 'a') = 1, 'PosChar');
  Assert(PosCharA(AnsiChar('a'), '') = 0, 'PosChar');
  Assert(PosCharA(AnsiChar('a'), 'aa') = 1, 'PosChar');
  Assert(PosCharA(AnsiChar('a'), 'ba') = 2, 'PosChar');
  Assert(PosCharA(AnsiChar('a'), 'zx') = 0, 'PosChar');
  Assert(PosCharSetA(['a'], 'abac', 2) = 3, 'PosChar');
  Assert(PosCharRevA(AnsiChar('a'), 'abac') = 3, 'PosCharRev');
  Assert(PosCharSetRevA(['a'..'z'], 'abac') = 4, 'PosCharRev');
  Assert(PosNotCharA(AnsiChar('a'), 'abac') = 2, 'PosNotChar');
  Assert(PosNotCharSetA(['a'..'z'], 'abac1a') = 5, 'PosNotChar');

  { Trim                                                                       }
  {$IFNDEF CLR}
  Assert(StrTrimLeftA('   123   ') = '123   ', 'TrimLeft');
  Assert(StrTrimLeftStrNoCase('   123   ', '  ') = ' 123   ', 'TrimLeftStrNoCase');
  Assert(StrTrimRight('   123   ') = '   123', 'TrimRight');
  Assert(StrTrimRightStrNoCase('   123   ', '  ') = '   123 ', 'TrimRightStrNoCase');
  Assert(StrTrimA('   123   ', [' ']) = '123', 'Trim');
  Assert(StrTrimA('', [' ']) = '', 'Trim');
  Assert(StrTrimA('X', [' ']) = 'X', 'Trim');
  {$ENDIF}

  { Dup                                                                        }
  Assert(DupStrA('xy', 3) = 'xyxyxy', 'Dup');
  Assert(DupStrA('', 3) = '', 'Dup');
  Assert(DupStrA('a', 0) = '', 'Dup');
  Assert(DupStrA('a', -1) = '', 'Dup');
  C := 'x';
  Assert(DupCharA(C, 6) = 'xxxxxx', 'Dup');
  Assert(DupCharA(C, 0) = '', 'Dup');
  Assert(DupCharA(C, -1) = '', 'Dup');

  { Pad                                                                        }
  Assert(StrPadLeftA('xxx', 'y', 6) = 'yyyxxx', 'PadLeft');
  Assert(StrPadLeftA('xxx', 'y', 2, True) = 'xx', 'PadLeft');
  Assert(StrPadLeftA('x', ' ', 3, True) = '  x', 'PadLeft');
  Assert(StrPadLeftA('xabc', ' ', 3, True) = 'xab', 'PadLeft');
  Assert(StrPadRightA('xxx', 'y', 6) = 'xxxyyy', 'PadRight');
  Assert(StrPadRightA('xxx', 'y', 2, True) = 'xx', 'PadRight');
  Assert(StrPadA('xxx', 'y', 7) = 'yyxxxyy', 'Pad');

  { Prefix/Suffix                                                              }
  S := 'ABC';
  StrEnsurePrefixA(S, '\');
  Assert(S = '\ABC', 'StrEnsurePrefix');
  StrEnsureSuffixA(S, '\');
  Assert(S = '\ABC\', 'StrEnsureSuffix');
  StrEnsureNoPrefixA(S, '\');
  Assert(S = 'ABC\', 'StrEnsureNoPrefix');
  StrEnsureNoSuffixA(S, '\');
  Assert(S = 'ABC', 'StrEnsureNoSuffix');
  for I := 0 to 256 do
    begin
      T := DupCharA('A', I);
      S := T;
      StrEnsurePrefixA(S, '\');
      Assert(S = '\' + T, 'StrEnsurePrefix');
      StrEnsureNoPrefixA(S, '\');
      Assert(S = T, 'StrEnsureNoPrefix');
      StrEnsureSuffixA(S, '\');
      Assert(S = T + '\', 'StrEnsureSuffix');
      StrEnsureNoSuffixA(S, '\');
      Assert(S = T, 'StrEnsureSuffix');
    end;

  { Split                                                                      }
  Assert(StrSplitAtCharA('ABC:X', AnsiChar(':'), S, T), 'StrSplitAtChar');
  Assert(S = 'ABC', 'StrSplitAtChar');
  Assert(T = 'X', 'StrSplitAtChar');
  Assert(not StrSplitAtCharA('ABC:X', AnsiChar(','), S, T), 'StrSplitAtChar');
  Assert(S = 'ABC:X', 'StrSplitAtChar');
  Assert(T = '', 'StrSplitAtChar');

  L := StrSplitA('', ',');
  Assert(Length(L) = 0, 'StrSplit');
  L := StrSplitA('ABC', ',');
  Assert(Length(L) = 1, 'StrSplit');
  Assert(L[0] = 'ABC', 'StrSplit');
  L := StrSplitA('ABC', '');
  Assert(Length(L) = 1, 'StrSplit');
  Assert(L[0] = 'ABC', 'StrSplit');
  L := StrSplitA('A,B,C', ',');
  Assert(Length(L) = 3, 'StrSplit');
  Assert(L[0] = 'A', 'StrSplit');
  Assert(L[1] = 'B', 'StrSplit');
  Assert(L[2] = 'C', 'StrSplit');
  L := StrSplitA('1,23,456', ',');
  Assert(Length(L) = 3, 'StrSplit');
  Assert(L[0] = '1', 'StrSplit');
  Assert(L[1] = '23', 'StrSplit');
  Assert(L[2] = '456', 'StrSplit');
  L := StrSplitA(',1,2,,3,', ',');
  Assert(Length(L) = 6, 'StrSplit');
  Assert(L[0] = '', 'StrSplit');
  Assert(L[1] = '1', 'StrSplit');
  Assert(L[2] = '2', 'StrSplit');
  Assert(L[3] = '', 'StrSplit');
  Assert(L[4] = '3', 'StrSplit');
  Assert(L[5] = '', 'StrSplit');
  L := StrSplitA('1..23..456', '..');
  Assert(Length(L) = 3, 'StrSplit');
  Assert(L[0] = '1', 'StrSplit');
  Assert(L[1] = '23', 'StrSplit');
  Assert(L[2] = '456', 'StrSplit');

  { Count                                                                      }
  Assert(StrCountChar('abcxyzdexxyxyz', AnsiChar('x')) = 4);
  Assert(StrCountChar('abcxyzdexxyxyz', AnsiChar('q')) = 0);
  Assert(StrCountChar('abcxyzdexxyxyz', ['a'..'z']) = 14);

  { Quoting                                                                    }
  {$IFNDEF CLR}
  Assert(StrRemoveSurroundingQuotesA('"123"') = '123', 'StrRemoveSurroundingQuotes');
  Assert(StrRemoveSurroundingQuotesA('"1""23"') = '1""23', 'StrRemoveSurroundingQuotes');
  Assert(StrQuoteA('Abe''s', '''') = '''Abe''''s''', 'StrQuote');
  Assert(StrUnquoteA('"123"') = '123', 'StrUnQuote');
  Assert(StrUnquoteA('"1""23"') = '1"23', 'StrUnQuote');
  Assert(StrIsQuotedStr('"ABC""D"'), 'StrIsQuotedStr');
  Assert(StrIsQuotedStr('"A"'), 'StrIsQuotedStr');
  Assert(not StrIsQuotedStr('"ABC""D'''), 'StrIsQuotedStr');
  Assert(not StrIsQuotedStr('"ABC""D'), 'StrIsQuotedStr');
  Assert(not StrIsQuotedStr('"'), 'StrIsQuotedStr');
  Assert(not StrIsQuotedStr(''), 'StrIsQuotedStr');
  Assert(StrIsQuotedStr(''''''), 'StrIsQuotedStr');
  Assert(not StrIsQuotedStr('''a'''''), 'StrIsQuotedStr');
  {$ENDIF}

  { Delimited                                                                  }
  Assert(StrAfter('ABCDEF', 'CD') = 'EF', 'StrAfter');
  Assert(StrAfter('ABCDEF', 'CE') = '', 'StrAfter');
  Assert(StrAfter('ABCDEF', 'CE', True) = 'ABCDEF', 'StrAfter');
  Assert(StrAfterRev('ABCABCABC', 'CA') = 'BC', 'StrAfterRev');
  Assert(StrAfterRev('ABCABCABC', 'CD') = '', 'StrAfterRev');
  Assert(StrAfterRev('ABCABCABC', 'CD', True) = 'ABCABCABC', 'StrAfterRev');
  Assert(StrBetweenChar('ABC', AnsiChar('<'), AnsiChar('>')) = '', 'StrBetweenChar');
  Assert(StrBetweenChar('ABC<D>', AnsiChar('<'), AnsiChar('>')) = 'D', 'StrBetweenChar');
  Assert(StrBetweenChar('A*BC*D', AnsiChar('*'), AnsiChar('*')) = 'BC', 'StrBetweenChar');
  Assert(StrBetweenChar('(ABC)', AnsiChar('('), AnsiChar(')')) = 'ABC', 'StrBetweenChar');
  Assert(StrBetweenChar('XYZ(ABC)(DEF)', AnsiChar('('), AnsiChar(')')) = 'ABC', 'StrBetweenChar');
  Assert(StrBetweenChar('XYZ"ABC', AnsiChar('"'), AnsiChar('"')) = '', 'StrBetweenChar');
  Assert(StrBetweenChar('1234543210', AnsiChar('3'), AnsiChar('3'), False, False) = '454', 'StrBetweenChar');
  Assert(StrBetweenChar('1234543210', AnsiChar('3'), AnsiChar('4'), False, False) = '', 'StrBetweenChar');
  Assert(StrBetweenChar('1234543210', AnsiChar('4'), AnsiChar('3'), False, False) = '54', 'StrBetweenChar');
  Assert(StrBetweenChar('1234543210', AnsiChar('4'), AnsiChar('6'), False, False) = '', 'StrBetweenChar');
  Assert(StrBetweenChar('1234543210', AnsiChar('4'), AnsiChar('6'), False, True) = '543210', 'StrBetweenChar');
  Assert(StrBetween('XYZ(ABC)(DEF)', '(', [')']) = 'ABC', 'StrBetween');
  Assert(StrBetween('XYZ(ABC)(DEF)', 'Z(', [')']) = 'ABC', 'StrBetween');

  S := 'XYZ(ABC)<DEF>G"H"IJ"KLM"<N';
  Assert(StrRemoveCharDelimited(S, '<', '>') = 'DEF', 'StrRemoveCharDelimited');
  Assert(S = 'XYZ(ABC)G"H"IJ"KLM"<N', 'StrRemoveCharDelimited');
  Assert(StrRemoveCharDelimited(S, '<', '>') = '', 'StrRemoveCharDelimited');
  Assert(S = 'XYZ(ABC)G"H"IJ"KLM"<N', 'StrRemoveCharDelimited');
  Assert(StrRemoveCharDelimited(S, '(', ')') = 'ABC', 'StrRemoveCharDelimited');
  Assert(S = 'XYZG"H"IJ"KLM"<N', 'StrRemoveCharDelimited');
  Assert(StrRemoveCharDelimited(S, '"', '"') = 'H', 'StrRemoveCharDelimited');
  Assert(S = 'XYZGIJ"KLM"<N', 'StrRemoveCharDelimited');
  Assert(StrRemoveCharDelimited(S, '"', '"') = 'KLM', 'StrRemoveCharDelimited');
  Assert(S = 'XYZGIJ<N', 'StrRemoveCharDelimited');

  { Replace                                                                    }
  Assert(StrReplaceCharA(AnsiChar('X'), AnsiChar('A'), '') = '', 'StrReplaceChar');
  Assert(StrReplaceCharA(AnsiChar('X'), AnsiChar('A'), 'XXX') = 'AAA', 'StrReplaceChar');
  Assert(StrReplaceCharA(AnsiChar('X'), AnsiChar('A'), 'X') = 'A', 'StrReplaceChar');
  Assert(StrReplaceCharA(AnsiChar('X'), AnsiChar('!'), 'ABCXXBXAC') = 'ABC!!B!AC', 'StrReplaceChar');
  Assert(StrReplaceCharA(['A', 'B'], AnsiChar('C'), 'ABCDABCD') = 'CCCDCCCD', 'StrReplaceChar');
  Assert(StrReplaceA('', 'A', 'ABCDEF') = 'ABCDEF', 'StrReplace');
  Assert(StrReplaceA('B', 'A', 'ABCDEFEDCBA') = 'AACDEFEDCAA', 'StrReplace');
  Assert(StrReplaceA('BC', '', 'ABCDEFEDCBA') = 'ADEFEDCBA', 'StrReplace');
  Assert(StrReplaceA('A', '', 'ABAABAA') = 'BB', 'StrReplace');
  Assert(StrReplaceA('C', 'D', 'ABAABAA') = 'ABAABAA', 'StrReplace');
  Assert(StrReplaceA('B', 'CC', 'ABAABAA') = 'ACCAACCAA', 'StrReplace');
  Assert(StrReplaceA('a', 'b', 'bababa') = 'bbbbbb', 'StrReplace');
  Assert(StrReplaceA('a', '', 'bababa') = 'bbb', 'StrReplace');
  Assert(StrReplaceA('a', '', 'aaa') = '', 'StrReplace');
  Assert(StrReplaceA('aba', 'x', 'bababa') = 'bxba', 'StrReplace');
  Assert(StrReplaceA('b', 'bb', 'bababa') = 'bbabbabba', 'StrReplace');
  Assert(StrReplaceA('c', 'aa', 'bababa') = 'bababa', 'StrReplace');
  Assert(StrReplaceA('ba', '', 'bababa') = '', 'StrReplace');
  Assert(StrReplaceA('BA', '', 'bababa', False) = '', 'StrReplace');
  Assert(StrReplaceA('BA', 'X', 'bababa', False) = 'XXX', 'StrReplace');
  Assert(StrReplaceA('aa', '12', 'aaaaa') = '1212a', 'StrReplace');
  Assert(StrReplaceA('aa', 'a', 'aaaaa') = 'aaa', 'StrReplace');
  {$IFNDEF CLR}
  Assert(StrReplaceA(['b'], 'z', 'bababa') = 'zazaza', 'StrReplace');
  Assert(StrReplaceA(['b', 'a'], 'z', 'bababa') = 'zzzzzz', 'StrReplace');
  {$ENDIF}
  Assert(StrReplaceA('a', 'b', 'bababa') = 'bbbbbb', 'StrReplace');
  Assert(StrReplaceA('a', '', 'bababa') = 'bbb', 'StrReplace');
  Assert(StrReplaceA('a', '', 'aaa') = '', 'StrReplace');
  S := DupStrA('ABCDEFGH', 1000000);
  S := StrReplaceA('BC', 'X', S);
  Assert(S = DupStrA('AXDEFGH', 1000000), 'StrReplace');
  Assert(StrRemoveDup('BBBAABABBA', 'B') = 'BAABABA', 'StrRemoveDup');
  Assert(StrRemoveDup('azaazzel', 'a') = 'azazzel', 'StrRemoveDup');
  Assert(StrRemoveDup('BBBAABABBA', 'A') = 'BBBABABBA', 'StrRemoveDup');
  {$IFNDEF CLR}
  Assert(StrRemoveCharSetA('BBBAABABBA', ['B']) = 'AAAA', 'StrRemoveChar');
  {$ENDIF}

  { MatchQuantSeq                                                              }
  {$IFNDEF CLR}
  Assert(MatchQuantSeq(I, [csAlpha], [mqOnce], 'a', []));
  Assert(I = 1);
  Assert(MatchQuantSeq(I, [csAlpha], [mqAny], 'a', []));
  Assert(I = 1);
  Assert(MatchQuantSeq(I, [csAlpha], [mqLeastOnce], 'a', []));
  Assert(I = 1);
  Assert(MatchQuantSeq(I, [csAlpha], [mqOptional], 'a', []));
  Assert(I = 1);
  Assert(MatchQuantSeq(I, [csAlpha], [mqOnce], 'ab', []));
  Assert(I = 1);
  Assert(MatchQuantSeq(I, [csAlpha], [mqAny], 'ab', []));
  Assert(I = 2);
  Assert(MatchQuantSeq(I, [csAlpha], [mqLeastOnce], 'ab', []));
  Assert(I = 2);
  Assert(MatchQuantSeq(I, [csAlpha], [mqOptional], 'ab', []));
  Assert(I = 1);
  Assert(MatchQuantSeq(I, [csAlpha], [mqOnce], 'abc', []));
  Assert(I = 1);
  Assert(MatchQuantSeq(I, [csAlpha], [mqAny], 'abc', []));
  Assert(I = 3);
  Assert(MatchQuantSeq(I, [csAlpha], [mqLeastOnce], 'abc', []));
  Assert(I = 3);
  Assert(MatchQuantSeq(I, [csAlpha], [mqOptional], 'abc', []));
  Assert(I = 1);
  Assert(not MatchQuantSeq(I, [csAlpha, csNumeric], [mqOnce, mqOnce], 'ab12', []));
  Assert(I = 0);
  Assert(MatchQuantSeq(I, [csAlpha, csNumeric], [mqAny, mqOnce], 'abc123', []));
  Assert(I = 4);
  Assert(not MatchQuantSeq(I, [csAlpha, csNumeric], [mqLeastOnce, mqAny], '123', []));
  Assert(I = 0);
  Assert(MatchQuantSeq(I, [csAlpha, csNumeric], [mqOptional, mqAny], '123abc', []));
  Assert(I = 3);
  Assert(MatchQuantSeq(I, [csAlpha, csNumeric], [mqOnce, mqAny], 'a123', []));
  Assert(I = 4);
  Assert(MatchQuantSeq(I, [csAlpha, csNumeric], [mqAny, mqAny], 'abc123', []));
  Assert(I = 6);
  Assert(MatchQuantSeq(I, [csAlpha, csNumeric], [mqLeastOnce, mqOnce], 'ab123', []));
  Assert(I = 3);
  Assert(MatchQuantSeq(I, [csAlpha, csNumeric], [mqOptional, mqOptional], '1', []));
  Assert(I = 1);
  Assert(MatchQuantSeq(I, [csAlpha, csNumeric], [mqOptional, mqOptional], 'a', []));
  Assert(I = 1);
  Assert(MatchQuantSeq(I, [csAlpha, csNumeric], [mqOnce, mqOptional], 'ab', []));
  Assert(I = 1);
  Assert(not MatchQuantSeq(I, [csAlpha, csNumeric], [mqOptional, mqOnce], 'ab', []));
  Assert(I = 0);
  Assert(MatchQuantSeq(I, [csAlphaNumeric, csNumeric, csAlpha, csNumeric],
                          [mqLeastOnce, mqAny, mqOptional, mqOnce], 'a1b2', []));
  Assert(I = 4);
  Assert(MatchQuantSeq(I, [csAlphaNumeric, csNumeric, csAlpha, csNumeric],
                          [mqAny, mqOnce, mqOptional, mqOnce], 'a1b2cd3efg4', []));
  Assert(I = 4);
  Assert(MatchQuantSeq(I, [csAlphaNumeric, csNumeric], [mqAny, mqOptional], 'a1', [moDeterministic]));
  Assert(I = 2);
  Assert(not MatchQuantSeq(I, [csAlphaNumeric, csNumeric], [mqAny, mqOnce], 'a1', [moDeterministic]));
  Assert(I = 0);
  Assert(MatchQuantSeq(I, [csAlpha, csNumeric, csAlpha, csAlphaNumeric],
                          [mqAny, mqOnce, mqAny, mqLeastOnce], 'a1b2cd3efg4', [moDeterministic]));
  Assert(I = 11);
  Assert(MatchQuantSeq(I, [csAlphaNumeric, csNumeric], [mqAny, mqOptional], 'a1', [moNonGreedy]));
  Assert(I = 0);
  Assert(MatchQuantSeq(I, [csAlphaNumeric, csNumeric], [mqAny, mqLeastOnce], 'a1', [moNonGreedy]));
  Assert(I = 2);
  Assert(not MatchQuantSeq(I, [csAlphaNumeric, csNumeric], [mqAny, mqOnce], 'abc', [moNonGreedy]));
  Assert(I = 0);
  Assert(MatchQuantSeq(I, [csAlphaNumeric, csNumeric, csAlpha, csNumeric],
                          [mqAny, mqOnce, mqOnce, mqLeastOnce], 'a1bc2de3g4', [moNonGreedy]));
  Assert(I = 10);
  {$ENDIF}

  { MatchPattern                                                         }
  {$IFNDEF CLR}
  Assert(MatchPattern('a*b', 'ab'), 'MatchPattern');
  Assert(MatchPattern('a*b', 'aab'), 'MatchPattern');
  Assert(MatchPattern('a*b', 'accb'), 'MatchPattern');
  Assert(not MatchPattern('a*b', 'a'), 'MatchPattern');
  Assert(MatchPattern('a?b', 'acb'), 'MatchPattern');
  Assert(not MatchPattern('a?b', 'ab'), 'MatchPattern');
  Assert(MatchPattern('a[^a]', 'ab'), 'MatchPattern');
  Assert(MatchPattern('a[0-9a-z]', 'ab'), 'MatchPattern');
  Assert(MatchPattern('', ''), 'MatchPattern');
  Assert(not MatchPattern('', 'a'), 'MatchPattern');
  Assert(not MatchPattern('a', ''), 'MatchPattern');
  Assert(not MatchPattern('?', ''), 'MatchPattern');
  {$ENDIF}

  { MatchFileMask                                                        }
  Assert(MatchFileMask('*', 'A'), 'MatchFileMask');
  Assert(MatchFileMask('?', 'A'), 'MatchFileMask');
  Assert(MatchFileMask('', 'A'), 'MatchFileMask');
  Assert(MatchFileMask('', ''), 'MatchFileMask');
  Assert(not MatchFileMask('X', ''), 'MatchFileMask');
  Assert(MatchFileMask('A?', 'A'), 'MatchFileMask');
  Assert(MatchFileMask('A?', 'AB'), 'MatchFileMask');
  Assert(MatchFileMask('A*B*C', 'ACBDC'), 'MatchFileMask');
  Assert(MatchFileMask('A*B*?', 'ACBDC'), 'MatchFileMask');

  { Escaping                                                                   }
  Assert(StrHexEscape('ABCDE', ['C', 'D'], '\\', '//', False, True) =
         'AB\\43//\\44//E', 'StrHexEscape');
  Assert(StrHexEscape('ABCDE', ['C', 'E'], '\', '', False, True) =
         'AB\43D\45', 'StrHexEscape');
  Assert(StrHexEscape('ABCDE', ['F'], '\', '', False, True) =
         'ABCDE', 'StrHexEscape');
  Assert(StrHexUnescape('AB\\43\\44XYZ', '\\') = 'ABCDXYZ', 'StrHexUnescape');
  Assert(StrHexUnescape('ABC', '\') = 'ABC', 'StrHexUnescape');
  Assert(StrHexUnescape('ABC\44', '\') = 'ABCD', 'StrHexUnescape');

  Assert(StrCharEscape('ABCDE', ['C', 'D'], '\\', ['c', 'd']) =
         'AB\\c\\dE', 'StrCharEscape');
  Assert(StrCharEscape('ABCDE', ['C', 'E'], '\', ['c', 'e']) =
         'AB\cD\e', 'StrCharEscape');
  Assert(StrCharEscape('ABCDE', ['F'], '\', ['f']) =
         'ABCDE', 'StrCharEscape');
  Assert(StrCharUnescape('AB\\c\\dE', '\\', ['c', 'd'], ['C', 'D'], True, True) =
         'ABCDE', 'StrCharUnescape');

  { CharClassStr                                                               }
  Assert(CharSetToCharClassStr(['a'..'z']) = '[a-z]', 'CharClassStr');
  Assert(CharSetToCharClassStr(CompleteCharSet) = '.', 'CharClassStr');
  Assert(CharSetToCharClassStr([#0..#31]) = '[\x0-\x1F]', 'CharClassStr');
  Assert(CharSetToCharClassStr([#0..#32]) = '[\x0- ]', 'CharClassStr');
  Assert(CharSetToCharClassStr(CompleteCharSet - ['a']) = '[^a]', 'CharClassStr');
  Assert(CharSetToCharClassStr(CompleteCharSet - ['a'..'z']) = '[^a-z]', 'CharClassStr');
  Assert(CharSetToCharClassStr(['a'..'b']) = '[ab]', 'CharClassStr');
  Assert(CharSetToCharClassStr([]) = '[]', 'CharClassStr');
  {$IFNDEF CLR}
  Assert(CharClassStrToCharSet('[a]') = ['a'], 'CharClassStr');
  Assert(CharClassStrToCharSet('[]') = [], 'CharClassStr');
  Assert(CharClassStrToCharSet('.') = CompleteCharSet, 'CharClassStr');
  Assert(CharClassStrToCharSet('') = [], 'CharClassStr');
  Assert(CharClassStrToCharSet('[a-z]') = ['a'..'z'], 'CharClassStr');
  Assert(CharClassStrToCharSet('[^a-z]') = CompleteCharSet - ['a'..'z'], 'CharClassStr');
  Assert(CharClassStrToCharSet('[-]') = ['-'], 'CharClassStr');
  Assert(CharClassStrToCharSet('[a-]') = ['a', '-'], 'CharClassStr');
  Assert(CharClassStrToCharSet('[\x5]') = [#$5], 'CharClassStr');
  Assert(CharClassStrToCharSet('[\x1f]') = [#$1f], 'CharClassStr');
  Assert(CharClassStrToCharSet('[\x10-]') = [#$10, '-'], 'CharClassStr');
  Assert(CharClassStrToCharSet('[\x10-\x1f]') = [#$10..#$1f], 'CharClassStr');
  Assert(CharClassStrToCharSet('[\x10-\xf]') = [], 'CharClassStr');
  {$ENDIF}
end;
{$ENDIF}



end.

