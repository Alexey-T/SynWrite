{******************************************************************************}
{                                                                              }
{   Library:          Fundamentals 4.00                                        }
{   File name:        cRandom.pas                                              }
{   File version:     4.13                                                     }
{   Description:      Random number functions                                  }
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
{   E-mail:           fundamentalslib at gmail.com                             }
{                                                                              }
{ Revision history:                                                            }
{                                                                              }
{   1999/11/07  0.01  Add RandomSeed.                                          }
{   1999/12/01  0.02  Add RandomUniform.                                       }
{   1999/12/03  0.03  Add RandomNormal.                                        }
{   2000/01/23  1.04  Add RandomPseudoWord.                                    }
{   2000/07/13  1.05  Fix bug reported by Andrew Driazgov.                     }
{   2000/08/22  1.06  Add RandomHex.                                           }
{   2000/09/20  1.07  Improve RandomSeed.                                      }
{   2002/06/01  3.08  Create cRandom unit.                                     }
{   2003/08/09  3.09  Replace random number generator.                         }
{   2005/06/10  4.10  Compilable with FreePascal 2 Win32 i386.                 }
{   2005/08/27  4.11  Revised for Fundamentals 4.                              }
{   2007/06/08  4.12  Compilable with FreePascal 2.04 Win32 i386               }
{   2010/06/27  4.13  Compilable with FreePascal 2.4.0 OSX x86-64              }
{                                                                              }
{ Supported compilers:                                                         }
{                                                                              }
{   Borland Delphi 5/6/7/2005/2006/2007 Win32 i386                             }
{   FreePascal 2 Win32 i386                                                    }
{   FreePascal 2 Linux i386                                                    }
{                                                                              }
{******************************************************************************}

{$INCLUDE cDefines.inc}
{$IFDEF FREEPASCAL}{$IFDEF DEBUG}
  {$WARNINGS OFF}{$HINTS OFF}
{$ENDIF}{$ENDIF}
unit cRandom;

interface



{                                                                              }
{ RandomSeed                                                                   }
{                                                                              }
{   Returns a random seed value based on various system states.                }
{   AddEntropy can be called to add additional random state to the values      }
{     returned by RandomSeed.                                                  }
{                                                                              }
function  RandomSeed: LongWord;
procedure AddEntropy(const Value: LongWord);



{                                                                              }
{ Uniform random number generator                                              }
{                                                                              }
{   Returns a random number from a uniform density distribution (ie all        }
{     values have an equal probability of being 'chosen')                      }
{   RandomFloat returns an uniformly distributed random floating point value   }
{     between 0 and 1.                                                         }
{   RandomAlphaStr returns a string of random letters (A-Z).                   }
{   RandomPseudoWord returns a random word-like string.                        }
{                                                                              }
function  RandomUniform: LongWord; overload;
function  RandomUniform(const N: Integer): Integer; overload;
function  RandomBoolean: Boolean;
function  RandomByte: Byte;
function  RandomByteNonZero: Byte;
function  RandomWord: Word;
function  RandomInt64: Int64; overload;
function  RandomInt64(const N: Int64): Int64; overload;
function  RandomHex(const Digits: Integer = 8): String;
function  RandomFloat: Extended;
function  RandomAlphaStr(const Length: Integer): AnsiString;
function  RandomPseudoWord(const Length: Integer): AnsiString;
function  RandomPassword(const MinLength, MaxLength: Integer;
          const CaseSensitive, UseSymbols, UseNumbers: Boolean): AnsiString;



{                                                                              }
{ Alternative uniform random number generators                                 }
{                                                                              }
function  mwcRandomLongWord: LongWord;
function  urnRandomLongWord: LongWord;
function  moaRandomFloat: Extended;
function  mwcRandomFloat: Extended;



{                                                                              }
{ Normal distribution random number generator                                  }
{                                                                              }
{   RandomNormalF returns a random number that has a Normal(0,1) distribution  }
{     (Gaussian distribution)                                                  }
{                                                                              }
function  RandomNormalF: Extended;



{                                                                              }
{ Test cases                                                                   }
{                                                                              }
{$IFDEF DEBUG}
procedure SelfTest;
{$ENDIF}



implementation

uses
  { System }
  {$IFDEF DOT_NET}
  Borland.Vcl.Windows,
  System.Threading,
  {$ELSE}
  {$IFDEF MSWIN}
  Windows,
  {$ENDIF}
  {$ENDIF}
  {$IFDEF UNIX}
  {$IFDEF FREEPASCAL}
  BaseUnix,
  Unix,
  {$ELSE}
  Libc,
  {$ENDIF}
  {$ENDIF}
  SysUtils;



