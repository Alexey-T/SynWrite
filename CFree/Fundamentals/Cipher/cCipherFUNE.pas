{******************************************************************************}
{                                                                              }
{   Library:          Fundamentals 4.00                                        }
{   File name:        cCipherFUNE.pas                                          }
{   File version:     0.02                                                     }
{   Description:      FunE (Fundamentals Encryption) cipher                    }
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
{   2010/12/17  0.01  Initial version.                                         }
{   2011/07/17  0.02  Improvements: BlockOp2.                                  }
{                                                                              }
{******************************************************************************}

{$INCLUDE cCipher.inc}

unit cCipherFUNE;

interface



const
  FUNE_KeyBits     = 256;
  FUNE_BlockBits   = 256;
  FUNE_KeySize     = FUNE_KeyBits div 8;   // 32 bytes
  FUNE_BlockSize   = FUNE_BlockBits div 8; // 32 bytes
  FUNE_NumOfRounds = 4;

type
  TFUNEKey = array[0..FUNE_KeySize - 1] of Byte;
  TFUNEBlock = array[0..FUNE_BlockSize - 1] of Byte;

  TFUNEKeyState = array[0..FUNE_KeySize - 1] of LongWord;
  TFUNEState = record
    K : TFUNEKeyState;
  end;

procedure FUNE_KeyInit(var Key: TFUNEKey; const KeyBuf; const KeyBufSize: Integer);

procedure FUNE_EncodeInit(var State: TFUNEState; const Key: TFUNEKey); overload;
procedure FUNE_EncodeInit(var State: TFUNEState; const KeyBuf; const KeyBufSize: Integer); overload;
procedure FUNE_EncodeBlock(var State: TFUNEState; const Block: TFUNEBlock; var CipherBlock: TFUNEBlock);

procedure FUNE_DecodeInit(var State: TFUNEState; const Key: TFUNEKey); overload;
procedure FUNE_DecodeInit(var State: TFUNEState; const KeyBuf; const KeyBufSize: Integer); overload;
procedure FUNE_DecodeBlock(var State: TFUNEState; const CipherBlock: TFUNEBlock; var Block: TFUNEBlock);



{                                                                              }
{ Test cases                                                                   }
{                                                                              }
{$IFDEF DEBUG}{$IFDEF SELFTEST}
procedure SelfTest;
{$ENDIF}{$ENDIF}



implementation



const
  fN = FUNE_KeySize;

{$IFOPT Q+}{$DEFINE QOn}{$Q-}{$ELSE}{$UNDEF QOn}{$ENDIF}
{$IFOPT R+}{$DEFINE ROn}{$R-}{$ELSE}{$UNDEF ROn}{$ENDIF}
// TransformB
// Transforms a byte into another random byte
// These transforms can be represented using array[Byte] of Byte lookup tables

// TransformB_SUB
// Subsitution transform
// Invertible
const
  FUNE_RC2Table: array[Byte] of Byte = ( // RC2 PITABLE - "Random" values based on value of Pi
    $D9, $78, $F9, $C4, $19, $DD, $B5, $ED, $28, $E9, $FD, $79, $4A, $A0, $D8, $9D,
    $C6, $7E, $37, $83, $2B, $76, $53, $8E, $62, $4C, $64, $88, $44, $8B, $FB, $A2,
    $17, $9A, $59, $F5, $87, $B3, $4F, $13, $61, $45, $6D, $8D, $09, $81, $7D, $32,
    $BD, $8F, $40, $EB, $86, $B7, $7B, $0B, $F0, $95, $21, $22, $5C, $6B, $4E, $82,
    $54, $D6, $65, $93, $CE, $60, $B2, $1C, $73, $56, $C0, $14, $A7, $8C, $F1, $DC,
    $12, $75, $CA, $1F, $3B, $BE, $E4, $D1, $42, $3D, $D4, $30, $A3, $3C, $B6, $26,
    $6F, $BF, $0E, $DA, $46, $69, $07, $57, $27, $F2, $1D, $9B, $BC, $94, $43, $03,
    $F8, $11, $C7, $F6, $90, $EF, $3E, $E7, $06, $C3, $D5, $2F, $C8, $66, $1E, $D7,
    $08, $E8, $EA, $DE, $80, $52, $EE, $F7, $84, $AA, $72, $AC, $35, $4D, $6A, $2A,
    $96, $1A, $D2, $71, $5A, $15, $49, $74, $4B, $9F, $D0, $5E, $04, $18, $A4, $EC,
    $C2, $E0, $41, $6E, $0F, $51, $CB, $CC, $24, $91, $AF, $50, $A1, $F4, $70, $39,
    $99, $7C, $3A, $85, $23, $B8, $B4, $7A, $FC, $02, $36, $5B, $25, $55, $97, $31,
    $2D, $5D, $FA, $98, $E3, $8A, $92, $AE, $05, $DF, $29, $10, $67, $6C, $BA, $C9,
    $D3, $00, $E6, $CF, $E1, $9E, $A8, $2C, $63, $16, $01, $3F, $58, $E2, $89, $A9,
    $0D, $38, $34, $1B, $AB, $33, $FF, $B0, $BB, $48, $0C, $5F, $B9, $B1, $CD, $2E,
    $C5, $F3, $DB, $47, $E5, $A5, $9C, $77, $0A, $A6, $20, $68, $FE, $7F, $C1, $AD);

