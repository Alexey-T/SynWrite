{******************************************************************************}
{                                                                              }
{   Library:          Fundamentals 4.00                                        }
{   File name:        cCipher.pas                                              }
{   File version:     4.07                                                     }
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
{   2007/01/07  0.02  ECB and padding support                                  }
{   2008/06/15  0.03  CBC mode                                                 }
{   2008/06/17  0.04  CFB and OFB modes                                        }
{   2010/11/18  0.05  Revision                                                 }
{   2010/12/16  0.06  AES cipher                                               }
{   2011/08/09  4.07  Revision                                                 }
{                                                                              }
{ Todo:                                                                        }
{ - Complete CAST, RSA, FUNE cipher stubs                                      }
{******************************************************************************}

{.DEFINE Cipher_SupportCAST}
{.DEFINE Cipher_SupportFUNE}
{.DEFINE Cipher_SupportRSA}

{$INCLUDE cCipher.inc}

unit cCipher;

interface

uses
  { System }
  SysUtils,
  { Cipher }
  cCipherRC2,
  cCipherRC4,
  cCipherDES,
  cCipherAES
  {$IFDEF Cipher_SupportCAST},
  cCipherCAST
  {$ENDIF}
  {$IFDEF Cipher_SupportFUNE},
  cCipherFUNE
  {$ENDIF}
  {$IFDEF Cipher_SupportRSA},
  cCipherRSA
  {$ENDIF};



{                                                                              }
{ Cipher information                                                           }
{                                                                              }
type
  TCipherType = (
    ctNone,
    ctRC2,            // RC2
    ctRC4,            // RC4
    ctDES,            // DES
    ctDES40,          // DES-40
    ctTripleDESEDE,   // Triple-DES-EDE 2 keys
    ctTripleDES3EDE,  // Triple-DES-EDE 3 keys
    ctTripleDES3EEE,  // Triple-DES-EEE 3 keys
    ctCast256,        // CAST-256
    ctAES,            // AES-128, AES-192, AES-256
    ctRSAOAEP1024     // RSA-OAEP-1024
   );

  TCipherOperation = (
    coEncrypt,
    coDecrypt);

  TCipherInitFunc =
    procedure (const Operation: TCipherOperation;
               const KeyBuffer: Pointer; const KeyBufferSize: Integer;
               const KeyBits: Integer;
               const ContextBuffer: Pointer);

  TCipherBufferFunc =
    procedure (const Context, Data: Pointer; const DataSize: Integer);

  TCipherFinaliseFunc =
    procedure (const Context: Pointer);

  TCipherBufferMode = (
    cbmStream,
    cbmMultipleBlocks,
    cbmSingleBlock);

  TCipherInfo = record
    ValidCipher  : Boolean;
    ShortName    : AnsiString;
    BufferMode   : TCipherBufferMode;
    InBlockSize  : Integer;
    OutBlockSize : Integer;
    KeyBitsMin   : Integer;
    KeyBitsMax   : Integer;
    ContextSize  : Integer;
    InitFunc     : TCipherInitFunc;
    EncryptFunc  : TCipherBufferFunc;
    DecryptFunc  : TCipherBufferFunc;
    FinaliseFunc : TCipherFinaliseFunc;
  end;
  PCipherInfo = ^TCipherInfo;

function GetCipherInfo(const Cipher: TCipherType): PCipherInfo;



{                                                                              }
{ Cipher                                                                       }
{                                                                              }
type
  TCipherMode = (
    cmECB,            // Electronic Codebook
    cmCBC,            // Cipher Block Chaining
    cmCFB,            // Cipher Feedback
    cmOFB             // Output Feedback
    );

  TCipherPadding = (
    cpNone,           // Padded with zeros (size of decrypted text may be longer
                      // than original text if original text size is not a
                      // multiple of cipher's block size; used with test cases)
    cpPadSizeByte,    // Padded with zeros and pad size byte
    cpPadPKCS5);      // Padded with pad size byte repeated

const
  MaxCipherContextSize = 384;

type
  TCipherState = record
    Operation  : TCipherOperation;
    Cipher     : TCipherType;
    Mode       : TCipherMode;
    Padding    : TCipherPadding;
    KeyBits    : Integer;
    CipherInfo : PCipherInfo;
    Context    : array[0..MaxCipherContextSize - 1] of Byte;
  end;

const
  CipherStateSize = SizeOf(TCipherState);



{                                                                              }
{ Encrypt                                                                      }
{                                                                              }
procedure EncryptInit(
          var State: TCipherState;
          const Cipher: TCipherType; const Mode: TCipherMode;
          const Padding: TCipherPadding;
          const KeyBits: Integer;
          const KeyBuffer: Pointer; const KeyBufferSize: Integer);
function  EncryptBuf(
          var State: TCipherState;
          const InputBuffer: Pointer; const InputBufferSize: Integer;
          const OutputBuffer: Pointer; const OutputBufferSize: Integer;
          const InitVectorBuffer: Pointer; const InitVectorBufferSize: Integer): Integer;
procedure EncryptFinalise(var State: TCipherState);

function  EncryptedSize(
          const Cipher: TCipherType; const Padding: TCipherPadding;
          const BufferSize: Integer): Integer;
function  Encrypt(
          const Cipher: TCipherType; const Mode: TCipherMode;
          const Padding: TCipherPadding;
          const KeyBits: Integer;
          const KeyBuffer: Pointer; const KeyBufferSize: Integer;
          const InputBuffer: Pointer; const InputBufferSize: Integer;
          const OutputBuffer: Pointer; const OutputBufferSize: Integer;
          const InitVectorBuffer: Pointer; const InitVectorBufferSize: Integer): Integer; overload;
function  Encrypt(
          const Cipher: TCipherType; const Mode: TCipherMode;
          const Padding: TCipherPadding;
          const KeyBits: Integer;
          const Key, Data, InitVector: AnsiString): AnsiString; overload;



{                                                                              }
{ Decrypt                                                                      }
{                                                                              }
procedure DecryptInit(
          var State: TCipherState;
          const Cipher: TCipherType; const Mode: TCipherMode;
          const Padding: TCipherPadding;
          const KeyBits: Integer;
          const KeyBuffer: Pointer; const KeyBufferSize: Integer);
function  DecryptBuf(
          var State: TCipherState;
          const Buffer: Pointer; const BufferSize: Integer;
          const InitVectorBuffer: Pointer; const InitVectorBufferSize: Integer): Integer;
procedure DecryptFinalise(var State: TCipherState);

function  Decrypt(
          const Cipher: TCipherType; const Mode: TCipherMode;
          const Padding: TCipherPadding;
          const KeyBits: Integer;
          const KeyBuffer: Pointer; const KeyBufferSize: Integer;
          const Buffer: Pointer; const BufferSize: Integer;
          const InitVectorBuffer: Pointer; const InitVectorBufferSize: Integer): Integer; overload;
function  Decrypt(
          const Cipher: TCipherType; const Mode: TCipherMode;
          const Padding: TCipherPadding;
          const KeyBits: Integer;
          const Key, Data, InitVector: AnsiString): AnsiString; overload;



{                                                                              }
{ Test cases                                                                   }
{                                                                              }
{$IFDEF DEBUG}{$IFDEF SELFTEST}
procedure SelfTest;
procedure Profile;
{$ENDIF}{$ENDIF}



implementation

uses
  { Fundamentals }
  cHugeInt,
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
{ RC2 cipher                                                                   }
{                                                                              }
const
  RC2ContextSize = Sizeof(TRC2CipherKey);

procedure CipherRC2Init(const Operation: TCipherOperation;
    const KeyBuffer: Pointer; const KeyBufferSize: Integer;
    const KeyBits: Integer; const ContextBuffer: Pointer);
begin
  RC2Init(KeyBuffer^, KeyBufferSize, KeyBits, PRC2CipherKey(ContextBuffer)^);
end;

procedure CipherRC2EncryptBuffer(const Context, Data: Pointer; const DataSize: Integer);
begin
  Assert(DataSize = RC2BlockSize);
  RC2EncryptBlock(PRC2CipherKey(Context)^, PRC2Block(Data)^);
end;

procedure CipherRC2DecryptBuffer(const Context, Data: Pointer; const DataSize: Integer);
begin
  Assert(DataSize = RC2BlockSize);
  RC2DecryptBlock(PRC2CipherKey(Context)^, PRC2Block(Data)^);
end;



{                                                                              }
{ RC4 cipher                                                                   }
{                                                                              }
const
  RC4ContextSize = Sizeof(TRC4Context);

procedure CipherRC4Init(const Operation: TCipherOperation;
    const KeyBuffer: Pointer; const KeyBufferSize: Integer;
    const KeyBits: Integer; const ContextBuffer: Pointer);
begin
  RC4Init(KeyBuffer^, KeyBufferSize, PRC4Context(ContextBuffer)^);
end;

procedure CipherRC4Buffer(const Context, Data: Pointer; const DataSize: Integer);
begin
  RC4Buffer(PRC4Context(Context)^, Data^, DataSize);
