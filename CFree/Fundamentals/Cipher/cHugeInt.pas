{******************************************************************************}
{                                                                              }
{   File name:        cHugeInt.pas                                             }
{   File version:     4.16                                                     }
{   Description:      HugeInt functions                                        }
{                                                                              }
{   Copyright:        Copyright � 2001-2011, David J Butler                    }
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
{   2001/11/18  0.01  HugeWord.                                                }
{   2001/11/19  0.02  HugeMultiplyFFT.                                         }
{   2003/10/01  0.03  HugeInt.                                                 }
{   2007/08/08  4.04  Revised for Fundamentals 4.                              }
{   2007/08/16  4.05  Revised HugeWord.                                        }
{   2007/08/22  4.06  PowerAndMod.                                             }
{   2008/01/20  4.07  HugeWord primality testing.                              }
{   2010/01/07  4.08  Minor revision.                                          }
{   2010/08/05  4.09  Changed HugeWord structure to separately keep track of   }
{                     allocated and used size.                                 }
{   2010/08/06  4.10  Revision, improved tests and bug fixes.                  }
{   2010/08/08  4.11  Improved ISqrt algorithm, HugeInt tests.                 }
{   2010/08/09  4.12  Optimisation and bug fix.                                }
{   2010/12/01  4.13  HugeWordAssignBuf.                                       }
{   2011/01/24  4.14  Revised for FreePascal 2.4.2.                            }
{   2011/01/25  4.15  THugeInt class.                                          }
{   2011/04/02  4.16  Compilable with Delphi 5.                                }
{                                                                              }
{******************************************************************************}

{$INCLUDE cDefines.inc}

{$IFDEF FREEPASCAL}
{$Q-}
{$ENDIF}

unit cHugeInt;

interface



{                                                                              }
{ Structures                                                                   }
{                                                                              }
type
  HugeWord = record
    Used  : Integer;
    Alloc : Integer;
    Data  : Pointer;
  end;
  PHugeWord = ^HugeWord;

type
  HugeWordElement = LongWord;
  PHugeWordElement = ^HugeWordElement;

const
  HugeWordElementSize = SizeOf(HugeWordElement); // 4 bytes
  HugeWordElementBits = HugeWordElementSize * 8; // 32 bits

type
  THugeWordCallbackProc = function (const Data: Integer): Boolean;

type
  HugeInt = packed record
    Sign  : ShortInt; // -1, 0 or 1
    Value : HugeWord;
  end;
  PHugeInt = ^HugeInt;


  
{                                                                              }
{ HugeWord                                                                     }
{                                                                              }
procedure HugeWordInit(out A: HugeWord);
procedure HugeWordFinalise(var A: HugeWord);
procedure HugeWordFinaliseTo(var A, B: HugeWord);

procedure HugeWordAlloc(var A: HugeWord; const Size: Integer);
procedure HugeWordAllocZero(var A: HugeWord; const Size: Integer);
procedure HugeWordFree(var A: HugeWord);
procedure HugeWordRealloc(var A: HugeWord; const Size: Integer);

function  HugeWordGetSize(const A: HugeWord): Integer; {$IFDEF UseInline}inline;{$ENDIF}
procedure HugeWordSetSize(var A: HugeWord; const Size: Integer);

function  HugeWordGetElement(const A: HugeWord; const I: Integer): LongWord; {$IFDEF UseInline}inline;{$ENDIF}
procedure HugeWordSetElement(const A: HugeWord; const I: Integer; const B: LongWord); {$IFDEF UseInline}inline;{$ENDIF}
function  HugeWordGetFirstElementPtr(const A: HugeWord): PHugeWordElement; {$IFDEF UseInline}inline;{$ENDIF}
function  HugeWordGetLastElementPtr(const A: HugeWord): PHugeWordElement; {$IFDEF UseInline}inline;{$ENDIF}

procedure HugeWordNormalise(var A: HugeWord);

procedure HugeWordInitZero(out A: HugeWord); {$IFDEF UseInline}inline;{$ENDIF}
procedure HugeWordInitOne(out A: HugeWord);
procedure HugeWordInitWord32(out A: HugeWord; const B: LongWord);
procedure HugeWordInitInt32(out A: HugeWord; const B: LongInt);
procedure HugeWordInitInt64(out A: HugeWord; const B: Int64);
procedure HugeWordInitHugeWord(out A: HugeWord; const B: HugeWord);

procedure HugeWordAssignZero(var A: HugeWord); {$IFDEF UseInline}inline;{$ENDIF}
procedure HugeWordAssignOne(var A: HugeWord); {$IFDEF UseInline}inline;{$ENDIF}
procedure HugeWordAssignWord32(var A: HugeWord; const B: LongWord);
procedure HugeWordAssignInt32(var A: HugeWord; const B: LongInt);
procedure HugeWordAssignInt64(var A: HugeWord; const B: Int64);
procedure HugeWordAssign(var A: HugeWord; const B: HugeWord);
procedure HugeWordAssignHugeIntAbs(var A: HugeWord; const B: HugeInt);
procedure HugeWordAssignBuf(var A: HugeWord; const Buf; const BufSize: Integer;
          const ReverseByteOrder: Boolean);
procedure HugeWordAssignBufStr(var A: HugeWord; const Buf: AnsiString;
          const ReverseByteOrder: Boolean);

procedure HugeWordSwap(var A, B: HugeWord);

function  HugeWordIsZero(const A: HugeWord): Boolean; {$IFDEF UseInline}inline;{$ENDIF}
function  HugeWordIsOne(const A: HugeWord): Boolean;
function  HugeWordIsOdd(const A: HugeWord): Boolean;
function  HugeWordIsEven(const A: HugeWord): Boolean;

function  HugeWordIsWord32Range(const A: HugeWord): Boolean;
function  HugeWordIsWord64Range(const A: HugeWord): Boolean;
function  HugeWordIsWord128Range(const A: HugeWord): Boolean;
function  HugeWordIsInt32Range(const A: HugeWord): Boolean;
function  HugeWordIsInt64Range(const A: HugeWord): Boolean;

function  HugeWordToWord32(const A: HugeWord): LongWord;
function  HugeWordToInt32(const A: HugeWord): LongInt;
function  HugeWordToInt64(const A: HugeWord): Int64;

function  HugeWordEqualsWord32(const A: HugeWord; const B: LongWord): Boolean;
function  HugeWordEqualsInt32(const A: HugeWord; const B: LongInt): Boolean;
function  HugeWordEqualsInt64(const A: HugeWord; const B: Int64): Boolean;
function  HugeWordEquals(const A, B: HugeWord): Boolean;

function  HugeWordCompareWord32(const A: HugeWord; const B: LongWord): Integer;
function  HugeWordCompareInt32(const A: HugeWord; const B: LongInt): Integer;
function  HugeWordCompareInt64(const A: HugeWord; const B: Int64): Integer;
function  HugeWordCompare(const A, B: HugeWord): Integer;

procedure HugeWordMin(var A: HugeWord; const B: HugeWord);
procedure HugeWordMax(var A: HugeWord; const B: HugeWord);

function  HugeWordGetBitCount(const A: HugeWord): Integer;
procedure HugeWordSetBitCount(var A: HugeWord; const Bits: Integer);

function  HugeWordIsBitSet(const A: HugeWord; const B: Integer): Boolean;
procedure HugeWordSetBit(var A: HugeWord; const B: Integer);
procedure HugeWordClearBit(var A: HugeWord; const B: Integer);
procedure HugeWordToggleBit(var A: HugeWord; const B: Integer);

function  HugeWordSetBitScanForward(const A: HugeWord): Integer;
function  HugeWordSetBitScanReverse(const A: HugeWord): Integer;
function  HugeWordClearBitScanForward(const A: HugeWord): Integer;
function  HugeWordClearBitScanReverse(const A: HugeWord): Integer;

procedure HugeWordShl(var A: HugeWord; const B: Integer);
procedure HugeWordShl1(var A: HugeWord);
procedure HugeWordShr(var A: HugeWord; const B: Integer);
procedure HugeWordShr1(var A: HugeWord);

procedure HugeWordNot(var A: HugeWord);
procedure HugeWordOrHugeWord(var A: HugeWord; const B: HugeWord);
procedure HugeWordAndHugeWord(var A: HugeWord; const B: HugeWord);
procedure HugeWordXorHugeWord(var A: HugeWord; const B: HugeWord);

procedure HugeWordAddWord32(var A: HugeWord; const B: LongWord);
procedure HugeWordAdd(var A: HugeWord; const B: HugeWord);

procedure HugeWordInc(var A: HugeWord);

function  HugeWordSubtractWord32(var A: HugeWord; const B: LongWord): Integer;
function  HugeWordSubtract(var A: HugeWord; const B: HugeWord): Integer;

procedure HugeWordDec(var A: HugeWord);

procedure HugeWordMultiplyWord8(var A: HugeWord; const B: Byte);
procedure HugeWordMultiplyWord16(var A: HugeWord; const B: Word);
procedure HugeWordMultiplyWord32(var A: HugeWord; const B: LongWord);
procedure HugeWordMultiply_Long_NN(var Res: HugeWord; const A, B: HugeWord);
procedure HugeWordMultiply_Long_NN_Unsafe(var Res: HugeWord; const A, B: HugeWord);
procedure HugeWordMultiply_Long(var Res: HugeWord; const A, B: HugeWord);
procedure HugeWordMultiply_ShiftAdd(var Res: HugeWord; const A, B: HugeWord);
procedure HugeWordMultiply(var Res: HugeWord; const A, B: HugeWord); {$IFDEF UseInline}inline;{$ENDIF}

procedure HugeWordSqr(var Res: HugeWord; const A: HugeWord); 

procedure HugeWordDivideWord32(const A: HugeWord; const B: LongWord; var Q: HugeWord; out R: LongWord);
procedure HugeWordDivide_RR(const A, B: HugeWord; var Q, R: HugeWord);
procedure HugeWordDivide_RR_Unsafe(const A, B: HugeWord; var Q, R: HugeWord);
procedure HugeWordDivide(const A, B: HugeWord; var Q, R: HugeWord);

procedure HugeWordMod(const A, B: HugeWord; var R: HugeWord);

procedure HugeWordGCD(const A, B: HugeWord; var R: HugeWord);

procedure HugeWordPower(var A: HugeWord; const B: LongWord);
procedure HugeWordPowerAndMod(var Res: HugeWord; const A, E, M: HugeWord);

function  HugeWordToStr(const A: HugeWord): AnsiString;
procedure StrToHugeWord(const A: AnsiString; var R: HugeWord);
function  HugeWordToHex(const A: HugeWord): AnsiString;
procedure HexToHugeWord(const A: AnsiString; var R: HugeWord);

procedure HugeWordISqrt(var A: HugeWord);

procedure HugeWordExtendedEuclid(const A, B: HugeWord; var R: HugeWord; var X, Y: HugeInt);
function  HugeWordModInv(const E, M: HugeWord; var R: HugeWord): Boolean;

procedure HugeWordRandom(var A: HugeWord; const Size: Integer);

type
  TPrimality = (
    pPotentialPrime,
    pNotPrime,
    pPrime);

function  HugeWordIsPrime_QuickTrial(const A: HugeWord): TPrimality;
function  HugeWordIsPrime_MillerRabin(const A: HugeWord): TPrimality;
function  HugeWordIsPrime(const A: HugeWord): TPrimality;

procedure HugeWordNextPotentialPrime(var A: HugeWord;
          const CallbackProc: THugeWordCallbackProc = nil;
          const CallbackData: Integer = 0);



{                                                                              }
{ HugeInt                                                                      }
{                                                                              }
procedure HugeIntInit(out A: HugeInt); {$IFDEF UseInline}inline;{$ENDIF}
procedure HugeIntFinalise(var A: HugeInt); {$IFDEF UseInline}inline;{$ENDIF}

procedure HugeIntNormalise(var A: HugeInt);

procedure HugeIntInitZero(out A: HugeInt); {$IFDEF UseInline}inline;{$ENDIF}
procedure HugeIntInitOne(out A: HugeInt);
procedure HugeIntInitMinusOne(out A: HugeInt);
procedure HugeIntInitWord32(out A: HugeInt; const B: LongWord);
procedure HugeIntInitInt32(out A: HugeInt; const B: LongInt);
procedure HugeIntInitInt64(out A: HugeInt; const B: Int64);
procedure HugeIntInitHugeWord(out A: HugeInt; const B: HugeWord);
procedure HugeIntInitHugeInt(out A: HugeInt; const B: HugeInt);

procedure HugeIntAssignZero(var A: HugeInt); {$IFDEF UseInline}inline;{$ENDIF}
procedure HugeIntAssignOne(var A: HugeInt);
procedure HugeIntAssignMinusOne(var A: HugeInt);
procedure HugeIntAssignWord32(var A: HugeInt; const B: LongWord);
procedure HugeIntAssignInt32(var A: HugeInt; const B: LongInt);
procedure HugeIntAssignInt64(var A: HugeInt; const B: Int64);
procedure HugeIntAssignHugeWord(var A: HugeInt; const B: HugeWord);
procedure HugeIntAssignHugeWordNegated(var A: HugeInt; const B: HugeWord);
procedure HugeIntAssignHugeInt(var A: HugeInt; const B: HugeInt);

procedure HugeIntSwap(var A, B: HugeInt);

function  HugeIntIsZero(const A: HugeInt): Boolean; {$IFDEF UseInline}inline;{$ENDIF}
function  HugeIntIsNegative(const A: HugeInt): Boolean; {$IFDEF UseInline}inline;{$ENDIF}
function  HugeIntIsNegativeOrZero(const A: HugeInt): Boolean; {$IFDEF UseInline}inline;{$ENDIF}
function  HugeIntIsPositive(const A: HugeInt): Boolean; {$IFDEF UseInline}inline;{$ENDIF}
function  HugeIntIsPositiveOrZero(const A: HugeInt): Boolean; {$IFDEF UseInline}inline;{$ENDIF}
function  HugeIntIsOne(const A: HugeInt): Boolean;
function  HugeIntIsMinusOne(const A: HugeInt): Boolean;
function  HugeIntIsOdd(const A: HugeInt): Boolean; {$IFDEF UseInline}inline;{$ENDIF}
function  HugeIntIsEven(const A: HugeInt): Boolean; {$IFDEF UseInline}inline;{$ENDIF}

function  HugeIntIsWord32Range(const A: HugeInt): Boolean;
function  HugeIntIsInt32Range(const A: HugeInt): Boolean;
function  HugeIntIsInt64Range(const A: HugeInt): Boolean;

function  HugeIntSign(const A: HugeInt): Integer; {$IFDEF UseInline}inline;{$ENDIF}
procedure HugeIntNegate(var A: HugeInt); {$IFDEF UseInline}inline;{$ENDIF}
function  HugeIntAbsInPlace(var A: HugeInt): Boolean;
function  HugeIntAbs(const A: HugeInt; var B: HugeWord): Boolean;

function  HugeIntToWord32(const A: HugeInt): LongWord;
function  HugeIntToInt32(const A: HugeInt): LongInt;
function  HugeIntToInt64(const A: HugeInt): Int64;

function  HugeIntEqualsWord32(const A: HugeInt; const B: LongWord): Boolean;
function  HugeIntEqualsInt32(const A: HugeInt; const B: LongInt): Boolean;
function  HugeIntEqualsInt64(const A: HugeInt; const B: Int64): Boolean;
function  HugeIntEqualsHugeInt(const A, B: HugeInt): Boolean;

function  HugeIntCompareWord32(const A: HugeInt; const B: LongWord): Integer;
function  HugeIntCompareInt32(const A: HugeInt; const B: LongInt): Integer;
function  HugeIntCompareInt64(const A: HugeInt; const B: Int64): Integer;
function  HugeIntCompareHugeInt(const A, B: HugeInt): Integer;
function  HugeIntCompareHugeIntAbs(const A, B: HugeInt): Integer;

procedure HugeIntMin(var A: HugeInt; const B: HugeInt);
procedure HugeIntMax(var A: HugeInt; const B: HugeInt);

procedure HugeIntAddWord32(var A: HugeInt; const B: LongWord);
procedure HugeIntAddInt32(var A: HugeInt; const B: LongInt);
procedure HugeIntAddHugeInt(var A: HugeInt; const B: HugeInt);

procedure HugeIntInc(var A: HugeInt);

procedure HugeIntSubtractWord32(var A: HugeInt; const B: LongWord);
procedure HugeIntSubtractInt32(var A: HugeInt; const B: LongInt);
procedure HugeIntSubtractHugeInt(var A: HugeInt; const B: HugeInt);

procedure HugeIntDec(var A: HugeInt);

procedure HugeIntMultiplyWord8(var A: HugeInt; const B: Byte);
procedure HugeIntMultiplyWord16(var A: HugeInt; const B: Word);
procedure HugeIntMultiplyWord32(var A: HugeInt; const B: LongWord);
procedure HugeIntMultiplyInt8(var A: HugeInt; const B: ShortInt);
procedure HugeIntMultiplyInt16(var A: HugeInt; const B: SmallInt);
procedure HugeIntMultiplyInt32(var A: HugeInt; const B: LongInt);
procedure HugeIntMultiplyHugeWord(var A: HugeInt; const B: HugeWord);
procedure HugeIntMultiplyHugeInt(var A: HugeInt; const B: HugeInt);

procedure HugeIntSqr(var A: HugeInt);

procedure HugeIntDivideWord32(const A: HugeInt; const B: LongWord; var Q: HugeInt; out R: LongWord);
procedure HugeIntDivideInt32(const A: HugeInt; const B: LongInt; var Q: HugeInt; out R: LongInt);
procedure HugeIntDivideHugeInt(const A, B: HugeInt; var Q, R: HugeInt);

procedure HugeIntMod(const A, B: HugeInt; var R: HugeInt);

procedure HugeIntPower(var A: HugeInt; const B: LongWord);

function  HugeIntToStr(const A: HugeInt): AnsiString;
procedure StrToHugeInt(const A: AnsiString; var R: HugeInt);
function  HugeIntToHex(const A: HugeInt): AnsiString;
procedure HexToHugeInt(const A: AnsiString; var R: HugeInt);

procedure HugeIntISqrt(var A: HugeInt);

procedure HugeIntRandom(var A: HugeInt; const Size: Integer);



{                                                                              }
{ HugeInt class                                                                }
{                                                                              }
type
  THugeInt = class
  private
    FValue : HugeInt;

  public
    constructor Create; overload;
    constructor Create(const A: Int64); overload;
    constructor Create(const A: THugeInt); overload;
    destructor Destroy; override;

    procedure AssignZero;
    procedure AssignOne;
    procedure AssignMinusOne;
    procedure Assign(const A: Int64); overload;
    procedure Assign(const A: THugeInt); overload;

    function  IsZero: Boolean;
    function  IsNegative: Boolean;
    function  IsPositive: Boolean;
    function  IsOne: Boolean;
    function  IsMinusOne: Boolean;
    function  IsOdd: Boolean;
    function  IsEven: Boolean;

    function  Sign: Integer;
    procedure Negate;
    procedure Abs;

    function  ToWord32: LongWord;
    function  ToInt32: LongInt;
    function  ToInt64: Int64;

    function  Equals(const A: LongWord): Boolean; overload;
    function  Equals(const A: LongInt): Boolean; overload;
    function  Equals(const A: Int64): Boolean; overload;
    function  Equals(const A: THugeInt): Boolean; overload;

    function  Compare(const A: LongWord): Integer; overload;
    function  Compare(const A: LongInt): Integer; overload;
    function  Compare(const A: Int64): Integer; overload;
    function  Compare(const A: THugeInt): Integer; overload;

    procedure Add(const A: LongInt); overload;
    procedure Add(const A: THugeInt); overload;
    procedure Inc;

    procedure Subtract(const A: LongInt); overload;
    procedure Subtract(const A: THugeInt); overload;
    procedure Dec;

    procedure Multiply(const A: LongInt); overload;
    procedure Multiply(const A: THugeInt); overload;
    procedure Sqr;

    procedure Divide(const B: LongInt; out R: LongInt); overload;
    procedure Divide(const B: THugeInt; var R: THugeInt); overload;

    procedure Power(const B: LongWord);

    function  ToStr: AnsiString;
    function  ToHex: AnsiString;
    
    procedure AssignStr(const A: AnsiString);
    procedure AssignHex(const A: AnsiString);

    procedure ISqrt;

    procedure Random(const Size: Integer);
  end;



{                                                                              }
{ Test cases                                                                   }
{                                                                              }
{$IFDEF DEBUG}{$IFDEF SELFTEST}
procedure SelfTest;
{$ENDIF}{$IFDEF PROFILE}
procedure Profile;
{$ENDIF}{$ENDIF}



implementation

uses
  { System }
  {$IFDEF DEBUG}{$IFDEF PROFILE}
  Windows,
  {$ENDIF}{$ENDIF}
  SysUtils,
  { Fundamentals }
  cRandom;



{                                                                              }
{ Utilities                                                                    }
{                                                                              }

{$IFDEF DELPHI5}
type
  PByte = ^Byte;
  PLongWord = ^LongWord;
  PLongInt = ^LongInt;
{$ENDIF}

const
  MinInt32 = LongInt(Low(LongInt)); // -$80000000
  MinInt64 = Int64(Low(Int64));     // -$8000000000000000



{                                                                              }
{ Error routines                                                               }
{                                                                              }
procedure RaiseDivByZeroError;
begin
  raise EDivByZero.Create('Division by zero');
end;

procedure RaiseRangeError;
begin
  raise ERangeError.Create('Range error');
end;

procedure RaiseConvertError;
begin
  raise EConvertError.Create('Convert error');
end;

procedure RaiseInvalidOpError;
begin
  raise EInvalidOp.Create('Invalid operation');
end;



{                                                                              }
{ HugeWord                                                                     }
{                                                                              }

{ HugeWord Init                                                                }
{   HugeWordInit needs to be called on every instance of HugeWord (except      }
{   where it can be assured the HugeWord structure is zero) before using it    }
{   in calls to other HugeWord routines.                                       }
{   Every HugeWord instance must be finalised with a call to HugeWordFinalise. }
procedure HugeWordInit(out A: HugeWord);
begin
  A.Used := 0;
  A.Alloc := 0;
  A.Data := nil;
end;

{ HugeWord Alloc                                                               }
{   Post: HugeWord data is undefined.                                          }
procedure HugeWordAlloc(var A: HugeWord; const Size: Integer);
var L : Integer;
begin
  Assert(Size > 0);

  L := Size * HugeWordElementSize;
  GetMem(A.Data, L);
  A.Alloc := Size;
end;

{ HugeWord AllocZero                                                           }
{   Post: HugeWord data is zero.                                               }
procedure HugeWordAllocZero(var A: HugeWord; const Size: Integer);
var L : Integer;
begin
  Assert(Size > 0);

  L := Size * HugeWordElementSize;
  GetMem(A.Data, L);
  A.Alloc := Size;
  FillChar(A.Data^, L, 0);
end;