function FUNE_TransformB_SUB(const A: Byte): Byte; {$IFDEF UseInline}inline;{$ENDIF}
begin
  Result := FUNE_RC2Table[A];
end;

// TransformB_ROT
// Invertible
function FUNE_TransformB_ROT(const A: Byte): Byte;
begin
  Result := Byte(A shl 3) or Byte(A shr 5);
end;

// TransformB_XOR
// Not invertible
const
  FUNE_BitCountTable : array[Byte] of Byte =
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

  FUNE_TransformB_XORTable : array[0..8] of Byte = (
     $F0, $1E, $D2, $3C, $B4, $5A, $96, $78, $A5);

function FUNE_TransformB_XOR(const A: Byte): Byte;
var F : Byte;
begin
  F := FUNE_BitCountTable[A];
  F := FUNE_TransformB_XORTable[F];
  Result := A xor F;
end;

// TransformB_MUL
// Not invertible
function FUNE_TransformB_MUL(const A: Byte): Byte;
begin
  Result := Byte(A * 79 + 73);
end;



// TransformBB
function FUNE_TransformBB_ADD(const A, I: Byte): Byte; {$IFDEF UseInline}inline;{$ENDIF}
begin
  Result := Byte(A + I);
end;



// TransformW_SUB
// Invertible
function FUNE_TransformW_SUB(const A: LongWord): LongWord;
var L : array[1..4] of Byte;
begin
  PLongWord(@L)^ := A;
  L[1] := FUNE_TransformB_SUB(L[1]);
  L[2] := FUNE_TransformB_SUB(FUNE_TransformBB_ADD(L[2], 1));
  L[3] := FUNE_TransformB_SUB(FUNE_TransformBB_ADD(L[3], 2));
  L[4] := FUNE_TransformB_SUB(FUNE_TransformBB_ADD(L[4], 3));
  Result := PLongWord(@L)^;
end;



// ExpandBB
// Expands a data byte and index byte into a word
function FUNE_ExpandBB(const A, I: Byte): LongWord;
var L : array[1..4] of Byte;
    M : array[1..4] of Byte;