end;



{                                                                              }
{ DES cipher                                                                   }
{                                                                              }
const
  DESContextSize = Sizeof(TDESContext);
  DESKeySize     = Sizeof(TDESKey);

procedure CipherDESInit(const Operation: TCipherOperation;
    const KeyBuffer: Pointer; const KeyBufferSize: Integer;
    const KeyBits: Integer; const ContextBuffer: Pointer);
begin
  if KeyBufferSize <> DESKeySize then
    raise ECipher.Create(CipherError_InvalidKeySize, 'Invalid DES key length');
  DESInit(Operation = coEncrypt, PDESKey(KeyBuffer)^, PDESContext(ContextBuffer)^);
end;

procedure CipherDESBuffer(const Context, Data: Pointer; const DataSize: Integer);
begin
  Assert(DataSize = DESBlockSize);
  DESBuffer(PDESContext(Context)^, PDESBlock(Data)^);
end;



{                                                                              }
{ DES-40 cipher                                                                }
{                                                                              }
const
  DES40ContextSize = DESContextSize;
  DES40KeySize     = DESKeySize;

procedure CipherDES40Init(const Operation: TCipherOperation;
    const KeyBuffer: Pointer; const KeyBufferSize: Integer;
    const KeyBits: Integer; const ContextBuffer: Pointer);
var DES40Key : TDESKey;
begin
  if KeyBufferSize <> DES40KeySize then
    raise ECipher.Create(CipherError_InvalidKeySize, 'Invalid DES key length');
  Move(KeyBuffer, DES40Key, DES40KeySize);
  DESKeyConvertToDES40(DES40Key);
  DESInit(Operation = coEncrypt, DES40Key, PDESContext(ContextBuffer)^);
end;

procedure CipherDES40Buffer(const Context, Data: Pointer; const DataSize: Integer);
begin
  Assert(DataSize = DESBlockSize);
  DESBuffer(PDESContext(Context)^, PDESBlock(Data)^);
end;



{                                                                              }
{ Triple-DES cipher                                                            }
{                                                                              }
const
  TripleDESContextSize = Sizeof(TTripleDESContext);

procedure CipherTripleDESInit(const Operation: TCipherOperation;
    const KeyBuffer: Pointer; const KeyBufferSize: Integer;
    const KeyBits: Integer; const ContextBuffer: Pointer);
begin
  if KeyBufferSize <> SizeOf(TTripleDESKey) then
    raise ECipher.Create(CipherError_InvalidKeySize, 'Invalid DES key length');
  TripleDESInit(Operation = coEncrypt, PTripleDESKey(KeyBuffer)^,
      PTripleDESContext(ContextBuffer)^);
end;

procedure CipherTripleDESBuffer(const Context, Data: Pointer; const DataSize: Integer);
begin
  Assert(DataSize = DESBlockSize);
  TripleDESBuffer(PTripleDESContext(Context)^, PDESBlock(Data)^);
end;



{                                                                              }
{ Triple-DES-3 cipher                                                          }
{                                                                              }
const
  TripleDES3ContextSize = Sizeof(TTripleDES3Context);

procedure CipherTripleDES3EDEInit(const Operation: TCipherOperation;
    const KeyBuffer: Pointer; const KeyBufferSize: Integer;
    const KeyBits: Integer; const ContextBuffer: Pointer);
begin
  if KeyBufferSize <> SizeOf(TTripleDES3Key) then
    raise ECipher.Create(CipherError_InvalidKeySize, 'Invalid DES key length');
  TripleDES3Init(Operation = coEncrypt, PTripleDES3Key(KeyBuffer)^, False,
      PTripleDES3Context(ContextBuffer)^);
end;

procedure CipherTripleDES3EEEInit(const Operation: TCipherOperation;
    const KeyBuffer: Pointer; const KeyBufferSize: Integer;
    const KeyBits: Integer; const ContextBuffer: Pointer);
begin
  if KeyBufferSize <> SizeOf(TTripleDES3Key) then
    raise ECipher.Create(CipherError_InvalidKeySize, 'Invalid DES key length');
  TripleDES3Init(Operation = coEncrypt, PTripleDES3Key(KeyBuffer)^, True,
      PTripleDES3Context(ContextBuffer)^);
end;

procedure CipherTripleDES3Buffer(const Context, Data: Pointer; const DataSize: Integer);
begin
  Assert(DataSize = DESBlockSize);
  TripleDES3Buffer(PTripleDES3Context(Context)^, PDESBlock(Data)^);
end;



{                                                                              }
{ CAST-256 cipher                                                              }
{                                                                              }
{$IFDEF Cipher_SupportCAST}
const
  Cast256ContextSize = Sizeof(TCast256Context);
  Cast256KeySize     = Sizeof(TCast256Key);

procedure CipherCast256Init(const Operation: TCipherOperation;
    const KeyBuffer: Pointer; const KeyBufferSize: Integer;
    const KeyBits: Integer; const ContextBuffer: Pointer);
begin
  Cast256Init(KeyBuffer, KeyBufferSize, PCast256Context(ContextBuffer)^);
end;

procedure CipherCast256EncryptBuffer(const Context, Data: Pointer; const DataSize: Integer);
begin
  Assert(DataSize = Cast256BlockSize);
  Cast256EncryptBlock(PCast256Context(Context)^, PCast256Buffer(Data)^);
end;

procedure CipherCast256DecryptBuffer(const Context, Data: Pointer; const DataSize: Integer);
begin
  Assert(DataSize = Cast256BlockSize);
  Cast256DecryptBlock(PCast256Context(Context)^, PCast256Buffer(Data)^);
end;
{$ENDIF}



{                                                                              }
{ AES cipher                                                                   }
{                                                                              }
const
  AESContextSize = Sizeof(TAESContext);

procedure CipherAESInit(const Operation: TCipherOperation;
    const KeyBuffer: Pointer; const KeyBufferSize: Integer;
    const KeyBits: Integer; const ContextBuffer: Pointer);
begin
  AESInit(PAESContext(ContextBuffer)^, KeyBits, KeyBuffer^, KeyBufferSize);
end;

procedure CipherAESEncryptBuffer(const Context, Data: Pointer; const DataSize: Integer);
begin
  Assert(DataSize = AESBlockSize);
  AESEncryptBlock(PAESContext(Context)^, Data^, DataSize, Data^, DataSize);
end;

procedure CipherAESDecryptBuffer(const Context, Data: Pointer; const DataSize: Integer);
begin
  Assert(DataSize = AESBlockSize);
  AESDecryptBlock(PAESContext(Context)^, Data^, DataSize, Data^, DataSize);
end;

procedure CipherAESFinalise(const Context: Pointer);
begin
  AESFinalise(PAESContext(Context)^);
end;



{                                                                              }
{ RSA cipher                                                                   }
{ Note: Stub under development                                                 } 
{                                                                              }
{$IFDEF Cipher_SupportRSA}
type
  TRSAOAEP1024Context = packed record
    Encrypt    : Boolean;
    PublicKey  : TRSAPublicKey;
    PrivateKey : TRSAPrivateKey;
  end;
  PRSAOAEP1024Context = ^TRSAOAEP1024Context;

const
  RSAOAEP1024ContextSize = SizeOf(TRSAOAEP1024Context);

procedure CipherRSAOAEP1024Init(const Operation: TCipherOperation;
    const KeyBuffer: Pointer; const KeyBufferSize: Integer;
    const KeyBits: Integer; const ContextBuffer: Pointer);
const
  KeyPartBits = 1024;
  KeyPartSize = 1024 div 8;
var C : PRSAOAEP1024Context;
    P, Q : PByte;
begin
  C := ContextBuffer;
  C^.Encrypt := Operation = coEncrypt;
  RSAPublicKeyInit(C^.PublicKey);
  RSAPrivateKeyInit(C^.PrivateKey);
  if (KeyBufferSize <> KeyPartSize * 2) or (KeyBits <> KeyPartBits) then
    raise ECipher.Create(CipherError_InvalidKeySize, 'Invalid RSA key length');
  P := @KeyBuffer;
  Q := P;
  Inc(Q, KeyPartSize);
  if Operation = coEncrypt then
    RSAPublicKeyAssignBuf(C^.PublicKey, KeyPartBits, P^, KeyPartSize, Q^, KeyPartSize, False)
  else
    RSAPrivateKeyAssignBuf(C^.PrivateKey, KeyPartBits, P^, KeyPartSize, Q^, KeyPartSize, False);
end;

procedure CipherRSAOAEP1024EncryptBuffer(const Context, Data: Pointer; const DataSize: Integer);
var C : PRSAOAEP1024Context;
    B : array[0..127] of Byte;
begin
  C := Context;
  RSAEncrypt(rsaetOAEP, C^.PublicKey, Data, DataSize, B[0], SizeOf(B));
  Move(B[0], Data^, 128);
end;

procedure CipherRSAOAEP1024DecryptBuffer(const Context, Data: Pointer; const DataSize: Integer);
var C : PRSAOAEP1024Context;
    B : array[0..127] of Byte;