{                                                                              }
{ Linear Congruential Random Number Generators                                 }
{   The general form of a linear congruential generator is:                    }
{   SEED = (A * SEED + C) mod M                                                }
{                                                                              }
function lcRandom1(const Seed: LongWord): LongWord;
begin
  Result := LongWord(29943829 * Int64(Seed) - 1);
end;

function lcRandom2(const Seed: LongWord): LongWord;
begin
  Result := LongWord(69069 * Int64(Seed) + 1);
end;

function lcRandom3(const Seed: LongWord): LongWord;
begin
  Result := LongWord(1103515245 * Int64(Seed) + 12345);
end;

function lcRandom4(const Seed: LongWord): LongWord;
begin
  Result := LongWord(214013 * Int64(Seed) + 2531011);
end;

function lcRandom5(const Seed: LongWord): LongWord;
begin
  Result := LongWord(134775813 * Int64(Seed) + 1);
end;



{                                                                              }
{ RandomSeed                                                                   }
{   The random seed is generated from a startup seed, a fixed seed, a          }
{   variable seed and an entropy seed.                                         }
{   The startup seed is initialised on module initialisation.                  }
{   The fixed seed is randomised on the first call to RandomSeed.              }
{   The variable seed is randomised on every call to RandomSeed.               }
{   The entropy seed is randomised by calls to AddEntropy.                     }
{                                                                              }
var
  StartupSeed   : Int64 = 0;
  FixedSeedInit : Boolean = False;
  FixedSeed     : Int64 = 0;
  VariableSeed  : Int64 = 0;
  EntropySeed   : Int64 = 0;

{$IFDEF WindowsPlatform}
function GetHighPrecisionCounter: Int64;
begin
  QueryPerformanceCounter(Result);
end;
{$ENDIF}
{$IFDEF UNIX}
{$IFDEF FREEPASCAL}
function GetHighPrecisionCounter: Int64;
var TV : TTimeVal;
    TZ : PTimeZone;
begin
  TZ := nil;
  fpGetTimeOfDay(@TV, TZ);
  Result := Int64(TV.tv_sec) * 1000000 + Int64(TV.tv_usec);
end;
{$ELSE}
function GetHighPrecisionCounter: Int64;
var T : Ttimeval;
begin
  GetTimeOfDay(T, nil);
  Result := Int64(T.tv_sec) * 1000000 + Int64(T.tv_usec);
end;
{$ENDIF}
{$ENDIF}

{$IFDEF WindowsPlatform}
function GetTick: LongWord;
begin
  Result := GetTickCount;
end;
{$ELSE}{$IFDEF UNIX}
function GetTick: LongWord;
begin
  Result := LongWord(DateTimeToTimeStamp(Now).Time);
end;
{$ENDIF}{$ENDIF}

function RandomState: Int64;
var H, Mi, S, S1 : Word;
    Ye, Mo, Da   : Word;
    Registers    : LongWord;
begin
  { CPU Registers }
  {$IFDEF ASM386}
  asm
    lahf
    add eax, ebx
    adc eax, ecx
    adc eax, edx
    adc eax, esi
    adc eax, edi
    mov [Registers], eax
  end;
  {$ELSE}
  Registers := 0;
  {$ENDIF}
  Result := Int64(Registers);
  { Counters }
  Result := Result xor GetHighPrecisionCounter xor GetTick;
  { System Time }
  DecodeTime(Time, H, Mi, S, S1);
  Result := Result xor H xor (Mi shl 8) xor (S1 shl 16) xor (S shl 24);
  { System Date }
  DecodeDate(Date, Ye, Mo, Da);
  Result := Result xor Ye xor (Mo shl 16) xor (Da shl 24);
end;

// The StartupSeed is used to initialise the FixedSeed. It is based on state
// change between startup and fixed seed initialisation.
procedure InitStartupSeed;
begin
  StartupSeed := RandomState;
  {$IFNDEF DOT_NET}
  Int64Rec(StartupSeed).Lo := lcRandom1(Int64Rec(StartupSeed).Lo);
  Int64Rec(StartupSeed).Hi := lcRandom2(Int64Rec(StartupSeed).Hi);
  {$ENDIF}
end;

{$IFNDEF DOT_NET}
function BufferHash(const Buffer: PByte; const Len: Integer): LongWord;
var I : Integer;
    P : PByte;