begin
  L[1] := FUNE_TransformB_SUB(A);
  L[2] := FUNE_TransformB_XOR(A);
  L[3] := FUNE_TransformB_MUL(A);
  L[4] := FUNE_TransformB_ROT(A);

  M[1] := FUNE_TransformB_SUB(I);
  M[2] := FUNE_TransformB_XOR(I);
  M[3] := FUNE_TransformB_MUL(I);
  M[4] := FUNE_TransformB_ROT(I);

  L[1] := FUNE_TransformBB_ADD(L[1], M[2]);
  L[2] := FUNE_TransformBB_ADD(L[2], M[4]);
  L[3] := FUNE_TransformBB_ADD(L[3], M[1]);
  L[4] := FUNE_TransformBB_ADD(L[4], M[3]);

  L[1] := FUNE_TransformB_SUB(L[1]);
  L[2] := FUNE_TransformB_XOR(L[2]);
  L[3] := FUNE_TransformB_MUL(L[3]);
  L[4] := FUNE_TransformB_ROT(L[4]);

  L[1] := FUNE_TransformBB_ADD(L[1], L[2]);
  L[2] := FUNE_TransformBB_ADD(L[2], L[3]);
  L[3] := FUNE_TransformBB_ADD(L[3], L[4]);
  L[4] := FUNE_TransformBB_ADD(L[4], L[1]);

  L[1] := FUNE_TransformB_XOR(L[1]);
  L[2] := FUNE_TransformB_MUL(L[2]);
  L[3] := FUNE_TransformB_ROT(L[3]);
  L[4] := FUNE_TransformB_SUB(L[4]);

  L[1] := FUNE_TransformBB_ADD(L[1], L[3]);
  L[2] := FUNE_TransformBB_ADD(L[2], L[4]);
  L[3] := FUNE_TransformBB_ADD(L[3], L[1]);
  L[4] := FUNE_TransformBB_ADD(L[4], L[2]);

  L[1] := FUNE_TransformB_MUL(L[1]);
  L[2] := FUNE_TransformB_ROT(L[2]);
  L[3] := FUNE_TransformB_SUB(L[3]);
  L[4] := FUNE_TransformB_XOR(L[4]);

  L[1] := FUNE_TransformBB_ADD(L[1], L[4]);
  L[2] := FUNE_TransformBB_ADD(L[2], L[1]);
  L[3] := FUNE_TransformBB_ADD(L[3], L[2]);
  L[4] := FUNE_TransformBB_ADD(L[4], L[3]);

  L[1] := FUNE_TransformB_ROT(L[1]);
  L[2] := FUNE_TransformB_SUB(L[2]);
  L[3] := FUNE_TransformB_XOR(L[3]);
  L[4] := FUNE_TransformB_MUL(L[4]);

  Result := PLongWord(@L)^;
end;



// Mix2W
// Mixes two words and an index
const
  // first 32 bits of the fractional parts of the cube roots of the first 64 primes 2..311
  FUNE_SHA256K: array[0..63] of LongWord = (
    $428a2f98, $71374491, $b5c0fbcf, $e9b5dba5, $3956c25b, $59f111f1, $923f82a4, $ab1c5ed5,
    $d807aa98, $12835b01, $243185be, $550c7dc3, $72be5d74, $80deb1fe, $9bdc06a7, $c19bf174,
    $e49b69c1, $efbe4786, $0fc19dc6, $240ca1cc, $2de92c6f, $4a7484aa, $5cb0a9dc, $76f988da,
    $983e5152, $a831c66d, $b00327c8, $bf597fc7, $c6e00bf3, $d5a79147, $06ca6351, $14292967,
    $27b70a85, $2e1b2138, $4d2c6dfc, $53380d13, $650a7354, $766a0abb, $81c2c92e, $92722c85,
    $a2bfe8a1, $a81a664b, $c24b8b70, $c76c51a3, $d192e819, $d6990624, $f40e3585, $106aa070,
    $19a4c116, $1e376c08, $2748774c, $34b0bcb5, $391c0cb3, $4ed8aa4a, $5b9cca4f, $682e6ff3,
    $748f82ee, $78a5636f, $84c87814, $8cc70208, $90befffa, $a4506ceb, $bef9a3f7, $c67178f2
  );

function FUNE_Mix2w_SUM(const A, B: LongWord; const I: Byte): LongWord;
var E : LongWord;
begin
  E := FUNE_SHA256K[I mod 32];
  Result := LongWord(A + B + E);
end;

function FUNE_Mix2w_MUL(const A, B: LongWord; const I: Byte): LongWord;
var E, F : LongWord;
begin
  E := FUNE_SHA256K[32 + (I mod 32)];
  F := LongWord(A + B);
  F := LongWord(F * E);
  Result := F;
end;

function FUNE_Mix2w_ROT(const A, B: LongWord; const I: Byte): LongWord;
var F : LongWord;
    L, N : Byte;
begin
  L := I mod 32;
  N := 32 - L;
  F := LongWord(A + B + I);
  F := (F shl L) or (F shr N);
  Result := F;
end;

function FUNE_Mix2w_SUB(const A, B: LongWord; const I: Byte): LongWord;
var L, M : LongWord;
begin
  L := FUNE_TransformW_SUB(A);
  M := FUNE_TransformW_SUB(B);
  Result := L xor M xor I;
end;



// Mix4W
// Mixes four words and an index
function FUNE_Mix4w_SUM(const A, B, C, D: LongWord; const I: Byte): LongWord;
begin
  Result := LongWord(A + B + C + D + I);
end;