begin
  C := Context;
  RSADecrypt(rsaetOAEP, C^.PrivateKey, Data, DataSize, B[0], SizeOf(B));
  Move(B[0], Data^, 128);
end;

procedure CipherRSAOAEP1024Finalise(const Context: Pointer);
var C : PRSAOAEP1024Context;
begin
  C := Context;
  RSAPrivateKeyFinalise(C^.PrivateKey);
  RSAPublicKeyFinalise(C^.PublicKey);
end;
{$ENDIF}



{                                                                              }
{ Cipher mode buffer functions                                                 }
{                                                                              }
procedure XORBuffer(const Buffer1, Buffer2: Pointer; const BufferSize: Integer);
var I    : Integer;
    P, Q : PByte;
begin
  Assert(Assigned(Buffer1));
  Assert(Assigned(Buffer2));
  P := Buffer1;
  Q := Buffer2;
  for I := 0 to BufferSize - 1 do
    begin
      P^ := P^ xor Q^;
      Inc(P);
      Inc(Q);
    end;
end;

{ Cipher buffer                                                                }
procedure CipherBuffer(
    const Buffer: Pointer; const BufferSize: Integer;
    const CipherContext: Pointer;
    const CipherFunc: TCipherBufferFunc; const CipherBlockSize: Integer);
begin
  CipherFunc(CipherContext, @Buffer, BufferSize);
end;

{ ECB - Electronic codebook                                                    }
procedure ECBBuffer(
    const Buffer: Pointer; const BufferSize: Integer;
    const CipherContext: Pointer;
    const CipherFunc: TCipherBufferFunc; const CipherBlockSize: Integer);
var P    : PByte;
    L, M : Integer;
begin
  P := Buffer;
  L := BufferSize;
  while L > 0 do
    begin
      if L >= CipherBlockSize then
        M := CipherBlockSize
      else
        M := L;
      CipherFunc(CipherContext, P, M);
      Inc(P, M);
      Dec(L, M);
    end;
end;