begin
  Result := 0;
  P := Buffer;
  for I := 1 to Len do
    begin
      Result := Result xor (LongWord(P^) shl ((I mod 7) * 4));
      Inc(P);
    end;
end;
{$ENDIF}

// The FixedSeed is initialised on the first call to RandomSeed. It is based
// on the StartupSeed and various system states that don't change while the
// application is running.
{$Q-}{$IFDEF DELPHI5}{$OPTIMIZATION OFF}{$ENDIF}
procedure InitFixedSeed;
var S : Int64;
    {$IFNDEF DOT_NET}
    Q : Pointer;
    {$ENDIF}
    B : Array[0..258] of Byte;
    {$IFDEF MSWIN}
    {$IFNDEF DOT_NET}
    L : LongWord;
    {$ENDIF}
    P : Int64;
    {$ENDIF}
    {$IFDEF UNIX}
    T : AnsiString;
    {$ENDIF}
begin
  { Startup Seed }
  S := StartupSeed;
  { System State }
  S := S xor RandomState;
  { Pointer Values }
  {$IFNDEF DOT_NET}
  Q := @FixedSeed; // Global variable
  S := Int64(S + Integer(Q));
  Q := @B; // Local variable
  S := Int64(S + Integer(Q));
  {$ENDIF}
  { OS Timing }
  Sleep(0);
  S := Int64(S + RandomState);
  {$IFDEF MSWIN}
  { CPU Frequency }
  if QueryPerformanceFrequency(P) then
    S := S xor P;
  {$IFNDEF DOT_NET}
  { OS User Name }
  L := 256;
  FillChar(B[0], Sizeof(B), #0);
  if GetUserName(@B, L) then
    S := Int64(S + BufferHash(@B, L));
  { OS Computer Name }
  L := 256;
  FillChar(B[0], Sizeof(B), #0);
  if GetComputerName(@B, L) then
    S := Int64(S + BufferHash(@B, L));
  {$ENDIF}
  { Process ID }
  S := S xor GetCurrentProcessID;
  {$ENDIF}
  {$IFDEF UNIX}
  { OS User Name }
  T := GetEnvironmentVariable('USER');
  if T = '' then
    T := GetEnvironmentVariable('USERNAME');
  if T <> '' then
    S := Int64(S + BufferHash(Pointer(T), Length(T)));
  { OS Computer Name }
  T := GetEnvironmentVariable('HOSTNAME');
  if T <> '' then
    S := Int64(S + BufferHash(Pointer(T), Length(T)));
  { PPID }
  T := GetEnvironmentVariable('PPID');
  if T <> '' then
    S := Int64(S + BufferHash(Pointer(T), Length(T)));
  {$ENDIF}
  { Randomize bits }
  {$IFNDEF DOT_NET}
  Int64Rec(S).Lo := lcRandom3(Int64Rec(S).Lo);
  Int64Rec(S).Hi := lcRandom4(Int64Rec(S).Hi);
  {$ENDIF}
  { Save fixed seed }
  FixedSeed := S;
  FixedSeedInit := True;
end;
{$IFDEF DEBUG}{$Q+}{$ENDIF}{$IFDEF DELPHI5}{$OPTIMIZATION ON}{$ENDIF}

{$Q-}{$IFDEF DELPHI5}{$OPTIMIZATION OFF}{$ENDIF}
function RandomSeed: LongWord;
var S : Int64;
begin
  { Fixed Seed }
  if not FixedSeedInit then
    InitFixedSeed;
  S := FixedSeed;
  { System State }
  S := S xor RandomState;
  {$IFDEF MSWIN}
  { OS Handles }
  S := S xor GetCurrentThreadID;
  {$ENDIF}
  { Entropy Seed }
  S := Int64(S + EntropySeed);
  { Variable Seed }
  S := Int64(S + VariableSeed);
  {$IFNDEF DOT_NET}
  Int64Rec(VariableSeed).Lo := lcRandom5(Int64Rec(S).Lo);
  Int64Rec(VariableSeed).Hi := lcRandom2(Int64Rec(S).Hi);
  {$ENDIF}
  { Randomise bits }
  {$IFDEF DOT_NET}
  Result := lcRandom1(LongWord(S and $FFFFFFFF));
  {$ELSE}
  Result := LongWord(lcRandom1(Int64Rec(S).Lo) + lcRandom3(Int64Rec(S).Hi));
  {$ENDIF}
end;
{$IFDEF DEBUG}{$Q+}{$ENDIF}{$IFDEF DELPHI5}{$OPTIMIZATION ON}{$ENDIF}

procedure AddEntropy(const Value: LongWord);
begin
  {$IFNDEF DOT_NET}
  Int64Rec(EntropySeed).Lo := lcRandom4(Int64Rec(EntropySeed).Lo xor Value);
  Int64Rec(EntropySeed).Hi := lcRandom1(Int64Rec(EntropySeed).Hi xor Value);
  {$ENDIF}
end;



{                                                                              }
{ Mother-of-All pseudo random number generator                                 }
{   This is a multiply-with-carry or recursion-with-carry generator.           }
{   It has a cycle length of 3E+47.                                            }
{   It was invented by George Marsaglia.                                       }
{                                                                              }
var
  moaSeeded : Boolean = False;
  moaX      : Array[0..3] of LongWord;
  moaC      : LongWord;

procedure moaInitSeed(const Seed: LongWord);
var I : Integer;
    S : LongWord;
begin
  S := Seed;
  for I := 0 to 3 do
    begin
      S := lcRandom1(S);
      moaX[I] := S;
    end;
  moaC := lcRandom1(S);
  moaSeeded := True;
end;

function moaRandomLongWord: LongWord;
var S  : Int64;
    Xn : LongWord;
begin
  if not moaSeeded then
    moaInitSeed(RandomSeed);
  S := 2111111111 * Int64(moaX[0]) +
             1492 * Int64(moaX[1]) +
             1776 * Int64(moaX[2]) +
             5115 * Int64(moaX[3]) +
                    Int64(moaC);
  moaC := LongWord(S shr 32);
  Xn := LongWord(S);
  moaX[0] := moaX[1];
  moaX[1] := moaX[2];
  moaX[2] := moaX[3];
  moaX[3] := Xn;
  Result := Xn;
end;

function moaRandomFloat: Extended;
begin
  Result := moaRandomLongWord / High(LongWord);
end;



{                                                                              }
{ Multiply-With-Carry pseudo random number generator mentioned by George       }
{ Marsaglia in his paper on the Mother-of-All generator:                       }
{   " Here is an interesting simple MWC generator with period > 2^92, for      }
{   32-bit arithmetic:                                                         }
{   x[n]=1111111464*(x[n-1]+x[n-2]) + carry mod 2^32.                          }
{   Suppose you have functions, say top() and bot(), that give the top and     }
{   bottom halves of a 64-bit result.  Then, with initial 32-bit x, y and      }
{   carry c,  simple statements such as                                        }
{          y=bot(1111111464*(x+y)+c)                                           }
{          x=y                                                                 }
{          c=top(y)                                                            }
{   will, repeated, give over 2^92 random 32-bit y's. "                        }
{                                                                              }
var
  mwcSeeded : Boolean = False;
  mwcX      : LongWord;
  mwcY      : LongWord;
  mwcC      : LongWord;

procedure mwcInitSeed(const Seed: LongWord);
begin
  mwcX := lcRandom2(Seed);
  mwcY := lcRandom2(mwcX);
  mwcC := lcRandom2(mwcY);
  mwcSeeded := True;
end;

function mwcRandomLongWord: LongWord;
var S : Int64;
begin
  if not mwcSeeded then
    mwcInitSeed(RandomSeed);
  S := 1111111464 * (Int64(mwcX) + mwcY) + mwcC;
  Result := LongWord(S);
  mwcX := mwcY;
  mwcY := Result;
  mwcC := LongWord(S shr 32);
end;

function mwcRandomFloat: Extended;
begin
  Result := mwcRandomLongWord / High(LongWord);
end;



{                                                                              }
{ Universal random number generator proposed by Marsaglia, Zaman, and Tsang.   }
{ FSU-SCRI-87-50                                                               }
{   It has a period of 2^144 = 2E+43.                                          }
{   Only 24 bits are guarantueed to be completely random.                      }
{   This generator passes all known statistical tests on randomness.           }
{   The algorithm is a combination of a Fibonacci sequence and an arithmetic   }
{   sequence.                                                                  }
{                                                                              }
var
  urnSeeded : Boolean = False;
  urnU      : Array[1..97] of Double;
  urnC      : Double;
  urnCD     : Double;
  urnCM     : Double;
  urnI      : Integer;
  urnJ      : Integer;

procedure urnInit(const IJ, KL: Integer);
var I, J, K, L : Integer;
    F, G, M    : Integer;
    S, T       : Double;
begin
  Assert((IJ >= 0) and (IJ <= 31328) and (KL >= 0) and (KL <= 30081));
  I := (IJ div 177) mod 177 + 2;
  J := IJ mod 177 + 2;
  K := (KL div 169) mod 178 + 1;
  L := KL mod 169;
  for F := 1 to 97 do
    begin
      S := 0.0;
      T := 0.5;
      for G := 1 to 24 do
        begin
          M := (((I * J) mod 179) * K) mod 179;
          I := J;
          J := K;
          K := M;
          L := (53 * L + 1) mod 169;
          if ((L * M) mod 64 >= 32) then
                  S := S + T;
          T := T * 0.5;
        end;
      urnU[F] := S;
    end;
  urnC  := 362436.0 / 16777216.0;
  urnCD := 7654321.0 / 16777216.0;
  urnCM := 16777213.0 / 16777216.0;
  urnI  := 97;
  urnJ  := 33;
  urnSeeded := True;
end;

procedure urnInitSeed(const Seed: LongWord);
begin
  urnInit((Seed and $FFFF) mod 30000, (Seed shr 16) mod 30000);
end;

function urnRandomFloat: Double;
var R : Double;
begin
  if not urnSeeded then
    urnInitSeed(RandomSeed);
  R := urnU[urnI] - urnU[urnJ];
  if R < 0.0 then
    R := R + 1.0;
  urnU[urnI] := R;
  Dec(urnI);
  if urnI = 0 then
    urnI := 97;
  Dec(urnJ);
  if urnJ = 0 then
    urnJ := 97;
  urnC := urnC - urnCD;
  if urnC < 0.0 then
    urnC := urnC + urnCM;
  R := R - urnC;
  if R < 0.0 then
    R := R + 1.0;
  Result := R;
end;

function urnRandomLongWord: LongWord;
begin
  Result := LongWord(Trunc(urnRandomFloat * 4294967295.0));
end;



{                                                                              }
{ Uniform Random                                                               }
{                                                                              }
function RandomUniform: LongWord;
begin
  Result := moaRandomLongWord;
end;

function RandomUniform(const N: Integer): Integer;
begin
  if N <= 1 then
    Result := 0
  else
    Result := Integer(RandomUniform mod LongWord(N));
end;

function RandomBoolean: Boolean;
begin
  Result := RandomUniform and 1 = 1;
end;

function RandomByte: Byte;
var I : LongWord;
begin
  I := RandomUniform;
  I := I xor (I shr 8) xor (I shr 16) xor (I shr 24);
  Result := Byte(I and $FF);
end;

function RandomByteNonZero: Byte;
begin
  repeat
    Result := RandomByte;
  until Result <> 0;
end;

function RandomWord: Word;
var I : LongWord;
begin
  I := RandomUniform;
  I := I xor (I shr 16);
  Result := Word(I and $FFFF);
end;

function RandomFloat: Extended;
begin
  Result := urnRandomFloat;
end;

function RandomInt64: Int64;
begin
  {$IFDEF DOT_NET}
  Result := RandomUniform + Int64(RandomUniform) shl 31;
  {$ELSE}
  Int64Rec(Result).Lo := RandomUniform;
  Int64Rec(Result).Hi := RandomUniform;
  {$ENDIF}
end;

function RandomInt64(const N: Int64): Int64;
begin
  if N <= 0 then
    Result := 0
  else
    begin
      Result := RandomInt64;
      if Result < 0 then
        Result := -Result;
      Result := Result mod N;
    end;
end;

function RandomHex(const Digits: Integer): String;
var I : Integer;
begin
  Result := '';
  Repeat
    I := Digits - Length(Result);
    if I > 0 then
      Result := Result + IntToHex(RandomUniform, 8);
  Until I <= 0;
  SetLength(Result, Digits);
end;

function RandomAlphaStr(const Length: Integer): AnsiString;
var I : Integer;
begin
  if Length <= 0 then
    begin
      Result := '';
      exit;
    end;
  SetLength(Result, Length);
  for I := 1 to Length do
    Result[I] := AnsiChar(Ord('A') + RandomUniform(26));
end;

const
  Vowels         = 'AEIOUY';
  VowelCount     = Length(Vowels);
  Consonants     = 'BCDFGHJKLMNPQRSTVWXZ';
  ConsonantCount = Length(Consonants);

function RandomPseudoWord(const Length: Integer): AnsiString;
var I, A, P, T : Integer;
begin
  if Length <= 0 then
    begin
      Result := '';
      exit;
    end;
  SetLength(Result, Length);
  P := -1;
  A := RandomUniform(2);
  for I := 1 to Length do
    begin
      case A of
        0 : Result[I] := AnsiChar(Vowels[RandomUniform(VowelCount) + 1]);
        1 : Result[I] := AnsiChar(Consonants[RandomUniform(ConsonantCount) + 1]);
      end;
      T := A;
      if A = P then
        A := A xor 1
      else
        A := RandomUniform(2);
      P := T;
    end;
end;

const
  PasswordSymbolChars = '!?@%$&-*#';
  PasswordSymbolCharCount = Length(PasswordSymbolChars);
  PasswordNumberChars = '0123456789';
  PasswordNumberCharCount = Length(PasswordNumberChars);

function RandomPassword(const MinLength, MaxLength: Integer;
         const CaseSensitive, UseSymbols, UseNumbers: Boolean): AnsiString;
var I, J, K, N, Length : Integer;
    C : AnsiChar;
begin
  if (MaxLength <= 0) or (MaxLength < MinLength) then
    begin
      Result := '';
      exit;
    end;
  if MinLength = MaxLength then
    Length := MinLength
  else
    Length := MinLength + RandomUniform(MaxLength - MinLength + 1);
  Result := RandomPseudoWord(Length);
  if CaseSensitive then
    begin
      N := RandomUniform(1 + Length div 2);
      for I := 0 to N - 1 do
        begin
          J := RandomUniform(Length);
          C := Result[J + 1];
          if C in ['A'..'Z'] then
            Result[J + 1] := AnsiChar(Ord(C) + 32);
        end;
    end;
  if UseSymbols then
    begin
      N := RandomUniform(1 + Length div 4);
      for I := 0 to N - 1 do
        begin
          J := RandomUniform(Length);
          K := RandomUniform(PasswordSymbolCharCount);
          Result[J + 1] := AnsiChar(PasswordSymbolChars[K + 1]);
        end;
    end;
  if UseNumbers then
    begin
      N := RandomUniform(1 + Length div 4);
      for I := 0 to N - 1 do
        begin
          J := RandomUniform(Length);
          K := RandomUniform(PasswordNumberCharCount);
          Result[J + 1] := AnsiChar(PasswordNumberChars[K + 1]);
        end;
    end;
end;



{                                                                              }
{ Normal Random                                                                }
{                                                                              }
var
  HasRandomNormal : Boolean = False;
  ARandomNormal   : Extended;

function RandomNormalF: Extended;
var fac, r, v1, v2: Extended;
begin
  if not HasRandomNormal then
    begin
      Repeat
        v1 := 2.0 * RandomFloat - 1.0;
        v2 := 2.0 * RandomFloat - 1.0;
        r := Sqr(v1) + Sqr(v2);
      Until r < 1.0;
      fac := Sqrt(-2.0 * ln(r) / r);
      ARandomNormal := v1 * fac;
      Result := v2 * fac;
      HasRandomNormal := True;
    end else
    begin
      Result := ARandomNormal;
      HasRandomNormal := False;
    end;
end;



{                                                                              }
{ Test cases                                                                   }
{                                                                              }
{$IFDEF DEBUG}
{$ASSERTIONS ON}
procedure SelfTest;
var I, L : Integer;
    A, B, C : LongWord;
    T1, T2 : Int64;
begin
  Assert(Length(RandomPassword(0, 0, True, True, True)) = 0);
  Assert(Length(RandomPassword(1, 1, True, True, True)) = 1);
  for I := 1 to 100 do
  begin
    L := Length(RandomPassword(5, 16, True, True, True));
    Assert((L >= 5) and (L <= 16));
  end;
  // Note: These are primitive sanity tests that may fail occasionally
  T1 := 0;
  T2 := 0;
  for I := 1 to 10000 do
    begin
      A := RandomSeed;
      B := RandomSeed;
      C := RandomSeed;
      Assert(not ((A = B) and (B = C)), 'RandomSeed');
      T1 := T1 + A + B + C;
      A := RandomUniform;
      B := RandomUniform;
      C := RandomUniform;
      Assert(not ((A = B) and (B = C)), 'RandomUniform');
      T2 := T2 + A + B + C;
    end;
  T1 := T1 div 30000;
  Assert((T1 > 1600000000) and (T1 < 2800000000), 'RandomSeed');
  T2 := T2 div 30000;
  Assert((T2 > 1600000000) and (T2 < 2800000000), 'RandomUniform');
end;
{$ENDIF}



initialization
  InitStartupSeed;
end.