function FUNE_Mix4w_XOR(const A, B, C, D: LongWord; const I: Byte): LongWord;
var K, L, M, N : LongWord;
begin
  K := A xor (B and C and not D);
  L := B xor (C and D and not A);
  M := C xor (D and A and not B);
  N := D xor (A and B and not C);
  Result := K xor L xor M xor N xor I;
end;
{$IFDEF QOn}{$Q+}{$ENDIF}
{$IFDEF ROn}{$R+}{$ENDIF}



// MixKeyState
procedure FUNE_MixKeyState(var K: TFUNEKeyState);
var I : Byte;
    C, T : LongWord;
begin
  // mix 4w XOR up
  K[0] := FUNE_Mix4w_XOR(K[0], K[fN - 1], K[fN - 2], K[fN - 3], 0);
  K[1] := FUNE_Mix4w_XOR(K[1], K[0],      K[fN - 1], K[fN - 2], 1);
  K[2] := FUNE_Mix4w_XOR(K[2], K[1],      K[0],      K[fN - 1], 2);
  for I := 3 to fN - 1 do
    K[I] := FUNE_Mix4w_XOR(K[I], K[I - 1], K[I - 2], K[I - 3], I);
  // mix 4w SUM down
  K[fN - 1] := FUNE_Mix4w_SUM(K[fN - 1], K[0],      K[1],      K[2], fN - 1);
  K[fN - 2] := FUNE_Mix4w_SUM(K[fN - 2], K[fN - 1], K[0],      K[1], fN - 2);
  K[fN - 3] := FUNE_Mix4w_SUM(K[fN - 3], K[fN - 2], K[fN - 1], K[0], fN - 3);
  for I := fN - 4 downto 0 do
    K[I] := FUNE_Mix4w_SUM(K[I], K[I + 1], K[I + 2], K[I + 3], I);
  // mix 2w up
  T := K[fN - 1];
  for I := 0 to fN - 1 do
    begin
      C := K[I];
      T := FUNE_Mix2w_SUM(T, C, I);
      C := FUNE_Mix2w_SUM(C, T, I);
      C := FUNE_Mix2w_SUB(C, T, I);
      K[I] := C;
    end;
  // mix 2w down
  for I := fN - 1 downto 0 do
    begin
      C := K[I];
      T := FUNE_Mix2w_SUM(T, C, I);
      C := FUNE_Mix2w_MUL(C, T, I);
      C := FUNE_Mix2w_ROT(C, T, I);
      K[I] := C;
    end;
end;



// Key Mix
procedure FUNE_KeyMix(var State: TFUNEState; const Key: TFUNEKey);
var I : Byte;
begin
  for I := 0 to FUNE_KeySize - 1 do
    State.K[I] := FUNE_ExpandBB(Key[I], I);
  FUNE_MixKeyState(State.K);
end;