{ CBC - Cipher-block chaining                                                  }
{ See http://en.wikipedia.org/wiki/Cipher_block_chaining                       }
const
  MaxCipherBlockSize = 4096;

procedure CBCEncode(
    const Buffer: Pointer; const BufferSize: Integer;
    const CipherContext: Pointer;
    const CipherFunc: TCipherBufferFunc; const CipherBlockSize: Integer;
    const InitVector: Pointer; const InitVectorBufferSize: Integer);
var P, F : PByte;
    L    : Integer;
    B    : array[0..MaxCipherBlockSize - 1] of Byte;
begin
  Assert(BufferSize > 0);
  Assert(CipherBlockSize <= MaxCipherBlockSize);
  Assert(Assigned(InitVector));
  Assert(InitVectorBufferSize = CipherBlockSize);
  P := Buffer;
  L := BufferSize;
  F := InitVector;
  while L >= CipherBlockSize do
    begin
      XORBuffer(P, F, CipherBlockSize);
      CipherFunc(CipherContext, P, CipherBlockSize);
      F := P;
      Dec(L, CipherBlockSize);
      Inc(P, CipherBlockSize);
    end;
  if L > 0 then
    begin
      Move(P^, B[0], L);
      FillChar(B[L], CipherBlockSize - L, 0);
      XORBuffer(@B[0], F, CipherBlockSize);
      CipherFunc(CipherContext, @B[0], L);
      Move(B[0], P^, L);
      SecureClear(B[0], CipherBlockSize);
    end;
end;

procedure CBCDecode(
    const Buffer: Pointer; const BufferSize: Integer;
    const CipherState: Pointer;
    const CipherFunc: TCipherBufferFunc; const CipherBlockSize: Integer;
    const InitVector: Pointer; const InitVectorBufferSize: Integer);
var P : PByte;
    L : Integer;
    B : array[0..MaxCipherBlockSize - 1] of Byte;
    C : array[0..MaxCipherBlockSize - 1] of Byte;
begin
  Assert(BufferSize > 0);
  Assert(CipherBlockSize <= MaxCipherBlockSize);
  Assert(Assigned(InitVector));
  Assert(InitVectorBufferSize = CipherBlockSize);
  P := Buffer;
  L := BufferSize;
  Move(InitVector^, B[0], CipherBlockSize);
  while L >= CipherBlockSize do
    begin
      Move(P^, C[0], CipherBlockSize);
      CipherFunc(CipherState, P, CipherBlockSize);
      XORBuffer(P, @B[0], CipherBlockSize);
      Move(C[0], B[0], CipherBlockSize);
      Dec(L, CipherBlockSize);
      Inc(P, CipherBlockSize);
    end;
  if L > 0 then
    begin
      Move(P^, C[0], L);
      FillChar(C[L], CipherBlockSize - L, 0);
      CipherFunc(CipherState, @C[0], L);
      XORBuffer(@C[0], @B[0], CipherBlockSize);
      Move(C[0], P^, L);
    end;
  SecureClear(B[0], CipherBlockSize);
  SecureClear(C[0], CipherBlockSize);
end;

{ CFB - Cipher FeedBack                                                        }
procedure CFBEncode(
    const Buffer: Pointer; const BufferSize: Integer;
    const CipherContext: Pointer;
    const CipherFunc: TCipherBufferFunc; const CipherBlockSize: Integer;
    const InitVector: Pointer; const InitVectorBufferSize: Integer);
var P    : PByte;
    L    : Integer;
    B, F : array[0..MaxCipherBlockSize - 1] of Byte;
begin
  Assert(BufferSize > 0);
  Assert(CipherBlockSize <= MaxCipherBlockSize);
  Assert(Assigned(InitVector));
  Assert(InitVectorBufferSize = CipherBlockSize);
  P := Buffer;
  L := BufferSize;
  Move(InitVector^, F[0], CipherBlockSize);
  while L >= 0 do
    begin
      Move(F[0], B[0], CipherBlockSize);
      CipherFunc(CipherContext, @B[0], CipherBlockSize);
      P^ := P^ xor B[0];
      Move(F[1], F[0], CipherBlockSize - 1);
      F[CipherBlockSize - 1] := P^;
      Dec(L);
      Inc(P);
    end;
  SecureClear(B[0], CipherBlockSize);
end;

procedure CFBDecode(
    const Buffer: Pointer; const BufferSize: Integer;
    const CipherContext: Pointer;
    const CipherFunc: TCipherBufferFunc; const CipherBlockSize: Integer;
    const InitVector: Pointer; const InitVectorBufferSize: Integer);
var P    : PByte;
    C    : Byte;
    L    : Integer;
    B, F : array[0..MaxCipherBlockSize - 1] of Byte;
begin
  Assert(BufferSize > 0);
  Assert(CipherBlockSize <= MaxCipherBlockSize);
  Assert(Assigned(InitVector));
  Assert(InitVectorBufferSize = CipherBlockSize);
  P := Buffer;
  L := BufferSize;
  Move(InitVector^, F[0], CipherBlockSize);
  while L >= 0 do
    begin
      Move(F[0], B[0], CipherBlockSize);
      CipherFunc(CipherContext, @B[0], CipherBlockSize);
      Move(F[1], F[0], CipherBlockSize - 1);
      C := P^;
      F[CipherBlockSize - 1] := C;
      P^ := C xor B[0];
      Dec(L);
      Inc(P);
    end;
  SecureClear(B[0], CipherBlockSize);
end;

{ OFB - Output FeedBack                                                        }
procedure OFBEncode(
    const Buffer: Pointer; const BufferSize: Integer;
    const CipherContext: Pointer;
    const CipherFunc: TCipherBufferFunc; const CipherBlockSize: Integer;
    const InitVector: Pointer; const InitVectorBufferSize: Integer);
var P    : PByte;
    L    : Integer;
    B, F : array[0..MaxCipherBlockSize - 1] of Byte;
begin
  Assert(BufferSize > 0);
  Assert(CipherBlockSize <= MaxCipherBlockSize);
  Assert(Assigned(InitVector));
  Assert(InitVectorBufferSize = CipherBlockSize);
  P := Buffer;
  L := BufferSize;
  Move(InitVector^, F[0], CipherBlockSize);
  while L >= 0 do
    begin
      Move(F[0], B[0], CipherBlockSize);
      CipherFunc(CipherContext, @B[0], CipherBlockSize);
      P^ := P^ xor B[0];
      Move(F[1], F[0], CipherBlockSize - 1);
      F[CipherBlockSize - 1] := B[0];
      Dec(L);
      Inc(P);
    end;
  SecureClear(B[0], CipherBlockSize);
end;

procedure OFBDecode(
    const Buffer: Pointer; const BufferSize: Integer;
    const CipherContext: Pointer;
    const CipherFunc: TCipherBufferFunc; const CipherBlockSize: Integer;
    const InitVector: Pointer; const InitVectorBufferSize: Integer);
var P    : PByte;
    L    : Integer;
    B, F : array[0..MaxCipherBlockSize - 1] of Byte;
begin
  Assert(BufferSize > 0);
  Assert(CipherBlockSize <= MaxCipherBlockSize);
  Assert(Assigned(InitVector));
  Assert(InitVectorBufferSize = CipherBlockSize);
  P := Buffer;
  L := BufferSize;
  Move(InitVector^, F[0], CipherBlockSize);
  while L >= 0 do
    begin
      Move(F[0], B[0], CipherBlockSize);
      CipherFunc(CipherContext, @B[0], CipherBlockSize);
      Move(F[1], F[0], CipherBlockSize - 1);
      F[CipherBlockSize - 1] := B[0];
      P^ := P^ xor B[0];
      Dec(L);
      Inc(P);
    end;
  SecureClear(B[0], CipherBlockSize);
end;



{                                                                              }
{ Cipher information                                                           }
{                                                                              }
const
  CipherInfo : array[TCipherType] of TCipherInfo = (
    (
     ValidCipher:  False;
     ShortName:    '';
     BufferMode:   cbmStream;
     InBlockSize:  0;
     OutBlockSize: 0;
     KeyBitsMin:   0;
     KeyBitsMax:   0;
     ContextSize:  0;
     InitFunc:     nil;
     EncryptFunc:  nil;
     DecryptFunc:  nil;
     FinaliseFunc: nil;
    ),

    (
     ValidCipher:  True;
     ShortName:    'RC2';
     BufferMode:   cbmMultipleBlocks;
     InBlockSize:  RC2BlockSize;
     OutBlockSize: RC2BlockSize;
     KeyBitsMin:   1;
     KeyBitsMax:   1024;
     ContextSize:  RC2ContextSize;
     InitFunc:     CipherRC2Init;
     EncryptFunc:  CipherRC2EncryptBuffer;
     DecryptFunc:  CipherRC2DecryptBuffer;
     FinaliseFunc: nil;
    ),

    (
     ValidCipher:  True;
     ShortName:    'RC4';
     BufferMode:   cbmStream;
     InBlockSize:  1024;
     OutBlockSize: 1024;
     KeyBitsMin:   1;
     KeyBitsMax:   2048;
     ContextSize:  RC4ContextSize;
     InitFunc:     CipherRC4Init;
     EncryptFunc:  CipherRC4Buffer;
     DecryptFunc:  CipherRC4Buffer;
     FinaliseFunc: nil;
    ),

    (
     ValidCipher:  True;
     ShortName:    'DES';
     BufferMode:   cbmMultipleBlocks;
     InBlockSize:  DESBlockSize;
     OutBlockSize: DESBlockSize;
     KeyBitsMin:   64;
     KeyBitsMax:   64;
     ContextSize:  DESContextSize;
     InitFunc:     CipherDESInit;
     EncryptFunc:  CipherDESBuffer;
     DecryptFunc:  CipherDESBuffer;
     FinaliseFunc: nil;
    ),

    (
     ValidCipher:  True;
     ShortName:    'DES-40';
     BufferMode:   cbmMultipleBlocks;
     InBlockSize:  DESBlockSize;
     OutBlockSize: DESBlockSize;
     KeyBitsMin:   64;
     KeyBitsMax:   64;
     ContextSize:  DES40ContextSize;
     InitFunc:     CipherDES40Init;
     EncryptFunc:  CipherDES40Buffer;
     DecryptFunc:  CipherDES40Buffer;
     FinaliseFunc: nil;
    ),

    (
     ValidCipher:  True;
     ShortName:    'TripleDES';
     BufferMode:   cbmMultipleBlocks;
     InBlockSize:  DESBlockSize;
     OutBlockSize: DESBlockSize;
     KeyBitsMin:   128;
     KeyBitsMax:   128;
     ContextSize:  TripleDESContextSize;
     InitFunc:     CipherTripleDESInit;
     EncryptFunc:  CipherTripleDESBuffer;
     DecryptFunc:  CipherTripleDESBuffer;
     FinaliseFunc: nil;
    ),

    (
     ValidCipher:  True;
     ShortName:    'TripleDES3EDE';
     BufferMode:   cbmMultipleBlocks;
     InBlockSize:  DESBlockSize;
     OutBlockSize: DESBlockSize;
     KeyBitsMin:   192;
     KeyBitsMax:   192;
     ContextSize:  TripleDES3ContextSize;
     InitFunc:     CipherTripleDES3EDEInit;
     EncryptFunc:  CipherTripleDES3Buffer;
     DecryptFunc:  CipherTripleDES3Buffer;
     FinaliseFunc: nil;
    ),

    (
     ValidCipher:  True;
     ShortName:    'TipleDES3EEE';
     BufferMode:   cbmMultipleBlocks;
     InBlockSize:  DESBlockSize;
     OutBlockSize: DESBlockSize;
     KeyBitsMin:   192;
     KeyBitsMax:   192;
     ContextSize:  TripleDES3ContextSize;
     InitFunc:     CipherTripleDES3EEEInit;
     EncryptFunc:  CipherTripleDES3Buffer;
     DecryptFunc:  CipherTripleDES3Buffer;
     FinaliseFunc: nil;
    ),

    {$IFDEF Cipher_SupportCAST}
    (
     ValidCipher:  True;
     ShortName:    'CAST-256';
     BufferMode:   cbmMultipleBlocks;
     InBlockSize:  Cast256BlockSize;
     OutBlockSize: Cast256BlockSize;
     KeyBitsMin:   256;
     KeyBitsMax:   256;
     ContextSize:  Cast256ContextSize;
     InitFunc:     CipherCast256Init;
     EncryptFunc:  CipherCast256EncryptBuffer;
     DecryptFunc:  CipherCast256DecryptBuffer;
     FinaliseFunc: nil;
    ),
    {$ELSE}
    (
     ValidCipher:  False;
     ShortName:    'CAST-256';
     BufferMode:   cbmMultipleBlocks;
     InBlockSize:  0;
     OutBlockSize: 0;
     KeyBitsMin:   256;
     KeyBitsMax:   256;
     ContextSize:  0;
     InitFunc:     nil;
     EncryptFunc:  nil;
     DecryptFunc:  nil;
     FinaliseFunc: nil;
    ),
    {$ENDIF}

    (
     ValidCipher:  True;
     ShortName:    'AES';
     BufferMode:   cbmMultipleBlocks;
     InBlockSize:  AESBlockSize;
     OutBlockSize: AESBlockSize;
     KeyBitsMin:   128;
     KeyBitsMax:   256;
     ContextSize:  AESContextSize;
     InitFunc:     CipherAESInit;
     EncryptFunc:  CipherAESEncryptBuffer;
     DecryptFunc:  CipherAESDecryptBuffer;
     FinaliseFunc: CipherAESFinalise;
    ),

    {$IFDEF Cipher_SupportRSA}
    (
     ValidCipher:  True;
     ShortName:    'RSA-OAEP-1024';
     BufferMode:   cbmSingleBlock;
     InBlockSize:  0;
     OutBlockSize: 128;
     KeyBitsMin:   2048;
     KeyBitsMax:   2048;
     ContextSize:  RSAOAEP1024ContextSize;
     InitFunc:     CipherRSAOAEP1024Init;
     EncryptFunc:  CipherRSAOAEP1024EncryptBuffer;
     DecryptFunc:  CipherRSAOAEP1024DecryptBuffer;
     FinaliseFunc: CipherRSAOAEP1024Finalise;
    )
    {$ELSE}
    (
     ValidCipher:  False;
     ShortName:    'RSA-OAEP-1024';
     BufferMode:   cbmSingleBlock;
     InBlockSize:  0;
     OutBlockSize: 128;
     KeyBitsMin:   1024;
     KeyBitsMax:   1024;
     ContextSize:  0;
     InitFunc:     nil;
     EncryptFunc:  nil;
     DecryptFunc:  nil;
     FinaliseFunc: nil;
    )
    {$ENDIF}
  );

function GetCipherInfo(const Cipher: TCipherType): PCipherInfo;
begin
  Result := @CipherInfo[Cipher];
  if not Result^.ValidCipher then
    Result := nil;
end;



{                                                                              }
{ Cipher                                                                       }
{                                                                              }
function InitCipherState(
         var State: TCipherState;
         const Operation: TCipherOperation;
         const Cipher: TCipherType; const Mode: TCipherMode;
         const Padding: TCipherPadding;
         const KeyBits: Integer): PCipherInfo;
var C : PCipherInfo;
begin
  C := GetCipherInfo(Cipher);
  if not Assigned(C) then
    raise ECipher.Create(CipherError_InvalidCipher, 'Invalid cipher');
  FillChar(State, SizeOf(State), 0);
  State.Operation  := Operation;
  State.Cipher     := Cipher;
  State.Mode       := Mode;
  State.Padding    := Padding;
  State.KeyBits    := KeyBits;
  State.CipherInfo := C;
  Result := C;
end;



{                                                                              }
{ Encrypt                                                                      }
{                                                                              }
procedure EncryptInit(
          var State: TCipherState;
          const Cipher: TCipherType; const Mode: TCipherMode;
          const Padding: TCipherPadding;
          const KeyBits: Integer;
          const KeyBuffer: Pointer; const KeyBufferSize: Integer);
var C : PCipherInfo;
begin
  C := InitCipherState(State, coEncrypt, Cipher, Mode, Padding, KeyBits);
  if Assigned(C^.InitFunc) then
    C^.InitFunc(coEncrypt, KeyBuffer, KeyBufferSize, KeyBits, @State.Context);
end;

procedure EncryptPadBuffer(
          const Padding: TCipherPadding;
          const Buffer: Pointer;
          const InputBufferSize, OutputBufferSize: Integer);
var P : PAnsiChar;
    I : Integer;
begin
  P := Buffer;
  Inc(P, InputBufferSize);
  I := OutputBufferSize - InputBufferSize;
  case Padding of
    cpNone        : FillChar(P^, I, 0);
    cpPadSizeByte :
      begin
        FillChar(P^, I - 1, 0);
        Assert(I <= $FF);
        Inc(P, I - 1);
        P^ := AnsiChar(I);
      end;
    cpPadPKCS5    :
      begin
        Assert(I <= $FF);
        FillChar(P^, I, Char(I));
      end;
  end;
end;

function EncryptedSize(
         const Cipher: TCipherType; const Padding: TCipherPadding;
         const BufferSize: Integer): Integer;
var C : PCipherInfo;
    B : Integer;
begin
  if BufferSize < 0 then
    begin
      Result := 0;
      exit;
    end;
  C := GetCipherInfo(Cipher);
  case C^.BufferMode of
    cbmMultipleBlocks :
      begin
        Result := BufferSize;
        B := C^.OutBlockSize;
        Assert((Padding = cpNone) or (B <= $FF));
        case Padding of
          cpNone        : ;
          cpPadSizeByte : Inc(Result);
          cpPadPKCS5    :
            if Result mod B = 0 then
              Inc(Result, B);
        end;
        Result := ((Result + (B - 1)) div B) * B;
      end;
    cbmSingleBlock : Result := C^.OutBlockSize;
    cbmStream      : Result := BufferSize;
  else
    Result := BufferSize;
  end;
end;

function EncryptBuf(
         var State: TCipherState;
         const InputBuffer: Pointer; const InputBufferSize: Integer;
         const OutputBuffer: Pointer; const OutputBufferSize: Integer;
         const InitVectorBuffer: Pointer; const InitVectorBufferSize: Integer): Integer;
var C : PCipherInfo;
    P : Pointer;
begin
  Assert(State.Operation = coEncrypt);
  Assert(Assigned(State.CipherInfo));
  
  C := State.CipherInfo;
  // validate parameters
  Result := EncryptedSize(State.Cipher, State.Padding, InputBufferSize);
  if Result = 0 then
    exit;
  if Result > OutputBufferSize then
    raise ECipher.Create(CipherError_InvalidBufferSize, 'Output buffer too small');
  if not Assigned(InputBuffer) or not Assigned(OutputBuffer) then
    raise ECipher.Create(CipherError_InvalidBuffer, 'Invalid buffer');
  // encrypt
  if InputBuffer <> OutputBuffer then
    Move(InputBuffer^, OutputBuffer^, InputBufferSize);
  // pad buffer
  if C^.BufferMode = cbmMultipleBlocks then
    if InputBufferSize < Result then
      EncryptPadBuffer(State.Padding, OutputBuffer, InputBufferSize, Result);
  // encrypt buffer
  P := @State.Context;
  if C^.BufferMode = cbmSingleBlock then
    CipherBuffer(OutputBuffer, Result, P, C^.EncryptFunc, C^.InBlockSize)
  else
    case State.Mode of
      cmECB : ECBBuffer(OutputBuffer, Result, P, C^.EncryptFunc, C^.InBlockSize);
      cmCBC : CBCEncode(OutputBuffer, Result, P, C^.EncryptFunc, C^.InBlockSize, InitVectorBuffer, InitVectorBufferSize);
      cmCFB : CFBEncode(OutputBuffer, Result, P, C^.EncryptFunc, C^.InBlockSize, InitVectorBuffer, InitVectorBufferSize);
      cmOFB : OFBEncode(OutputBuffer, Result, P, C^.EncryptFunc, C^.InBlockSize, InitVectorBuffer, InitVectorBufferSize);
    else
      raise ECipher.Create(CipherError_InvalidCipherMode, 'Invalid cipher mode');
    end;
end;

procedure EncryptFinalise(var State: TCipherState);
var C : PCipherInfo;
begin
  C := State.CipherInfo;
  if Assigned(C) then
    if Assigned(C^.FinaliseFunc) then
      C^.FinaliseFunc(@State.Context);
  SecureClear(State, SizeOf(State));
end;

function Encrypt(const Cipher: TCipherType; const Mode: TCipherMode;
         const Padding: TCipherPadding;
         const KeyBits: Integer;
         const KeyBuffer: Pointer; const KeyBufferSize: Integer;
         const InputBuffer: Pointer; const InputBufferSize: Integer;
         const OutputBuffer: Pointer; const OutputBufferSize: Integer;
         const InitVectorBuffer: Pointer; const InitVectorBufferSize: Integer): Integer;
var State : TCipherState;
begin
  EncryptInit(
      State, Cipher, Mode, Padding,
      KeyBits, KeyBuffer, KeyBufferSize);
  Result := EncryptBuf(
      State,
      InputBuffer, InputBufferSize, OutputBuffer, OutputBufferSize,
      InitVectorBuffer, InitVectorBufferSize);
  EncryptFinalise(State);
end;

function Encrypt(const Cipher: TCipherType; const Mode: TCipherMode;
         const Padding: TCipherPadding; const KeyBits: Integer;
         const Key, Data, InitVector: AnsiString): AnsiString;
var L, M : Integer;
begin
  M := Length(Data);
  L := EncryptedSize(Cipher, Padding, M);
  SetLength(Result, L);
  if L = 0 then
    exit;
  Encrypt(Cipher, Mode, Padding, KeyBits, Pointer(Key), Length(Key),
      Pointer(Data), M, Pointer(Result), L,
      Pointer(InitVector), Length(InitVector));
end;



{                                                                              }
{ Decrypt                                                                      }
{                                                                              }
procedure DecryptInit(
          var State: TCipherState;
          const Cipher: TCipherType; const Mode: TCipherMode;
          const Padding: TCipherPadding;
          const KeyBits: Integer;
          const KeyBuffer: Pointer; const KeyBufferSize: Integer);
var C : PCipherInfo;
begin
  C := InitCipherState(State, coDecrypt, Cipher, Mode, Padding, KeyBits);
  if Assigned(C^.InitFunc) then
    if Mode in [cmCFB, cmOFB] then
      C^.InitFunc(coEncrypt, KeyBuffer, KeyBufferSize, KeyBits, @State.Context)
    else
      C^.InitFunc(coDecrypt, KeyBuffer, KeyBufferSize, KeyBits, @State.Context)
end;

function DecryptBuf(
         var State: TCipherState;
         const Buffer: Pointer; const BufferSize: Integer;
         const InitVectorBuffer: Pointer; const InitVectorBufferSize: Integer): Integer;
var C : PCipherInfo;
    P : PByte;
    D : Pointer;
    I : Integer;
    L : Byte;
    N : Integer;
begin
  Assert(State.Operation = coDecrypt);
  Assert(Assigned(State.CipherInfo));

  C := State.CipherInfo;
  // decrypt buffer
  D := @State.Context;
  if C^.BufferMode = cbmSingleBlock then
    CipherBuffer(Buffer, BufferSize, D, C^.DecryptFunc, C^.InBlockSize)
  else
    case State.Mode of
      cmECB : ECBBuffer(Buffer, BufferSize, D, C^.DecryptFunc, C^.InBlockSize);
      cmCBC : CBCDecode(Buffer, BufferSize, D, C^.DecryptFunc, C^.InBlockSize, InitVectorBuffer, InitVectorBufferSize);
      cmCFB : CFBDecode(Buffer, BufferSize, D, C^.EncryptFunc, C^.InBlockSize, InitVectorBuffer, InitVectorBufferSize);
      cmOFB : OFBDecode(Buffer, BufferSize, D, C^.EncryptFunc, C^.InBlockSize, InitVectorBuffer, InitVectorBufferSize);
    else
      raise ECipher.Create(CipherError_InvalidCipherMode, 'Invalid cipher mode');
    end;
  N := BufferSize;
  // remove padding
  if C^.BufferMode = cbmMultipleBlocks then
    if State.Padding in [cpPadSizeByte, cpPadPKCS5] then
      begin
        // get pad size byte (last byte)
        P := Buffer;
        Inc(P, BufferSize - 1);
        L := P^;
        // validate padding
        if (L > N) or (L > C^.InBlockSize) then
          raise ECipher.Create(CipherError_InvalidData, 'Invalid data');
        for I := 1 to L - 1 do
          begin
            Dec(P);
            if ((State.Padding = cpPadSizeByte) and (P^ <> 0)) or
               ((State.Padding = cpPadPKCS5)    and (P^ <> L)) then
              raise ECipher.Create(CipherError_InvalidData, 'Invalid data');
          end;
        // decrease buffer size with padding size
        Dec(N, L);
      end;
  // return number of decoded bytes
  Result := N;
end;

procedure DecryptFinalise(var State: TCipherState);
var C : PCipherInfo;
begin
  C := State.CipherInfo;
  if Assigned(C) then
    if Assigned(C^.FinaliseFunc) then
      C^.FinaliseFunc(@State.Context);
  SecureClear(State, SizeOf(State));
end;

function Decrypt(const Cipher: TCipherType; const Mode: TCipherMode;
         const Padding: TCipherPadding;
         const KeyBits: Integer;
         const KeyBuffer: Pointer; const KeyBufferSize: Integer;
         const Buffer: Pointer; const BufferSize: Integer;
         const InitVectorBuffer: Pointer; const InitVectorBufferSize: Integer): Integer; overload;
var State : TCipherState;
begin
  DecryptInit(State, Cipher, Mode, Padding, KeyBits, KeyBuffer, KeyBufferSize);
  Result := DecryptBuf(State, Buffer, BufferSize, InitVectorBuffer, InitVectorBufferSize);
  DecryptFinalise(State);
end;

function Decrypt(const Cipher: TCipherType; const Mode: TCipherMode;
         const Padding: TCipherPadding; const KeyBits: Integer;
         const Key, Data, InitVector: AnsiString): AnsiString;
var L, M : Integer;
begin
  L := Length(Data);
  SetLength(Result, L);
  if L = 0 then
    exit;
  Move(Pointer(Data)^, Pointer(Result)^, L);
  M := Decrypt(Cipher, Mode, Padding, KeyBits, Pointer(Key), Length(Key),
      Pointer(Result), L,
      Pointer(InitVector), Length(InitVector));
  if M < L then
    SetLength(Result, M);
end;



{                                                                              }
{ Test cases                                                                   }
{                                                                              }
{$IFDEF DEBUG}{$IFDEF SELFTEST}
{$ASSERTIONS ON}
type
  TCipherTestCase = record
    Cipher     : TCipherType;
    Mode       : TCipherMode;
    KeyBits    : Integer;      // Effective key length (bits)
    Key        : AnsiString;
    InitVector : AnsiString;
    PlainText  : AnsiString;
    CipherText : AnsiString;
  end;

const
  CipherTestCaseCount = 33;

var
  CipherTestCases : array[0..CipherTestCaseCount - 1] of TCipherTestCase = (
    // RC2 test vectors from RFC 2268
    (Cipher:     ctRC2;
     Mode:       cmECB;
     KeyBits:    63;
     Key:        #$00#$00#$00#$00#$00#$00#$00#$00;
     PlainText:  #$00#$00#$00#$00#$00#$00#$00#$00;
     CipherText: #$eb#$b7#$73#$f9#$93#$27#$8e#$ff),
    (Cipher:     ctRC2;
     Mode:       cmECB;
     KeyBits:    64;
     Key:        #$ff#$ff#$ff#$ff#$ff#$ff#$ff#$ff;
     PlainText:  #$ff#$ff#$ff#$ff#$ff#$ff#$ff#$ff;
     CipherText: #$27#$8b#$27#$e4#$2e#$2f#$0d#$49),
    (Cipher:     ctRC2;
     Mode:       cmECB;
     KeyBits:    64;
     Key:        #$30#$00#$00#$00#$00#$00#$00#$00;
     PlainText:  #$10#$00#$00#$00#$00#$00#$00#$01;
     CipherText: #$30#$64#$9e#$df#$9b#$e7#$d2#$c2),
    (Cipher:     ctRC2;
     Mode:       cmECB;
     KeyBits:    64;
     Key:        #$88;
     PlainText:  #$00#$00#$00#$00#$00#$00#$00#$00;
     CipherText: #$61#$a8#$a2#$44#$ad#$ac#$cc#$f0),
    (Cipher:     ctRC2;
     Mode:       cmECB;
     KeyBits:    64;
     Key:        #$88#$bc#$a9#$0e#$90#$87#$5a;
     PlainText:  #$00#$00#$00#$00#$00#$00#$00#$00;
     CipherText: #$6c#$cf#$43#$08#$97#$4c#$26#$7f),
    (Cipher:     ctRC2;
     Mode:       cmECB;
     KeyBits:    64;
     Key:        #$88#$bc#$a9#$0e#$90#$87#$5a#$7f#$0f#$79#$c3#$84#$62#$7b#$af#$b2;
     PlainText:  #$00#$00#$00#$00#$00#$00#$00#$00;
     CipherText: #$1a#$80#$7d#$27#$2b#$be#$5d#$b1),
    (Cipher:     ctRC2;
     Mode:       cmECB;
     KeyBits:    128;
     Key:        #$88#$bc#$a9#$0e#$90#$87#$5a#$7f#$0f#$79#$c3#$84#$62#$7b#$af#$b2;
     PlainText:  #$00#$00#$00#$00#$00#$00#$00#$00;
     CipherText: #$22#$69#$55#$2a#$b0#$f8#$5c#$a6),
    (Cipher:     ctRC2;
     Mode:       cmECB;
     KeyBits:    129;
     Key:        #$88#$bc#$a9#$0e#$90#$87#$5a#$7f#$0f#$79#$c3#$84#$62#$7b#$af#$b2#$16#$f8#$0a#$6f#$85#$92#$05#$84#$c4#$2f#$ce#$b0#$be#$25#$5d#$af#$1e;
     PlainText:  #$00#$00#$00#$00#$00#$00#$00#$00;
     CipherText: #$5b#$78#$d3#$a4#$3d#$ff#$f1#$f1),
    // RC4 test vectors from http://en.wikipedia.org/wiki/RC4
    (Cipher:     ctRC4;
     Mode:       cmECB;
     KeyBits:    24;
     Key:        'Key';
     PlainText:  'Plaintext';
     CipherText: #$BB#$F3#$16#$E8#$D9#$40#$AF#$0A#$D3),
    (Cipher:     ctRC4;
     Mode:       cmECB;
     KeyBits:    32;
     Key:        'Wiki';
     PlainText:  'pedia';
     CipherText: #$10#$21#$BF#$04#$20),
    (Cipher:     ctRC4;
     Mode:       cmECB;
     KeyBits:    48;
     Key:        'Secret';
     PlainText:  'Attack at dawn';
     CipherText: #$45#$A0#$1F#$64#$5F#$C3#$5B#$38#$35#$52#$54#$4B#$9B#$F5),
    // RC4 test vectors from Internet Draft on ARCFOUR
    (Cipher:     ctRC4;
     Mode:       cmECB;
     KeyBits:    64;
     Key:        #$01#$23#$45#$67#$89#$AB#$CD#$EF;
     PlainText:  #$00#$00#$00#$00#$00#$00#$00#$00;
     CipherText: #$74#$94#$C2#$E7#$10#$4B#$08#$79),
    (Cipher:     ctRC4;
     Mode:       cmECB;
     KeyBits:    40;
     Key:        #$61#$8a#$63#$d2#$fb;
     PlainText:  #$dc#$ee#$4c#$f9#$2c;
     CipherText: #$f1#$38#$29#$c9#$de),
    (Cipher:     ctRC4;
     Mode:       cmECB;
     KeyBits:    128;
     Key:        #$29#$04#$19#$72#$fb#$42#$ba#$5f#$c7#$12#$77#$12#$f1#$38#$29#$c9;
     PlainText:  #$52#$75#$69#$73#$6c#$69#$6e#$6e#$75#$6e#$20#$6c#$61#$75#$6c#$75 +
                 #$20#$6b#$6f#$72#$76#$69#$73#$73#$73#$61#$6e#$69#$2c#$20#$74#$e4 +
                 #$68#$6b#$e4#$70#$e4#$69#$64#$65#$6e#$20#$70#$e4#$e4#$6c#$6c#$e4 +
                 #$20#$74#$e4#$79#$73#$69#$6b#$75#$75#$2e#$20#$4b#$65#$73#$e4#$79 +
                 #$f6#$6e#$20#$6f#$6e#$20#$6f#$6e#$6e#$69#$20#$6f#$6d#$61#$6e#$61 +
                 #$6e#$69#$2c#$20#$6b#$61#$73#$6b#$69#$73#$61#$76#$75#$75#$6e#$20 +
                 #$6c#$61#$61#$6b#$73#$6f#$74#$20#$76#$65#$72#$68#$6f#$75#$75#$2e +
                 #$20#$45#$6e#$20#$6d#$61#$20#$69#$6c#$6f#$69#$74#$73#$65#$2c#$20 +
                 #$73#$75#$72#$65#$20#$68#$75#$6f#$6b#$61#$61#$2c#$20#$6d#$75#$74 +
                 #$74#$61#$20#$6d#$65#$74#$73#$e4#$6e#$20#$74#$75#$6d#$6d#$75#$75 +
                 #$73#$20#$6d#$75#$6c#$6c#$65#$20#$74#$75#$6f#$6b#$61#$61#$2e#$20 +
                 #$50#$75#$75#$6e#$74#$6f#$20#$70#$69#$6c#$76#$65#$6e#$2c#$20#$6d +
                 #$69#$20#$68#$75#$6b#$6b#$75#$75#$2c#$20#$73#$69#$69#$6e#$74#$6f +
                 #$20#$76#$61#$72#$61#$6e#$20#$74#$75#$75#$6c#$69#$73#$65#$6e#$2c +
                 #$20#$6d#$69#$20#$6e#$75#$6b#$6b#$75#$75#$2e#$20#$54#$75#$6f#$6b +
                 #$73#$75#$74#$20#$76#$61#$6e#$61#$6d#$6f#$6e#$20#$6a#$61#$20#$76 +
                 #$61#$72#$6a#$6f#$74#$20#$76#$65#$65#$6e#$2c#$20#$6e#$69#$69#$73 +
                 #$74#$e4#$20#$73#$79#$64#$e4#$6d#$65#$6e#$69#$20#$6c#$61#$75#$6c +
                 #$75#$6e#$20#$74#$65#$65#$6e#$2e#$20#$2d#$20#$45#$69#$6e#$6f#$20 +
                 #$4c#$65#$69#$6e#$6f;
     CipherText: #$35#$81#$86#$99#$90#$01#$e6#$b5#$da#$f0#$5e#$ce#$eb#$7e#$ee#$21 +
                 #$e0#$68#$9c#$1f#$00#$ee#$a8#$1f#$7d#$d2#$ca#$ae#$e1#$d2#$76#$3e +
                 #$68#$af#$0e#$ad#$33#$d6#$6c#$26#$8b#$c9#$46#$c4#$84#$fb#$e9#$4c +
                 #$5f#$5e#$0b#$86#$a5#$92#$79#$e4#$f8#$24#$e7#$a6#$40#$bd#$22#$32 +
                 #$10#$b0#$a6#$11#$60#$b7#$bc#$e9#$86#$ea#$65#$68#$80#$03#$59#$6b +
                 #$63#$0a#$6b#$90#$f8#$e0#$ca#$f6#$91#$2a#$98#$eb#$87#$21#$76#$e8 +
                 #$3c#$20#$2c#$aa#$64#$16#$6d#$2c#$ce#$57#$ff#$1b#$ca#$57#$b2#$13 +
                 #$f0#$ed#$1a#$a7#$2f#$b8#$ea#$52#$b0#$be#$01#$cd#$1e#$41#$28#$67 +
                 #$72#$0b#$32#$6e#$b3#$89#$d0#$11#$bd#$70#$d8#$af#$03#$5f#$b0#$d8 +
                 #$58#$9d#$bc#$e3#$c6#$66#$f5#$ea#$8d#$4c#$79#$54#$c5#$0c#$3f#$34 +
                 #$0b#$04#$67#$f8#$1b#$42#$59#$61#$c1#$18#$43#$07#$4d#$f6#$20#$f2 +
                 #$08#$40#$4b#$39#$4c#$f9#$d3#$7f#$f5#$4b#$5f#$1a#$d8#$f6#$ea#$7d +
                 #$a3#$c5#$61#$df#$a7#$28#$1f#$96#$44#$63#$d2#$cc#$35#$a4#$d1#$b0 +
                 #$34#$90#$de#$c5#$1b#$07#$11#$fb#$d6#$f5#$5f#$79#$23#$4d#$5b#$7c +
                 #$76#$66#$22#$a6#$6d#$e9#$2b#$e9#$96#$46#$1d#$5e#$4d#$c8#$78#$ef +
                 #$9b#$ca#$03#$05#$21#$e8#$35#$1e#$4b#$ae#$d2#$fd#$04#$f9#$46#$73 +
                 #$68#$c4#$ad#$6a#$c1#$86#$d0#$82#$45#$b2#$63#$a2#$66#$6d#$1f#$6c +
                 #$54#$20#$f1#$59#$9d#$fd#$9f#$43#$89#$21#$c2#$f5#$a4#$63#$93#$8c +
                 #$e0#$98#$22#$65#$ee#$f7#$01#$79#$bc#$55#$3f#$33#$9e#$b1#$a4#$c1 +
                 #$af#$5f#$6a#$54#$7f),
    // AES test vectors generated from online AES calculator at http://www.unsw.adfa.edu.au/~lpb/src/AEScalc/AEScalc.html
    (Cipher:     ctAES;
     Mode:       cmECB;
     KeyBits:    128;
     Key:        #$0f#$15#$71#$c9#$47#$d9#$e8#$59#$0c#$b7#$ad#$d6#$af#$7f#$67#$98;
     PlainText:  '1234567890123456';
     CipherText: #$2f#$7d#$76#$42#$5e#$bb#$85#$e4#$f2#$e7#$b0#$08#$68#$bf#$0f#$ce),
    (Cipher:     ctAES;
     Mode:       cmECB;
     KeyBits:    128;
     Key:        #$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00;
     PlainText:  #$14#$0f#$0f#$10#$11#$b5#$22#$3d#$79#$58#$77#$17#$ff#$d9#$ec#$3a;
     CipherText: #$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00),
    (Cipher:     ctAES;
     Mode:       cmECB;
     KeyBits:    192;
     Key:        #$96#$43#$D8#$33#$4A#$63#$DF#$4D#$48#$E3#$1E#$9E#$25#$67#$18#$F2#$92#$29#$31#$9C#$19#$F1#$5B#$A4;
     PlainText:  #$23#$00#$ea#$46#$3f#$43#$72#$64#$12#$75#$5f#$4c#$83#$e2#$cb#$78;
     CipherText: #$48#$E3#$1E#$9E#$25#$67#$18#$F2#$92#$29#$31#$9C#$19#$F1#$5B#$A4),
    (Cipher:     ctAES;
     Mode:       cmECB;
     KeyBits:    256;
     Key:        #$85#$C6#$B2#$BB#$23#$00#$14#$8F#$94#$5A#$EB#$F1#$F0#$21#$CF#$79#$05#$8C#$CF#$FD#$BB#$CB#$38#$2D#$1F#$6F#$56#$58#$5D#$8A#$4A#$DE;
     PlainText:  #$e7#$0f#$9e#$09#$08#$87#$0a#$1d#$cf#$09#$60#$ae#$13#$d0#$7c#$68;
     CipherText: #$05#$8C#$CF#$FD#$BB#$CB#$38#$2D#$1F#$6F#$56#$58#$5D#$8A#$4A#$DE),
    // AES test vectors generated from online AES calculator at http://www.riscure.com/tech-corner/online-crypto-tools/aes.html
    (Cipher:     ctAES;
     Mode:       cmCBC;
     KeyBits:    128;
     Key:        #$84#$52#$35#$BA#$BE#$BD#$14#$84#$63#$E9#$DB#$46#$74#$77#$F9#$D2;
     InitVector: #$01#$02#$03#$04#$05#$06#$07#$08#$09#$10#$11#$12#$13#$14#$15#$16;
     PlainText:  #$8F#$98#$3F#$D0#$99#$A3#$6D#$1E#$2F#$A5#$B3#$86#$31#$14#$42#$08;
     CipherText: #$7E#$50#$7D#$C5#$D8#$ED#$3B#$A9#$F4#$C9#$30#$C8#$13#$D4#$A7#$BC),
    // DES test vectors from http://www.aci.net/Kalliste/des.htm
    (Cipher:     ctDES;
     Mode:       cmECB;
     KeyBits:    64;
     Key:        #$13#$34#$57#$79#$9B#$BC#$DF#$F1;
     PlainText:  #$01#$23#$45#$67#$89#$AB#$CD#$EF;
     CipherText: #$85#$E8#$13#$54#$0F#$0A#$B4#$05),
    (Cipher:     ctDES;
     Mode:       cmECB;
     KeyBits:    64;
     Key:        #$0E#$32#$92#$32#$EA#$6D#$0D#$73;
     PlainText:  #$87#$87#$87#$87#$87#$87#$87#$87;
     CipherText: #$00#$00#$00#$00#$00#$00#$00#$00),
    // DES test vectors from http://groups.google.com/group/sci.crypt/msg/1e08a60f44daa890?&hl=en
    (Cipher:     ctDES;
     Mode:       cmECB;
     KeyBits:    64;
     Key:        #$01#$01#$01#$01#$01#$01#$01#$01;
     PlainText:  #$95#$F8#$A5#$E5#$DD#$31#$D9#$00;
     CipherText: #$80#$00#$00#$00#$00#$00#$00#$00),
    (Cipher:     ctDES;
     Mode:       cmECB;
     KeyBits:    64;
     Key:        #$7C#$A1#$10#$45#$4A#$1A#$6E#$57;
     PlainText:  #$01#$A1#$D6#$D0#$39#$77#$67#$42;
     CipherText: #$69#$0F#$5B#$0D#$9A#$26#$93#$9B),
    (Cipher:     ctDES;
     Mode:       cmECB;
     KeyBits:    64;
     Key:        #$80#$01#$01#$01#$01#$01#$01#$01;
     PlainText:  #$00#$00#$00#$00#$00#$00#$00#$00;
     CipherText: #$95#$A8#$D7#$28#$13#$DA#$A9#$4D),
    // DES test vectors from http://tero.co.uk/des/show.php
    (Cipher:     ctDES;
     Mode:       cmECB;
     KeyBits:    64;
     Key:        '12345678';
     PlainText:  'This is the message to encrypt!!';
     CipherText: #$05#$c9#$c4#$ca#$fb#$99#$37#$d9#$5b#$bf#$be#$df#$c5#$d7#$7f#$19 +
                 #$a6#$cd#$5a#$5d#$ab#$18#$8a#$33#$df#$d8#$97#$9f#$c4#$b7#$b2#$be),
    (Cipher:     ctDES;
     Mode:       cmCBC;
     KeyBits:    64;
     Key:        '12345678';
     InitVector: 'abcdefgh';
     PlainText:  'This is the message to encrypt!!';
     CipherText: #$6c#$a9#$47#$0c#$84#$9d#$1c#$c1#$a5#$9f#$fc#$14#$8f#$1c#$b5#$e9 +
                 #$cf#$1f#$5c#$03#$28#$a7#$e8#$75#$63#$87#$ff#$4d#$0f#$e4#$60#$50),
    (Cipher:     ctDES;
     Mode:       cmECB;
     KeyBits:    64;
     Key:        #$01#$23#$45#$67#$89#$ab#$cd#$ef;
     PlainText:  'Now is the time for all ';
     CipherText: #$3f#$a4#$0e#$8a#$98#$4d#$48#$15#$6a#$27#$17#$87#$ab#$88#$83#$f9 +
                 #$89#$3d#$51#$ec#$4b#$56#$3b#$53),
    // DES test vectors from http://www.herongyang.com/crypto/des_php_implementation_mcrypt_2.html
    (Cipher:     ctDES;
     Mode:       cmCBC;
     KeyBits:    64;
     Key:        #$01#$23#$45#$67#$89#$ab#$cd#$ef;
     InitVector: #$12#$34#$56#$78#$90#$ab#$cd#$ef;
     PlainText:  #$4e#$6f#$77#$20#$69#$73#$20#$74#$68#$65#$20#$74#$69#$6d#$65#$20 +
                 #$66#$6f#$72#$20#$61#$6c#$6c#$20;
     CipherText: #$e5#$c7#$cd#$de#$87#$2b#$f2#$7c#$43#$e9#$34#$00#$8c#$38#$9c#$0f +
                 #$68#$37#$88#$49#$9a#$7c#$05#$f6),
    (Cipher:     ctDES;
     Mode:       cmCFB;
     KeyBits:    64;
     Key:        #$01#$23#$45#$67#$89#$ab#$cd#$ef;
     InitVector: #$12#$34#$56#$78#$90#$ab#$cd#$ef;
     PlainText:  #$4e#$6f#$77#$20#$69#$73#$20#$74#$68#$65#$20#$74#$69#$6d#$65#$20 +
                 #$66#$6f#$72#$20#$61#$6c#$6c#$20;
     CipherText: #$f3#$1f#$da#$07#$01#$14#$62#$ee#$18#$7f#$43#$d8#$0a#$7c#$d9#$b5 +
                 #$b0#$d2#$90#$da#$6e#$5b#$9a#$87),
    (Cipher:     ctDES;
     Mode:       cmOFB;
     KeyBits:    64;
     Key:        #$01#$23#$45#$67#$89#$ab#$cd#$ef;
     InitVector: #$12#$34#$56#$78#$90#$ab#$cd#$ef;
     PlainText:  #$4e#$6f#$77#$20#$69#$73#$20#$74#$68#$65#$20#$74#$69#$6d#$65#$20 +
                 #$66#$6f#$72#$20#$61#$6c#$6c#$20;
     CipherText: #$f3#$4a#$28#$50#$c9#$c6#$49#$85#$d6#$84#$ad#$96#$d7#$72#$e2#$f2 +
                 #$43#$ea#$49#$9a#$be#$e8#$ae#$95),
    // Triple-DES test vectors generated from online DES calculator at http://www.riscure.com/tech-corner/online-crypto-tools/des.html
    (Cipher:     ctTripleDESEDE;
     Mode:       cmECB;
     KeyBits:    128;
     Key:        '1234567890123456';
     PlainText:  '1234567890123456';
     CipherText: #$BC#$57#$08#$BC#$02#$FE#$BF#$2F#$F6#$AD#$24#$D2#$1E#$FB#$70#$3A),
    (Cipher:     ctTripleDESEDE;
     Mode:       cmECB;
     KeyBits:    128;
     Key:        #$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00;
     PlainText:  '1234567890123456';
     CipherText: #$62#$DD#$8E#$4A#$61#$4E#$1A#$F9#$BE#$3D#$31#$47#$71#$1F#$A2#$77),
    (Cipher:     ctTripleDESEDE;
     Mode:       cmCBC;
     KeyBits:    128;
     Key:        #$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00;
     InitVector: '12345678';
     PlainText:  '1234567890123456';
     CipherText: #$8C#$A6#$4D#$E9#$C1#$B1#$23#$A7#$97#$8D#$A5#$4E#$AE#$E5#$7B#$46)
    // CAST-256 test vectors from RFC 2612
{
    (Cipher:     ctCAST256;
     Mode:       cmECB;
     KeyBits:    256;
     Key:        #$23#$42#$bb#$9e#$fa#$38#$54#$2c#$be#$d0#$ac#$83#$94#$0a#$c2#$98 +
                 #$8d#$7c#$47#$ce#$26#$49#$08#$46#$1c#$c1#$b5#$13#$7a#$e6#$b6#$04;
     PlainText:  #$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00;
     CipherText: #$4f#$6a#$20#$38#$28#$68#$97#$b9#$c9#$87#$01#$36#$55#$33#$17#$fa),
    (Cipher:     ctCAST256;
     Mode:       cmECB;
     KeyBits:    192;
     Key:        #$23#$42#$bb#$9e#$fa#$38#$54#$2c#$be#$d0#$ac#$83#$94#$0a#$c2#$98 +
                 #$ba#$c7#$7a#$77#$17#$94#$28#$63;
     PlainText:  #$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00;
     CipherText: #$1b#$38#$6c#$02#$10#$dc#$ad#$cb#$dd#$0e#$41#$aa#$08#$a7#$a7#$e8)
}

   );

procedure SelfTestTestCases;
var I : Integer;
    B : array[0..1023] of Char;
    L : Integer;
    C : AnsiString;
    M : AnsiString;
begin
  for I := 0 to CipherTestCaseCount - 1 do
    with CipherTestCases[I] do
      try
        if Assigned(GetCipherInfo(Cipher)) then
          begin
            M := IntToStr(I);
            L := Length(PlainText);
            Move(PAnsiChar(PlainText)^, B[0], L);
            L := Encrypt(Cipher, Mode, cpNone, KeyBits, Pointer(Key), Length(Key),
                @B[0], L, @B[0], Sizeof(B), Pointer(InitVector), Length(InitVector));
            SetLength(C, L);
            Move(B[0], Pointer(C)^, L);
            Assert(C = CipherText, M);
            L := Decrypt(Cipher, Mode, cpNone, KeyBits, Pointer(Key), Length(Key),
                @B[0], L, Pointer(InitVector), Length(InitVector));
            Move(B[0], Pointer(C)^, L);
            Assert(C = PlainText, M);
            Assert(Encrypt(Cipher, Mode, cpNone, KeyBits, Key, PlainText, InitVector) = CipherText, M);
            Assert(Decrypt(Cipher, Mode, cpNone, KeyBits, Key, CipherText, InitVector) = PlainText, M);
          end;
      except
        on E : Exception do
          raise Exception.Create('Test case ' + IntToStr(I) + ': ' + E.Message);
      end;
end;

procedure SelfTest;
begin
  Assert(RC2BlockSize = 8);
  Assert(RC2BlockSize = Sizeof(TRC2Block));
  Assert(DESBlockSize = 8);
  Assert(DESBlockSize = Sizeof(TDESBlock));

  Assert(RC2ContextSize = 128);
  Assert(RC2ContextSize <= MaxCipherContextSize);
  Assert(RC4ContextSize <= MaxCipherContextSize);
  Assert(DESContextSize <= MaxCipherContextSize);
  Assert(TripleDESContextSize <= MaxCipherContextSize);
  Assert(TripleDES3ContextSize <= MaxCipherContextSize);

  SelfTestTestCases;
end;

procedure Profile;
begin
end;
{$ENDIF}{$ENDIF}



end.

