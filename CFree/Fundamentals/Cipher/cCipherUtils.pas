{******************************************************************************}
{                                                                              }
{   Library:          Fundamentals 4.00                                        }
{   File name:        cCipherUtils.pas                                         }
{   File version:     0.01                                                     }
{   Description:      Cipher library                                           }
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
{ Revision history:                                                            }
{                                                                              }
{   2007/01/05  0.01  Initial version                                          }
{                                                                              }
{******************************************************************************}

{$INCLUDE cCipher.inc}

unit cCipherUtils;

interface

uses
  { System }
  SysUtils;



{                                                                              }
{ Cipher errors                                                                }
{                                                                              }
const
  CipherError_InvalidCipher     = 1;
  CipherError_InvalidKeySize    = 2;
  CipherError_InvalidKeyBits    = 3;
  CipherError_InvalidCipherMode = 4;
  CipherError_InvalidBufferSize = 5;
  CipherError_InvalidBuffer     = 6;
  CipherError_InvalidData       = 7;

type
  ECipher = class(Exception)
  protected
    FErrorCode : Integer;
  public
    constructor Create(const ErrorCode: Integer; const Msg: AnsiString);
    property ErrorCode: Integer read FErrorCode;
  end;



{                                                                              }
{ Secure clear helper function                                                 }
{                                                                              }
procedure SecureClear(var Buffer; const BufferSize: Integer);
procedure SecureClearStr(var S: AnsiString);



implementation



{                                                                              }
{ Cipher errors                                                                }
{                                                                              }
constructor ECipher.Create(const ErrorCode: Integer; const Msg: AnsiString);
begin
  FErrorCode := ErrorCode;
  inherited Create(Msg);
end;



{                                                                              }
{ Secure clear helper function                                                 }
{   Securely clears a piece of memory before it is released to help prevent    }
{   sensitive information from being exposed.                                  }
{                                                                              }
procedure SecureClear(var Buffer; const BufferSize: Integer);
begin
  if BufferSize <= 0 then
    exit;
  FillChar(Buffer, BufferSize, $00);
end;

procedure SecureClearStr(var S: AnsiString);
var L : Integer;
begin
  L := Length(S);
  if L = 0 then
    exit;
  SecureClear(S[1], L);
  S := '';
end;



end.