// Block operations
const
  FUNE_AES_S : array[Byte] of Byte = (
    $63, $7c, $77, $7b, $f2, $6b, $6f, $c5, $30, $01, $67, $2b, $fe, $d7, $ab, $76,
    $ca, $82, $c9, $7d, $fa, $59, $47, $f0, $ad, $d4, $a2, $af, $9c, $a4, $72, $c0,
    $b7, $fd, $93, $26, $36, $3f, $f7, $cc, $34, $a5, $e5, $f1, $71, $d8, $31, $15,
    $04, $c7, $23, $c3, $18, $96, $05, $9a, $07, $12, $80, $e2, $eb, $27, $b2, $75,
    $09, $83, $2c, $1a, $1b, $6e, $5a, $a0, $52, $3b, $d6, $b3, $29, $e3, $2f, $84,
    $53, $d1, $00, $ed, $20, $fc, $b1, $5b, $6a, $cb, $be, $39, $4a, $4c, $58, $cf,
    $d0, $ef, $aa, $fb, $43, $4d, $33, $85, $45, $f9, $02, $7f, $50, $3c, $9f, $a8,
    $51, $a3, $40, $8f, $92, $9d, $38, $f5, $bc, $b6, $da, $21, $10, $ff, $f3, $d2,
    $cd, $0c, $13, $ec, $5f, $97, $44, $17, $c4, $a7, $7e, $3d, $64, $5d, $19, $73,
    $60, $81, $4f, $dc, $22, $2a, $90, $88, $46, $ee, $b8, $14, $de, $5e, $0b, $db,
    $e0, $32, $3a, $0a, $49, $06, $24, $5c, $c2, $d3, $ac, $62, $91, $95, $e4, $79,
    $e7, $c8, $37, $6d, $8d, $d5, $4e, $a9, $6c, $56, $f4, $ea, $65, $7a, $ae, $08,
    $ba, $78, $25, $2e, $1c, $a6, $b4, $c6, $e8, $dd, $74, $1f, $4b, $bd, $8b, $8a,
    $70, $3e, $b5, $66, $48, $03, $f6, $0e, $61, $35, $57, $b9, $86, $c1, $1d, $9e,
    $e1, $f8, $98, $11, $69, $d9, $8e, $94, $9b, $1e, $87, $e9, $ce, $55, $28, $df,
    $8c, $a1, $89, $0d, $bf, $e6, $42, $68, $41, $99, $2d, $0f, $b0, $54, $bb, $16
    );

  FUNE_AES_InvS : array[Byte] of Byte = (
    $52, $09, $6a, $d5, $30, $36, $a5, $38, $bf, $40, $a3, $9e, $81, $f3, $d7, $fb,
    $7c, $e3, $39, $82, $9b, $2f, $ff, $87, $34, $8e, $43, $44, $c4, $de, $e9, $cb,
    $54, $7b, $94, $32, $a6, $c2, $23, $3d, $ee, $4c, $95, $0b, $42, $fa, $c3, $4e,
    $08, $2e, $a1, $66, $28, $d9, $24, $b2, $76, $5b, $a2, $49, $6d, $8b, $d1, $25,
    $72, $f8, $f6, $64, $86, $68, $98, $16, $d4, $a4, $5c, $cc, $5d, $65, $b6, $92,
    $6c, $70, $48, $50, $fd, $ed, $b9, $da, $5e, $15, $46, $57, $a7, $8d, $9d, $84,
    $90, $d8, $ab, $00, $8c, $bc, $d3, $0a, $f7, $e4, $58, $05, $b8, $b3, $45, $06,
    $d0, $2c, $1e, $8f, $ca, $3f, $0f, $02, $c1, $af, $bd, $03, $01, $13, $8a, $6b,
    $3a, $91, $11, $41, $4f, $67, $dc, $ea, $97, $f2, $cf, $ce, $f0, $b4, $e6, $73,
    $96, $ac, $74, $22, $e7, $ad, $35, $85, $e2, $f9, $37, $e8, $1c, $75, $df, $6e,
    $47, $f1, $1a, $71, $1d, $29, $c5, $89, $6f, $b7, $62, $0e, $aa, $18, $be, $1b,
    $fc, $56, $3e, $4b, $c6, $d2, $79, $20, $9a, $db, $c0, $fe, $78, $cd, $5a, $f4,
    $1f, $dd, $a8, $33, $88, $07, $c7, $31, $b1, $12, $10, $59, $27, $80, $ec, $5f,
    $60, $51, $7f, $a9, $19, $b5, $4a, $0d, $2d, $e5, $7a, $9f, $93, $c9, $9c, $ef,
    $a0, $e0, $3b, $4d, $ae, $2a, $f5, $b0, $c8, $eb, $bb, $3c, $83, $53, $99, $61,
    $17, $2b, $04, $7e, $ba, $77, $d6, $26, $e1, $69, $14, $63, $55, $21, $0c, $7d
    );

function FUNE_BlockOp_XOR(const D, K, I: Byte): Byte;
begin
  Result := D xor K xor I;
end;

function FUNE_InvBlockOp_XOR(const D, K, I: Byte): Byte;
begin
  Result := D xor K xor I;
end;

function FUNE_BlockOp_SUM(const D, K, I: Byte): Byte;
begin
  Result := Byte(D + K + I);
end;

function FUNE_InvBlockOp_SUM(const D, K, I: Byte): Byte;
begin
  Result := Byte(D - K - I);
end;

function FUNE_BlockOp_SUB(const D, K, I: Byte): Byte;
var F : Byte;
begin
  F := D;
  F := FUNE_AES_S[F];
  F := F xor I;
  F := FUNE_AES_S[F];
  F := F xor K;
  F := FUNE_AES_S[F];
  Result := F;
end;

function FUNE_InvBlockOp_SUB(const D, K, I: Byte): Byte;
var F : Byte;
begin
  F := D;
  F := FUNE_AES_InvS[F];
  F := F xor K;
  F := FUNE_AES_InvS[F];
  F := F xor I;
  F := FUNE_AES_InvS[F];
  Result := F;
end;

