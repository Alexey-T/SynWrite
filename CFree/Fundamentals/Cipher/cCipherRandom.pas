{******************************************************************************}
{                                                                              }
{   Library:          Fundamentals 4.00                                        }
{   File name:        cCipherRandom.pas                                        }
{   File version:     0.01                                                     }
{   Description:      Cipher random                                            }
{                                                                              }
{   Copyright:        Copyright (c) 2010-2011, David J Butler                  }
{                     All rights reserved.                                     }
{                     This file is licensed under the BSD License.             }
{                     See http://www.opensource.org/licenses/bsd-license.php   }
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
{   2010/12/17  0.01  Initial version                                          }
{                                                                              }
{******************************************************************************}

{$INCLUDE cCipher.inc}

unit cCipherRandom;

interface



procedure SecureRandomBuf(var Buf; const Size: Integer);
function  SecureRandomStr(const Size: Integer): AnsiString;
function  SecureRandomLongWord: LongWord;



implementation

uses
  { Fundamentals }
  cRandom,
  cHash;



const
  SecureRandomBlockSize = 128 div 8;

type
  TSecureRandomBlock = array[0..SecureRandomBlockSize - 1] of Byte;
  PSecureRandomBlock = ^TSecureRandomBlock;

// produces a block of SecureRandomBlockSize bytes of secure random material
procedure SecureRandomBlockGenerator(var Block: TSecureRandomBlock);
const
  RandomBlockSize = 512 div 8;
var I : Integer;
    R512 : array[0..RandomBlockSize - 1] of Byte;
    H256 : T256BitDigest;
    H128 : T128BitDigest;
begin
  try
    for I := 0 to RandomBlockSize - 1 do
      R512[I] := RandomByte;
    H256 := CalcSHA256(R512, RandomBlockSize);
    H128 := CalcMD5(H256, SizeOf(T256BitDigest));
    Assert(SizeOf(H128) >= SecureRandomBlockSize);
    Move(H128, Block, SecureRandomBlockSize);
  finally
    SecureClear(H128, SizeOf(T128BitDigest));
    SecureClear(H256, SizeOf(T256BitDigest));
    SecureClear(R512, RandomBlockSize);
  end;
end;

procedure SecureRandomBuf(var Buf; const Size: Integer);
var P : PSecureRandomBlock;
    L : Integer;
    B : TSecureRandomBlock;
begin
  P := @Buf;
  L := Size;
  while L >= SecureRandomBlockSize do
    begin
      SecureRandomBlockGenerator(P^);
      Inc(P);
      Dec(L, SecureRandomBlockSize);
    end;
  if L > 0 then
    begin
      SecureRandomBlockGenerator(B);
      Move(B, P^, L);
      SecureClear(B, SecureRandomBlockSize);
    end;
end;

function SecureRandomStr(const Size: Integer): AnsiString;
begin
  SetLength(Result, Size);
  if Size <= 0 then
    exit;
  SecureRandomBuf(Result[1], Size);
end;

function SecureRandomLongWord: LongWord;
var L : LongWord;
begin
  SecureRandomBuf(L, SizeOf(LongWord));
  Result := L;
  SecureClear(L, SizeOf(LongWord));
end;



end.