{ HugeWord Free                                                                }
procedure HugeWordFree(var A: HugeWord);
begin
  Assert(A.Alloc > 0);
  Assert(A.Data <> nil);

  FreeMem(A.Data);
  A.Alloc := 0;
  A.Data := nil;
end;

{ HugeWord Realloc                                                             }
procedure HugeWordRealloc(var A: HugeWord; const Size: Integer);
var OldSize, L : Integer;
begin
  Assert(Size >= 0);

  OldSize := A.Alloc;
  if OldSize = Size then
    exit;
  if Size <= 0 then
    begin
      HugeWordFree(A);
      exit;
    end;
  if OldSize = 0 then
    begin
      HugeWordAlloc(A, Size);
      exit;
    end;
  L := Size * HugeWordElementSize;
  ReallocMem(A.Data, L);
  A.Alloc := Size;
end;

procedure HugeWordFinalise(var A: HugeWord);
begin
  if A.Data <> nil then
    HugeWordFree(A);
end;

{ HugeWord FinaliseTo                                                          }
{ Assign A to B and finalise A                                                 }
procedure HugeWordFinaliseTo(var A, B: HugeWord);
begin
  HugeWordFinalise(B);
  B.Used := A.Used;
  B.Alloc := A.Alloc;
  B.Data := A.Data;
  A.Alloc := 0;
  A.Data := nil;
end;

{ HugeWord GetSize                                                             }
{   Post: Returns number of HugeWordItems in the HugeWord structure.           }
function HugeWordGetSize(const A: HugeWord): Integer;
begin
  Result := A.Used;
end;

{ HugeWord SetSize                                                             }
{   Post: Expanded data is set to zero.                                        }
procedure HugeWordSetSize(var A: HugeWord; const Size: Integer);
var OldUsed, OldAlloc, NewAlloc : Integer;
    P : PByte;
begin
  Assert(Size >= 0);

  OldUsed := A.Used;
  if Size = OldUsed then // unchanged
    exit;
  if Size < OldUsed then
    begin
      // shrink: keep allocated memory
      A.Used := Size;
      exit;
    end;
  OldAlloc := A.Alloc;
  if OldAlloc = 0 then
    begin
      // first allocation: allocate and set all to zero
      HugeWordAllocZero(A, Size);
      A.Used := Size;
      exit;
    end;
  if Size > OldAlloc then
    begin
      // growing block: allocate more memory than requested, this reduces
      // the number of future Realloc calls
      NewAlloc := OldAlloc * 2;
      if NewAlloc < Size then
        NewAlloc := Size;
      HugeWordRealloc(A, NewAlloc);
    end;
  // set expanded elements to zero
  P := A.Data;
  Inc(P, OldUsed * HugeWordElementSize);
  FillChar(P^, (Size - OldUsed) * HugeWordElementSize, 0);
  A.Used := Size;
end;

function HugeWordGetElement(const A: HugeWord; const I: Integer): LongWord;
var P : PLongWord;
begin
  Assert(I < A.Used);

  P := A.Data;
  Inc(P, I);
  Result := P^;
end;

procedure HugeWordSetElement(const A: HugeWord; const I: Integer; const B: LongWord);
var P : PLongWord;
begin
  Assert(I < A.Used);

  P := A.Data;
  Inc(P, I);
  P^ := B;
end;

function HugeWordGetFirstElementPtr(const A: HugeWord): PHugeWordElement;
begin
  if A.Used = 0 then
    Result := nil
  else
    Result := A.Data;
end;

function HugeWordGetLastElementPtr(const A: HugeWord): PHugeWordElement;
var L : Integer;
begin
  L := A.Used;
  if L = 0 then
    Result := nil
  else
    begin
      Result := A.Data;
      Inc(Result, L - 1);
    end;
end;

{ HugeWord Normalise (helper function)                                         }
{   A 'normalised' HugeWord has no trailing zeros (ie the most significant     }
{   value is non-zero) or it is nil (to represent a value of 0).               }
procedure HugeWordNormalise(var A: HugeWord);
var I, L : Integer;
    P : PLongWord;
begin
  L := A.Used;
  if L = 0 then
    exit;
  I := 0;
  P := A.Data;
  Inc(P, L - 1);
  while (I < L) and (P^ = 0) do
    begin
      Dec(P);
      Inc(I);
    end;
  if I = 0 then
    exit;
  HugeWordSetSize(A, L - I);
end;

{ HugeWord Init Zero                                                           }
{   Post:  A is zero                                                           }
{          A normalised                                                        }
procedure HugeWordInitZero(out A: HugeWord);
begin
  HugeWordInit(A);
end;

{ HugeWord Init One                                                            }
{   Post:  A is zero                                                           }
{          A normalised                                                        }
procedure HugeWordInitOne(out A: HugeWord);
begin
  HugeWordInit(A);
  HugeWordAssignOne(A);
end;

procedure HugeWordInitWord32(out A: HugeWord; const B: LongWord);
begin
  HugeWordInit(A);
  HugeWordAssignWord32(A, B);
end;

procedure HugeWordInitInt32(out A: HugeWord; const B: LongInt);
begin
  HugeWordInit(A);
  HugeWordAssignInt32(A, B);
end;

procedure HugeWordInitInt64(out A: HugeWord; const B: Int64);
begin
  HugeWordInit(A);
  HugeWordAssignInt64(A, B);
end;

procedure HugeWordInitHugeWord(out A: HugeWord; const B: HugeWord);
var L : Integer;
begin
  L := B.Used;
  if L = 0 then
    HugeWordInit(A)
  else
    begin
      HugeWordAlloc(A, L);
      A.Used := L;
      Move(B.Data^, A.Data^, L * HugeWordElementSize);
    end;
end;

procedure HugeWordAssignZero(var A: HugeWord);
begin
  HugeWordSetSize(A, 0);
end;

procedure HugeWordAssignOne(var A: HugeWord);
begin
  HugeWordSetSize(A, 1);
  PLongWord(A.Data)^ := 1;
end;

procedure HugeWordAssignWord32(var A: HugeWord; const B: LongWord);
begin
  if B = 0 then
    HugeWordAssignZero(A)
  else
    begin
      HugeWordSetSize(A, 1);
      PLongWord(A.Data)^ := B;
    end;
end;

procedure HugeWordAssignInt32(var A: HugeWord; const B: LongInt);
begin
  {$IFOPT R+}
  if B < 0 then
    RaiseRangeError else
  {$ENDIF}
  if B = 0 then
    HugeWordAssignZero(A)
  else
    begin
      HugeWordSetSize(A, 1);
      PLongWord(A.Data)^ := LongWord(B);
    end;
end;

{ HugeWord AssignInt64                                                         }
{   Post:  A normalised                                                        }
procedure HugeWordAssignInt64(var A: HugeWord; const B: Int64);
var P : PLongWord;
begin
  {$IFOPT R+}
  if B < 0 then
    RaiseRangeError else
  {$ENDIF}
  if Int64Rec(B).Hi = 0 then
    HugeWordAssignWord32(A, Int64Rec(B).Lo)
  else
    begin
      HugeWordSetSize(A, 2);
      P := A.Data;
      P^ := Int64Rec(B).Lo;
      Inc(P);
      P^ := Int64Rec(B).Hi;
      HugeWordNormalise(A);
    end;
end;

procedure HugeWordAssign(var A: HugeWord; const B: HugeWord);
var L : Integer;
begin
  L := B.Used;
  HugeWordSetSize(A, L);
  if L = 0 then
    exit;
  Move(B.Data^, A.Data^, L * HugeWordElementSize);
end;

{ HugeWord Assign HugeInt Abs                                                  }
procedure HugeWordAssignHugeIntAbs(var A: HugeWord; const B: HugeInt);
begin
  if B.Sign = 0 then
    HugeWordAssignZero(A)
  else
    HugeWordAssign(A, B.Value);
end;

procedure HugeWordAssignBuf(var A: HugeWord; const Buf; const BufSize: Integer;
          const ReverseByteOrder: Boolean);
var L, I : Integer;
    P, Q : PByte;
begin
  if BufSize <= 0 then
    HugeWordAssignZero(A)
  else
    begin
      L := (BufSize + HugeWordElementSize - 1) div HugeWordElementSize;
      HugeWordSetSize(A, L);
      P := @Buf;
      Q := A.Data; 
      if ReverseByteOrder then
        Inc(P, BufSize - 1);
      for I := 0 to BufSize - 1 do
        begin
          Q^ := P^;
          Inc(Q);
          if ReverseByteOrder then
            Dec(P)
          else
            Inc(P);
        end;
    end;
end;

procedure HugeWordAssignBufStr(var A: HugeWord; const Buf: AnsiString;
          const ReverseByteOrder: Boolean);
var L : Integer;
begin
  L := Length(Buf);
  if L = 0 then
    HugeWordAssignZero(A)
  else
    HugeWordAssignBuf(A, Buf[1], L, ReverseByteOrder);
end;

procedure HugeWordSwap(var A, B: HugeWord);
var C : HugeWord;
begin
  HugeWordInitHugeWord(C, A);      // C := A
  try
    HugeWordAssign(A, B);          // A := B
    HugeWordAssign(B, C);          // B := C
  finally
    HugeWordFinalise(C);
  end;
end;

{ HugeWord IsZero                                                              }
{   Pre:   A normalised                                                        }
{   Post:  Result is True if A is zero                                         }
function HugeWordIsZero(const A: HugeWord): Boolean;
begin
  Result := A.Used = 0;
end;

{ HugeWord IsOne                                                               }
{   Pre:   A normalised                                                        }
{   Post:  Result is True if A is one                                          }
function HugeWordIsOne(const A: HugeWord): Boolean;
begin
  if A.Used <> 1 then
    Result := False
  else
    Result := PLongWord(A.Data)^ = 1;
end;

{ HugeWord IsOdd                                                               }
{   Pre:   A normalised                                                        }
{   Post:  Result is True if A is odd                                          }
function HugeWordIsOdd(const A: HugeWord): Boolean;
begin
  if A.Used = 0 then
    Result := False
  else
    Result := PLongWord(A.Data)^ and 1 = 1;
end;

{ HugeWord IsEven                                                              }
{   Pre:   A normalised                                                        }
{   Post:  Result is True if A is even (zero is even)                          }
function HugeWordIsEven(const A: HugeWord): Boolean;
begin
  if A.Used = 0 then
    Result := True
  else
    Result := PLongWord(A.Data)^ and 1 = 0;
end;

{ HugeWord Word32 range checking                                               }
{   Pre:   A normalised                                                        }
{   Post:  Result is True if A is in 32-bit word range                         }
function HugeWordIsWord32Range(const A: HugeWord): Boolean;
begin
  Result := (A.Used <= 1);
end;

{ HugeWord Word64 range checking                                               }
{   Pre:   A normalised                                                        }
{   Post:  Result is True if A is in 64-bit word range                         }
function HugeWordIsWord64Range(const A: HugeWord): Boolean;
begin
  Result := (A.Used <= 2);
end;

{ HugeWord Word128 range checking                                              }
{   Pre:   A normalised                                                        }
{   Post:  Result is True if A is in 128-bit word range                        }
function HugeWordIsWord128Range(const A: HugeWord): Boolean;
begin
  Result := (A.Used <= 4);
end;

{ HugeWord Int32 range checking                                                }
{   Pre:   A normalised                                                        }
{   Post:  Result is True if A is in Int32 range                               }
function HugeWordIsInt32Range(const A: HugeWord): Boolean;
var L : Integer;
begin
  L := A.Used;
  if L = 0 then
    Result := True else
  if L >= 2 then
    Result := False
  else
    Result := PLongWord(A.Data)^ < $80000000;
end;

{ HugeWord Int64 range checking                                                }
{   Pre:   A normalised                                                        }
{   Post:  Result is True if A is in Int64 range                               }
function HugeWordIsInt64Range(const A: HugeWord): Boolean;
var L : Integer;
    P : PLongWord;
begin
  L := A.Used;
  if L <= 1 then
    Result := True else
  if L >= 3 then
    Result := False
  else
    begin
      P := A.Data;
      Inc(P);
      Result := P^ < $80000000;
    end;
end;

function HugeWordToWord32(const A: HugeWord): LongWord;
var L : Integer;
begin
  L := A.Used;
  {$IFOPT R+}
  if L > 1 then
    RaiseRangeError;
  {$ENDIF};
  if L = 0 then
    Result := 0
  else
    Result := PLongWord(A.Data)^;
end;

function HugeWordToInt32(const A: HugeWord): LongInt;
var L : Integer;
begin
  L := A.Used;
  {$IFOPT R+}
  if L > 1 then
    RaiseRangeError;
  if L > 0 then
    if PLongWord(A.Data)^ >= $80000000 then
      RaiseRangeError;
  {$ENDIF};
  if L = 0 then
    Result := 0
  else
    Result := PLongInt(A.Data)^;
end;

function HugeWordToInt64(const A: HugeWord): Int64;
var L : Integer;
    P : PLongWord;
begin
  L := A.Used;
  if L = 0 then
    begin
      Result := 0;
      exit;
    end;
  if L = 1 then
    begin
      Result := PLongWord(A.Data)^;
      exit;
    end;
  {$IFOPT R+}
  if L > 2 then
    RaiseRangeError;
  if L > 1 then
    begin
      P := A.Data;
      Inc(P);
      if P^ >= $80000000 then
        RaiseRangeError;
    end;
  {$ENDIF};
  P := A.Data;
  Int64Rec(Result).Lo := P^;
  Inc(P);
  Int64Rec(Result).Hi := P^;
end;

{ HugeWord equals Word                                                         }
{   Pre:   A normalised                                                        }
function HugeWordEqualsWord32(const A: HugeWord; const B: LongWord): Boolean;
var L : Integer;
begin
  L := A.Used;
  if L = 0 then
    Result := (B = 0) else
  if L = 1 then
    Result := (B = PLongWord(A.Data)^)
  else
    Result := False;
end;

{ HugeWord equals Int                                                          }
{   Pre:   A normalised                                                        }
function HugeWordEqualsInt32(const A: HugeWord; const B: LongInt): Boolean;
var L : Integer;
begin
  if B < 0 then
    Result := False
  else
    begin
      L := A.Used;
      if L = 0 then
        Result := (B = 0) else
      if L = 1 then
        Result := (PLongWord(A.Data)^ = LongWord(B))
      else
        Result := False;
    end;
end;

function HugeWordEqualsInt64(const A: HugeWord; const B: Int64): Boolean;
var L : Integer;
    P : PLongWord;
begin
  if B < 0 then
    Result := False
  else
    begin
      L := A.Used;
      if L = 0 then
        Result := (B = 0) else
      if L = 1 then
        Result := (PLongWord(A.Data)^ = B) else
      if L = 2 then
        begin
          P := A.Data;
          Result := P^ = Int64Rec(B).Lo;
          if not Result then
            exit;
          Inc(P);
          Result := P^ = Int64Rec(B).Hi;
        end
      else
        Result := False;
    end;
end;

{ HugeWord equals                                                              }
{   Pre:   A and B normalised                                                  }
function HugeWordEquals(const A, B: HugeWord): Boolean;
var L, M, I : Integer;
    P, Q : PLongWord;
begin
  L := A.Used;
  M := B.Used;
  if L <> M then
    begin
      Result := False;
      exit;
    end;
  P := A.Data;
  Q := B.Data;
  if P = Q then
    begin
      Result := True;
      exit;
    end;
  for I := 0 to L - 1 do
    if P^ <> Q^ then
      begin
        Result := False;
        exit;
      end
    else
      begin
        Inc(P);
        Inc(Q);
      end;
  Result := True;
end;

{ HugeWord Compare Word                                                        }
{   Pre:   A normalised                                                        }
{   Post:  Result is -1 if A < B, 1 if A > B or 0 if A = B                     }
function HugeWordCompareWord32(const A: HugeWord; const B: LongWord): Integer;
var L : Integer;
    F : LongWord;
begin
  L := A.Used;
  if L = 0 then
    begin
      if B = 0 then
        Result := 0
      else
        Result := -1;
      exit;
    end;
  if L > 1 then
    begin
      Result := 1;
      exit;
    end;
  F := PLongWord(A.Data)^;
  if F < B then
    Result := -1 else
  if F > B then
    Result := 1
  else
    Result := 0;
end;

{ HugeWord Compare Int                                                         }
{   Pre:   A normalised                                                        }
{   Post:  Result is -1 if A < B, 1 if A > B or 0 if A = B                     }
function HugeWordCompareInt32(const A: HugeWord; const B: LongInt): Integer;
var L : Integer;
    F : LongWord;
begin
  if B < 0 then
    begin
      Result := 1;
      exit;
    end;
  L := A.Used;
  if L = 0 then
    begin
      if B = 0 then
        Result := 0
      else
        Result := -1;
      exit;
    end;
  if L > 1 then
    begin
      Result := 1;
      exit;
    end;
  F := PLongWord(A.Data)^;
  if F < LongWord(B) then
    Result := -1 else
  if F > LongWord(B) then
    Result := 1
  else
    Result := 0;
end;

function HugeWordCompareInt64(const A: HugeWord; const B: Int64): Integer;
var L : Integer;
    F, G : LongWord;
    P : PLongWord;
begin
  if B < 0 then
    begin
      Result := 1;
      exit;
    end;
  L := A.Used;
  case L of
    0 : begin
          if B = 0 then
            Result := 0
          else
            Result := -1;
          exit;
        end;
    1 : if Int64Rec(B).Hi = 0 then
          begin
            F := PLongWord(A.Data)^;
            G := Int64Rec(B).Lo;
          end
        else
          begin
            Result := -1;
            exit;
          end;
    2 : begin
          P := A.Data;
          Inc(P);
          F := P^;
          G := Int64Rec(B).Hi;
          if F = G then
            begin
              F := PLongWord(A.Data)^;
              G := Int64Rec(B).Lo;
            end;
        end;
  else
    begin
      Result := 1;
      exit;
    end;
  end;
  if F < G then
    Result := -1 else
  if F > G then
    Result := 1
  else
    Result := 0;
end;

{ HugeWord Compare                                                             }
{   Pre:   A and B normalised                                                  }
{   Post:  Result is -1 if A < B, 1 if A > B or 0 if A = B                     }
function HugeWordCompare(const A, B: HugeWord): Integer;
var I, L, M : Integer;
    F, G    : LongWord;
    P, Q    : PLongWord;
begin
  L := A.Used;
  M := B.Used;
  if L > M then
    Result := 1 else
  if L < M then
    Result := -1
  else
    begin
      P := A.Data;
      Q := B.Data;
      if P = Q then
        begin
          Result := 0;
          exit;
        end;
      Inc(P, L);
      Inc(Q, L);
      for I := L - 1 downto 0 do
        begin
          Dec(P);
          Dec(Q);
          F := P^;
          G := Q^;
          if F <> G then
            begin
              if F < G then
                Result := -1
              else
                Result := 1;
              exit;
            end;
        end;
      Result := 0;
    end;
end;

{ HugeWord Min/Max                                                             }
{   Post:  A is minimum/maximum of A and B.                                    }
procedure HugeWordMin(var A: HugeWord; const B: HugeWord);
begin
  if HugeWordCompare(A, B) <= 0 then
    exit;
  HugeWordAssign(A, B);
end;

procedure HugeWordMax(var A: HugeWord; const B: HugeWord);
begin
  if HugeWordCompare(A, B) >= 0 then
    exit;
  HugeWordAssign(A, B);
end;

function HugeWordGetBitCount(const A: HugeWord): Integer;
begin
  Result := HugeWordGetSize(A) * HugeWordElementBits;
end;

{ HugeWord SetBits                                                             }
{   Sets the number of bits in the HugeWord.                                   }
{   Pre:   Bits must be multiple of 32.                                        }
{   Post:  A NOT normalised.                                                   }
procedure HugeWordSetBitCount(var A: HugeWord; const Bits: Integer);
begin
  if Bits mod HugeWordElementBits <> 0 then
    RaiseInvalidOpError;
  HugeWordSetSize(A, Bits div HugeWordElementBits);
end;

{ HugeWord Bit State                                                           }
{   Pre:   B is bit index (0 based)                                            }
function HugeWordIsBitSet(const A: HugeWord; const B: Integer): Boolean;
var L : Integer;
    P : PLongWord;
begin
  L := A.Used;
  if (B < 0) or (B >= L * 32) then
    Result := False
  else
    begin
      P := A.Data;
      Inc(P, B shr 5);
      Result := (P^ and LongWord(1 shl (B and $1F)) <> 0);
    end;
end;

procedure HugeWordSetBit(var A: HugeWord; const B: Integer);
var I, L : Integer;
    P : PLongWord;
begin
  L := A.Used;
  if B < 0 then
    exit;
  I := B shr 5;
  if I >= L then
    HugeWordSetSize(A, I + 1);
  P := A.Data;
  Inc(P, I);
  P^ := P^ or LongWord(1 shl (B and $1F));
end;

procedure HugeWordClearBit(var A: HugeWord; const B: Integer);
var I, L : Integer;
    P : PLongWord;
begin
  L := A.Used;
  if (B < 0) or (B >= L * 32) then
    exit;
  I := B shr 5;
  P := A.Data;
  Inc(P, I);
  P^ := P^ and not LongWord(1 shl (B and $1F));
end;

procedure HugeWordToggleBit(var A: HugeWord; const B: Integer);
var I, L : Integer;
    P : PLongWord;
begin
  L := A.Used;
  if B < 0 then
    exit;
  I := B shr 5;
  if I >= L then
    HugeWordSetSize(A, I + 1);
  P := A.Data;
  Inc(P, I);
  P^ := P^ xor LongWord(1 shl (B and $1F));
end;

{ HugeWord Bit Scan                                                            }
{   Post:  Returns index of bit in A, or -1 if none found                      }
function HugeWordSetBitScanForward(const A: HugeWord): Integer;
var B : Integer;
    P : PLongWord;
begin
  for B := 0 to A.Used * 32 - 1 do
    begin
      P := A.Data;
      Inc(P, B shr 5); // P = A[B shr 5]
      if P^ and (1 shl (B and $1F)) <> 0 then
        begin
          Result := B;
          exit;
        end;
    end;
  Result := -1;
end;

function HugeWordSetBitScanReverse(const A: HugeWord): Integer;
var B : Integer;
    P : PLongWord;
begin
  for B := A.Used * 32 - 1 downto 0 do
    begin
      P := A.Data;
      Inc(P, B shr 5); // P = A[B shr 5]
      if P^ and (1 shl (B and $1F)) <> 0 then
        begin
          Result := B;
          exit;
        end;
    end;
  Result := -1;
end;

function HugeWordClearBitScanForward(const A: HugeWord): Integer;
var B : Integer;
    P : PLongWord;
begin
  for B := 0 to A.Used * 32 - 1 do
    begin
      P := A.Data;
      Inc(P, B shr 5); // P = A[B shr 5]
      if P^ and (1 shl (B and $1F)) = 0 then
        begin
          Result := B;
          exit;
        end;
    end;
  Result := -1;
end;

function HugeWordClearBitScanReverse(const A: HugeWord): Integer;
var B : Integer;
    P : PLongWord;