procedure FUNE_BlockOp1(var State: TFUNEState; var Block: TFUNEBlock);
var I, J : Byte;
    F : Byte;
    L : array[1..4] of Byte;
begin
  for I := 0 to fN - 1 do
    begin
      J := I * 4;
      PLongWord(@L)^ := State.K[I];
      F := Block[I];
      F := FUNE_BlockOp_XOR(F, L[1], J);
      F := FUNE_BlockOp_SUM(F, L[2], J + 1);
      F := FUNE_BlockOp_SUB(F, L[3], J + 2);
      Block[I] := F;
    end;
end;

procedure FUNE_InvBlockOp1(var State: TFUNEState; var Block: TFUNEBlock);
var I, J : Byte;
    F, G : Byte;
    L : array[1..4] of Byte;
begin
  for I := fN - 1 downto 0 do
    begin
      J := I * 4;
      PLongWord(@L)^ := State.K[I];
      G := Block[I];
      F := FUNE_InvBlockOp_SUB(G, L[3], J + 2);
      F := FUNE_InvBlockOp_SUM(F, L[2], J + 1);
      F := FUNE_InvBlockOp_XOR(F, L[1], J);
      Block[I] := F;
    end;
end;

{
BlockOp2:
e.g. using + operator instead of SUB
Block:  1  2  3  4
Round1: 5  7  10 14
Round2: 19 26 36 50
}
const
  FUNE_BlockOp2_Iterations = 2;

procedure FUNE_BlockOp2(var State: TFUNEState; var Block: TFUNEBlock);
var I, J : Byte;
    F, G : Byte;
    N : Integer;
    L : array[0..3] of Byte;
    LK : Byte;
begin
  for J := 0 to FUNE_BlockOp2_Iterations - 1 do
    begin
      LK := J mod 4;
      G := Block[fN - 1];
      for I := 0 to fN - 1 do
        begin
          PLongWord(@L)^ := State.K[I];
          F := Block[I];
          N := I + L[LK];
          F := FUNE_BlockOp_SUB(F, G, Byte(N));
          Block[I] := F;
          G := F;
        end;
    end;
end;

procedure FUNE_InvBlockOp2(var State: TFUNEState; var Block: TFUNEBlock);
var I, J : Byte;
    F, G : Byte;
    N : Integer;
    L : array[0..3] of Byte;
    LK : Byte;
begin
  for J := FUNE_BlockOp2_Iterations - 1 downto 0 do
    begin
      LK := J mod 4;
      for I := fN - 1 downto 1 do
        begin
          PLongWord(@L)^ := State.K[I];
          F := Block[I];
          G := Block[I - 1];
          N := I + L[LK];
          F := FUNE_InvBlockOp_SUB(F, G, Byte(N));
          Block[I] := F;
        end;
      PLongWord(@L)^ := State.K[0];
      F := Block[0];
      G := Block[fN - 1];
      F := FUNE_InvBlockOp_SUB(F, G, L[LK]);
      Block[0] := F;
    end;
end;

// Encode rounds
procedure FUNE_EncodeRound1(var State: TFUNEState; var CipherBlock: TFUNEBlock);
begin
  FUNE_BlockOp2(State, CipherBlock);
end;

procedure FUNE_EncodeRoundI(var State: TFUNEState; const I: Integer; var CipherBlock: TFUNEBlock);
begin
  FUNE_BlockOp2(State, CipherBlock);
  FUNE_BlockOp1(State, CipherBlock);
end;

procedure FUNE_EncodeRoundN(var State: TFUNEState; var CipherBlock: TFUNEBlock);
begin
  FUNE_BlockOp1(State, CipherBlock);
end;



// Decode rounds
procedure FUNE_DecodeRound1(var State: TFUNEState; var CipherBlock: TFUNEBlock);
begin
  FUNE_InvBlockOp2(State, CipherBlock);
end;

procedure FUNE_DecodeRoundI(var State: TFUNEState; const I: Integer; var CipherBlock: TFUNEBlock);
begin
  FUNE_InvBlockOp1(State, CipherBlock);
  FUNE_InvBlockOp2(State, CipherBlock);
end;

procedure FUNE_DecodeRoundN(var State: TFUNEState; var CipherBlock: TFUNEBlock);
begin
  FUNE_InvBlockOp1(State, CipherBlock);
end;



// Utilities
procedure FUNE_StateInit(var State: TFUNEState);
begin
  FillChar(State, SizeOf(State), 0);
