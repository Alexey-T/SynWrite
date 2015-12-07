{******************************************************************************}
{                                                                              }
{   Library:          Fundamentals 4.00                                        }
{   File name:        cCipherRC4.pas                                           }
{   File version:     0.06                                                     }
{   Description:      RC4 cipher routines                                      }
{                                                                              }
{   Copyright:        Copyright (c) 2007-2011, David J Butler                  }
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
{ References:                                                                  }
{                                                                              }
{   * www.mozilla.org/projects/security/pki/nss/                               }
{       draft-kaukonen-cipher-arcfour-03.txt                                   }
{                                                                              }
{ Revision history:                                                            }
{                                                                              }
{   2007/01/05  0.01  Initial version.                                         }
{                                                                              }
{******************************************************************************}

{$INCLUDE cCipher.inc}

unit cCipherRC4;

interface



{                                                                              }
{ RC4                                                                          }
{ Also known as Arcfour.                                                       }
{                                                                              }
type
  TRC4SBox = array[Byte] of Byte;
  TRC4Context = packed record
    S  : TRC4SBox;
    SI : Byte;
    SJ : Byte;
  end;
  PRC4Context = ^TRC4Context;

procedure RC4Init(const Key; const KeySize: Integer; var Context: TRC4Context);
procedure RC4Buffer(var Context: TRC4Context; var Buffer; const BufferSize: Integer);



implementation

uses
  { Cipher }
  cCipherUtils;


  
{                                                                              }
{ Utilities                                                                    }
{                                                                              }

{$IFDEF DELPHI5}
type
  PByte = ^Byte;
{$ENDIF}



{                                                                              }
{ RC4                                                                          }
{                                                                              }
procedure RC4Init(const Key; const KeySize: Integer; var Context: TRC4Context);
type
  TRC4KeyBuffer = array[Byte] of Byte;
  PRC4KeyBuffer = ^TRC4KeyBuffer;
var I, J, T : Byte;
    K       : PRC4KeyBuffer;
begin
  // Validate parameters
  if KeySize > 256 then
    raise ECipher.Create(CipherError_InvalidKeySize, 'Maximum RC4 key length is 256');
  if KeySize < 1 then
    raise ECipher.Create(CipherError_InvalidKeySize, 'Minimum RC4 key length is 1');
  // Prepare RC4 context
  with Context do
    begin
      for I := 0 to 255 do
        S[I] := I;
      K := @Key;
      J := 0;
      for I := 0 to 255 do
        begin
          J := Byte(J + S[I] + K^[I mod KeySize]);
          T := S[I];
          S[I] := S[J];
          S[J] := T;
        end;
      SI := 0;
      SJ := 0;
    end;
end;

procedure RC4Buffer(var Context: TRC4Context; var Buffer; const BufferSize: Integer);
var T : Byte;
    F : Integer;
    P : PByte;
begin
  P := @Buffer;
  with Context do
    for F := 0 to BufferSize - 1 do
      begin
        SI := Byte(SI + 1);
        SJ := Byte(SJ + S[SI]);
        T := S[SI];
        S[SI] := S[SJ];
        S[SJ] := T;
        T := Byte(S[SI] + S[SJ]);
        T := S[T];
        P^ := P^ xor T;
        Inc(P);
      end;
end;



end.