begin
  for B := A.Used * 32 - 1 downto 0 do
    begin
      P := A.Data;
      Inc(P, B shr 5); // P = A[B shr 5]
      if P^ and (1 shl (B and $1F)) = 0 then
        begin
          Result := B;
          exit;
        end;
    end;
  Result := -1;
end;

{ HugeWord Bit Shift                                                           }
{   Post: A not normalised                                                     }
{         A's size expanded if required to accommodate result                  }
{         A's size may be reduced                                              }
procedure HugeWordShl(var A: HugeWord; const B: Integer);
var E, I, L, N : Integer;
    C, D       : Byte;
    P, Q, T    : PLongWord;
    F          : LongWord;
begin
  if B = 0 then
    exit;
  if B < 0 then
    begin
      HugeWordShr(A, -B);
      exit;
    end;
  L := A.Used;
  if L = 0 then
    exit;
  E := B div 32; // number of new full LongWords
  D := B mod 32; // number of new remaining bits
  N := E;
  // check if high bits require additional LongWord
  // expand size of A if required 
  if D > 0 then
    begin
      P := A.Data;
      Inc(P, L - 1);
      F := P^ shr (32 - D);
      if F <> 0 then
        Inc(N);
      if N > 0 then
        HugeWordSetSize(A, L + N);
      if F <> 0 then
        begin
          P := A.Data;
          Inc(P, L + N - 1);
          P^ := F;
        end;
    end else
    if N > 0 then
      HugeWordSetSize(A, L + N);
  // shift A
  C := 32 - D;
  P := A.Data;
  Inc(P, L + E - 1); // P = A[L + E - 1]
  for I := L + E - 1 downto E + 1 do
    begin
      Q := A.Data;
      Inc(Q, I - E); // Q = A[I - E]
      T := Q;
      Dec(T);        // T = A[I - E - 1]
      P^ := (Q^ shl D) or (T^ shr C);
      Dec(P);
    end;
  P^ := PLongWord(A.Data)^ shl D; // A[E] := A[0] shl D
  Dec(P);
  for I := E - 1 downto 0 do
    begin
      P^ := 0; // A[I] := 0
      Dec(P);
    end;
end;

procedure HugeWordShl1(var A: HugeWord);
var I, L : Integer;
    P, Q : PLongWord;
begin
  L := A.Used;
  if L = 0 then
    exit;
  P := A.Data;
  Inc(P, L - 1);
  if P^ and $80000000 <> 0 then // A[L - 1] high bit set
    begin
      HugeWordSetSize(A, L + 1);
      P := A.Data;
      Inc(P, L);
      P^ := 1; // A[L] := 1
      Dec(P);
    end;
  Q := P;
  Dec(Q);
  for I := L - 1 downto 1 do
    begin
      P^ := (P^ shl 1) or (Q^ shr 31); // A[I] := (A[I] shl 1) or (A[I - 1] shr 31)
      Dec(P);
      Dec(Q);
    end;
  P^ := P^ shl 1; // A[0] := A[0] shl 1
end;

procedure HugeWordShr(var A: HugeWord; const B: Integer);
var E, I, L : Integer;
    C, D    : Byte;
    P, Q, T : PLongWord;
    F       : LongWord;
begin
  if B = 0 then
    exit;
  if B < 0 then
    begin
      HugeWordShl(A, -B);
      exit;
    end;
  L := A.Used;
  if L = 0 then
    exit;
  if B >= L * 32 then
    begin
      HugeWordAssignZero(A);
      exit;
    end;
  E := B div 32;
  D := B mod 32;
  C := 32 - D;
  P := A.Data; // P = A[0]
  Q := P;
  Inc(Q, E);   // Q = A[E]
  T := Q;
  Inc(T);      // T = A[E + 1]
  for I := 0 to L - E - 2 do
    begin
      // A[I] := (A[I + E] shr D) or (A[I + E + 1] shl C)
      F := (Q^ shr D);
      if C < 32 then // note: T^ shl 32 evaluates to T^ and not 0
        F := F or (T^ shl C);
      P^ := F;
      Inc(P);
      Inc(Q);
      Inc(T);
    end;
  Q := A.Data;
  Inc(Q, L - 1); // Q = A[L - 1]
  P^ := Q^ shr D; // A[L - E - 1] := A[L - 1] shr D
  for I := L - E to L - 1 do
    begin
      Inc(P);
      P^ := 0; // A[I] := 0
    end;
end;

procedure HugeWordShr1(var A: HugeWord);
var I, L : Integer;
    P, Q : PLongWord;
begin
  L := A.Used;
  if L = 0 then
    exit;
  P := A.Data; // P := A[0]
  Q := P;
  Inc(Q);      // Q := A[1]
  for I := 0 to L - 2 do
    begin
      P^ := (P^ shr 1) or (Q^ shl 31); // A[I] := (A[I] shr 1) or (A[I + 1] shl 31)
      Inc(P);
      Inc(Q);
    end;
  P^ := P^ shr 1; // A[L - 1] := A[L - 1] shr 1
end;

{ HugeWord Logical NOT                                                         }
{   Pre:   Any A                                                               }
{   Post:  A's length unchanged                                                }
{          A not normalised                                                    }
procedure HugeWordNot(var A: HugeWord);
var I, L : Integer;
    P : PLongWord;
begin
  L := A.Used;
  if L = 0 then
    exit;
  P := A.Data;
  for I := 0 to L - 1 do
    begin
      P^ := not P^;
      Inc(P);
    end;
end;

{ HugeWord Logical OR                                                          }
{   Pre:   Any A and B                                                         }
{   Post:  A as large as largest of A and B                                    }
{          A normalised if A and B was normalised                              }
procedure HugeWordOrHugeWord(var A: HugeWord; const B: HugeWord);
var I, L, M, N : Integer;
    P, Q : PLongWord;
begin
  L := A.Used;
  if L = 0 then
    begin
      HugeWordAssign(A, B);
      exit;
    end;
  M := B.Used;
  if M = 0 then
    exit;
  if L > M then
    N := L
  else
    N := M;
  if L < N then
    HugeWordSetSize(A, N);
  P := A.Data;
  Q := B.Data;
  for I := 0 to M - 1 do
    begin
      P^ := P^ or Q^;
      Inc(P);
      Inc(Q);
    end;
end;

{ HugeWord Logical AND                                                         }
{   Pre:   Any A and B                                                         }
{   Post:  A as large as smallest of A and B                                   }
{          A not normalised.                                                   }
procedure HugeWordAndHugeWord(var A: HugeWord; const B: HugeWord);
var I, L, M, N : Integer;
    P, Q : PLongWord;
begin
  L := A.Used;
  if L = 0 then
    exit;
  M := B.Used;
  if M = 0 then
    begin
      HugeWordAssignZero(A);
      exit;
    end;
  if L < M then
    N := L
  else
    N := M;
  HugeWordSetSize(A, N);
  P := A.Data;
  Q := B.Data;
  for I := 0 to M - 1 do
    begin
      P^ := P^ and Q^;
      Inc(P);
      Inc(Q);
    end;
end;

{ HugeWord Logical XOR                                                         }
{   Pre:   Any A and B                                                         }
{   Post:  A as large as largest of A and B                                    }
{          A not normalised.                                                   }
procedure HugeWordXorHugeWord(var A: HugeWord; const B: HugeWord);
var I, L, M, N : Integer;
    P, Q : PLongWord;
begin
  L := A.Used;
  if L = 0 then
    begin
      HugeWordAssign(A, B);
      exit;
    end;
  M := B.Used;
  if M = 0 then
    exit;
  if L > M then
    N := L
  else
    N := M;
  if L < N then
    HugeWordSetSize(A, N);
  P := A.Data;
  Q := B.Data;
  for I := 0 to M - 1 do
    begin
      P^ := P^ xor Q^;
      Inc(P);
      Inc(Q);
    end;
end;

{ HugeWord Add Word                                                            }
{   Pre:   A normalised                                                        }
{   Post:  A contains result of A + B                                          }
{          A normalised                                                        }
procedure HugeWordAddWord32(var A: HugeWord; const B: LongWord);
var L, I : Integer;
    R    : Int64;
    C    : LongWord;
    P    : PLongWord;
begin
  if B = 0 then
    exit;
  L := A.Used;
  if L = 0 then
    begin
      HugeWordAssignWord32(A, B);
      exit;
    end;
  P := A.Data;
  C := B;
  for I := 0 to L - 1 do
    begin
      R := C;
      Inc(R, P^);
      P^ := Int64Rec(R).Lo;
      C := Int64Rec(R).Hi;
      if C = 0 then
        exit;
      Inc(P);
    end;
  HugeWordSetSize(A, L + 1);
  P := A.Data;
  Inc(P, L);
  P^ := C;
end;

{ HugeWord Add                                                                 }
{   Pre:   A and B normalised                                                  }
{   Post:  A contains result of A + B                                          }
{          A normalised                                                        }
{$IFDEF ASM386_DELPHI}
function HugeBufAddHugeBuf_Asm(const A, B: PLongWord; const L: Integer): LongWord; register; assembler;
asm
  push esi
  push edi
  xor edi, edi
  or ecx, ecx
  jz @Fin
@Loop:
  mov esi, edi
  xor edi, edi
  add esi, [eax]
  adc esi, [edx]
  adc edi, 0
  mov [eax], esi
  add eax, 4
  add edx, 4
  dec ecx
  jnz @Loop
@Fin:
  mov eax, edi
  pop edi
  pop esi
  ret
end;

function HugeBufAddCarry_Asm(const A: PLongWord; const C: LongWord; const L: Integer): LongWord; register; assembler;
asm
  push esi
  push edi
  mov edi, edx
  or edi, edi
  jz @Fin
  or ecx, ecx
  jz @Fin
@Loop:
  mov esi, 1
  add esi, [eax]
  mov [eax], esi
  jnc @Fin0
  add eax, 4
  dec ecx
  jnz @Loop
@Fin0:
  xor edi, edi
@Fin:
  mov eax, edi
  pop edi
  pop esi
  ret
end;

procedure HugeWordAdd(var A: HugeWord; const B: HugeWord);
var L, M : Integer;
    C    : LongWord;
    P, Q : PLongWord;
begin
  M := B.Used;
  if M = 0 then
    exit;
  L := A.Used;
  if L = 0 then
    begin
      HugeWordAssign(A, B);
      exit;
    end;
  if L < M then
    begin
      HugeWordSetSize(A, M);
      L := M;
    end;
  P := A.Data;
  Q := B.Data;
  C := HugeBufAddHugeBuf_Asm(P, Q, M);
  if C = 0 then
    exit;
  Inc(P, M);
  C := HugeBufAddCarry_Asm(P, C, L - M);
  if C = 0 then
    exit;
  HugeWordSetSize(A, L + 1);
  P := A.Data;
  Inc(P, L);
  P^ := C;
end;
{$ELSE}
procedure HugeWordAdd(var A: HugeWord; const B: HugeWord);
var L, M : Integer;
    I    : Integer;
    R    : Int64;
    C    : LongWord;
    P, Q : PLongWord;
begin
  M := B.Used;
  if M = 0 then
    exit;
  L := A.Used;
  if L = 0 then
    begin
      HugeWordAssign(A, B);
      exit;
    end;
  if L < M then
    begin
      HugeWordSetSize(A, M);
      L := M;
    end;
  P := A.Data;
  Q := B.Data;
  C := 0;
  for I := 0 to M - 1 do
    begin
      R := C;
      Inc(R, P^);
      Inc(R, Q^);
      P^ := Int64Rec(R).Lo;
      C := Int64Rec(R).Hi;
      Inc(P);
      Inc(Q);
    end;
  if C = 0 then
    exit;
  for I := M to L - 1 do
    begin
      R := C;
      Inc(R, P^);
      P^ := Int64Rec(R).Lo;
      C := Int64Rec(R).Hi;
      if C = 0 then
        exit;
      Inc(P);
    end;
  HugeWordSetSize(A, L + 1);
  P := A.Data;
  Inc(P, L);
  P^ := C;
end;
{$ENDIF}

procedure HugeWordInc(var A: HugeWord);
begin
  HugeWordAddWord32(A, 1);
end;

{ HugeWord Subtract Word                                                       }
{   Pre:   A normalised                                                        }
{   Post:  A contains result of A - B                                          }
{          A normalised                                                        }
{          Result is sign of A (-1 or +1) or 0 if A is zero                    }
function HugeWordSubtractWord32(var A: HugeWord; const B: LongWord): Integer;
var C    : Integer;
    L, I : Integer;
    R    : Int64;
    P    : PLongWord;
begin
  L := A.Used;
  // Handle A = 0 or B = 0
  if L = 0 then
    begin
      if B = 0 then
        begin
          Result := 0;
          exit;
        end;
      HugeWordAssignWord32(A, B);
      Result := -1;
      exit;
    end;
  if B = 0 then
    begin
      Result := 1;
      exit;
    end;
  // Handle A = B
  C := HugeWordCompareWord32(A, B);
  if C = 0 then
    begin
      HugeWordAssignZero(A);
      Result := 0;
      exit;
    end;
  // Handle A < B
  if C < 0 then
    begin
      HugeWordAssignWord32(A, B - PLongWord(A.Data)^);
      Result := -1;
      exit;
    end;
  // Handle A > B
  // Subtract
  P := A.Data;
  for I := 0 to L - 1 do
    begin
      if I = 0 then
        begin
          R := $100000000;
          Dec(R, B);
        end
      else
        R := $FFFFFFFF;
      Inc(R, P^);
      P^ := Int64Rec(R).Lo;
      if Int64Rec(R).Hi > 0 then
        break;
      Inc(P);
    end;
  // Normalise
  HugeWordNormalise(A);
  // Return sign
  if HugeWordIsZero(A) then
    Result := 0
  else
    Result := 1;
end;

{ HugeWord Subtract                                                            }
{   Pre:   A and B normalised                                                  }
{   Post:  A contains result of A - B                                          }
{          A normalised                                                        }
{          Result is sign of A (-1 or +1) or 0 if A is zero                    }
function HugeWordSubtract_Asm1(const A, B, R: PLongWord; const L: LongWord): Boolean; assembler;
asm
  push esi
  push edi
  push ebx
  push ecx

  mov esi, A
  mov ebx, B
  mov edi, R
  mov ecx, L

  or ecx, ecx
  jz @Fin0
  xor edx, edx

@loop1:
  mov eax, [esi]
  sub eax, [ebx]
  mov dh, 0
  sbb dh, 0
  or dl, dl
  jz @save
  stc
  sbb eax, 0

@save:
  mov [edi], eax
  mov dl, dh

  add esi, 4
  add ebx, 4
  add edi, 4

  dec ecx
  jnz @loop1

  or edx, edx
  jz @Fin0
  mov al, 1
  jmp @Fin
@Fin0:
  mov al, 0
@Fin:
  pop ecx
  pop ebx
  pop edi
  pop esi
end;

function HugeWordSubtract_Asm(var A: HugeWord; const B: HugeWord): Integer;
var C       : Integer;
    D, E    : PHugeWord;
    L, M    : Integer;
    R       : Int64;
    I, J    : Integer;
    F       : Boolean;
    P, Q, Z : PLongWord;
begin
  // Handle A = 0 or B = 0
  if HugeWordIsZero(A) then
    begin
      if HugeWordIsZero(B) then
        begin
          Result := 0;
          exit;
        end;
      HugeWordAssign(A, B);
      Result := -1;
      exit;
    end;
  if HugeWordIsZero(B) then
    begin
      Result := 1;
      exit;
    end;
  // Handle A = B
  C := HugeWordCompare(A, B);
  if C = 0 then
    begin
      HugeWordAssignZero(A);
      Result := 0;
      exit;
    end;
  // Swap around if A < B
  if C > 0 then
    begin
      D := @A;
      E := @B;
    end
  else
    begin
      HugeWordSetSize(A, B.Used);
      D := @B;
      E := @A;
    end;
  // Subtract
  P := D^.Data;
  Q := E^.Data;
  Z := A.Data;
  L := D^.Used;
  M := E^.Used;
  F := HugeWordSubtract_Asm1(P, Q, Z, M);
  Inc(P, M);
  Inc(Z, M);
  if F then
    for I := M to L - 1 do
      begin
        R := $FFFFFFFF;
        Inc(R, P^);
        Z^ := Int64Rec(R).Lo;
        if Int64Rec(R).Hi > 0 then
          begin
            if P <> Z then
              begin
                Inc(P);
                Inc(Z);
                for J := I + 1 to L - 1 do
                  begin
                    Z^ := P^;
                    Inc(P);
                    Inc(Z);
                  end;
              end;
            break;
          end;
        Inc(P);
        Inc(Z);
      end;
  // Normalise
  HugeWordNormalise(A);
  // Return sign
  if HugeWordIsZero(A) then
    Result := 0 else
  if C > 0 then
    Result := 1
  else
    Result := -1;
end;

function HugeWordSubtract(var A: HugeWord; const B: HugeWord): Integer;
var C       : Integer;
    D, E    : PHugeWord;
    L, M    : Integer;
    R       : Int64;
    I       : Integer;
    F       : Boolean;
    P, Q, Z : PLongWord;
begin
  // Handle A = 0 or B = 0
  if HugeWordIsZero(A) then
    begin
      if HugeWordIsZero(B) then
        begin
          Result := 0;
          exit;
        end;
      HugeWordAssign(A, B);
      Result := -1;
      exit;
    end;
  if HugeWordIsZero(B) then
    begin
      Result := 1;
      exit;
    end;
  // Handle A = B
  C := HugeWordCompare(A, B);
  if C = 0 then
    begin
      HugeWordAssignZero(A);
      Result := 0;
      exit;
    end;
  // Swap around if A < B
  if C > 0 then
    begin
      D := @A;
      E := @B;
    end
  else
    begin
      HugeWordSetSize(A, B.Used);
      D := @B;
      E := @A;
    end;
  // Subtract
  P := D^.Data;
  Q := E^.Data;
  Z := A.Data;
  L := D^.Used;
  M := E^.Used;
  F := False;
  for I := 0 to M - 1 do
    begin
      if F then
        R := $FFFFFFFF
      else
        R := $100000000;
      Inc(R, P^);
      Dec(R, Q^);
      Z^ := Int64Rec(R).Lo;
      F := Int64Rec(R).Hi = 0;
      Inc(P);
      Inc(Q);
      Inc(Z);
    end;
  if F then
    for I := M to L - 1 do
      begin
        R := $FFFFFFFF;
        Inc(R, P^);
        Z^ := Int64Rec(R).Lo;
        if Int64Rec(R).Hi > 0 then
          break;
        Inc(P);
        Inc(Z);
      end;
  // Normalise
  HugeWordNormalise(A);
  // Return sign
  if HugeWordIsZero(A) then
    Result := 0 else
  if C > 0 then
    Result := 1
  else
    Result := -1;
end;

procedure HugeWordDec(var A: HugeWord);
begin
  {$IFOPT R+}
  if HugeWordIsZero(A) then
    RaiseRangeError;
  {$ENDIF}
  HugeWordSubtractWord32(A, 1);
end;

{ HugeWord Multiply Word                                                       }
{   Pre:   A and B normalised                                                  }
{   Post:  Result contains A * B                                               }
{          Result NOT normalised. Result has size of Length(A) + Length(B)     }
procedure HugeWordMultiplyWord8(var A: HugeWord; const B: Byte);
var I, L : Integer;
    C    : Int64;
    P    : PLongWord;
begin
  L := A.Used;
  if L = 0 then
    exit;
  if B = 0 then
    begin
      HugeWordAssignZero(A);
      exit;
    end;
  if B = 1 then
    exit;
  P := A.Data;
  C := Int64(P^) * B;
  P^ := Int64Rec(C).Lo;
  for I := 1 to L - 1 do
    begin
      Inc(P);
      C := C shr 32;
      C := C + (Int64(P^) * B);
      P^ := Int64Rec(C).Lo;
    end;
  C := C shr 32;
  if C > 0 then
    begin
      HugeWordSetSize(A, L + 1);
      P := A.Data;
      Inc(P, L);
      P^ := Int64Rec(C).Lo;
    end;
end;

procedure HugeWordMultiplyWord16(var A: HugeWord; const B: Word);
var I, L : Integer;
    C    : Int64;
    P    : PLongWord;
begin
  L := A.Used;
  if L = 0 then
    exit;
  if B = 0 then
    begin
      HugeWordAssignZero(A);
      exit;
    end;
  if B = 1 then
    exit;
  P := A.Data;
  C := Int64(P^) * B;
  P^ := Int64Rec(C).Lo;
  for I := 1 to L - 1 do
    begin
      Inc(P);
      C := C shr 32;
      C := C + (Int64(P^) * B);
      P^ := Int64Rec(C).Lo;
    end;
  C := C shr 32;
  if C > 0 then
    begin
      HugeWordSetSize(A, L + 1);
      P := A.Data;
      Inc(P, L);
      P^ := Int64Rec(C).Lo;
    end;
end;

procedure HugeWordMultiplyWord32(var A: HugeWord; const B: LongWord);
var F : HugeWord;
begin
  HugeWordInitWord32(F, B);
  HugeWordMultiply(A, A, F);
  HugeWordFinalise(F);
end;

{ HugeWord Long Multiplication                                                 }
{   Multiply using the 'long multiplication' method. Time is o(n^2).           }
{   Pre:   Res initialised, A and B normalised                                 }
{   Post:  Res contains A * B                                                  }
{          Res NOT normalised. Res has size of Size(A) + Size(B)               }
procedure HugeWordMultiply_Long_NN(var Res: HugeWord; const A, B: HugeWord);
var L, M : Integer;
    I, J : Integer;
    C    : LongWord;
    R, V : Int64;
    P, Q : PLongWord;
    F    : PLongWord;
    T    : HugeWord;
begin
  // handle zero
  L := A.Used;
  M := B.Used;
  if (L = 0) or (M = 0) then
    begin
      HugeWordAssignZero(Res);
      exit;
    end;
  // multiply
  HugeWordInit(T);
  try
    HugeWordSetSize(T, L + M);
    Q := B.Data;
    for I := 0 to M - 1 do
      begin
        V := Q^; // V = B[I]
        C := 0;
        P := A.Data;
        F := T.Data;
        Inc(F, I);
        for J := 0 to L - 1 do
          begin
            R := C;
            Inc(R, F^);            // Inc(R, Result[I + J])
            {$IFDEF FREEPASCAL}
            R := R + (V * P^);
            {$ELSE}
            Inc(R, V * P^);        // Inc(R, V * A[J])
            {$ENDIF}
            F^ := Int64Rec(R).Lo;
            C := Int64Rec(R).Hi;
            Inc(P);
            Inc(F);
          end;
        F^ := C;
        Inc(Q);
      end;
    HugeWordAssign(Res, T);
  finally
    HugeWordFinalise(T);
  end;
end;

procedure HugeWordMultiply_Long_NN_Unsafe(var Res: HugeWord; const A, B: HugeWord);
var L, M : Integer;
    I, J : Integer;
    C    : LongWord;
    R, V : Int64;
    P, Q : PLongWord;
    F    : PLongWord;
begin
  // handle zero
  L := A.Used;
  M := B.Used;
  if (L = 0) or (M = 0) then
    begin
      HugeWordAssignZero(Res);
      exit;
    end;
  // multiply
  HugeWordAssignZero(Res);
  HugeWordSetSize(Res, L + M);
  Q := B.Data;
  for I := 0 to M - 1 do
    begin
      V := Q^; // V = B[I]
      C := 0;
      P := A.Data;
      F := Res.Data;
      Inc(F, I);
      for J := 0 to L - 1 do
        begin
          R := C;
          Inc(R, F^);            // Inc(R, Result[I + J])
          {$IFDEF FREEPASCAL}
          R := R + (V * P^);
          {$ELSE}
          Inc(R, V * P^);        // Inc(R, V * A[J])
          {$ENDIF}
          F^ := Int64Rec(R).Lo;
          C := Int64Rec(R).Hi;
          Inc(P);
          Inc(F);
        end;
      F^ := C;
      Inc(Q);
    end;
end;

procedure HugeWordMultiply_Long(var Res: HugeWord; const A, B: HugeWord);
begin
  HugeWordMultiply_Long_NN(Res, A, B);
  HugeWordNormalise(Res);
end;

{ HugeWord Shift-Add Multiplication                                            }
{   Multiply using the 'shift-add' method:                                     }
{     + Set the Result to 0                                                    }
{     + For each bit of the Multiplier (from right to left) do                 }
{     +   If the bit is 1 then add the Multiplicand to the Result              }
{     +   Shift the Multiplicand left one bit                                  }
{   Pre:   Res initialised, A and B normalised                                 }
{          Res may be same instance as A or B                                  }
{   Post:  Res contains A * B                                                  }
{          Res normalised.                                                     }
procedure HugeWordMultiply_ShiftAdd(var Res: HugeWord; const A, B: HugeWord);
var L, M, C, I : Integer;
    D, R : HugeWord;
begin
  // handle zero
  L := A.Used;
  M := B.Used;
  if (L = 0) or (M = 0) then
    begin
      HugeWordAssignZero(Res);
      exit;
    end;
  // multiply
  HugeWordInitZero(R);
  HugeWordInitHugeWord(D, B);
  try
    C := HugeWordSetBitScanReverse(A);
    for I := 0 to C do
      begin
        if HugeWordIsBitSet(A, I) then
          HugeWordAdd(R, D);
        HugeWordShl1(D);
      end;
    HugeWordAssign(Res, R);
  finally
    HugeWordFinalise(D);
    HugeWordFinalise(R);
  end;
end;

{ HugeWord Multiplication                                                      }
{   Pre:   A, B normalised                                                     }
{          Res initialised                                                     }
{   Post:  Res contains A * B                                                  }
{          Res normalised                                                      }
{.DEFINE HugeInt_AlwaysMultiplyLong}
{.DEFINE HugeInt_AlwaysMultiplyShiftAdd}
procedure HugeWordMultiply(var Res: HugeWord; const A, B: HugeWord);
begin
  {$IFDEF HugeInt_AlwaysMultiplyLong}
  HugeWordMultiply_Long(Res, A, B);
  {$ELSE}{$IFDEF HugeInt_AlwaysMultiplyShiftAdd}
  HugeWordMultiply_ShiftAdd(Res, A, B);
  {$ELSE}
  HugeWordMultiply_Long(Res, A, B);
  {$ENDIF}{$ENDIF}
end;

{ HugeWord Sqr                                                                 }
{   Pre:   Res initialised, A normalised                                       }
{   Post:  Res contains A * A                                                  }
{          Res normalised                                                      }
procedure HugeWordSqr(var Res: HugeWord; const A: HugeWord);
begin
  HugeWordMultiply(Res, A, A);
end;

{ HugeWord Divide                                                              }
procedure HugeWordDivideWord32(const A: HugeWord; const B: LongWord; var Q: HugeWord; out R: LongWord);
var C, T : HugeWord;
begin
  HugeWordInitWord32(C, B);
  HugeWordInit(T);
  try
    HugeWordDivide(A, C, Q, T);
    R := HugeWordToWord32(T);
  finally
    HugeWordFinalise(T);
    HugeWordFinalise(C);
  end;
end;

{ HugeWord Divide                                                              }
{   Divide using the "restoring radix two division" method.                    }
procedure HugeWordDivide_RR(const A, B: HugeWord; var Q, R: HugeWord);
var C, F : Integer;
    D, E : HugeWord;
begin
  // Handle special cases
  if HugeWordIsZero(B) then // B = 0
    RaiseDivByZeroError else
  if HugeWordIsOne(B) then  // B = 1
    begin
      HugeWordAssign(Q, A);         // Q = A
      HugeWordAssignZero(R);        // R = 0
      exit;
    end;
  if HugeWordIsZero(A) then // A = 0
    begin
      HugeWordAssignZero(Q);        // Q = 0
      HugeWordAssignZero(R);        // R = 0
      exit;
    end;
  C := HugeWordCompare(A, B);
  if C < 0 then             // A < B
    begin
      HugeWordAssign(R, A);         // R = A
      HugeWordAssignZero(Q);        // Q = 0
      exit;
    end else
  if C = 0 then             // A = B
    begin
      HugeWordAssignOne(Q);         // Q = 1
      HugeWordAssignZero(R);        // R = 0
      exit;
    end;
  // Divide using "restoring radix two division"
  HugeWordInitHugeWord(D, A);       // D = A
  HugeWordInitHugeWord(E, B);       // E = B
  try
    HugeWordAssignZero(R);             // R = remainder
    HugeWordAssignZero(Q);             // Q = quotient
    F := HugeWordSetBitScanReverse(D); // F = high bit index in dividend
    for C := 0 to F do
      begin
        // Shift high bit of dividend D into low bit of remainder R
        HugeWordShl1(R);
        if HugeWordIsBitSet(D, F - C) then
          HugeWordSetBit(R, 0);
        // Shift quotient
        HugeWordShl1(Q);
        // Subtract divisor from remainder if large enough
        if HugeWordCompare(R, E) >= 0 then
          begin
            HugeWordSubtract(R, E);
            // Set result bit in quotient
            HugeWordSetBit(Q, 0);
          end;
      end;
  finally
    HugeWordFinalise(E);
    HugeWordFinalise(D);
  end;
end;

procedure HugeWordDivide_RR_Unsafe(const A, B: HugeWord; var Q, R: HugeWord);
var C, F : Integer;
begin
  // Handle special cases
  if HugeWordIsZero(B) then // B = 0
    RaiseDivByZeroError else
  if HugeWordIsOne(B) then  // B = 1
    begin
      HugeWordAssign(Q, A);         // Q = A
      HugeWordAssignZero(R);        // R = 0
      exit;
    end;
  if HugeWordIsZero(A) then // A = 0
    begin
      HugeWordAssignZero(Q);        // Q = 0
      HugeWordAssignZero(R);        // R = 0
      exit;
    end;
  C := HugeWordCompare(A, B);
  if C < 0 then             // A < B
    begin
      HugeWordAssign(R, A);         // R = A
      HugeWordAssignZero(Q);        // Q = 0
      exit;
    end else
  if C = 0 then             // A = B
    begin
      HugeWordAssignOne(Q);         // Q = 1
      HugeWordAssignZero(R);        // R = 0
      exit;
    end;
  // Divide using "restoring radix two division"
  HugeWordAssignZero(R);             // R = remainder
  HugeWordAssignZero(Q);             // Q = quotient
  F := HugeWordSetBitScanReverse(A); // F = high bit index in dividend
  for C := 0 to F do
    begin
      // Shift high bit of dividend D into low bit of remainder R
      HugeWordShl1(R);
      if HugeWordIsBitSet(A, F - C) then
        HugeWordSetBit(R, 0);
      // Shift quotient
      HugeWordShl1(Q);
      // Subtract divisor from remainder if large enough
      if HugeWordCompare(R, B) >= 0 then
        begin
          HugeWordSubtract(R, B);
          // Set result bit in quotient
          HugeWordSetBit(Q, 0);
        end;
    end;
end;

{ HugeWord Divide                                                              }
{   Pre:   Q, R initialised, A, B normalised                                   }
{   Post:  Q is Quotient                                                       }
{          R is Remainder                                                      }
{          Q and R normalised                                                  }
procedure HugeWordDivide(const A, B: HugeWord; var Q, R: HugeWord);
begin
  HugeWordDivide_RR(A, B, Q, R);
end;

{ HugeWord Mod                                                                 }
{   Pre:  A and B normalised, R initialised                                    }
{         Length(A) >= Length(B)                                               }
{   Post: R is Remainder when A is divided by B                                }
{         R normalised                                                         }
procedure HugeWordMod(const A, B: HugeWord; var R: HugeWord);
var Q : HugeWord;
begin
  HugeWordInit(Q);
  try
    HugeWordDivide(A, B, Q, R);
  finally
    HugeWordFinalise(Q);
  end;
end;

{ HugeWord GCD                                                                 }
{   Post:  R contains GCD(A, B)                                                }
{   Uses the Euclidean algorithm                                               }
procedure HugeWordGCD(const A, B: HugeWord; var R: HugeWord);
var C, D, T : HugeWord;
begin
  HugeWordInitHugeWord(C, A);
  HugeWordInitHugeWord(D, B);
  HugeWordInit(T);
  try
    while not HugeWordIsZero(D) do
      begin
        HugeWordAssign(T, D);
        HugeWordMod(C, D, D);
        HugeWordAssign(C, T);
      end;
    HugeWordAssign(R, C);
  finally
    HugeWordFinalise(T);
    HugeWordFinalise(D);
    HugeWordFinalise(C);
  end;
end;

{ HugeWord Power operation                                                     }
{ Calculates A^B                                                               }
{   Pre:  A initialised                                                        }
procedure HugeWordPower(var A: HugeWord; const B: LongWord);
var R, C : HugeWord;
    D : LongWord;
begin
  if B = 0 then
    begin
      HugeWordAssignOne(A);
      exit;
    end;
  if HugeWordIsZero(A) or HugeWordIsOne(A) then
    exit;
  if B = 1 then
    exit;
  if B = 2 then
    begin
      HugeWordSqr(A, A);
      exit;
    end;
  HugeWordInitHugeWord(C, A);
  HugeWordInitOne(R);
  try
    D := B;
    while D > 0 do
      if D and 1 = 0 then
        begin
          HugeWordSqr(C, C);
          D := D shr 1;
        end
      else
        begin
          HugeWordMultiply(R, R, C);
          Dec(D);
        end;
    HugeWordAssign(A, R);
  finally
    HugeWordFinalise(R);
    HugeWordFinalise(C);
  end;
end;

{ HugeWord PowerAndMod                                                         }
{ Calculates A^E mod M (Modular exponentiation)                                }
{   Pseudocode:                                                                }
{      Mod-Exp (a, e, m)                                                       }
{      product = 1                                                             }
{      y = a                                                                   }
{      while e > 0 do                                                          }
{        if e is odd then                                                      }
{          product = (product * y) % m;                                        }
{        endif                                                                 }
{        y = (y * y) % m;                                                      }
{        e = e / 2                                                             }
{      end while                                                               }
{      return product                                                          }
{   Pre:  Res initialised                                                      }
procedure HugeWordPowerAndMod(var Res: HugeWord; const A, E, M: HugeWord);
var P, T, Y, F, Q : HugeWord;
begin
  HugeWordInitOne(P);                                  // P = 1
  HugeWordInit(T);
  HugeWordInitHugeWord(Y, A);                          // Y = A
  HugeWordInitHugeWord(F, E);                          // F = E
  HugeWordInit(Q);
  try
    while not HugeWordIsZero(F) do
      begin
        if HugeWordIsOdd(F) then
          begin
            HugeWordMultiply_Long_NN_Unsafe(T, P, Y);  // T = P * Y             HugeWordMultiply(T, P, Y)
            HugeWordNormalise(T);
            HugeWordDivide_RR_Unsafe(T, M, Q, P);      // P = (P * Y) mod M
          end;
        HugeWordMultiply_Long_NN_Unsafe(T, Y, Y);      // T = Y * Y             HugeWordSqr(T, Y)
        HugeWordNormalise(T);
        HugeWordDivide_RR_Unsafe(T, M, Q, Y);          // Y = (Y * Y) mod M
        HugeWordShr1(F);                               // F = F / 2
        HugeWordNormalise(F);
      end;
    HugeWordAssign(Res, P);
  finally
    HugeWordFinalise(Q);
    HugeWordFinalise(F);
    HugeWordFinalise(Y);
    HugeWordFinalise(T);
    HugeWordFinalise(P);
  end;
end;

{ HugeWord String conversion                                                   }
function HugeWordToStr(const A: HugeWord): AnsiString;
var B, C : HugeWord;
    D    : LongWord;
    S    : AnsiString;
    I, L : Integer;
begin
  if HugeWordIsZero(A) then
    begin
      Result := '0';
      exit;
    end;
  HugeWordInitHugeWord(B, A);
  HugeWordInit(C);
  try
    S := '';
    repeat
      HugeWordDivideWord32(B, 10, C, D);
      S := S + AnsiChar(Byte(D) + Ord('0'));
      HugeWordAssign(B, C);
    until HugeWordIsZero(B);
  finally
    HugeWordFinalise(C);
    HugeWordFinalise(B);
  end;
  L := Length(S);
  SetLength(Result, L);
  for I := 1 to L do
    Result[I] := S[L - I + 1];
end;

{ HugeWord String conversion                                                   }
procedure StrToHugeWord(const A: AnsiString; var R: HugeWord);
var I : Integer;
    B : AnsiChar;
    C : LongWord;
begin
  if A = '' then
    RaiseConvertError;
  HugeWordAssignZero(R);
  for I := 1 to Length(A) do
    begin
      B := A[I];
      if not (B in ['0'..'9']) then
        RaiseConvertError;
      C := Ord(A[I]) - Ord('0');
      HugeWordMultiplyWord8(R, 10);
      HugeWordAddWord32(R, C);
    end;
end;

{ HugeWord Hex conversion                                                      }
const
  HexLookupU = '0123456789ABCDEF';
  HexLookupL = '0123456789abcdef';

function HugeWordToHex(const A: HugeWord): AnsiString;
var L, I, J : Integer;
    P : PLongWord;
    F : LongWord;
begin
  if HugeWordIsZero(A) then
    begin
      Result := '00000000';
      exit;
    end;
  L := A.Used;
  SetLength(Result, L * 8);
  P := A.Data;
  Inc(P, L - 1);
  for I := 0 to L - 1 do
    begin
      F := P^;
      for J := 0 to 7 do
        begin
          Result[I * 8 + J + 1] := AnsiChar(HexLookupU[(F shr 28) + 1]);
          F := F shl 4;
        end;
      Dec(P);
    end;
end;

procedure HexToHugeWord(const A: AnsiString; var R: HugeWord);
var L, N, C, I, J, K : Integer;
    B : AnsiChar;
    D, E : Byte;
    F : LongWord;
begin
  L := Length(A);
  if L = 0 then
    RaiseConvertError;
  // L = number of characters in strings
  N := (L div 2) + (L mod 2);
  // N = number of bytes
  C := (N + 3) div 4;
  // C = number of LongWords
  HugeWordSetSize(R, C);
  for I := 0 to C - 1 do
    begin
      F := 0;
      for J := 0 to 7 do
        begin
          K := L - I * 8 - J;
          if K < 1 then
            B := '0'
          else
            B := A[L - I * 8 - J];
          E := 16;
          for D := 1 to 16 do
            if (B = HexLookupU[D]) or
               (B = HexLookupL[D]) then
              begin
                E := D - 1;
                break;
              end;
          if E = 16 then
            RaiseConvertError;
          F := F or (E shl (J * 4));
        end;
      HugeWordSetElement(R, I, F);
    end;
end;

{ HugeWord ISqrt                                                               }
{   Calculates integer square root of A using Newton's method.                 }
{   Pre:  A normalised                                                         }
{   Post: A normalised                                                         }
procedure HugeWordISqrt(var A: HugeWord);
var B, C, D, E, F : HugeWord;
    I, K, L, P    : Integer;
    R             : Boolean;
begin
  // Handle special cases
  if HugeWordCompareWord32(A, 1) <= 0 then // A <= 1
    exit;
  HugeWordInit(B);
  HugeWordInit(C);
  HugeWordInit(D);
  HugeWordInit(E);
  HugeWordInit(F);
  try
    // Shift A left by 8 bits for extra precision
    HugeWordAssign(E, A);
    HugeWordShl(E, 8);
    // Divide algorithm based on Netwon's method for f(y,x) = y � x^2
    // xest <- (xest + y/xest) / 2
    // Initial estimate for xest is 1 shl (HighestSetBit div 2)
    K := HugeWordSetBitScanReverse(E);
    I := K div 2;
    HugeWordAssignOne(C);
    HugeWordShl(C, I);
    // Iterate until a) estimate converges
    //               b) the estimate alternates between two values
    //               c) a maximum number of iterations is reached
    // Allow for one iteration per bit in A (plus extra); this is more than
    // enough since Newton's method doubles precision with every iteration
    // and the initial estimate should be close
    L := 8 + K;
    I := 0;
    P := 0;
    R := False;
    repeat
      HugeWordAssign(B, C);                   // B = previous xest
      HugeWordDivide(E, B, C, D);             // C = y/xest
      HugeWordAdd(C, B);                      // C = xest + y/xest
      HugeWordShr1(C);                        // C = (xest + y/xest) / 2
      // finish if maximum iteration reached
      if I = L then
        R := True else
      // finish if xest converged on exact value
      if HugeWordEquals(B, C) then
        R := True
      else
        begin
          // finish if this is the third iteration where difference is one
          HugeWordAssign(F, C);
          HugeWordSubtract(F, B);           // F = difference in xest and previous xest
          if HugeWordCompareWord32(F, 1) <= 0 then  // F <= 1
            if P = 2 then
              begin
                // xest is alternating between two sequential values
                // Take smallest of the two
                HugeWordMin(C, B);
                R := True
              end
            else
              Inc(P);
        end;
      Inc(I);
    until R;
    // Restore precision in result by shifting right
    HugeWordShr(C, 4);
    HugeWordNormalise(C);
    // Return result
    HugeWordAssign(A, C);
  finally
    HugeWordFinalise(F);
    HugeWordFinalise(E);
    HugeWordFinalise(D);
    HugeWordFinalise(C);
    HugeWordFinalise(B);
  end;
end;

{ HugeWord Extended Euclid                                                     }
{                                                                              }
{ Pseudocode:                                                                  }
{    function extended_gcd(a, b)                                               }
{    x := 0    lastx := 1                                                      }
{    y := 1    lasty := 0                                                      }
{    while b <> 0                                                              }
{        quotient := a div b                                                   }
{                                                                              }
{        temp := b                                                             }
{        b := a mod b                                                          }
{        a := temp                                                             }
{                                                                              }
{        temp := x                                                             }
{        x := lastx-quotient*x                                                 }
{        lastx := temp                                                         }
{                                                                              }
{        temp := y                                                             }
{        y := lasty-quotient*y                                                 }
{        lasty := temp                                                         }
{    return (lastx, lasty, a)                                                  }
{                                                                              }
{   Post:  R contains GCD(A, B)                                                }
{          X and Y contains values that solve AX + BY = GCD(A, B)              }
procedure HugeWordExtendedEuclid(const A, B: HugeWord; var R: HugeWord; var X, Y: HugeInt);
var C, D, T, Q : HugeWord;
    I, J, U    : HugeInt;
begin
  HugeWordInitHugeWord(C, A);                    // C = A
  HugeWordInitHugeWord(D, B);                    // D = B
  HugeWordInit(T);
  HugeWordInit(Q);
  HugeIntInitOne(I);                             // I = 1                       lastx = 1
  HugeIntInitZero(J);                            // J = 0                       lasty = 0
  HugeIntInit(U);
  try
    HugeIntAssignZero(X);                        // X = 0                       x = 0
    HugeIntAssignOne(Y);                         // Y = 1                       y = 1
    while not HugeWordIsZero(D) do               //                             while b <> 0
      begin
        HugeWordAssign(T, D);                    // T = D                       temp = b
        HugeWordDivide(C, D, Q, D);              // D = C mod D, Q = C div D    Q = quotient
        HugeWordAssign(C, T);                    // C = T                       a = temp

        // x[i+1] = x[i-1] - q[i]*x[i]
        HugeIntAssignHugeInt(U, X);              // U = X                       temp = x
        HugeIntMultiplyHugeWord(X, Q);           // X = X * Q                   quotient * x
        HugeIntSubtractHugeInt(I, X);            // I = I - X                   lastx - quotient * x
        HugeIntAssignHugeInt(X, I);              // X = I                       x = lastx - quotient * x
        HugeIntAssignHugeInt(I, U);              // I = U                       lastx = temp

        HugeIntAssignHugeInt(U, Y);              // U = Y                       temp = y
        HugeIntMultiplyHugeWord(Y, Q);           // Y = Y * Q                   quotient * y
        HugeIntSubtractHugeInt(J, Y);            // J = J - Y                   lasty - quotient * y
        HugeIntAssignHugeInt(Y, J);              // Y = J                       y = lasty - quotient * y
        HugeIntAssignHugeInt(J, U);              // J = U                       lasty = temp
      end;
    HugeIntAssignHugeInt(X, I);                  // X = I                       x = lastx
    HugeIntAssignHugeInt(Y, J);                  // Y = J                       y = lasty
    HugeWordAssign(R, C);                        // R = C                       r = a
  finally
    HugeIntFinalise(U);
    HugeIntFinalise(J);
    HugeIntFinalise(I);
    HugeWordFinalise(Q);
    HugeWordFinalise(T);
    HugeWordFinalise(D);
    HugeWordFinalise(C);
  end;
end;

{ HugeWord Modular Inverse and Mod                                             }
{   Calculates modular inverse(E) mod M using extended Euclidean algorithm     }
{   Post:  Returns False if modular inverse does not exist                     }
{          R contains modular inverse(E) mod M if modular inverse exists       }
function HugeWordModInv(const E, M: HugeWord; var R: HugeWord): Boolean;
var GCD : HugeWord;
    X, Y, F, G : HugeInt;
begin
  HugeWordInit(GCD);
  HugeIntInit(X);
  HugeIntInit(Y);
  HugeIntInit(F);
  HugeIntInit(G);
  try
    HugeWordExtendedEuclid(E, M, GCD, X, Y);
    if HugeWordIsOne(GCD) then
      begin
        HugeIntAssignHugeInt(F, X);
        if HugeIntIsNegative(F) then
          begin
            HugeIntAssignHugeWord(G, M);
            HugeIntAddHugeInt(F, G);
          end;
        HugeWordAssign(R, F.Value);
        Result := True;
      end
    else
      Result := False;
  finally
    HugeIntFinalise(G);
    HugeIntFinalise(F);
    HugeIntFinalise(Y);
    HugeIntFinalise(X);
    HugeWordFinalise(GCD);
  end;
end;

{ HugeWord Random                                                              }
{   Generates a random HugeWord with Size elements.                            }
{   Pre:   Size is number of elements in result                                }
{   Post:  A normalised                                                        }
procedure HugeWordRandom(var A: HugeWord; const Size: Integer);
var I : Integer;
    P : PLongWord;
begin
  HugeWordSetSize(A, Size);
  if Size <= 0 then
    exit;
  P := A.Data;
  for I := 0 to Size - 1 do
    begin
      P^ := RandomUniform;
      Inc(P);
    end;
  HugeWordNormalise(A);
end;

{ HugeWord Primality testing                                                   }
const
  PrimeTableCount = 54;
  PrimeTable: array[0..PrimeTableCount - 1] of Byte = (
      2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61,
      67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109, 113, 127, 131, 137,
      139, 149, 151, 157, 163, 167, 173, 179, 181, 191, 193, 197, 199, 211,
      223, 227, 229, 233, 239, 241, 251);

{ HugeWord IsPrime Quick Trial                                                 }
{   Quick check for primality using trial division of the first few prime      }
{   numbers.                                                                   }
const
  PrimeTableQuickSmallCount  = 50;
  PrimeTableQuickLargeCount1 = 6;
  PrimeTableQuickLargeCount2 = 12;
  PrimeTableQuickLargeCount3 = 24;

function HugeWordIsPrime_QuickTrial(const A: HugeWord): TPrimality;
var L, I, N : Integer;
    F, G, H : LongWord;
    C, Q, R : HugeWord;
begin
  L := A.Used;
  if L = 0 then
    Result := pNotPrime else
  if L = 1 then
    begin
      F := HugeWordToWord32(A);
      if F = 1 then
        Result := pNotPrime else
      if F = 2 then
        Result := pPrime else
      if F and 1 = 0 then
        Result := pNotPrime
      else
        begin
          G := Trunc(Sqrt(F)) + 1;
          for I := 1 to PrimeTableQuickSmallCount do
            begin
              H := PrimeTable[I];
              if H > G then
                begin
                  Result := pPrime;
                  exit;
                end;
              if F mod H = 0 then
                begin
                  Result := pNotPrime;
                  exit;
                end;
            end;
          Result := pPotentialPrime;
        end;
    end
  else
    if not HugeWordIsOdd(A) then
      Result := pNotPrime
    else
    begin
      HugeWordInit(C);
      HugeWordInit(Q);
      HugeWordInit(R);
      try
        if L >= 128 then // >= 4096 bits
          N := PrimeTableQuickLargeCount1 else
        if L >= 32 then  // >= 1024 bits
          N := PrimeTableQuickLargeCount2
        else             //  < 1024 bits
          N := PrimeTableQuickLargeCount3;
        for I := 1 to N do
          begin
            H := PrimeTable[I];
            HugeWordAssignWord32(C, H);
            HugeWordDivide(A, C, Q, R);
            if HugeWordIsZero(R) then
              begin
                Result := pNotPrime;
                exit;
              end;
          end;
        Result := pPotentialPrime;
      finally
        HugeWordFinalise(R);
        HugeWordFinalise(Q);
        HugeWordFinalise(C);
      end;
    end;
end;

{ HugeWord IsPrime MillerRabin                                                 }
{   Check primality using Miller-Rabin:                                        }
{   "pick some a and take a^(n-1) mod n. If you don't get 1, then you know     }
{   that n is not prime."                                                      }
{   +---+---+---+---+---+---+---+---+----+                                     }
{   | k |256|342|384|410|512|683|768|1024|                                     }
{   +---+---+---+---+---+---+---+---+----+                                     }
{   | t |17 |12 |11 |10 |8  |6  |5  |4   |                                     }
{   +---+---+---+---+---+---+---+---+----+                                     }
{   k = bits in A                                                              }
{   t = PrimeTableMRCount sufficient for 2^-100 probability of not being prime }
function HugeWordIsPrime_MillerRabin(const A: HugeWord): TPrimality;
var I, L, N : Integer;
    B, C, D : HugeWord;
begin
  HugeWordInit(B);
  HugeWordInitHugeWord(C, A);
  HugeWordInit(D);
  try
    HugeWordSubtractWord32(C, 1);
    // determine number of checks to do according to number of bits in A 
    L := HugeWordSetBitScanReverse(A) + 1;
    if L >= 1024 then
      N := 4 else
    if L >= 512 then
      N := 8 else
    if L >= 256 then
      N := 17
    else
      N := 25;
    // do check using first N prime numbers as "a".
    // this may be sufficient for actual primality testing for certain A
    for I := 0 to N - 1 do
      begin
        HugeWordAssignWord32(B, PrimeTable[I]);
        HugeWordPowerAndMod(D, B, C, A);
        if not HugeWordIsOne(D) then
          begin
            Result := pNotPrime;
            exit;
          end;
      end;
  finally
    HugeWordFinalise(D);
    HugeWordFinalise(C);
    HugeWordFinalise(B);
  end;
  Result := pPotentialPrime;
end;

{ HugeWord IsPrime                                                             }
function HugeWordIsPrime(const A: HugeWord): TPrimality;
begin
  Result := HugeWordIsPrime_QuickTrial(A);
  if Result <> pPotentialPrime then
    exit;
  Result := HugeWordIsPrime_MillerRabin(A);
end;

{ HugeWord NextPotentialPrime                                                  }
{   Returns the next potential prime after A.                                  }
{   Returns A = 0 if process was aborted by callback procedure.                } 
procedure HugeWordNextPotentialPrime(var A: HugeWord;
          const CallbackProc: THugeWordCallbackProc;
          const CallbackData: Integer);
begin
  if not HugeWordIsOdd(A) then
    HugeWordAddWord32(A, 1)
  else
    HugeWordAddWord32(A, 2);
  while HugeWordIsPrime(A) = pNotPrime do
    begin
      if Assigned(CallbackProc) then
        if not CallbackProc(CallbackData) then
          begin
            // aborted
            HugeWordInitZero(A);
            exit;
          end;
      HugeWordAddWord32(A, 2);
    end;
end;



{                                                                              }
{ HugeInt                                                                      }
{                                                                              }
procedure HugeIntInit(out A: HugeInt);
begin
  A.Sign := 0;
  HugeWordInit(A.Value);
end;

procedure HugeIntFinalise(var A: HugeInt);
begin
  HugeWordFinalise(A.Value);
end;

{ HugeIntNormalise                                                             }
{   A 'normalised' HugeInt has a normalised HugeWord Value and has a Sign of   }
{   zero if the Value is zero, otherwise a Sign of +1 or -1 to indicate the    }
{   sign of Value.                                                             }
procedure HugeIntNormalise(var A: HugeInt);
begin
  HugeWordNormalise(A.Value);
  if HugeWordIsZero(A.Value) then
    A.Sign := 0;
end;

procedure HugeIntInitZero(out A: HugeInt);
begin
  HugeIntInit(A);
end;

procedure HugeIntInitOne(out A: HugeInt);
begin
  HugeIntInit(A);
  HugeIntAssignOne(A);
end;

procedure HugeIntInitMinusOne(out A: HugeInt);
begin
  HugeIntInit(A);
  HugeIntAssignMinusOne(A);
end;

procedure HugeIntInitWord32(out A: HugeInt; const B: LongWord);
begin
  HugeIntInit(A);
  HugeIntAssignWord32(A, B);
end;

procedure HugeIntInitInt32(out A: HugeInt; const B: LongInt);
begin
  HugeIntInit(A);
  HugeIntAssignInt32(A, B);
end;

procedure HugeIntInitInt64(out A: HugeInt; const B: Int64);
begin
  HugeIntInit(A);
  HugeIntAssignInt64(A, B);
end;

procedure HugeIntInitHugeWord(out A: HugeInt; const B: HugeWord);
begin
  if HugeWordIsZero(B) then
    HugeIntInit(A)
  else
    begin
      A.Sign := 1;
      HugeWordInitHugeWord(A.Value, B);
    end;
end;

procedure HugeIntInitHugeInt(out A: HugeInt; const B: HugeInt);
begin
  A.Sign := B.Sign;
  HugeWordInitHugeWord(A.Value, B.Value);
end;

procedure HugeIntAssignZero(var A: HugeInt);
begin
  A.Sign := 0;
  HugeWordAssignZero(A.Value);
end;

procedure HugeIntAssignOne(var A: HugeInt);
begin
  A.Sign := 1;
  HugeWordAssignOne(A.Value);
end;

procedure HugeIntAssignMinusOne(var A: HugeInt);
begin
  A.Sign := -1;
  HugeWordAssignOne(A.Value);
end;

procedure HugeIntAssignWord32(var A: HugeInt; const B: LongWord);
begin
  if B = 0 then
    begin
      A.Sign := 0;
      HugeWordAssignZero(A.Value);
    end
  else
    begin
      A.Sign := 1;
      HugeWordAssignWord32(A.Value, B);
    end;
end;

procedure HugeIntAssignInt32(var A: HugeInt; const B: LongInt);
begin
  if B = 0 then
    begin
      A.Sign := 0;
      HugeWordAssignZero(A.Value);
    end else
  if B < 0 then
    begin
      A.Sign := -1;
      HugeWordAssignWord32(A.Value, LongWord(-Int64(B)));
    end
  else
    begin
      A.Sign := 1;
      HugeWordAssignInt32(A.Value, B);
    end;
end;

procedure HugeIntAssignInt64(var A: HugeInt; const B: Int64);
var T : Int64;
begin
  if B = 0 then
    begin
      A.Sign := 0;
      HugeWordAssignZero(A.Value);
    end else
  if B < 0 then
    begin
      A.Sign := -1;
      if B = MinInt64 {-$8000000000000000} then // -Min(Int64) is out of Int64 range
        begin
          HugeWordSetSize(A.Value, 2);
          HugeWordSetElement(A.Value, 0, $00000000);
          HugeWordSetElement(A.Value, 1, $80000000);
        end
      else
        begin
          T := -B;
          HugeWordAssignInt64(A.Value, T);
        end;
    end
  else
    begin
      A.Sign := 1;
      HugeWordAssignInt64(A.Value, B);
    end;
end;

procedure HugeIntAssignHugeWord(var A: HugeInt; const B: HugeWord);
begin
  if HugeWordIsZero(B) then
    begin
      A.Sign := 0;
      HugeWordAssignZero(A.Value);
    end
  else
    begin
      A.Sign := 1;
      HugeWordAssign(A.Value, B);
    end;
end;

procedure HugeIntAssignHugeWordNegated(var A: HugeInt; const B: HugeWord);
begin
  if HugeWordIsZero(B) then
    begin
      A.Sign := 0;
      HugeWordAssignZero(A.Value);
    end
  else
    begin
      A.Sign := -1;
      HugeWordAssign(A.Value, B);
    end;
end;

procedure HugeIntAssignHugeInt(var A: HugeInt; const B: HugeInt);
begin
  A.Sign := B.Sign;
  HugeWordAssign(A.Value, B.Value);
end;

procedure HugeIntSwap(var A, B: HugeInt);
var C : HugeInt;
begin
  HugeIntInitHugeInt(C, A);      // C := A
  try
    HugeIntAssignHugeInt(A, B);  // A := B
    HugeIntAssignHugeInt(B, C);  // B := C
  finally
    HugeIntFinalise(C);
  end;
end;

function HugeIntIsZero(const A: HugeInt): Boolean;
begin
  Result := A.Sign = 0;
end;

function HugeIntIsNegative(const A: HugeInt): Boolean;
begin
  Result := A.Sign < 0;
end;

function HugeIntIsNegativeOrZero(const A: HugeInt): Boolean;
begin
  Result := A.Sign <= 0;
end;

function HugeIntIsPositive(const A: HugeInt): Boolean;
begin
  Result := A.Sign > 0;
end;

function HugeIntIsPositiveOrZero(const A: HugeInt): Boolean;
begin
  Result := A.Sign >= 0;
end;

function HugeIntIsOne(const A: HugeInt): Boolean;
begin
  Result := (A.Sign > 0) and HugeWordIsOne(A.Value);
end;

function HugeIntIsMinusOne(const A: HugeInt): Boolean;
begin
  Result := (A.Sign < 0) and HugeWordIsOne(A.Value);
end;

function HugeIntIsOdd(const A: HugeInt): Boolean;
begin
  Result := HugeWordIsOdd(A.Value);
end;

function HugeIntIsEven(const A: HugeInt): Boolean;
begin
  Result := HugeWordIsOdd(A.Value);
end;

function HugeIntIsWord32Range(const A: HugeInt): Boolean;
begin
  if A.Sign = 0 then
    Result := True else
  if A.Sign < 0 then
    Result := False
  else
    Result := HugeWordGetSize(A.Value) <= 1;
end;

function HugeIntIsInt32Range(const A: HugeInt): Boolean;
begin
  if A.Sign = 0 then
    Result := True else
  if HugeWordGetSize(A.Value) > 1 then
    Result := False
  else
    if A.Sign > 0 then
      Result := HugeWordIsInt32Range(A.Value)
    else
      Result := HugeWordGetElement(A.Value, 0) <= $80000000;
end;

function HugeIntIsInt64Range(const A: HugeInt): Boolean;
var F : LongWord;
begin
  if A.Sign = 0 then
    Result := True
  else
  begin
    F := HugeWordGetSize(A.Value);
    if F = 1 then
      Result := True else
    if F > 2 then
      Result := False
    else
      if A.Sign > 0 then
        Result := HugeWordIsInt64Range(A.Value)
      else
        begin
          F := HugeWordGetElement(A.Value, 1);
          if F > $80000000 then
            Result := False else
          if F < $80000000 then
            Result := True
          else
            Result := HugeWordGetElement(A.Value, 0) = $00000000;
        end;
  end;
end;

function HugeIntSign(const A: HugeInt): Integer;
begin
  Result := A.Sign;
end;

procedure HugeIntNegate(var A: HugeInt);
begin
  A.Sign := -A.Sign;
end;

function HugeIntAbsInPlace(var A: HugeInt): Boolean;
begin
  if A.Sign < 0 then
    begin
      A.Sign := 1;
      Result := True;
    end
  else
    Result := False;
end;

function HugeIntAbs(const A: HugeInt; var B: HugeWord): Boolean;
begin
  HugeWordAssign(B, A.Value);
  Result := A.Sign < 0;
end;

function HugeIntToWord32(const A: HugeInt): LongWord;
begin
  {$IFOPT R+}
  if (A.Sign < 0) or not HugeWordIsWord32Range(A.Value) then
    RaiseRangeError;
  {$ENDIF}
  Result := HugeWordToWord32(A.Value);
end;

function HugeIntToInt32(const A: HugeInt): LongInt;
begin
  {$IFOPT R+}
  if ((A.Sign > 0) and (HugeWordCompareWord32(A.Value, $7FFFFFFF) > 0)) or
     ((A.Sign < 0) and (HugeWordCompareWord32(A.Value, $80000000) > 0)) then
    RaiseRangeError;
  {$ENDIF}
  if A.Sign > 0 then
    Result := HugeWordToWord32(A.Value) else
  if A.Sign < 0 then
    begin
      {$IFDEF DELPHI5}
      // Delphi5 incorrectly raises an exception if done as:
      //   Result := -HugeWordToWord32(A.Value)
      Result := HugeWordToWord32(A.Value);
      Result := -Result;
      {$ELSE}
      Result := -HugeWordToWord32(A.Value)
      {$ENDIF}
    end
  else
    Result := 0;
end;

function HugeIntToInt64(const A: HugeInt): Int64;
begin
  {$IFOPT R+}
  if A.Value.Used > 2 then
    RaiseRangeError else
  if A.Value.Used = 2 then
    if A.Sign > 0 then
      begin
        if HugeWordGetElement(A.Value, 1) > $7FFFFFFF then
          RaiseRangeError;
      end else
    if A.Sign < 0 then
      begin
        if HugeWordGetElement(A.Value, 1) > $80000000 then
          RaiseRangeError;
        if (HugeWordGetElement(A.Value, 1) = $80000000) and
           (HugeWordGetElement(A.Value, 0) > $00000000) then
          RaiseRangeError;
      end;
  {$ENDIF}
  if A.Sign > 0 then
    Result := HugeWordToInt64(A.Value) else
  if A.Sign < 0 then
    begin
      if (A.Value.Used = 2) and
         (HugeWordGetElement(A.Value, 1) = $80000000) and
         (HugeWordGetElement(A.Value, 0) = $00000000) then
        Result := MinInt64 { -$8000000000000000 }
      else
        begin
          {$IFDEF DELPHI5}
          // Delphi5 incorrectly raises an overflow with 7FFFFFFFFFFFFFFF
          if (A.Value.Used = 2) and
             (HugeWordGetElement(A.Value, 1) = $7FFFFFFF) and
             (HugeWordGetElement(A.Value, 0) = $FFFFFFFF) then
            Result := -$7FFFFFFFFFFFFFFF
          else
            Result := -HugeWordToInt64(A.Value);
          {$ELSE}
          Result := -HugeWordToInt64(A.Value);
          {$ENDIF}
        end;
    end
  else
    Result := 0;
end;

function HugeIntEqualsWord32(const A: HugeInt; const B: LongWord): Boolean;
begin
  if A.Sign < 0 then
    Result := False else
  if not HugeWordIsWord32Range(A.Value) then
    Result := False
  else
    Result := HugeWordToWord32(A.Value) = B;
end;

function HugeIntEqualsInt32(const A: HugeInt; const B: LongInt): Boolean;
begin
  if A.Sign < 0 then
    if B >= 0 then
      Result := False
    else
      Result := HugeWordEqualsWord32(A.Value, LongWord(-Int64(B)))
  else
    Result := HugeWordEqualsInt32(A.Value, B);
end;

function HugeIntEqualsInt64(const A: HugeInt; const B: Int64): Boolean;
begin
  if A.Sign < 0 then
    if B >= 0 then
      Result := False
    else
      begin
        if B = MinInt64 { -$8000000000000000 } then
          begin
            if HugeWordGetSize(A.Value) <> 2 then
              Result := False
            else
              Result :=
                  (HugeWordGetElement(A.Value, 0) = $00000000) and
                  (HugeWordGetElement(A.Value, 1) = $80000000);
          end
        else
          Result := HugeWordEqualsInt64(A.Value, -B);
      end
  else
    Result := HugeWordEqualsInt64(A.Value, B);
end;

function HugeIntEqualsHugeInt(const A, B: HugeInt): Boolean;
begin
  if A.Sign <> B.Sign then
    Result := False else
  if A.Sign = 0 then
    Result := True
  else
    Result := HugeWordEquals(A.Value, B.Value);
end;

function HugeIntCompareWord32(const A: HugeInt; const B: LongWord): Integer;
begin
  if A.Sign < 0 then
    Result := -1 else
  if A.Sign = 0 then
    if B = 0 then
      Result := 0
    else
      Result := -1
  else
    Result := HugeWordCompareWord32(A.Value, B);
end;

function HugeIntCompareInt32(const A: HugeInt; const B: LongInt): Integer;
begin
  if A.Sign < 0 then
    if B >= 0 then
      Result := -1
    else
      Result := -HugeWordCompareWord32(A.Value, LongWord(-Int64(B)))
  else
  if A.Sign = 0 then
    if B < 0 then
      Result := 1 else
    if B = 0 then
      Result := 0
    else
      Result := -1
  else
    Result := HugeWordCompareInt32(A.Value, B);
end;

function HugeIntCompareInt64(const A: HugeInt; const B: Int64): Integer;
var L : Integer;
    F, G : LongWord;
begin
  if A.Sign < 0 then
    if B >= 0 then
      Result := -1
    else
      begin
        if B = MinInt64 { -$8000000000000000 } then
          begin
            L := HugeWordGetSize(A.Value);
            if L < 2 then
              Result := 1 else
            if L > 2 then
              Result := -1
            else
              begin
                F := HugeWordGetElement(A.Value, 0);
                G := HugeWordGetElement(A.Value, 1);
                if G > $80000000 then
                  Result := -1 else
                if G < $80000000 then
                  Result := 1
                else
                  if F > $00000000 then
                    Result := -1
                  else
                    Result := 0;
              end;
          end
        else
          Result := -HugeWordCompareInt64(A.Value, -B);
      end
  else
  if A.Sign = 0 then
    if B < 0 then
      Result := 1 else
    if B = 0 then
      Result := 0
    else
      Result := -1
  else
    Result := HugeWordCompareInt64(A.Value, B);
end;

function HugeIntCompareHugeInt(const A, B: HugeInt): Integer;
begin
  if A.Sign < 0 then
    if B.Sign >= 0 then
      Result := -1
    else
      Result := -HugeWordCompare(A.Value, B.Value)
  else
  if A.Sign = 0 then
    if B.Sign < 0 then
      Result := 1 else
    if B.Sign = 0 then
      Result := 0
    else
      Result := -1
  else
    if B.Sign <= 0 then
      Result := 1
    else
      Result := HugeWordCompare(A.Value, B.Value);
end;

{ HugeInt CompareHugeIntAbs                                                    }
{   Compares the absolute values of two HugeInts.                              }
function HugeIntCompareHugeIntAbs(const A, B: HugeInt): Integer;
begin
  if A.Sign = 0 then
    if B.Sign = 0 then
      Result := 0
    else
      Result := -1
  else
  if B.Sign = 0 then
    Result := 1
  else
    Result := HugeWordCompare(A.Value, B.Value);
end;

procedure HugeIntMin(var A: HugeInt; const B: HugeInt);
begin
  if HugeIntCompareHugeInt(A, B) <= 0 then
    exit;
  HugeIntAssignHugeInt(A, B);
end;

procedure HugeIntMax(var A: HugeInt; const B: HugeInt);
begin
  if HugeIntCompareHugeInt(A, B) >= 0 then
    exit;
  HugeIntAssignHugeInt(A, B);
end;

procedure HugeIntAddWord32(var A: HugeInt; const B: LongWord);
var C : Integer;
begin
  if B = 0 then
    exit;
  if A.Sign = 0 then
    HugeIntAssignWord32(A, B) else
  if A.Sign < 0 then
    begin
      C := HugeWordSubtractWord32(A.Value, B);
      if C = 0 then
        HugeIntAssignZero(A) else
      if C < 0 then
        A.Sign := 1;
    end
  else
    HugeWordAddWord32(A.Value, B);
end;

procedure HugeIntAddInt32(var A: HugeInt; const B: LongInt);
var C : Integer;
begin
  if B = 0 then
    exit;
  if A.Sign = 0 then
    HugeIntAssignInt32(A, B)
  else
    if ((B > 0) and (A.Sign < 0)) or
       ((B < 0) and (A.Sign > 0)) then
      begin
        C := HugeWordSubtractWord32(A.Value, Abs(B));
        if C = 0 then
          HugeIntAssignZero(A) else
        if C < 0 then
          A.Sign := -A.Sign;
      end
    else
      HugeWordAddWord32(A.Value, Abs(B));
end;

procedure HugeIntAddHugeInt(var A: HugeInt; const B: HugeInt);
var C : Integer;
begin
  if B.Sign = 0 then
    exit;
  if A.Sign = 0 then
    HugeIntAssignHugeInt(A, B)
  else
    if A.Sign <> B.Sign then
      begin
        C := HugeWordSubtract(A.Value, B.Value);
        if C = 0 then
          HugeIntAssignZero(A) else
        if C < 0 then
          A.Sign := -A.Sign;
      end
    else
      HugeWordAdd(A.Value, B.Value);
end;

procedure HugeIntInc(var A: HugeInt);
begin
  HugeIntAddWord32(A, 1);
end;

procedure HugeIntSubtractWord32(var A: HugeInt; const B: LongWord);
var C : Integer;
begin
  if B = 0 then
    exit;
  if A.Sign = 0 then
    begin
      A.Sign := -1;
      HugeWordInitWord32(A.Value, B);
    end else
  if A.Sign < 0 then
    HugeWordAddWord32(A.Value, B)
  else
    begin
      C := HugeWordSubtractWord32(A.Value, B);
      if C = 0 then
        HugeIntAssignZero(A) else
      if C < 0 then
        A.Sign := -1;
    end;
end;

procedure HugeIntSubtractInt32(var A: HugeInt; const B: LongInt);
var C : Integer;
begin
  if B = 0 then
    exit;
  if A.Sign = 0 then
    begin
      HugeIntAssignInt32(A, B);
      HugeIntNegate(A);
    end
  else
    if ((B > 0) and (A.Sign < 0)) or
       ((B < 0) and (A.Sign > 0)) then
      HugeWordAddWord32(A.Value, Abs(B))
    else
      begin
        C := HugeWordSubtractWord32(A.Value, Abs(B));
        if C = 0 then
          HugeIntAssignZero(A) else
        if C < 0 then
          A.Sign := -A.Sign;
      end;
end;

procedure HugeIntSubtractHugeInt(var A: HugeInt; const B: HugeInt);
var C : Integer;
begin
  if B.Sign = 0 then
    exit;
  if A.Sign = 0 then
    begin
      HugeIntAssignHugeInt(A, B);
      A.Sign := -B.Sign;
    end
  else
    if A.Sign <> B.Sign then
      HugeWordAdd(A.Value, B.Value)
    else
      begin
        C := HugeWordSubtract(A.Value, B.Value);
        if C = 0 then
          HugeIntAssignZero(A) else
        if C < 0 then
          A.Sign := -A.Sign;
      end;
end;

procedure HugeIntDec(var A: HugeInt);
begin
  HugeIntSubtractWord32(A, 1);
end;

procedure HugeIntMultiplyWord8(var A: HugeInt; const B: Byte);
begin
  if A.Sign = 0 then
    exit;
  if B = 0 then
    HugeIntAssignZero(A)
  else
    HugeWordMultiplyWord8(A.Value, B);
end;

procedure HugeIntMultiplyWord16(var A: HugeInt; const B: Word);
begin
  if A.Sign = 0 then
    exit;
  if B = 0 then
    HugeIntAssignZero(A)
  else
    HugeWordMultiplyWord16(A.Value, B);
end;

procedure HugeIntMultiplyWord32(var A: HugeInt; const B: LongWord);
begin
  if A.Sign = 0 then
    exit;
  if B = 0 then
    HugeIntAssignZero(A)
  else
    HugeWordMultiplyWord32(A.Value, B);
end;

procedure HugeIntMultiplyInt8(var A: HugeInt; const B: ShortInt);
begin
  if A.Sign = 0 then
    exit;
  if B = 0 then
    HugeIntAssignZero(A)
  else
    begin
      HugeWordMultiplyWord8(A.Value, Abs(B));
      if ((B < 0) and (A.Sign > 0)) or
         ((B > 0) and (A.Sign < 0)) then
        A.Sign := -1
      else
        A.Sign := 1;
    end;
end;

procedure HugeIntMultiplyInt16(var A: HugeInt; const B: SmallInt);
begin
  if A.Sign = 0 then
    exit;
  if B = 0 then
    HugeIntAssignZero(A)
  else
    begin
      HugeWordMultiplyWord16(A.Value, Abs(B));
      if ((B < 0) and (A.Sign > 0)) or
         ((B > 0) and (A.Sign < 0)) then
        A.Sign := -1
      else
        A.Sign := 1;
    end;
end;

procedure HugeIntMultiplyInt32(var A: HugeInt; const B: LongInt);
begin
  if A.Sign = 0 then
    exit;
  if B = 0 then
    HugeIntAssignZero(A)
  else
    begin
      HugeWordMultiplyWord32(A.Value, Abs(B));
      if ((B < 0) and (A.Sign > 0)) or
         ((B > 0) and (A.Sign < 0)) then
        A.Sign := -1
      else
        A.Sign := 1;
    end;
end;

procedure HugeIntMultiplyHugeWord(var A: HugeInt; const B: HugeWord);
begin
  if A.Sign = 0 then
    exit;
  if HugeWordIsZero(B) then
    HugeIntAssignZero(A)
  else
    HugeWordMultiply(A.Value, A.Value, B);
end;

procedure HugeIntMultiplyHugeInt(var A: HugeInt; const B: HugeInt);
begin
  if A.Sign = 0 then
    exit;
  if B.Sign = 0 then
    HugeIntAssignZero(A)
  else
    begin
      HugeWordMultiply(A.Value, A.Value, B.Value);
      if A.Sign <> B.Sign then
        A.Sign := -1
      else
        A.Sign := 1;
    end;
end;

procedure HugeIntSqr(var A: HugeInt);
begin
  if A.Sign = 0 then
    exit;
  A.Sign := 1;
  HugeWordSqr(A.Value, A.Value);
end;

procedure HugeIntDivideWord32(const A: HugeInt; const B: LongWord; var Q: HugeInt; out R: LongWord);
begin
  if B = 0 then
    RaiseDivByZeroError;
  if A.Sign = 0 then
    begin
      HugeIntAssignZero(Q);
      R := 0;
      exit;
    end;
  HugeWordDivideWord32(A.Value, B, Q.Value, R);
  if HugeWordIsZero(Q.Value) then
    Q.Sign := 0
  else
    Q.Sign := A.Sign;
end;

procedure HugeIntDivideInt32(const A: HugeInt; const B: LongInt; var Q: HugeInt; out R: LongInt);
var C : LongWord;
begin
  if B = 0 then
    RaiseDivByZeroError;
  if A.Sign = 0 then
    begin
      HugeIntAssignZero(Q);
      R := 0;
      exit;
    end;
  HugeWordDivideWord32(A.Value, Abs(B), Q.Value, C);
  if HugeWordIsZero(Q.Value) then
    Q.Sign := 0 else
  if ((B > 0) and (A.Sign < 0)) or
     ((B < 0) and (A.Sign > 0)) then
    Q.Sign := -1
  else
    Q.Sign := 1;
  R := LongInt(C);
end;

procedure HugeIntDivideHugeInt(const A, B: HugeInt; var Q, R: HugeInt);
begin
  if B.Sign = 0 then
    RaiseDivByZeroError;
  if A.Sign = 0 then
    begin
      HugeIntAssignZero(Q);
      HugeIntAssignZero(R);
      exit;
    end;
  HugeWordDivide(A.Value, B.Value, Q.Value, R.Value);
  if HugeWordIsZero(Q.Value) then
    Q.Sign := 0 else
  if A.Sign <> B.Sign then
    Q.Sign := -1
  else
    Q.Sign := 1;
  if HugeWordIsZero(R.Value) then
    R.Sign := 0
  else
    R.Sign := 1;
end;

procedure HugeIntMod(const A, B: HugeInt; var R: HugeInt);
var Q : HugeInt;
begin
  HugeIntInit(Q);
  try
    HugeIntDivideHugeInt(A, B, Q, R);
  finally
    HugeIntFinalise(Q);
  end;
end;

procedure HugeIntPower(var A: HugeInt; const B: LongWord);
begin
  if B = 0 then
    begin
      HugeIntAssignOne(A);
      exit;
    end;
  if HugeIntIsZero(A) or HugeIntIsOne(A) then
    exit;
  if B = 1 then
    exit;
  if B = 2 then
    begin
      HugeIntSqr(A);
      exit;
    end;
  HugeWordPower(A.Value, B);
  if (A.Sign < 0) and (B and 1 = 0) then
    A.Sign := 1;
end;

function HugeIntToStr(const A: HugeInt): AnsiString;
var S : AnsiString;
begin
  if A.Sign = 0 then
    Result := '0'
  else
    begin
      S := HugeWordToStr(A.Value);
      if A.Sign < 0 then
        Result := '-' + S
      else
        Result := S;
    end;
end;

procedure StrToHugeInt(const A: AnsiString; var R: HugeInt);
var B : AnsiString;
begin
  if A = '' then
    RaiseConvertError;
  if A[1] = '-' then
    begin
      R.Sign := -1;
      B := Copy(A, 2, Length(A) - 1);
    end
  else
    begin
      R.Sign := 1;
      B := A;
    end;
  StrToHugeWord(B, R.Value);
  if HugeWordIsZero(R.Value) then
    R.Sign := 0;
end;

function HugeIntToHex(const A: HugeInt): AnsiString;
var S : AnsiString;
begin
  if A.Sign = 0 then
    Result := '00000000'
  else
    begin
      S := HugeWordToHex(A.Value);
      if A.Sign < 0 then
        Result := '-' + S
      else
        Result := S;
    end;
end;

procedure HexToHugeInt(const A: AnsiString; var R: HugeInt);
var B : AnsiString;
begin
  if A = '' then
    RaiseConvertError;
  if A[1] = '-' then
    begin
      R.Sign := -1;
      B := Copy(A, 2, Length(A) - 1);
    end
  else
    begin
      R.Sign := 1;
      B := A;
    end;
  HexToHugeWord(B, R.Value);
  if HugeWordIsZero(R.Value) then
    R.Sign := 0;
end;

procedure HugeIntISqrt(var A: HugeInt);
begin
  if A.Sign = 0 then
    exit;
  if A.Sign < 0 then
    RaiseInvalidOpError;
  HugeWordISqrt(A.Value);
end;

procedure HugeIntRandom(var A: HugeInt; const Size: Integer);
begin
  HugeWordRandom(A.Value, Size);
  if HugeWordIsZero(A.Value) then
    A.Sign := 0 else
  if RandomBoolean then
    A.Sign := 1
  else
    A.Sign := -1;
end;



{                                                                              }
{ HugeInt class                                                                }
{                                                                              }
constructor THugeInt.Create;
begin
  inherited Create;
  HugeIntInit(FValue);
end;

constructor THugeInt.Create(const A: Int64);
begin
  inherited Create;
  HugeIntInitInt64(FValue, A);
end;

constructor THugeInt.Create(const A: THugeInt);
begin
  Assert(Assigned(A));
  inherited Create;
  HugeIntInitHugeInt(FValue, A.FValue);
end;

destructor THugeInt.Destroy;
begin
  HugeIntFinalise(FValue);
  inherited Destroy;
end;

procedure THugeInt.AssignZero;
begin
  HugeIntAssignZero(FValue);;
end;

procedure THugeInt.AssignOne;
begin
  HugeIntAssignOne(FValue);;
end;

procedure THugeInt.AssignMinusOne;
begin
  HugeIntAssignMinusOne(FValue);;
end;

procedure THugeInt.Assign(const A: Int64);
begin
  HugeIntAssignInt64(FValue, A);
end;

procedure THugeInt.Assign(const A: THugeInt);
begin
  HugeIntAssignHugeInt(FValue, A.FValue);
end;

function THugeInt.IsZero: Boolean;
begin
  Result := HugeIntIsZero(FValue);
end;

function THugeInt.IsNegative: Boolean;
begin
  Result := HugeIntIsNegative(FValue);
end;

function THugeInt.IsPositive: Boolean;
begin
  Result := HugeIntIsPositive(FValue);
end;

function THugeInt.IsOne: Boolean;
begin
  Result := HugeIntIsOne(FValue);
end;

function THugeInt.IsMinusOne: Boolean;
begin
  Result := HugeIntIsMinusOne(FValue);
end;

function THugeInt.IsOdd: Boolean;
begin
  Result := HugeIntIsOdd(FValue);
end;

function THugeInt.IsEven: Boolean;
begin
  Result := HugeIntIsEven(FValue);
end;

function THugeInt.Sign: Integer;
begin
  Result := HugeIntSign(FValue);
end;

procedure THugeInt.Negate;
begin
  HugeIntNegate(FValue);
end;

procedure THugeInt.Abs;
begin
  HugeIntAbsInPlace(FValue);
end;

function THugeInt.ToWord32: LongWord;
begin
  Result := HugeIntToWord32(FValue);
end;

function THugeInt.ToInt32: LongInt;
begin
  Result := HugeIntToInt32(FValue);
end;

function THugeInt.ToInt64: Int64;
begin
  Result := HugeIntToInt64(FValue);
end;

function THugeInt.Equals(const A: LongWord): Boolean;
begin
  Result := HugeIntEqualsWord32(FValue, A);
end;

function THugeInt.Equals(const A: LongInt): Boolean;
begin
  Result := HugeIntEqualsInt32(FValue, A);
end;

function THugeInt.Equals(const A: Int64): Boolean;
begin
  Result := HugeIntEqualsInt64(FValue, A);
end;

function THugeInt.Equals(const A: THugeInt): Boolean;
begin
  Assert(Assigned(A));
  Result := HugeIntEqualsHugeInt(FValue, A.FValue);
end;

function THugeInt.Compare(const A: LongWord): Integer;
begin
  Result := HugeIntCompareWord32(FValue, A);
end;

function THugeInt.Compare(const A: LongInt): Integer;
begin
  Result := HugeIntCompareInt32(FValue, A);
end;

function THugeInt.Compare(const A: Int64): Integer; 
begin
  Result := HugeIntCompareInt64(FValue, A);
end;

function THugeInt.Compare(const A: THugeInt): Integer; 
begin
  Assert(Assigned(A));
  Result := HugeIntCompareHugeInt(FValue, A.FValue);
end;

procedure THugeInt.Add(const A: LongInt);
begin
  HugeIntAddInt32(FValue, A);
end;

procedure THugeInt.Add(const A: THugeInt);
begin
  HugeIntAddHugeInt(FValue, A.FValue);
end;

procedure THugeInt.Inc;
begin
  HugeIntInc(FValue);
end;

procedure THugeInt.Subtract(const A: LongInt);
begin
  HugeIntSubtractInt32(FValue, A);
end;

procedure THugeInt.Subtract(const A: THugeInt);
begin
  HugeIntSubtractHugeInt(FValue, A.FValue);
end;

procedure THugeInt.Dec;
begin
  HugeIntDec(FValue);
end;

procedure THugeInt.Multiply(const A: LongInt);
begin
  HugeIntMultiplyInt32(FValue, A);
end;

procedure THugeInt.Multiply(const A: THugeInt);
begin
  HugeIntMultiplyHugeInt(FValue, A.FValue);
end;

procedure THugeInt.Sqr;
begin
  HugeIntSqr(FValue);
end;

procedure THugeInt.Divide(const B: LongInt; out R: LongInt);
begin
  HugeIntDivideInt32(FValue, B, FValue, R);
end;

procedure THugeInt.Divide(const B: THugeInt; var R: THugeInt);
begin
  HugeIntDivideHugeInt(FValue, B.FValue, FValue, R.FValue);
end;

procedure THugeInt.Power(const B: LongWord);
begin
  HugeIntPower(FValue, B);
end;

function THugeInt.ToStr: AnsiString;
begin
  Result := HugeIntToStr(FValue);
end;

function THugeInt.ToHex: AnsiString;
begin
  Result := HugeIntToHex(FValue);
end;

procedure THugeInt.AssignStr(const A: AnsiString);
begin
  StrToHugeInt(A, FValue);
end;

procedure THugeInt.AssignHex(const A: AnsiString);
begin
  HexToHugeInt(A, FValue);
end;

procedure THugeInt.ISqrt;
begin
  HugeIntISqrt(FValue);
end;

procedure THugeInt.Random(const Size: Integer);
begin
  HugeIntRandom(FValue, Size);
end;



{                                                                              }
{ Test cases                                                                   }
{                                                                              }
{$IFDEF DEBUG}{$ASSERTIONS ON}
{$IFDEF SELFTEST}
procedure SelfTest_HugeWord;
var A, B, C, D : HugeWord;
    X, Y : HugeInt;
    I : Integer;
    S : AnsiString;
    F : LongWord;
begin
  HugeWordInit(A);
  HugeWordInit(B);
  HugeWordInit(C);
  HugeWordInit(D);
  HugeIntInit(X);
  HugeIntInit(Y);

  // Zero
  HugeWordAssignZero(A);
  Assert(HugeWordGetSize(A) = 0);
  Assert(HugeWordIsZero(A));
  Assert(HugeWordToWord32(A) = 0);
  Assert(HugeWordToInt32(A) = 0);
  Assert(HugeWordToInt64(A) = 0);
  Assert(HugeWordCompareWord32(A, 0) = 0);
  Assert(HugeWordCompareWord32(A, 1) = -1);
  Assert(HugeWordCompare(A, A) = 0);
  Assert(HugeWordIsWord32Range(A));
  Assert(HugeWordIsWord64Range(A));
  Assert(HugeWordIsInt32Range(A));
  Assert(HugeWordIsInt64Range(A));
  Assert(HugeWordIsEven(A));
  Assert(not HugeWordIsOdd(A));
  Assert(HugeWordToStr(A) = '0');
  Assert(HugeWordToHex(A) = '00000000');

  // One
  HugeWordAssignOne(A);
  Assert(not HugeWordIsEven(A));
  Assert(HugeWordIsOdd(A));
  Assert(not HugeWordIsZero(A));
  Assert(HugeWordIsOne(A));
  Assert(HugeWordToInt32(A) = 1);
  Assert(HugeWordCompareWord32(A, 0) = 1);
  Assert(HugeWordToHex(A) = '00000001');

  // $FFFFFFFF
  HugeWordAssignZero(A);
  HugeWordAddWord32(A, $FFFFFFFF);
  Assert(HugeWordGetSize(A) = 1);
  Assert(HugeWordGetElement(A, 0) = $FFFFFFFF);
  Assert(HugeWordIsWord32Range(A));
  Assert(not HugeWordIsInt32Range(A));
  Assert(HugeWordIsInt64Range(A));
  Assert(HugeWordToWord32(A) = $FFFFFFFF);
  Assert(HugeWordToInt64(A) = $FFFFFFFF);
  Assert(not HugeWordIsZero(A));
  Assert(HugeWordCompareWord32(A, 0) = 1);
  HugeWordAddWord32(A, $FFFFFFFF);
  Assert(HugeWordGetSize(A) = 2);
  Assert((HugeWordGetElement(A, 0) = $FFFFFFFE) and (HugeWordGetElement(A, 1) = 1));
  Assert(not HugeWordIsWord32Range(A));
  Assert(HugeWordToInt64(A) = $1FFFFFFFE);
  HugeWordAddWord32(A, $FFFFFFFF);
  Assert(HugeWordGetSize(A) = 2);
  Assert((HugeWordGetElement(A, 0) = $FFFFFFFD) and (HugeWordGetElement(A, 1) = 2));
  Assert(HugeWordToInt64(A) = $2FFFFFFFD);
  Assert(HugeWordSubtractWord32(A, $FFFFFFFF) = 1);
  Assert(HugeWordGetSize(A) = 2);
  Assert((HugeWordGetElement(A, 0) = $FFFFFFFE) and (HugeWordGetElement(A, 1) = 1));
  Assert(HugeWordSubtractWord32(A, $FFFFFFFF) = 1);
  Assert(HugeWordToWord32(A) = $FFFFFFFF);
  Assert(HugeWordSubtractWord32(A, $FFFFFFFF) = 0);
  Assert(HugeWordToWord32(A) = 0);
  Assert(HugeWordSubtractWord32(A, $FFFFFFFF) = -1);
  Assert(HugeWordToWord32(A) = $FFFFFFFF);
  Assert(HugeWordToHex(A) = 'FFFFFFFF');

  // $80000000
  HugeWordAssignWord32(A, $80000000);
  Assert(HugeWordIsWord32Range(A));
  Assert(not HugeWordIsInt32Range(A));
  Assert(HugeWordIsInt64Range(A));
  Assert(HugeWordToWord32(A) = $80000000);
  Assert(HugeWordEqualsWord32(A, $80000000));
  HugeWordAdd(A, A);
  Assert(HugeWordToInt64(A) = $100000000);
  Assert(not HugeWordIsWord32Range(A));
  Assert(HugeWordEqualsInt64(A, $100000000));
  Assert(HugeWordToHex(A) = '0000000100000000');

  // $1234567890ABCDEF
  HugeWordAssignInt64(A, $1234567890ABCDEF);
  Assert(HugeWordToInt64(A) = $1234567890ABCDEF);
  Assert(not HugeWordIsWord32Range(A));
  Assert(not HugeWordIsZero(A));
  Assert(HugeWordIsInt64Range(A));
  Assert(HugeWordToHex(A) = '1234567890ABCDEF');

  // $7654321800000000
  HugeWordAssignInt64(A, $7654321800000000);
  Assert(HugeWordToInt64(A) = $7654321800000000);
  Assert(not HugeWordIsZero(A));
  Assert(not HugeWordIsWord32Range(A));
  Assert(not HugeWordIsInt32Range(A));
  Assert(HugeWordIsInt64Range(A));
  Assert(HugeWordToStr(A) = '8526495073179795456');
  Assert(HugeWordToHex(A) = '7654321800000000');

  // Swap
  HugeWordAssignInt32(A, 0);
  HugeWordAssignInt32(B, 1);
  HugeWordSwap(A, B);
  Assert(HugeWordToInt32(A) = 1);
  Assert(HugeWordToInt32(B) = 0);

  // Compare/Subtract
  HugeWordAssignZero(A);
  HugeWordAssignInt64(B, $FFFFFFFF);
  Assert(HugeWordToWord32(B) = $FFFFFFFF);
  Assert(HugeWordCompare(A, B) = -1);
  Assert(HugeWordCompare(B, A) = 1);
  Assert(HugeWordCompareWord32(B, $FFFFFFFF) = 0);
  Assert(HugeWordCompareWord32(B, 0) = 1);
  Assert(not HugeWordEquals(A, B));
  Assert(HugeWordEquals(B, B));
  HugeWordAdd(A, B);
  Assert(HugeWordGetSize(A) = 1);
  Assert(HugeWordGetElement(A, 0) = $FFFFFFFF);
  HugeWordAdd(A, B);
  Assert(HugeWordGetSize(A) = 2);
  Assert((HugeWordGetElement(A, 0) = $FFFFFFFE) and (HugeWordGetElement(A, 1) = 1));
  Assert(HugeWordCompare(A, B) = 1);
  Assert(HugeWordCompare(B, A) = -1);
  HugeWordAdd(A, B);
  Assert(HugeWordGetSize(A) = 2);
  Assert((HugeWordGetElement(A, 0) = $FFFFFFFD) and (HugeWordGetElement(A, 1) = 2));
  Assert(HugeWordSubtract(A, B) = 1);
  Assert(HugeWordGetSize(A) = 2);
  Assert((HugeWordGetElement(A, 0) = $FFFFFFFE) and (HugeWordGetElement(A, 1) = 1));
  Assert(HugeWordSubtract(A, B) = 1);
  Assert(HugeWordToWord32(A) = $FFFFFFFF);
  Assert(HugeWordSubtract(A, B) = 0);
  Assert(HugeWordToWord32(A) = 0);
  Assert(HugeWordSubtract(A, B) = -1);
  Assert(HugeWordToWord32(A) = $FFFFFFFF);

  // And/Or/Xor/Not
  HugeWordAssignInt64(A, $1234678FFFFFFFF);
  HugeWordAssignWord32(B, 0);
  HugeWordAndHugeWord(B, A);
  Assert(HugeWordToInt64(B) = 0);
  HugeWordOrHugeWord(B, A);
  Assert(HugeWordToInt64(B) = $1234678FFFFFFFF);
  HugeWordXorHugeWord(B, A);
  Assert(HugeWordToInt64(B) = 0);
  HugeWordAssignInt64(A, $FFFFFFFF);
  HugeWordNot(A);
  Assert(HugeWordToWord32(A) = 0);

  // Shl/Shr
  HugeWordAssignWord32(A, $101);
  HugeWordShr(A, 1);
  Assert(HugeWordToWord32(A) = $80);
  HugeWordShl(A, 1);
  Assert(HugeWordToWord32(A) = $100);

  // Shl1/Shl/Shr1/Shr
  HugeWordAssignWord32(A, 1);
  HugeWordAssignWord32(B, 1);
  for I := 0 to 50 do
    begin
      Assert(HugeWordToInt64(A) = Int64(1) shl I);
      Assert(HugeWordToInt64(B) = Int64(1) shl I);
      HugeWordShl1(A);
      HugeWordShl(B, 1);
    end;
  for I := 1 to 32 do
    HugeWordShl1(A);
  HugeWordShl(B, 32);
  Assert(HugeWordEquals(A, B));
  for I := 1 to 1000 do
    HugeWordShl1(A);
  HugeWordShl(B, 1000);
  Assert(HugeWordEquals(A, B));
  for I := 1 to 1032 do
    HugeWordShr1(A);
  HugeWordShr(B, 1000);
  HugeWordShr(B, 32);
  HugeWordNormalise(A);
  HugeWordNormalise(B);
  Assert(HugeWordEquals(A, B));
  for I := 51 downto 1 do
    begin
      Assert(HugeWordToInt64(A) = Int64(1) shl I);
      Assert(HugeWordToInt64(B) = Int64(1) shl I);
      HugeWordShr1(A);
      HugeWordShr(B, 1);
      HugeWordNormalise(A);
      HugeWordNormalise(B);
    end;

  // Add/Subtract
  HugeWordAssignZero(A);
  HugeWordAddWord32(A, 1);
  Assert(HugeWordToWord32(A) = 1);
  Assert(HugeWordSubtractWord32(A, 1) = 0);
  Assert(HugeWordToWord32(A) = 0);
  Assert(HugeWordSubtractWord32(A, 1) = -1);
  Assert(HugeWordToWord32(A) = 1);

  // Add/Subtract
  HugeWordAssignZero(A);
  HugeWordAssignWord32(B, 1);
  HugeWordAdd(A, B);
  Assert(HugeWordToWord32(A) = 1);
  Assert(HugeWordSubtract(A, B) = 0);
  Assert(HugeWordToWord32(A) = 0);
  Assert(HugeWordSubtract(A, B) = -1);
  Assert(HugeWordToWord32(A) = 1);

  // Add/Subtract
  HugeWordAssignInt64(A, $FFFFFFFF);
  HugeWordAddWord32(A, 1);
  Assert(HugeWordGetSize(A) = 2);
  Assert((HugeWordGetElement(A, 0) = 0) and (HugeWordGetElement(A, 1) = 1));
  Assert(HugeWordSubtractWord32(A, 1) = 1);
  Assert(HugeWordToWord32(A) = $FFFFFFFF);
  Assert(HugeWordSubtractWord32(A, 1) = 1);
  Assert(HugeWordToWord32(A) = $FFFFFFFE);

  // Add/Subtract
  HugeWordAssignInt64(A, $FFFFFFFF);
  HugeWordAssignWord32(B, 1);
  HugeWordAdd(A, B);
  Assert(HugeWordGetSize(A) = 2);
  Assert((HugeWordGetElement(A, 0) = 0) and (HugeWordGetElement(A, 1) = 1));
  Assert(HugeWordSubtract(A, B) = 1);
  Assert(HugeWordToWord32(A) = $FFFFFFFF);
  Assert(HugeWordSubtract(A, B) = 1);
  Assert(HugeWordToWord32(A) = $FFFFFFFE);

  // Add/Subtract
  StrToHugeWord('111111111111111111111111111111111111111111111111111111111', A);
  StrToHugeWord('222222222222222222222222222222222222222222222222222222222', B);
  HugeWordAdd(A, B);
  Assert(HugeWordToStr(A) = '333333333333333333333333333333333333333333333333333333333');

  // Multiply/Divide
  HugeWordAssignWord32(A, $10000000);
  HugeWordAssignWord32(B, $20000000);
  HugeWordMultiply(C, A, B);
  Assert(HugeWordToInt64(C) = $200000000000000);
  HugeWordDivide(C, B, D, C);
  Assert(HugeWordToInt64(D) = $10000000);
  Assert(HugeWordIsZero(C));

  // Multiply/Divide
  StrToHugeWord('111111111111111111111111111111111111', A);
  StrToHugeWord('100000000000000000000000000000000000', B);
  HugeWordMultiply(C, A, B);
  Assert(HugeWordToStr(C) = '11111111111111111111111111111111111100000000000000000000000000000000000');
  HugeWordDivide(C, B, D, C);
  Assert(HugeWordToStr(D) = '111111111111111111111111111111111111');
  Assert(HugeWordToStr(C) = '0');
  HugeWordMultiplyWord8(D, 10);
  Assert(HugeWordToStr(D) = '1111111111111111111111111111111111110');
  HugeWordMultiplyWord16(D, 100);
  Assert(HugeWordToStr(D) = '111111111111111111111111111111111111000');
  HugeWordMultiplyWord32(D, 1000);
  Assert(HugeWordToStr(D) = '111111111111111111111111111111111111000000');
  HugeWordDivideWord32(D, 1000000, D, F);
  Assert(HugeWordToStr(D) = '111111111111111111111111111111111111');
  Assert(F = 0);

  // ISqrt/Sqr
  HugeWordAssignWord32(A, $FFFF);
  HugeWordISqrt(A);
  Assert(HugeWordToInt64(A) = $FF);
  HugeWordAssignWord32(A, $10000);
  HugeWordISqrt(A);
  Assert(HugeWordToInt64(A) = $100);
  HugeWordAssignInt64(A, $FFFFFFFF);
  HugeWordISqrt(A);
  Assert(HugeWordToInt64(A) = $FFFF);
  HugeWordAssignInt64(A, $100000000);
  HugeWordISqrt(A);
  Assert(HugeWordToInt64(A) = $10000);
  HugeWordAssignInt64(A, $10000FFFF);
  HugeWordISqrt(A);
  Assert(HugeWordToInt64(A) = $10000);
  StrToHugeWord('10000000000000000000000000000000000000000', A);
  HugeWordISqrt(A);
  Assert(HugeWordToStr(A) = '100000000000000000000');
  HugeWordSqr(A, A);
  Assert(HugeWordToStr(A) = '10000000000000000000000000000000000000000');
  HugeWordAssignWord32(A, $10000000);
  HugeWordSqr(A, A);
  Assert(HugeWordToInt64(A) = $100000000000000);
  HugeWordISqrt(A);
  Assert(HugeWordToInt64(A) = $10000000);

  // GCD
  HugeWordAssignWord32(A, 111);
  HugeWordAssignWord32(B, 159);
  HugeWordGCD(A, B, C);
  Assert(HugeWordToStr(C) = '3');

  // GCD
  StrToHugeWord('359334085968622831041960188598043661065388726959079837', A);   // Bell number prime
  StrToHugeWord('1298074214633706835075030044377087', B);                       // Carol prime
  HugeWordGCD(A, B, C);
  Assert(HugeWordToStr(C) = '1');

  // PowerAndMod
  HugeWordAssignWord32(A, 3);
  HugeWordAssignWord32(B, 500);
  HugeWordAssignWord32(C, 5);
  HugeWordPowerAndMod(D, A, B, C);
  Assert(HugeWordToStr(D) = '1');

  // PowerAndMod
  HugeWordAssignWord32(A, 3);
  HugeWordAssignWord32(B, 123456);
  HugeWordAssignWord32(C, 7);
  HugeWordPowerAndMod(D, A, B, C);
  Assert(HugeWordToStr(D) = '1');

  // PowerAndMod
  HugeWordAssignWord32(A, 2905);
  HugeWordAssignWord32(B, 323);
  HugeWordAssignWord32(C, 245363);
  HugeWordPowerAndMod(D, A, B, C);
  Assert(HugeWordToStr(D) = '13388');

  // PowerAndMod
  StrToHugeWord('9999999999', A);
  HugeWordAssignWord32(B, 10);
  HugeWordPower(B, 100);
  HugeWordAssignWord32(C, 700);
  HugeWordPowerAndMod(D, A, B, C);
  Assert(HugeWordToStr(D) = '501');

  // Power/Mod
  HugeWordAssignWord32(A, 3);
  HugeWordAssignWord32(C, 5);
  HugeWordPower(A, 500);
  Assert(HugeWordToStr(A) =
      '36360291795869936842385267079543319118023385026001623040346035832580600191583895' +
      '48419850826297938878330817970253440385575285593151701306614299243091656202578002' +
      '1771247847643450125342836565813209972590371590152578728008385990139795377610001');
  HugeWordMod(A, C, D);
  Assert(HugeWordToStr(D) = '1');

  // Power/Mod
  HugeWordAssignWord32(A, 3);
  HugeWordAssignWord32(C, 7);
  HugeWordPower(A, 123456);
  HugeWordMod(A, C, D);
  Assert(HugeWordToStr(D) = '1');

  // Power
  HugeWordAssignZero(A);
  HugeWordPower(A, 0);
  Assert(HugeWordToInt32(A) = 1);
  HugeWordAssignZero(A);
  HugeWordPower(A, 1);
  Assert(HugeWordToInt32(A) = 0);
  HugeWordAssignOne(A);
  HugeWordPower(A, 0);
  Assert(HugeWordToInt32(A) = 1);
  HugeWordAssignOne(A);
  HugeWordPower(A, 1);
  Assert(HugeWordToInt32(A) = 1);

  // HexTo/ToHex
  HexToHugeWord('0', A);
  Assert(HugeWordToHex(A) = '00000000');
  StrToHugeWord('123456789', A);
  Assert(HugeWordToHex(A) = '075BCD15');
  HexToHugeWord('123456789ABCDEF', A);
  Assert(HugeWordToHex(A) = '0123456789ABCDEF');
  Assert(HugeWordToStr(A) = '81985529216486895');
  HexToHugeWord('0123456789ABCDEF00112233F', A);
  Assert(HugeWordToHex(A) = '00000000123456789ABCDEF00112233F');

  // StrTo/ToStr
  StrToHugeWord('12345', A);
  Assert(HugeWordToWord32(A) = 12345);
  Assert(HugeWordToStr(A) = '12345');

  // StrTo/ToStr
  S := '123456789012345678901234567890123456789012345678901234567890';
  StrToHugeWord(S, A);
  for I := 1 to 100 do
    begin
      HugeWordMultiplyWord8(A, 10);
      S := S + '0';
      Assert(HugeWordToStr(A) = S);
      StrToHugeWord(S, B);
      Assert(HugeWordEquals(A, B));
    end;

  // Prime
  HugeWordAssignWord32(A, 1);
  Assert(HugeWordIsPrime(A) = pNotPrime);
  HugeWordAssignWord32(A, 31);
  Assert(HugeWordIsPrime(A) = pPrime);
  HugeWordAssignWord32(A, 982451653);
  Assert(HugeWordIsPrime(A) <> pNotPrime);
  HugeWordAssignWord32(A, 3464946713);
  Assert(HugeWordIsPrime(A) <> pNotPrime);
  HugeWordAssignWord32(A, 3464946767);
  Assert(HugeWordIsPrime(A) = pNotPrime);
  HugeWordAssignWord32(A, 3464946769);
  Assert(HugeWordIsPrime(A) <> pNotPrime);
  StrToHugeWord('359334085968622831041960188598043661065388726959079837', A);     // Bell number prime
  Assert(HugeWordIsPrime(A) <> pNotPrime);
  StrToHugeWord('1298074214633706835075030044377087', A);                         // Carol prime
  Assert(HugeWordIsPrime(A) <> pNotPrime);
  StrToHugeWord('393050634124102232869567034555427371542904833', A);              // Cullen prime
  Assert(HugeWordIsPrime(A) <> pNotPrime);
  StrToHugeWord('8683317618811886495518194401279999999', A);                      // Factorial prime
  Assert(HugeWordIsPrime(A) <> pNotPrime);
  StrToHugeWord('19134702400093278081449423917', A);                              // Fibonacci prime
  Assert(HugeWordIsPrime(A) <> pNotPrime);
  StrToHugeWord('1363005552434666078217421284621279933627102780881053358473', A); // Padovan prime
  Assert(HugeWordIsPrime(A) <> pNotPrime);
  StrToHugeWord('1363005552434666078217421284621279933627102780881053358473', A); // Padovan prime
  HugeWordNextPotentialPrime(A);
  Assert(HugeWordToStr(A) = '1363005552434666078217421284621279933627102780881053358551');

  // ExtendedEuclid
  HugeWordAssignWord32(A, 120);
  HugeWordAssignWord32(B, 23);
  HugeWordExtendedEuclid(A, B, C, X, Y);
  Assert(HugeWordToWord32(C) = 1);
  Assert(HugeIntToInt32(X) = -9);
  Assert(HugeIntToInt32(Y) = 47);

  // ExtendedEuclid
  HugeWordAssignWord32(A, 11391);
  HugeWordAssignWord32(B, 5673);
  HugeWordExtendedEuclid(A, B, C, X, Y);
  Assert(HugeWordToWord32(C) = 3);
  Assert(HugeIntToInt32(X) = -126);
  Assert(HugeIntToInt32(Y) = 253);

  // ModInv
  HugeWordAssignWord32(A, 3);
  HugeWordAssignWord32(B, 26);
  Assert(HugeWordModInv(A, B, C));
  Assert(HugeWordToWord32(C) = 9);

  // ModInv
  HugeWordAssignWord32(A, 6);
  HugeWordAssignWord32(B, 3);
  Assert(not HugeWordModInv(A, B, C));

  // ModInv
  HugeWordAssignWord32(A, 31);
  HugeWordAssignWord32(B, 8887231);
  Assert(HugeWordModInv(A, B, C));
  Assert(HugeWordToWord32(C) = 2293479);

  // ModInv
  HugeWordAssignWord32(A, 999961543);
  StrToHugeWord('3464946713311', B);
  Assert(HugeWordModInv(A, B, C));
  Assert(HugeWordToStr(C) = '2733464305244');

  HugeIntFinalise(Y);
  HugeIntFinalise(X);
  HugeWordFinalise(D);
  HugeWordFinalise(C);
  HugeWordFinalise(B);
  HugeWordFinalise(A);
end;

procedure SelfTest_HugeInt;
var A, B, C, D : HugeInt;
    F : HugeWord;
    K : LongWord;
    L : LongInt;
begin
  HugeIntInit(A);
  HugeIntInit(B);
  HugeIntInit(C);
  HugeIntInit(D);
  HugeWordInit(F);

  // Zero
  HugeIntAssignZero(A);
  Assert(HugeIntIsZero(A));
  Assert(HugeIntIsPositiveOrZero(A));
  Assert(HugeIntIsNegativeOrZero(A));
  Assert(not HugeIntIsPositive(A));
  Assert(not HugeIntIsNegative(A));
  Assert(HugeIntIsInt32Range(A));
  Assert(HugeIntIsWord32Range(A));
  Assert(HugeIntToStr(A) = '0');
  Assert(HugeIntToHex(A) = '00000000');
  Assert(HugeIntToWord32(A) = 0);
  Assert(HugeIntToInt32(A) = 0);
  StrToHugeInt('0', A);
  Assert(HugeIntIsZero(A));
  Assert(HugeIntCompareInt64(A, MinInt64 { -$8000000000000000 }) = 1);
  Assert(HugeIntCompareInt64(A, $7FFFFFFFFFFFFFFF) = -1);
  Assert(not HugeIntEqualsInt64(A, MinInt64 { -$8000000000000000 }));
  HugeIntAddInt32(A, 0);
  Assert(HugeIntIsZero(A));
  HugeIntSubtractInt32(A, 0);
  Assert(HugeIntIsZero(A));
  HugeIntMultiplyInt8(A, 0);
  Assert(HugeIntIsZero(A));
  HugeIntMultiplyInt8(A, 1);
  Assert(HugeIntIsZero(A));
  HugeIntMultiplyInt8(A, -1);
  Assert(HugeIntIsZero(A));
  HugeIntMultiplyWord8(A, 0);
  Assert(HugeIntIsZero(A));
  HugeIntMultiplyWord8(A, 1);
  Assert(HugeIntIsZero(A));
  HugeIntMultiplyHugeWord(A, F);
  Assert(HugeIntIsZero(A));
  HugeIntMultiplyHugeInt(A, A);
  Assert(HugeIntIsZero(A));
  HugeIntSqr(A);
  Assert(HugeIntIsZero(A));
  HugeIntISqrt(A);
  Assert(HugeIntIsZero(A));

  // One
  HugeIntAssignOne(A);
  Assert(not HugeIntIsZero(A));
  Assert(HugeIntIsPositiveOrZero(A));
  Assert(not HugeIntIsNegativeOrZero(A));
  Assert(HugeIntIsOne(A));
  Assert(not HugeIntIsMinusOne(A));
  Assert(HugeIntToStr(A) = '1');
  Assert(HugeIntToHex(A) = '00000001');
  Assert(HugeIntIsPositive(A));
  Assert(not HugeIntIsNegative(A));
  Assert(HugeIntIsInt32Range(A));
  Assert(HugeIntIsWord32Range(A));
  StrToHugeInt('1', A);
  Assert(HugeIntIsOne(A));
  Assert(HugeIntCompareInt64(A, MinInt64 { -$8000000000000000 }) = 1);
  Assert(HugeIntCompareInt64(A, $7FFFFFFFFFFFFFFF) = -1);
  Assert(not HugeIntEqualsInt64(A, MinInt64 { -$8000000000000000 }));
  HugeIntAddInt32(A, 0);
  Assert(HugeIntIsOne(A));
  HugeIntSubtractInt32(A, 0);
  Assert(HugeIntIsOne(A));
  HugeIntMultiplyInt8(A, 1);
  Assert(HugeIntIsOne(A));
  HugeIntMultiplyInt8(A, -1);
  Assert(HugeIntIsMinusOne(A));
  HugeIntMultiplyInt8(A, -1);
  Assert(HugeIntIsOne(A));
  HugeIntMultiplyWord8(A, 1);
  Assert(HugeIntIsOne(A));
  HugeIntSqr(A);
  Assert(HugeIntIsOne(A));
  HugeIntISqrt(A);
  Assert(HugeIntIsOne(A));

  // MinusOne
  HugeIntAssignMinusOne(A);
  Assert(not HugeIntIsZero(A));
  Assert(not HugeIntIsPositiveOrZero(A));
  Assert(HugeIntIsNegativeOrZero(A));
  Assert(not HugeIntIsOne(A));
  Assert(HugeIntIsMinusOne(A));
  Assert(HugeIntToStr(A) = '-1');
  Assert(HugeIntToHex(A) = '-00000001');
  Assert(not HugeIntIsPositive(A));
  Assert(HugeIntIsNegative(A));
  Assert(HugeIntIsInt32Range(A));
  Assert(HugeIntIsInt64Range(A));
  Assert(not HugeIntIsWord32Range(A));
  StrToHugeInt('-1', A);
  Assert(HugeIntIsMinusOne(A));
  Assert(HugeIntCompareInt64(A, MinInt64 { -$8000000000000000 }) = 1);
  Assert(HugeIntCompareInt64(A, $7FFFFFFFFFFFFFFF) = -1);
  Assert(not HugeIntEqualsInt64(A, MinInt64 { -$8000000000000000 }));
  HugeIntMultiplyInt8(A, 1);
  Assert(HugeIntIsMinusOne(A));
  HugeIntAddWord32(A, 1);
  Assert(HugeIntIsZero(A));
  HugeIntAddInt32(A, -1);
  Assert(HugeIntIsMinusOne(A));
  HugeIntAddInt32(A, 0);
  Assert(HugeIntIsMinusOne(A));
  HugeIntSubtractInt32(A, 0);
  Assert(HugeIntIsMinusOne(A));
  HugeWordAssignHugeIntAbs(F, A);
  Assert(HugeWordIsOne(F));

  // MinInt64 (-$8000000000000000)
  HugeIntAssignInt64(A, MinInt64 { -$8000000000000000 });
  Assert(HugeIntToInt64(A) = MinInt64 { -$8000000000000000 });
  Assert(HugeIntToStr(A) = '-9223372036854775808');
  Assert(HugeIntToHex(A) = '-8000000000000000');
  Assert(HugeIntEqualsInt64(A, MinInt64 { -$8000000000000000 }));
  Assert(not HugeIntEqualsInt64(A, MinInt32 { -$80000000 }));
  Assert(HugeIntCompareInt64(A, MinInt64 { -$8000000000000000 }) = 0);
  Assert(HugeIntCompareInt64(A, -$7FFFFFFFFFFFFFFF) = -1);
  Assert(not HugeIntIsInt32Range(A));
  Assert(HugeIntIsInt64Range(A));
  StrToHugeInt('-9223372036854775808', A);
  Assert(HugeIntToStr(A) = '-9223372036854775808');
  HugeIntAbsInPlace(A);
  Assert(HugeIntToStr(A) = '9223372036854775808');
  Assert(HugeIntToHex(A) = '8000000000000000');
  Assert(not HugeIntEqualsInt64(A, MinInt64 { -$8000000000000000 }));
  Assert(HugeIntCompareInt64(A, MinInt64 { -$8000000000000000 }) = 1);
  Assert(not HugeIntIsInt64Range(A));
  HugeIntNegate(A);
  Assert(HugeIntToInt64(A) = MinInt64 { -$8000000000000000 });

  // MinInt64 + 1 (-$7FFFFFFFFFFFFFFF)
  HugeIntAssignInt64(A, -$7FFFFFFFFFFFFFFF);
  Assert(HugeIntToInt64(A) = -$7FFFFFFFFFFFFFFF);
  Assert(HugeIntToStr(A) = '-9223372036854775807');
  Assert(HugeIntToHex(A) = '-7FFFFFFFFFFFFFFF');
  Assert(HugeIntEqualsInt64(A, -$7FFFFFFFFFFFFFFF));
  Assert(not HugeIntEqualsInt64(A, MinInt64 { -$8000000000000000 }));
  Assert(HugeIntCompareInt64(A, -$7FFFFFFFFFFFFFFE) = -1);
  Assert(HugeIntCompareInt64(A, -$7FFFFFFFFFFFFFFF) = 0);
  Assert(HugeIntCompareInt64(A, MinInt64 { -$8000000000000000 }) = 1);
  Assert(HugeIntIsInt64Range(A));
  HugeIntAbsInPlace(A);
  Assert(HugeIntToStr(A) = '9223372036854775807');
  Assert(HugeIntToHex(A) = '7FFFFFFFFFFFFFFF');
  Assert(HugeIntToInt64(A) = $7FFFFFFFFFFFFFFF);
  Assert(HugeIntEqualsInt64(A, $7FFFFFFFFFFFFFFF));
  Assert(not HugeIntEqualsInt64(A, MinInt64 { -$8000000000000000 }));
  Assert(HugeIntCompareInt64(A, MinInt64 { -$8000000000000000 }) = 1);
  Assert(HugeIntIsInt64Range(A));
  HugeIntNegate(A);
  Assert(HugeIntToInt64(A) = -$7FFFFFFFFFFFFFFF);

  // MinInt64 - 1 (-$8000000000000001)
  HugeIntAssignInt64(A, MinInt64 { -$8000000000000000 });
  HugeIntSubtractInt32(A, 1);
  Assert(HugeIntToStr(A) = '-9223372036854775809');
  Assert(HugeIntToHex(A) = '-8000000000000001');
  Assert(not HugeIntEqualsInt64(A, MinInt64 { -$8000000000000000 }));
  Assert(HugeIntCompareInt64(A, MinInt64 { -$8000000000000000 }) = -1);
  Assert(not HugeIntIsInt64Range(A));
  HugeIntAbsInPlace(A);
  Assert(HugeIntToStr(A) = '9223372036854775809');
  Assert(not HugeIntEqualsInt64(A, MinInt64 { -$8000000000000000 }));
  Assert(HugeIntCompareInt64(A, MinInt64 { -$8000000000000000 }) = 1);
  HugeIntNegate(A);
  Assert(HugeIntToStr(A) = '-9223372036854775809');

  // Equals/Compare
  HugeIntAssignInt32(A, -1);
  HugeIntAssignWord32(B, 2);
  HugeIntAssignZero(C);
  Assert(HugeIntEqualsInt32(A, -1));
  Assert(not HugeIntEqualsInt32(A, 1));
  Assert(HugeIntEqualsWord32(B, 2));
  Assert(HugeIntEqualsInt32(B, 2));
  Assert(not HugeIntEqualsInt32(B, -2));
  Assert(HugeIntEqualsInt32(C, 0));
  Assert(HugeIntEqualsWord32(C, 0));
  Assert(not HugeIntEqualsWord32(C, 1));
  Assert(HugeIntEqualsInt64(C, 0));
  Assert(not HugeIntEqualsInt64(A, 1));
  Assert(HugeIntCompareWord32(A, 0) = -1);
  Assert(HugeIntCompareWord32(A, 1) = -1);
  Assert(HugeIntCompareWord32(B, 1) = 1);
  Assert(HugeIntCompareWord32(B, 2) = 0);
  Assert(HugeIntCompareWord32(C, 0) = 0);
  Assert(HugeIntCompareWord32(C, 1) = -1);
  Assert(HugeIntCompareInt32(A, 0) = -1);
  Assert(HugeIntCompareInt32(A, -1) = 0);
  Assert(HugeIntCompareInt32(A, -2) = 1);
  Assert(HugeIntCompareInt32(C, -1) = 1);
  Assert(HugeIntCompareInt32(C, 0) = 0);
  Assert(HugeIntCompareInt32(C, 1) = -1);
  Assert(HugeIntCompareInt64(A, 0) = -1);
  Assert(HugeIntCompareInt64(A, -1) = 0);
  Assert(HugeIntCompareInt64(A, -2) = 1);
  Assert(HugeIntCompareInt64(C, 0) = 0);
  Assert(HugeIntCompareInt64(C, 1) = -1);
  Assert(not HugeIntEqualsHugeInt(A, B));
  Assert(not HugeIntEqualsHugeInt(B, C));
  Assert(HugeIntEqualsHugeInt(A, A));
  Assert(HugeIntEqualsHugeInt(B, B));
  Assert(HugeIntEqualsHugeInt(C, C));
  Assert(HugeIntCompareHugeInt(A, B) = -1);
  Assert(HugeIntCompareHugeInt(B, A) = 1);
  Assert(HugeIntCompareHugeInt(A, A) = 0);
  Assert(HugeIntCompareHugeInt(B, B) = 0);
  Assert(HugeIntCompareHugeInt(C, A) = 1);
  Assert(HugeIntCompareHugeInt(C, B) = -1);
  Assert(HugeIntCompareHugeInt(C, C) = 0);
  Assert(HugeIntCompareHugeInt(A, C) = -1);
  Assert(HugeIntCompareHugeInt(B, C) = 1);
  Assert(HugeIntCompareHugeIntAbs(A, B) = -1);
  Assert(HugeIntCompareHugeIntAbs(B, A) = 1);
  Assert(HugeIntCompareHugeIntAbs(A, C) = 1);
  Assert(HugeIntCompareHugeIntAbs(B, C) = 1);
  Assert(HugeIntCompareHugeIntAbs(C, A) = -1);
  Assert(HugeIntCompareHugeIntAbs(C, B) = -1);
  Assert(HugeIntCompareHugeIntAbs(A, A) = 0);
  Assert(HugeIntCompareHugeIntAbs(B, B) = 0);
  Assert(HugeIntCompareHugeIntAbs(C, C) = 0);

  // Min/Max
  HugeIntAssignInt32(A, -1);
  HugeIntAssignInt32(B, 0);
  HugeIntAssignInt32(C, 1);
  HugeIntMin(A, B);
  Assert(HugeIntToInt32(A) = -1);
  HugeIntMin(B, A);
  Assert(HugeIntToInt32(B) = -1);
  HugeIntMax(C, A);
  Assert(HugeIntToInt32(C) = 1);
  HugeIntMax(A, C);
  Assert(HugeIntToInt32(A) = 1);

  // Swap
  HugeIntAssignInt32(A, 0);
  HugeIntAssignInt32(B, 1);
  HugeIntSwap(A, B);
  Assert(HugeIntToInt32(A) = 1);
  Assert(HugeIntToInt32(B) = 0);

  // Add/Subtract
  HugeIntAssignInt32(A, 0);
  HugeIntAssignInt32(B, 1);
  HugeIntAssignInt32(C, -1);
  HugeIntAddHugeInt(A, B);
  Assert(HugeIntToInt32(A) = 1);
  HugeIntAddHugeInt(A, B);
  Assert(HugeIntToInt32(A) = 2);
  HugeIntAddHugeInt(A, C);
  Assert(HugeIntToInt32(A) = 1);
  HugeIntAddHugeInt(A, C);
  Assert(HugeIntToInt32(A) = 0);
  HugeIntAddHugeInt(A, C);
  Assert(HugeIntToInt32(A) = -1);
  HugeIntAddHugeInt(A, C);
  Assert(HugeIntToInt32(A) = -2);
  HugeIntAddHugeInt(A, B);
  Assert(HugeIntToInt32(A) = -1);
  HugeIntAddHugeInt(A, B);
  Assert(HugeIntToInt32(A) = 0);
  HugeIntAddHugeInt(A, B);
  Assert(HugeIntToInt32(A) = 1);
  HugeIntSubtractHugeInt(A, B);
  Assert(HugeIntToInt32(A) = 0);
  HugeIntSubtractHugeInt(A, B);
  Assert(HugeIntToInt32(A) = -1);
  HugeIntSubtractHugeInt(A, B);
  Assert(HugeIntToInt32(A) = -2);
  HugeIntSubtractHugeInt(A, C);
  Assert(HugeIntToInt32(A) = -1);
  HugeIntSubtractHugeInt(A, C);
  Assert(HugeIntToInt32(A) = 0);
  HugeIntSubtractHugeInt(A, C);
  Assert(HugeIntToInt32(A) = 1);
  HugeIntSubtractHugeInt(A, C);
  Assert(HugeIntToInt32(A) = 2);

  // Add/Subtract
  HugeIntAssignInt32(A, 0);
  HugeIntAddInt32(A, 1);
  Assert(HugeIntToInt32(A) = 1);
  HugeIntAddInt32(A, -1);
  Assert(HugeIntToInt32(A) = 0);
  HugeIntAddInt32(A, -1);
  Assert(HugeIntToInt32(A) = -1);
  HugeIntAddInt32(A, -1);
  Assert(HugeIntToInt32(A) = -2);
  HugeIntAddInt32(A, 1);
  Assert(HugeIntToInt32(A) = -1);
  HugeIntAddInt32(A, 1);
  Assert(HugeIntToInt32(A) = 0);
  HugeIntAddInt32(A, 1);
  Assert(HugeIntToInt32(A) = 1);
  HugeIntAddInt32(A, 1);
  Assert(HugeIntToInt32(A) = 2);
  HugeIntSubtractInt32(A, 1);
  Assert(HugeIntToInt32(A) = 1);
  HugeIntSubtractInt32(A, 1);
  Assert(HugeIntToInt32(A) = 0);
  HugeIntSubtractInt32(A, 1);
  Assert(HugeIntToInt32(A) = -1);
  HugeIntSubtractInt32(A, 1);
  Assert(HugeIntToInt32(A) = -2);
  HugeIntSubtractInt32(A, -1);
  Assert(HugeIntToInt32(A) = -1);
  HugeIntSubtractInt32(A, -1);
  Assert(HugeIntToInt32(A) = 0);
  HugeIntSubtractInt32(A, -1);
  Assert(HugeIntToInt32(A) = 1);
  HugeIntSubtractInt32(A, -1);
  Assert(HugeIntToInt32(A) = 2);

  // Add/Subtract
  HugeIntAssignInt32(A, -1);
  HugeIntAddWord32(A, 1);
  Assert(HugeIntToInt32(A) = 0);
  HugeIntAddWord32(A, 1);
  Assert(HugeIntToInt32(A) = 1);
  HugeIntAddWord32(A, 1);
  Assert(HugeIntToInt32(A) = 2);
  HugeIntSubtractWord32(A, 1);
  Assert(HugeIntToInt32(A) = 1);
  HugeIntSubtractWord32(A, 1);
  Assert(HugeIntToInt32(A) = 0);
  HugeIntSubtractWord32(A, 1);
  Assert(HugeIntToInt32(A) = -1);
  HugeIntSubtractWord32(A, 1);
  Assert(HugeIntToInt32(A) = -2);

  // Multiply
  HugeIntAssignInt32(A, 10);
  HugeIntMultiplyWord8(A, 10);
  Assert(HugeIntToInt32(A) = 100);
  HugeIntMultiplyWord16(A, 10);
  Assert(HugeIntToInt32(A) = 1000);
  HugeIntMultiplyWord32(A, 10);
  Assert(HugeIntToInt32(A) = 10000);
  HugeIntAssignInt32(A, -10);
  HugeIntMultiplyWord8(A, 10);
  Assert(HugeIntToInt32(A) = -100);
  HugeIntMultiplyWord16(A, 10);
  Assert(HugeIntToInt32(A) = -1000);
  HugeIntMultiplyWord32(A, 10);
  Assert(HugeIntToInt32(A) = -10000);

  // Multiply
  HugeIntAssignInt32(A, -10);
  HugeIntMultiplyInt8(A, -10);
  Assert(HugeIntToInt32(A) = 100);
  HugeIntMultiplyInt8(A, 10);
  Assert(HugeIntToInt32(A) = 1000);
  HugeIntMultiplyInt8(A, -10);
  Assert(HugeIntToInt32(A) = -10000);
  HugeIntMultiplyInt8(A, 10);
  Assert(HugeIntToInt32(A) = -100000);
  HugeIntMultiplyInt8(A, 0);
  Assert(HugeIntToInt32(A) = 0);

  // Multiply
  HugeIntAssignInt32(A, -10);
  HugeIntMultiplyInt16(A, -10);
  Assert(HugeIntToInt32(A) = 100);
  HugeIntMultiplyInt16(A, 10);
  Assert(HugeIntToInt32(A) = 1000);
  HugeIntMultiplyInt16(A, -10);
  Assert(HugeIntToInt32(A) = -10000);
  HugeIntMultiplyInt16(A, 10);
  Assert(HugeIntToInt32(A) = -100000);
  HugeIntMultiplyInt16(A, 0);
  Assert(HugeIntToInt32(A) = 0);

  // Multiply
  HugeIntAssignInt32(A, -10);
  HugeIntMultiplyInt32(A, -10);
  Assert(HugeIntToInt32(A) = 100);
  HugeIntMultiplyInt32(A, 10);
  Assert(HugeIntToInt32(A) = 1000);
  HugeIntMultiplyInt32(A, -10);
  Assert(HugeIntToInt32(A) = -10000);
  HugeIntMultiplyInt32(A, 10);
  Assert(HugeIntToInt32(A) = -100000);
  HugeIntMultiplyInt32(A, 0);
  Assert(HugeIntToInt32(A) = 0);

  // Multiply
  HugeIntAssignInt32(A, 10);
  HugeIntAssignInt32(B, 10);
  HugeIntAssignInt32(C, -10);
  HugeIntMultiplyHugeInt(A, B);
  Assert(HugeIntToInt32(A) = 100);
  HugeIntMultiplyHugeInt(A, C);
  Assert(HugeIntToInt32(A) = -1000);
  HugeIntMultiplyHugeInt(A, B);
  Assert(HugeIntToInt32(A) = -10000);
  HugeIntMultiplyHugeInt(A, C);
  Assert(HugeIntToInt32(A) = 100000);
  HugeIntAssignInt32(B, 1);
  HugeIntMultiplyHugeInt(A, B);
  Assert(HugeIntToInt32(A) = 100000);
  HugeIntAssignInt32(B, -1);
  HugeIntMultiplyHugeInt(A, B);
  Assert(HugeIntToInt32(A) = -100000);
  HugeIntAssignInt32(B, 0);
  HugeIntMultiplyHugeInt(A, B);
  Assert(HugeIntToInt32(A) = 0);

  // Multiply
  HugeIntAssignInt32(A, 10);
  HugeWordAssignWord32(F, 10);
  HugeIntMultiplyHugeWord(A, F);
  Assert(HugeIntToInt32(A) = 100);
  HugeIntAssignInt32(A, -10);
  HugeIntMultiplyHugeWord(A, F);
  Assert(HugeIntToInt32(A) = -100);

  // Sqr
  HugeIntAssignInt32(A, -17);
  HugeIntSqr(A);
  Assert(HugeIntToInt32(A) = 289);

  // ISqrt
  HugeIntAssignInt32(A, 289);
  HugeIntISqrt(A);
  Assert(HugeIntToInt32(A) = 17);

  // Divide
  HugeIntAssignInt32(A, -1000);
  HugeIntDivideWord32(A, 3, B, K);
  Assert(HugeIntToInt32(B) = -333);
  Assert(K = 1);

  // Divide
  HugeIntAssignInt32(A, -1000);
  HugeIntDivideInt32(A, 3, B, L);
  Assert(HugeIntToInt32(B) = -333);
  Assert(L = 1);
  HugeIntDivideInt32(A, -3, B, L);
  Assert(HugeIntToInt32(B) = 333);
  Assert(L = 1);
  HugeIntAssignInt32(A, 1000);
  HugeIntDivideInt32(A, 3, B, L);
  Assert(HugeIntToInt32(B) = 333);
  Assert(L = 1);
  HugeIntDivideInt32(A, -3, B, L);
  Assert(HugeIntToInt32(B) = -333);
  Assert(L = 1);

  // Divide
  HugeIntAssignInt32(A, -1000);
  HugeIntAssignInt32(B, 3);
  HugeIntDivideHugeInt(A, B, C, D);
  Assert(HugeIntToInt32(C) = -333);
  Assert(HugeIntToInt32(D) = 1);
  HugeIntAssignInt32(B, -3);
  HugeIntDivideHugeInt(A, B, C, D);
  Assert(HugeIntToInt32(C) = 333);
  Assert(HugeIntToInt32(D) = 1);
  HugeIntAssignInt32(A, 1000);
  HugeIntAssignInt32(B, 3);
  HugeIntDivideHugeInt(A, B, C, D);
  Assert(HugeIntToInt32(C) = 333);
  Assert(HugeIntToInt32(D) = 1);
  HugeIntAssignInt32(B, -3);
  HugeIntDivideHugeInt(A, B, C, D);
  Assert(HugeIntToInt32(C) = -333);
  Assert(HugeIntToInt32(D) = 1);

  // Mod
  HugeIntAssignInt32(A, -1000);
  HugeIntAssignInt32(B, 3);
  HugeIntMod(A, B, C);
  Assert(HugeIntToInt32(C) = 1);

  // Power
  HugeIntAssignInt32(A, -2);
  HugeIntPower(A, 0);
  Assert(HugeIntToInt32(A) = 1);
  HugeIntAssignInt32(A, -2);
  HugeIntPower(A, 1);
  Assert(HugeIntToInt32(A) = -2);
  HugeIntAssignInt32(A, -2);
  HugeIntPower(A, 2);
  Assert(HugeIntToInt32(A) = 4);
  HugeIntAssignInt32(A, -2);
  HugeIntPower(A, 3);
  Assert(HugeIntToInt32(A) = -8);
  HugeIntAssignInt32(A, -2);
  HugeIntPower(A, 4);
  Assert(HugeIntToInt32(A) = 16);

  // Power
  HugeIntAssignZero(A);
  HugeIntPower(A, 0);
  Assert(HugeIntToInt32(A) = 1);
  HugeIntAssignZero(A);
  HugeIntPower(A, 1);
  Assert(HugeIntToInt32(A) = 0);
  HugeIntAssignOne(A);
  HugeIntPower(A, 0);
  Assert(HugeIntToInt32(A) = 1);
  HugeIntAssignOne(A);
  HugeIntPower(A, 1);
  Assert(HugeIntToInt32(A) = 1);
  HugeIntAssignMinusOne(A);
  HugeIntPower(A, 0);
  Assert(HugeIntToInt32(A) = 1);
  HugeIntAssignMinusOne(A);
  HugeIntPower(A, 1);
  Assert(HugeIntToInt32(A) = -1);
  HugeIntAssignMinusOne(A);
  HugeIntPower(A, 2);
  Assert(HugeIntToInt32(A) = 1);

  // ToStr/StrTo
  StrToHugeInt('-1234567890', A);
  Assert(HugeIntToInt32(A) = -1234567890);
  Assert(HugeIntToStr(A) = '-1234567890');
  Assert(HugeIntToHex(A) = '-499602D2');
  StrToHugeInt('123456789012345678901234567890123456789012345678901234567890', A);
  Assert(HugeIntToStr(A) = '123456789012345678901234567890123456789012345678901234567890');

  // ToHex/HexTo
  HexToHugeInt('-0123456789ABCDEF', A);
  Assert(HugeIntToHex(A) = '-0123456789ABCDEF');
  HexToHugeInt('-F1230', A);
  Assert(HugeIntToHex(A) = '-000F1230');

  HugeWordFinalise(F);
  HugeIntFinalise(D);
  HugeIntFinalise(C);
  HugeIntFinalise(B);
  HugeIntFinalise(A);
end;

procedure SelfTest;
begin
  SelfTest_HugeWord;
  SelfTest_HugeInt;
end;
{$ENDIF}

{$IFDEF PROFILE}
procedure Profile;
var
  A, B, C, D : HugeWord;
  I : Integer;
  T : LongWord;
begin
  HugeWordInit(A);
  HugeWordInit(B);
  HugeWordInit(C);
  HugeWordInit(D);

  HugeWordRandom(A, 10000);
  HugeWordAssign(B, A);

  T := GetTickCount;
  for I := 1 to 100000 do
    begin
      HugeWordCompare(A, B);
    end;
  T := GetTickCount - T;
  Writeln('Compare: ', 1000 / (T / 100000):0:1, '/s');

//  HugeWordRandom(A, 100);
//  HugeWordRandom(B, 100);
  HugeWordAssignInt32(A, 10);
  HugeWordAssignInt32(B, 10);

  T := GetTickCount;
  for I := 1 to 10000 do
    begin
//      HugeWordMultiply_Long(C, A, B);
      HugeWordMultiply_Long(A, A, B);
    end;
  T := GetTickCount - T;
  Writeln('Mul_Long: ', 1000 / (T / 10000):0:1, '/s');

  T := GetTickCount;
  for I := 1 to 1000 do
    begin
      HugeWordMultiply_ShiftAdd(C, A, B);
    end;
  T := GetTickCount - T;
  Writeln('Mul_ShiftAdd: ', 1000 / (T / 1000):0:1, '/s');

  HugeWordRandom(A, 100);
  HugeWordRandom(B, 80);
  T := GetTickCount;
  for I := 1 to 100 do
    begin
      HugeWordMod(A, B, C);
    end;
  T := GetTickCount - T;
  Writeln('Mod: ', 1000 / (T / 100):0:5, '/s');

  HugeWordRandom(A, 64);
  HugeWordRandom(B, 64);
  HugeWordRandom(C, 64);
  T := GetTickCount;
  for I := 1 to 1 do
    begin
      HugeWordPowerAndMod(D, A, B, C);
    end;
  T := GetTickCount - T;
  Writeln('PowerAndMod: ', 1000 / (T / 1):0:5, '/s');

  HugeWordAssignZero(A);
  HugeWordRandom(B, 10000);
  T := GetTickCount;
  for I := 1 to 10000 do
    begin
      HugeWordAdd(A, B);
    end;
  T := GetTickCount - T;
  Writeln('Add: ', 1000 / (T / 10000):0:1, '/s');

  HugeWordRandom(A, 10000);
  HugeWordRandom(B, 9000);
  T := GetTickCount;
  for I := 1 to 10000 do
    begin
      HugeWordSubtract(A, B);
    end;
  T := GetTickCount - T;
  Writeln('Subtract: ', 1000 / (T / 10000):0:1, '/s');

  HugeWordRandom(A, 1000);
  T := GetTickCount;
  for I := 1 to 100000 do
    begin
      HugeWordShl1(A);
    end;
  T := GetTickCount - T;
  Writeln('Shl1: ', 1000 / (T / 100000):0:1, '/s');

  HugeWordRandom(A, 1000);
  HugeWordSetElement(A, 999, 0);
  T := GetTickCount;
  for I := 1 to 10000000 do
    begin
      HugeWordSetBitScanReverse(A);
    end;
  T := GetTickCount - T;
  Writeln('SetBitScanReverse: ', 1000 / (T / 10000000):0:1, '/s');

  HugeWordFinalise(D);
  HugeWordFinalise(C);
  HugeWordFinalise(B);
  HugeWordFinalise(A);
end;
{$ENDIF}
{$ENDIF}



end.