end;

procedure FUNE_BlockToKey(const Block: TFUNEBlock; var Key: TFUNEKey);
var I : Byte;
begin
  Assert(FUNE_KeySize = FUNE_BlockSize);
  for I := 0 to FUNE_KeySize - 1 do
    Key[I] := Block[I];
end;

procedure FUNE_KeyInit(var Key: TFUNEKey; const KeyBuf; const KeyBufSize: Integer);
var I, J : Integer;
    P, Q : PByte;
begin
  FillChar(Key, SizeOf(TFUNEKey), 0);
  P := @KeyBuf;
  for I := 0 to KeyBufSize - 1 do
    begin
      J := I mod FUNE_KeySize;
      Q := @Key[J];
      Q^ := Q^ xor P^;
      Inc(P);
    end;
end;



// Encode
procedure FUNE_EncodeInit(var State: TFUNEState; const Key: TFUNEKey);
begin
  FUNE_StateInit(State);
  FUNE_KeyMix(State, Key);
end;

procedure FUNE_EncodeInit(var State: TFUNEState; const KeyBuf; const KeyBufSize: Integer);
var Key : TFUNEKey;
begin
  FUNE_KeyInit(Key, KeyBuf, KeyBufSize);
  FUNE_EncodeInit(State, Key);
end;

procedure FUNE_EncodeBlock(var State: TFUNEState; const Block: TFUNEBlock; var CipherBlock: TFUNEBlock);
var I : Integer;
    K : TFUNEKey;
begin
  CipherBlock := Block;
  FUNE_EncodeRound1(State, CipherBlock);
  for I := 2 to FUNE_NumOfRounds - 1 do
    FUNE_EncodeRoundI(State, I, CipherBlock);
  FUNE_EncodeRoundN(State, CipherBlock);
  FUNE_BlockToKey(CipherBlock, K);
  FUNE_KeyMix(State, K);
end;



// Decode
procedure FUNE_DecodeInit(var State: TFUNEState; const Key: TFUNEKey);
begin
  FUNE_StateInit(State);
  FUNE_KeyMix(State, Key);
end;

procedure FUNE_DecodeInit(var State: TFUNEState; const KeyBuf; const KeyBufSize: Integer);
var Key : TFUNEKey;
begin
  FUNE_KeyInit(Key, KeyBuf, KeyBufSize);
  FUNE_DecodeInit(State, Key);
end;

procedure FUNE_DecodeBlock(var State: TFUNEState; const CipherBlock: TFUNEBlock; var Block: TFUNEBlock);
var I : Integer;
    K : TFUNEKey;
begin
  Block := CipherBlock;
  FUNE_DecodeRoundN(State, Block);
  for I := FUNE_NumOfRounds - 1 downto 2 do
    FUNE_DecodeRoundI(State, I, Block);
  FUNE_DecodeRound1(State, Block);
  FUNE_BlockToKey(CipherBlock, K);
  FUNE_KeyMix(State, K);
end;




{                                                                              }
{ Test cases                                                                   }
{                                                                              }
{$IFDEF DEBUG}{$IFDEF SELFTEST}
{$ASSERTIONS ON}
procedure SelfTest_Block(const Block: TFUNEBlock);
var K : TFUNEKey;
    B, C, E : TFUNEBlock;
    S : TFUNEState;
    I : Integer;
begin
  // simple encode / decode test
  FillChar(K, FUNE_KeySize, 0);
  for I := 0 to FUNE_BlockSize - 1 do
    B[I] := Block[I];
  FillChar(C, FUNE_BlockSize, $FF);
  FUNE_EncodeInit(S, K);
  FUNE_EncodeBlock(S, B, C);
  FillChar(E, FUNE_BlockSize, $FF);
  FUNE_DecodeInit(S, K);
  FUNE_DecodeBlock(S, C, E);
  for I := 0 to FUNE_BlockSize - 1 do
    Assert(E[I] = Block[I]);
end;

procedure SelfTest;
var B : TFUNEBlock;
    I : Integer;
    C : Byte;
begin
  for C := 0 to 255 do
    begin
      for I := 0 to FUNE_BlockSize - 1 do
        B[I] := C;
      SelfTest_Block(B);
    end;
  for I := 0 to FUNE_BlockSize - 1 do
    B[I] := I;
  SelfTest_Block(B);
end;
{$ENDIF}{$ENDIF}



end.

