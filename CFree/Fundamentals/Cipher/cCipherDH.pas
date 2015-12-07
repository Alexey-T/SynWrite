{******************************************************************************}
{                                                                              }
{   Library:          Fundamentals 4.00                                        }
{   File name:        cCipherDH.pas                                            }
{   File version:     0.03                                                     }
{   Description:      Diffie-Hellman cipher routines                           }
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
{ References:                                                                  }
{                                                                              }
{   RFC 2631 - Diffie-Hellman Key Agreement Method                             }
{                                                                              }
{ Revision history:                                                            }
{                                                                              }
{   2010/11/07  0.01  Initial development (Primes, OtherInfo)                  }
{   2010/11/10  0.02  Further development (KEK)                                }
{   2010/12/03  0.03  Changes to prime generation based on RFC errata.         }
{                                                                              }
{ Note: Under development                                                      }
{******************************************************************************}

{$INCLUDE cCipher.inc}

unit cCipherDH;

interface

uses
  { System }
  SysUtils,
  { Fundamentals }
  cHugeInt;



type
  EDH = class(Exception);

  TDHHashAlgorithm = (
      dhhSHA1,
      dhhSHA256);

  TDHState = record
    HashAlgorithm  : TDHHashAlgorithm;
    HashBitCount   : Integer;
    PrimeQBitCount : Integer;   // Bits in Q = m
    PrimePBitCount : Integer;   // Bits in P = L
    P              : HugeWord;  // Prime P
    Q              : HugeWord;  // Prime Q
    Seed           : HugeWord;
    Counter        : Integer;
    G              : HugeWord;  // Generator
    X              : HugeWord;  // Private key
    Y              : HugeWord;  // Public key
    ZZ             : HugeWord;  // Shared secret
    RemoteKeySize  : Integer;
    RemoteKey      : HugeWord;
    KEK            : AnsiString;
  end;

procedure DHStateInit(var State: TDHState);
procedure DHStateFinalise(var State: TDHState);

procedure DHInitHashAlgorithm(var State: TDHState;
          const HashAlgorithm: TDHHashAlgorithm);

procedure DHGeneratePrimesPQ(
          var State: TDHState;
          const PrimeQBitCount, PrimePBitCount: Integer);

procedure DHGenerateG(var State: TDHState);
procedure DHGeneratePrivateKeyX(var State: TDHState);
procedure DHGeneratePublicKeyY(var State: TDHState);
procedure DHGenerateSharedSecretZZ(
          var State: TDHState;
          const RemoteKeySize: Integer;
          const RemoteKey: HugeWord);

function  DHIsPublicKeyValid(const State: TDHState; const Y: HugeWord): Boolean;

function  DHGenerateOtherInfo(
          const CipherOID: array of Integer;
          const CipherKeyBits: Integer;
          const KEKCounter: Integer;
          const PartyAInfo: AnsiString): AnsiString;
procedure DHGenerateKEK(
          var State: TDHState;
          const CipherOID: array of Integer;
          const CipherKeyBits: Integer;
          const PartyAInfo: AnsiString);

{
Primes from:
http://www.floatingdoghead.net/bigprimes.html

2048-bit secure Diffie-Hellman modulus #1
This is too small to protect a 128-bit generation at full strength.

9aebdbd054a6cfc9db5bcb8f3eaa82c9d8b925018b77954013e170025a7f420b
eb57b7b905869b53a24d08ce5cb76dc812e8081e4140704e0d3875dee731962f
56420f6eea5cd0810513fe9fcb0227852ec4fd289ced1b3e87b62f6ce5fcef95
5273d28e916db157e6ff7b1038db41608da42d701f83d9ed34a90c6047705a66
57bb75347718d17879be72f38296b13ddab9df4fc7cf2c6a0fb03e86efa18dc0
123ffba51a0afb6c8d977640faf1dfde83c96186524a02879e84e22503c3d95c
a66380889da78ea0ba8ba68c3b2167442a059fe13654ac75f422374e4648bfb6
d35dfde06ba961dee283e0cbb4fc682f32fea0813814c62806b433e9bb332cab

2048-bit secure Diffie-Hellman modulus #2
This is too small to protect a 128-bit generation at full strength.

fa6d3cb85ca608b967329e2b7514e976a9b5a707875f408e2b758bf6b20b57bd
8e5b7fa06033791f7e14716e18bdc1a5495e46034bfdcbb77fcbfaa570893d9c
7adec9a1a1309770501e8893e63aaa53b309cd0fdde38b1450e4c0c9984ea28d
1e0955e286f1ca33e3806e03bbf8e78eb893a8802a74c1deb411977817960e13
fb6fd33542319016dc01c0f9bca01f1c7d760916e60537185f385d888445ef27
da91dc1d4496cdf34766c82f74d1233c4c16a1701e9a802868c4610a2f3fcd8c
0e6b9345668e696a39e7962c6f1ba276c29182aa40c0dadc1f3b86dd396c9b0e
0453ab22008f3c01c6ec4889a4ff828e400938d31969db5e88fcfbf633817983

2048-bit secure Diffie-Hellman modulus #3
This is too small to protect a 128-bit generation at full strength.
qf
942acc406c4f6c68f7d56f96b4efe8a314d624d11b0b7c9b5c0aca240406ba33
bc986676070bfe47007f65e92a0c825513d79ea1d81ce0fac5132846f847d4a9
bfc7f420cf293347d589b45269a062483acc84f7ab643d371d1546c84a3689c6 
dab6313e1a461ca249dc24f49da1abc7089357fdd2f5f8cbdf323725fa64f8ee 
e22de1dcb8ba25f2a410ae16d08ed5a4377a36175e20e56c14e29cfb3a4797f8 
a123ff1ce04da33d3948cfd751929a373a9a3f1d2acf6620b917c0263ed3ea52 
df585c64e6a3936937b2a2d900bf49cd6514d80a71cd6126f4519fb903d41d27 
844f244446776282f313f36e679097d3f34d43c443141c9272ece204867f08c7

2560-bit secure Diffie-Hellman modulus #1 
This is adequately-sized to support 128-bit genrations at full strength.

b8eb857df1eb89bc8c13ef777772d6f3d3716ecc671e5dfbb969c28ffc2c3383 
283b54ca857ec4fff0cf45badd491e1203918b1d35ee197cafc039f65654e908 
d0235537b280a605d902a3e273362cb21ba61423b926a57f41864195f785d8c2 
8524345bfb89a05490ea1a56207db04a958590b1725ef2b538a05bb833ebbe0d 
fb55f8195ae050ad216739970344c1423ac016cdc501dc6e51af56bfedb247e7 
460530c6b5a73046b448818d85f19a5af50c19fa03143b108b71b18081b80e9a 
8c5648cf8d2772f2e81c44f479fcf483db3b5e68d906833278de670cfdce7023 
0c88beded782940e9724d1269412223f1bf70445288612b36fa67abf2f4dd391 
1173c08793c42e51b2f469ac3455a894cb15dbc870c1252fca298a24cd5e507d 
b637960f6eeb653d971075b73dfae5a60c51314313a6815438f1c6b4a6f3a2cf

3072-bit secure Diffie-Hellman modulus #1 
Unknown strength greater than 128-bit, less than 192-bit.

c48f6e2843518c51000efb2aa67017951bca4b322b94c0ea1bb3f47444aa47a4 
1b26ef9f4b0566c7c503ae38e53260127d1110c97c4d84746c49e74ddfcce99e 
9dabe0588cdde430bacbce373da1adc4826fba83dc121798b4182d06398336ff 
ed5149e893a22a17d341833693cc8c07b953a5f88abca6ce4ebbb33712406d37 
0ae0dcbd55f3bd3b7fc1d15f2fa384cab5e10115aa342d00e04ff76d12c21059 
35aa6867881384144d2affeaa9bec900e2ab7a24907c0129451531d5efca29d4 
07bea207a4534ab45d5541fe5e248a9280b8e01e84d48570942c05137fc888ca 
6b9b7e96be659352149ce05a0754cba3a22ce47da03deba945f2d5123a3fc02a 
e46300ee8791ee6a6bba15d92f9ad0895811b277ac20becee88ea33a2e18ec3b 
5ce8e913aa85c2912e214190eb6a1ceef052288c95fe94988b2e36c74b384d4e 
26eb1e8fdb1c3898695c97ca1114207bd69fcf9ecbec36cae0092e20dcfbbbbd 
6169970e2ec2309c178b0907d9bad5c0c9a41b9abfa997306404777836b22acf

3584-bit secure Diffie-Hellman modulus #1 
Unknown strength greater than 128-bit, less than 192-bit.

a01cadf74b4d06569caad9b77c3451e75d1f9e898833c7ad6fe533a1be8f77b3 
d20cf0507745151f8a8d5d79ac9dffca39e3a10768ca8b5d1a991450c03e5fd6 
e1bb8cf302022695eb30d5f0d1822cb1cadea3297b2bb4244eb15c23a7add89f 
27c4c9e6f8e0b53342d8767dc10632bdf0360c48e08f17758c2e1348b7363c5d 
d7aaebfc2040aa1e6f697f7cd87f625475a144bcfefb7af752d77aa2f5b21664 
d1e750160203baca07aba7c3c7541000808c42122a8173a4396fefbb5593f356 
c3557fc1939ad39d6bbedb1fdc931ce6a3574fe4acb224291d36c6fae9e31fcf 
883632bfc6e588dd7dca73c53312970b63702ee13381b74b03dae1d1e22e17a9 
d865c2386615d89fdcff94e81629a85613754d9b10a9c79ffdfba2302ee80e35 
f8162307f1d32dc837d7a9d0cc41fb0ade4d90e0e86d186b91d52f5c7d63ed55 
5f6822fe4c7c0c0e0f6c35b03661e8d37b77e2bda25548aa4bd16b6780a268d9 
e81975c989a737aa8ae9adb44dbfb0d4a607e355f4db36de3534c7d2c2c11c75 
0f3febf92e6bf5be3e1033bca99d773f000feb762d87ab4c22c0642a694fc7d9 
df026ca20497820ee4da94ffe2c93e3db34521f196bf524f3c3f0fe878f8ec2b

4096-bit secure Diffie-Hellman modulus #1 
Whoah, Nellie!!! I consider myself lucky to have generated this one. 
It only took a short time compared to 3072 #1. 
ASCII-hexadecimal representations of this modulus and the session keys generated with it are 1024 bytes long. 
That may be handy for you. 
Unknown strength greater than 128-bit, less than 192-bit.

af0c858df6f08fdf9c65c46b862b8a49a89643bc8beb69d4fecad6dea6af8dc3 
943812bc93789dba86113ad79abf48bf46098947e71e41a136533f60436f90b8 
9d535dc354ebd9cb6cf57f5506d5b18bbcaa861998f4055b9ec3582fa6c2161f 
75d05542ba4b2d5496b4113854c6d14fb8bb93370579bae0e1e6077fd6efe62e 
d744f65a1912f730592e621ec7d4593c1ff41694acf61be27ba5d25edf5ebfe3 
3334617a31b089aa8ac8b8f917f0d8185362574c7cdfaf64624149aec5c1a397 
289614a9efdc529f4084b0978360ece10dd6eb9ad8be046fe7c935769a068af8 
bf72569e6e5b454b58754f35892b918fa730fefa1ef4067d64f365db7253d49e 
d9f09193c889b4a078e62bf56b9104f9acac2e2a3803dbbdf4d7696e1a26f8b4 
7159af14f8550c70d0dc9b1c36353286a201e042474f2d466737bb35c3b6a754 
413eaad190dd3d090817bc32f6e7ba413ff9f94bf65ba876545a4a1e0ce54430 
84f704942224ee79f067d8518652b61d591aa1be7a35acd3d96b31443d3046b6 
1c73d2a41305848acce64d830454f1a947604b57625990059b23a2c3f33ccacf 
0a9185bf9e6bbf9ccc7ed05eccbee8eda9375a964fd1f0c4e0fb25e64af19089 
fdb9a35abcb17e8c4bfdfd60294831942851cd227a0c0f405a84dbb437909190 
181b3ef7791b4737020ff12a0def480b780840cede5f624cf8f3bef5fd44f573

8192-bit secure Diffie-Hellman modulus #1 
Ew Dawggie!!! 
This one took over 2 months of compute time on my 1.7 GHz P4. 
Clearly I don't use an operating system from Washington, USA for this work. 
Binary representations of this modulus and the session keys generated with it are 1024 bytes long. 
That may be handy for you. 
Unknown strength greater than 192-bit, less than 256-bit.

99134f625a7e28b61a2e610e1d55c5b1c01dc37f718c16116e482f500a046cca 
650df4bea06121e842c16e3208548c51dbfe07a34fba510d61c5961d8920c41b 
516e47ead343d0152f71ff692ccfd078b90323f0405ab12a0f5b1717236242b5 
b4382b65bfeee7a8ed102a9fd8870b42a6b54a7667cfb0ac6a58de6b7ef1d7ca 
db892d859ec9cd5feef5ca54127aa75aa84d20ea88d3085d3fab4ea71a82b4c0 
ad0b9139d68d9521ca9ca4bef9f2221f96c7b3d93564e7735ea1514e318baa24 
72e46a0f474fcfcafab662843d172ab0a5021e27fd8dd3c077f876350029679a 
25de16eb0df0371d889f48d709ae68638dc2c82e797dccec72f8dec9842ba8a7 
a9b9a047afc98769252b1c3db5805b7e7a91b4860eb785cd0eaa575f9313a876 
2eca9929aed02f5fbd660a11c2a3bb70e2836a471928d283ab40fc470cf71331 
eb51e6a09ad94b8f50f33af6c8af995fc943616467a6815e5d32cfb25a084ac6 
386746dd5ab339283e643bf3ef7d488838769b2990776b728b1de7e605c8294f 
cc7ecd9092a357d3286f7827bf921e4fb7239db2f5aa415ec53be0a5b26f7063 
2191929b7dc9a8e17917b308884bb0745e8420fc6639a570ef45e3eae39a9444 
cdcfc4509775d32f297a47025fd706fd6854a6a327981c4e4e56280ac590e63b 
cd6dea98682a4c655de964ae0de75922b0f88a071950029de9f6ce673599ebb7 
4bb122969b7c065a10ee2e6e60c41e8acae2ea6da0097810192d17198756dd22 
bc1b533602e60dab38c0146b02394c7ba727da464bd7ab5bbd0b3c287522caf5 
1f69db508fc5c603a7832bfbdba41f7467e3a565984368421e489cf04a44a0d4 
fb5bd58237773506284131ea99c0c55545729d1b56473e2ee83e73c74fd19b5f 
076115a85042370028e899c6cdaac1be1e9668518be1e48aecf40de573da2241 
3e20a2d64d6ff935c5899f1c3c40eec8c33f9389aaff8ea6cab749199e09084f 
94aa7dfe5257c09c601198ae84225cf1f995ce8610a1c21f79d767f177c75f6b 
3a5575e3880b021e67f9c8bca52a6b8ce4ceec522fae129a08a23288f570403e 
8acd8973b490fae5a6e669a5291afee18550b3d6e96100ee41b32b92e48056ad 
626451d132c4676496776951eff8c672a480d297fb9d12aaa3faee456ea93953 
b1ca94ceeaeb6e4091fd820df5d6bfc2fed4a2587a096f8b5267600a97c4b9eb 
bfa91b5579dbe1cfaf7c6018bc4a1d679204c2e729c492eba06bd506f77b2403 
d57730d1c73dcc861aabb2f3e90ffdb9a12bf3298eb34924c2be999bbcc6e4d7 
dea62e98a1ea40943c998142a9947a13eef3e1531506a30b369b399bf22868cf
c79684e07e8dad0a936d8db81e876f3711dc1ea0c53fc19e234f00f826ccc2f8
8aa0e2ae60eebaff8a98977924c2054429454ca000c5c2aa22fccfc5e2fdd553

}

{
From:
http://www.faqs.org/rfcs/rfc2539.html

Appendix A: Well known prime/generator pairs

   These numbers are copied from the IPSEC effort where the derivation
   of these values is more fully explained and additional information is
   available.  Richard Schroeppel performed all the mathematical and
   computational work for this appendix.

A.1. Well-Known Group 1:  A 768 bit prime

   The prime is 2^768 - 2^704 - 1 + 2^64 * ( [2^638 pi] + 149686 ).  Its
   decimal value is
          155251809230070893513091813125848175563133404943451431320235
          119490296623994910210725866945387659164244291000768028886422
          915080371891804634263272761303128298374438082089019628850917
          0691316593175367469551763119843371637221007210577919

   Prime modulus: Length (32 bit words): 24, Data (hex):
            FFFFFFFF FFFFFFFF C90FDAA2 2168C234 C4C6628B 80DC1CD1
            29024E08 8A67CC74 020BBEA6 3B139B22 514A0879 8E3404DD
            EF9519B3 CD3A431B 302B0A6D F25F1437 4FE1356D 6D51C245
            E485B576 625E7EC6 F44C42E9 A63A3620 FFFFFFFF FFFFFFFF

   Generator: Length (32 bit words): 1, Data (hex): 2

A.2. Well-Known Group 2:  A 1024 bit prime

   The prime is 2^1024 - 2^960 - 1 + 2^64 * ( [2^894 pi] + 129093 ).
   Its decimal value is
         179769313486231590770839156793787453197860296048756011706444
         423684197180216158519368947833795864925541502180565485980503
         646440548199239100050792877003355816639229553136239076508735
         759914822574862575007425302077447712589550957937778424442426
         617334727629299387668709205606050270810842907692932019128194
         467627007

   Prime modulus:  Length (32 bit words): 32, Data (hex):
            FFFFFFFF FFFFFFFF C90FDAA2 2168C234 C4C6628B 80DC1CD1
            29024E08 8A67CC74 020BBEA6 3B139B22 514A0879 8E3404DD
            EF9519B3 CD3A431B 302B0A6D F25F1437 4FE1356D 6D51C245
            E485B576 625E7EC6 F44C42E9 A637ED6B 0BFF5CB6 F406B7ED
            EE386BFB 5A899FA5 AE9F2411 7C4B1FE6 49286651 ECE65381
            FFFFFFFF FFFFFFFF

   Generator: Length (32 bit words):  1, Data (hex): 2
}



{
From RFC 5114:

2.1.  1024-bit MODP Group with 160-bit Prime Order Subgroup

   The hexadecimal value of the prime is:

   p = B10B8F96 A080E01D DE92DE5E AE5D54EC 52C99FBC FB06A3C6
       9A6A9DCA 52D23B61 6073E286 75A23D18 9838EF1E 2EE652C0
       13ECB4AE A9061123 24975C3C D49B83BF ACCBDD7D 90C4BD70
       98488E9C 219A7372 4EFFD6FA E5644738 FAA31A4F F55BCCC0
       A151AF5F 0DC8B4BD 45BF37DF 365C1A65 E68CFDA7 6D4DA708
       DF1FB2BC 2E4A4371

   The hexadecimal value of the generator is:

   g = A4D1CBD5 C3FD3412 6765A442 EFB99905 F8104DD2 58AC507F
       D6406CFF 14266D31 266FEA1E 5C41564B 777E690F 5504F213
       160217B4 B01B886A 5E91547F 9E2749F4 D7FBD7D3 B9A92EE1
       909D0D22 63F80A76 A6A24C08 7A091F53 1DBF0A01 69B6A28A
       D662A4D1 8E73AFA3 2D779D59 18D08BC8 858F4DCE F97C2A24
       855E6EEB 22B3B2E5

   The generator generates a prime-order subgroup of size:

   q = F518AA87 81A8DF27 8ABA4E7D 64B7CB9D 49462353

2.2.  2048-bit MODP Group with 224-bit Prime Order Subgroup

   The hexadecimal value of the prime is:

   p =  AD107E1E 9123A9D0 D660FAA7 9559C51F A20D64E5 683B9FD1
        B54B1597 B61D0A75 E6FA141D F95A56DB AF9A3C40 7BA1DF15
        EB3D688A 309C180E 1DE6B85A 1274A0A6 6D3F8152 AD6AC212
        9037C9ED EFDA4DF8 D91E8FEF 55B7394B 7AD5B7D0 B6C12207
        C9F98D11 ED34DBF6 C6BA0B2C 8BBC27BE 6A00E0A0 B9C49708
        B3BF8A31 70918836 81286130 BC8985DB 1602E714 415D9330
        278273C7 DE31EFDC 7310F712 1FD5A074 15987D9A DC0A486D
        CDF93ACC 44328387 315D75E1 98C641A4 80CD86A1 B9E587E8
        BE60E69C C928B2B9 C52172E4 13042E9B 23F10B0E 16E79763
        C9B53DCF 4BA80A29 E3FB73C1 6B8E75B9 7EF363E2 FFA31F71
        CF9DE538 4E71B81C 0AC4DFFE 0C10E64F

   The hexadecimal value of the generator is:

   g =  AC4032EF 4F2D9AE3 9DF30B5C 8FFDAC50 6CDEBE7B 89998CAF
        74866A08 CFE4FFE3 A6824A4E 10B9A6F0 DD921F01 A70C4AFA
        AB739D77 00C29F52 C57DB17C 620A8652 BE5E9001 A8D66AD7
        C1766910 1999024A F4D02727 5AC1348B B8A762D0 521BC98A
        E2471504 22EA1ED4 09939D54 DA7460CD B5F6C6B2 50717CBE
        F180EB34 118E98D1 19529A45 D6F83456 6E3025E3 16A330EF
        BB77A86F 0C1AB15B 051AE3D4 28C8F8AC B70A8137 150B8EEB
        10E183ED D19963DD D9E263E4 770589EF 6AA21E7F 5F2FF381
        B539CCE3 409D13CD 566AFBB4 8D6C0191 81E1BCFE 94B30269
        EDFE72FE 9B6AA4BD 7B5A0F1C 71CFFF4C 19C418E1 F6EC0179
        81BC087F 2A7065B3 84B890D3 191F2BFA

   The generator generates a prime-order subgroup of size:

   q =  801C0D34 C58D93FE 99717710 1F80535A 4738CEBC BF389A99
        B36371EB

2.3.  2048-bit MODP Group with 256-bit Prime Order Subgroup

   The hexadecimal value of the prime is:

   p = 87A8E61D B4B6663C FFBBD19C 65195999 8CEEF608 660DD0F2
       5D2CEED4 435E3B00 E00DF8F1 D61957D4 FAF7DF45 61B2AA30
       16C3D911 34096FAA 3BF4296D 830E9A7C 209E0C64 97517ABD
       5A8A9D30 6BCF67ED 91F9E672 5B4758C0 22E0B1EF 4275BF7B
       6C5BFC11 D45F9088 B941F54E B1E59BB8 BC39A0BF 12307F5C
       4FDB70C5 81B23F76 B63ACAE1 CAA6B790 2D525267 35488A0E
       F13C6D9A 51BFA4AB 3AD83477 96524D8E F6A167B5 A41825D9
       67E144E5 14056425 1CCACB83 E6B486F6 B3CA3F79 71506026
       C0B857F6 89962856 DED4010A BD0BE621 C3A3960A 54E710C3
       75F26375 D7014103 A4B54330 C198AF12 6116D227 6E11715F
       693877FA D7EF09CA DB094AE9 1E1A1597

   The hexadecimal value of the generator is:

   g = 3FB32C9B 73134D0B 2E775066 60EDBD48 4CA7B18F 21EF2054
       07F4793A 1A0BA125 10DBC150 77BE463F FF4FED4A AC0BB555
       BE3A6C1B 0C6B47B1 BC3773BF 7E8C6F62 901228F8 C28CBB18
       A55AE313 41000A65 0196F931 C77A57F2 DDF463E5 E9EC144B
       777DE62A AAB8A862 8AC376D2 82D6ED38 64E67982 428EBC83
       1D14348F 6F2F9193 B5045AF2 767164E1 DFC967C1 FB3F2E55
       A4BD1BFF E83B9C80 D052B985 D182EA0A DB2A3B73 13D3FE14
       C8484B1E 052588B9 B7D2BBD2 DF016199 ECD06E15 57CD0915
       B3353BBB 64E0EC37 7FD02837 0DF92B52 C7891428 CDC67EB6
       184B523D 1DB246C3 2F630784 90F00EF8 D647D148 D4795451
       5E2327CF EF98C582 664B4C0F 6CC41659

   The generator generates a prime-order subgroup of size:

   q = 8CF83642 A709A097 B4479976 40129DA2 99B1A47D 1EB3750B
       A308B0FE 64F5FBD3

}



{                                                                              }
{ Test cases                                                                   }
{                                                                              }
{$IFDEF DEBUG}{$IFDEF SELFTEST}
procedure SelfTest;
{$ENDIF}{$ENDIF}



implementation

uses
  { Fundamentals }
  cHash,
  cRandom,
  cASN1;



{                                                                              }
{ DH                                                                           }
{                                                                              }
procedure DHStateInit(var State: TDHState);
begin
  FillChar(State, SizeOf(TDHState), 0);
  HugeWordInit(State.P);
  HugeWordInit(State.Q);
  HugeWordInit(State.Seed);
  HugeWordInit(State.G);
  HugeWordInit(State.X);
  HugeWordInit(State.Y);
  HugeWordInit(State.ZZ);
  HugeWordInit(State.RemoteKey);
end;

procedure DHStateFinalise(var State: TDHState);
begin
  HugeWordFinalise(State.RemoteKey);
  HugeWordFinalise(State.ZZ);
  HugeWordFinalise(State.Y);
  HugeWordFinalise(State.X);
  HugeWordFinalise(State.G);
  HugeWordFinalise(State.Seed);
  HugeWordFinalise(State.Q);
  HugeWordFinalise(State.P);
end;

const
  HashAlgorithmBitCount : array[TDHHashAlgorithm] of Integer = (160, 256);

procedure DHInitHashAlgorithm(var State: TDHState;
          const HashAlgorithm: TDHHashAlgorithm);
begin
  State.HashAlgorithm := HashAlgorithm;
  State.HashBitCount := HashAlgorithmBitCount[HashAlgorithm];
end;

procedure DHHugeWordSHA1(const A: HugeWord; var B: HugeWord);
var H : T160BitDigest;
begin
  H := CalcSHA1(A.Data^, A.Used * HugeWordElementSize);
  HugeWordSetSize(B, 160 div HugeWordElementBits);
  Move(H.Longs[0], B.Data^, 20);
end;

procedure DHRandomSeed(const Bits: Integer; var Seed: HugeWord);
begin
  Assert(Bits >= HugeWordElementBits);

  HugeWordRandom(Seed, Bits div HugeWordElementBits);
  HugeWordSetBit(Seed, Bits - 1 - RandomUniform(HugeWordElementBits));
end;

procedure DHGeneratePrimeQ(var State: TDHState; const Bits: Integer);
var M, MP, I, H : Integer;
    Q, U, T1, T2 : HugeWord;
begin
  HugeWordInit(Q);
  HugeWordInit(U);
  HugeWordInit(T1);
  HugeWordInit(T2);
  try
    M := Bits;
    H := State.HashBitCount;
    // set m' = m / 160 where / represents integer division with rounding upwards i.e. 200/160 = 2
    MP := (M + H - 1) div H;
    repeat
      // select an arbitrary bit string SEED such that the length of SEED >= m
      DHRandomSeed(M, State.Seed);
      // set U = 0
      HugeWordAssignZero(U);
      // for i = 0 to m' - 1
      for I := 0 to MP - 1 do
        begin
          // Modified version from errata for RFC 2631:
          // U = U + (
          //          SHA1[SEED + i] XOR
          //          SHA1[(SEED + m' + i) mod 2^(160 * (i + 1))]
          //         )
          //
          //     T1 = SHA1[SEED + i]
          HugeWordAssign(T1, State.Seed);
          HugeWordAddWord32(T1, I);
          DHHugeWordSHA1(T1, T1);
          //     T2 = SEED + m' + i
          HugeWordAssign(T2, State.Seed);
          HugeWordAddWord32(T2, MP + I);
          //     T2 = T2 mod 2^(160 * (i + 1))
          HugeWordSetSize(T2, (H * (I + 1)) div HugeWordElementBits);
          //     T2 = SHA1[(SEED + m' + i) mod 2^(160 * (i + 1))]
          DHHugeWordSHA1(T2, T2);
          //     T1 = T1 XOR T2
          HugeWordXorHugeWord(T1, T2);
          // Added the following operation (not in errata) to make sure U is of the desired size:
          //     T1 = T1 * 2^(160 * i)
          HugeWordShl(T1, I * H);
          //     U = U + T1
          HugeWordAdd(U, T1);
        end;
      // form q from U by computing U mod (2^m) and setting the most significant
      // bit (the 2^(m-1) bit) and the least significant bit to 1. In terms of
      // boolean operations, q = U OR 2^(m-1) OR 1. Note that 2^(m-1) < q < 2^m
      HugeWordAssign(Q, U);
      HugeWordSetBit(Q, 0);
      HugeWordSetBit(Q, M - 1);
      HugeWordSetSize(Q, M div HugeWordElementBits);
      // use a robust primality algorithm to test whether q is prime
    until HugeWordIsPrime(Q) <> pNotPrime;
    State.PrimeQBitCount := M;
    HugeWordAssign(State.Q, Q);
  finally
    HugeWordFinalise(T2);
    HugeWordFinalise(T1);
    HugeWordFinalise(U);
    HugeWordFinalise(Q);
  end;
end;

procedure DHGeneratePrimeP(var State: TDHState; const BitsP: Integer);
var L, M, LP, NP, MP, C, I, H : Integer;
    P, R, T1, T2, V, W, X : HugeWord;
    PR : Boolean;
begin
  HugeWordInit(P);
  HugeWordInit(R);
  HugeWordInit(T1);
  HugeWordInit(T2);
  HugeWordInit(V);
  HugeWordInit(W);
  HugeWordInit(X);
  try
    H := State.HashBitCount;
    // set L' = L/160, set N' = L/1024
    L := BitsP;
    M := State.PrimeQBitCount;
    LP := (L + H - 1) div H;
    NP := (L + 1023) div 1024;
    MP := (M + H - 1) div H;
    // let counter = 0
    C := 0;
    repeat
      // set R = Seed + 2*m' + (L' * counter)
      HugeWordAssign(R, State.Seed);
      HugeWordAddWord32(R, 2 * MP + LP * C);
      // set V = 0
      HugeWordAssignZero(V);
      // for i = 0 to L' - 1 do
      for I := 0 to LP - 1 do
        begin
          // V = V + SHA1(R + i) * 2^(160 * i)
          HugeWordAssign(T1, R);
          HugeWordAddWord32(T1, I);
          DHHugeWordSHA1(T1, T1);
          if I > 0 then
            HugeWordShl(T1, 160 * I);
          HugeWordAdd(V, T1);
        end;
      // set W = V mod 2^L
      HugeWordAssign(W, V);
      HugeWordSetSize(W, L div HugeWordElementBits);
      // set X = W OR 2^(L-1)
      // note that 0 <= W < 2^(L-1) and hence X >= 2^(L-1)
      HugeWordAssign(X, W);
      HugeWordSetBit(X, L - 1);
      // set p = X - (X mod (2*q)) + 1
      HugeWordAssign(P, X);
      //     T1 = 2 * Q
      HugeWordAssign(T1, State.Q);
      HugeWordShl(T1, 1);
      //     T2 = X mod (2*q)
      HugeWordMod(X, T1, T2);
      HugeWordSubtract(P, T2);
      HugeWordAddWord32(P, 1);
      // if p > 2^(L-1) use a robust primality test to test whether p is prime
      if not HugeWordIsBitSet(P, L - 1) then
        PR := False
      else
        PR := HugeWordIsPrime(P) <> pNotPrime;
      // if p is prime output p, q, seed, counter and stop, else
      // set counter = counter + 1
      if not PR then
        Inc(C);
      // if counter < (4096 * N) then repeat
    until PR or (C >= 4096 * NP);
    if not PR then
      raise EDH.Create('Failed to generate prime');
    State.PrimePBitCount := L;
    State.Counter := C;
    HugeWordAssign(State.P, P);
  finally
    HugeWordFinalise(X);
    HugeWordFinalise(W);
    HugeWordFinalise(V);
    HugeWordFinalise(T2);
    HugeWordFinalise(T1);
    HugeWordFinalise(R);
    HugeWordFinalise(P);
  end;
end;

procedure DHGeneratePrimesPQ(
          var State: TDHState;
          const PrimeQBitCount, PrimePBitCount: Integer);
begin
  Assert(PrimeQBitCount >= 160);
  Assert(PrimePBitCount > PrimeQBitCount);

  DHGeneratePrimeQ(State, PrimeQBitCount);
  DHGeneratePrimeP(State, PrimePBitCount);
end;

{ g = h^[(p-1)/q] mod p, where
  h is any integer with 1 < h < p-1 such that h[(p-1)/q] mod p > 1
  (g has order q mod p; i.e. g^q mod p = 1 if g!=1)
  j a large integer such that p=qj + 1 }
procedure DHGenerateG(var State: TDHState);
var
  J, T1, T2, H, G : HugeWord;
begin
  HugeWordInit(J);
  HugeWordInit(T1);
  HugeWordInit(T2);
  HugeWordInit(H);
  HugeWordInit(G);
  try
    // 1. Let j = (p - 1)/q.
    // T1 = p - 1
    HugeWordAssign(T1, State.P);
    HugeWordSubtractWord32(T1, 1);
    // J = T1 / q
    HugeWordDivide(T1, State.Q, J, T2);
    repeat
      // 2. Set h = any integer, where 1 < h < p - 1 and h differs from any value previously tried.
      repeat
        HugeWordRandom(H, State.P.Used);
      until HugeWordCompare(H, T1) < 0;
      // 3. Set g = h^j mod p
      HugeWordPowerAndMod(G, H, J, State.P);
      // 4. If g = 1 go to step 2
    until not HugeWordIsOne(G);
    HugeWordAssign(State.G, G);
  finally
    HugeWordFinalise(G);
    HugeWordFinalise(H);
    HugeWordFinalise(T2);
    HugeWordFinalise(T1);
    HugeWordFinalise(J);
  end;
end;

{ X9.42 requires that the private key x be in the interval [2, (q - 2)].
  x should be randomly generated in this interval. y is then computed by
  calculating g^x mod p. }
procedure DHGeneratePrivateKeyX(var State: TDHState);
var
  X, T : HugeWord;
begin
  HugeWordInit(X);
  HugeWordInit(T);
  try
    HugeWordAssign(T, State.Q);
    HugeWordSubtractWord32(T, 2);
    repeat
     HugeWordRandom(X, T.Used);
    until (HugeWordCompare(X, T) < 0) and
          (HugeWordCompareWord32(X, 2) >= 0);
    HugeWordAssign(State.X, X);
  finally
    HugeWordFinalise(T);
    HugeWordFinalise(X);
  end;
end;

{ ya is party a's public key; ya = g^xa mod p }
procedure DHGeneratePublicKeyY(var State: TDHState);
begin
  HugeWordPowerAndMod(State.Y, State.G, State.X, State.P);
end;

{ X9.42 defines that the shared secret ZZ is generated as follows:
  ZZ = g ^ (xb * xa) mod p
  Note that the individual parties actually perform the computations:
      ZZ = (yb ^ xa)  mod p  = (ya ^ xb)  mod p
  where ^ denotes exponentiation
      ya is party a's public key; ya = g ^ xa mod p
      yb is party b's public key; yb = g ^ xb mod p
      xa is party a's private key
      xb is party b's private key }
procedure DHGenerateSharedSecretZZ(
          var State: TDHState;
          const RemoteKeySize: Integer;
          const RemoteKey: HugeWord);
begin
  State.RemoteKeySize := RemoteKeySize;
  HugeWordAssign(State.RemoteKey, RemoteKey);
  HugeWordPowerAndMod(State.ZZ, State.RemoteKey, State.X, State.P);
end;

{ Verify that y lies within the interval [2,p-1]. If it does not, the key is invalid.
  Compute y^q mod p. If the result == 1, the key is valid. Otherwise the key is invalid. }
function DHIsPublicKeyValid(const State: TDHState; const Y: HugeWord): Boolean;
var T : HugeWord;
begin
  if HugeWordCompareWord32(Y, 2) <= 0 then
    Result := False
  else
  if HugeWordCompare(Y, State.P) >= 0 then
    Result := False
  else
    begin
      HugeWordInit(T);
      try
        HugeWordPowerAndMod(T, Y, State.Q, State.P);
        Result := HugeWordIsOne(T);
      finally
        HugeWordFinalise(T);
      end;
    end;
end;

{ OtherInfo ::= SEQUENCE [
      keyInfo KeySpecificInfo,
      partyAInfo [0] OCTET STRING OPTIONAL,
      suppPubInfo [2] OCTET STRING ]
  KeySpecificInfo ::= SEQUENCE [
      algorithm OBJECT IDENTIFIER,
      counter OCTET STRING SIZE (4..4) ]
  algorithm is the ASN.1 algorithm OID of the CEK wrapping algorithm
      with which this KEK will be used. Note that this is NOT an
      AlgorithmIdentifier, but simply the OBJECT IDENTIFIER. No parameters
      are used.
  counter is a 32 bit number, represented in network byte order. Its
      initial value is 1 for any ZZ, i.e. the byte sequence 00 00 00 01
      (hex), and it is incremented by one every time the above key
      generation function is run for a given KEK.
  partyAInfo is a random string provided by the sender. In CMS, it is
      provided as a parameter in the UserKeyingMaterial field (encoded as
      an OCTET STRING). If provided, partyAInfo MUST contain 512 bits.
  suppPubInfo is the length of the generated KEK, in bits, represented
      as a 32 bit number in network byte order. E.g. for 3DES it would be
      the byte sequence 00 00 00 C0. }
function DHGenerateOtherInfo(
         const CipherOID: array of Integer;
         const CipherKeyBits: Integer;
         const KEKCounter: Integer;
         const PartyAInfo: AnsiString): AnsiString;
var S : AnsiString;
begin
  S := ASN1EncodeSequence(
         ASN1EncodeOID(CipherOID) +
         ASN1EncodeInt32AsOctetString(KEKCounter)
       );
  if PartyAInfo <> '' then
    S := S +
      ASN1EncodeObj($A0,
        ASN1EncodeOctetString(PartyAInfo)
      );
  S := S +
    ASN1EncodeObj($A2,
      ASN1EncodeInt32AsOctetString(CipherKeyBits)
    );
  Result := ASN1EncodeSequence(S);
end;

{  KM = H ( ZZ || OtherInfo)
   H is the message digest function SHA-1 [FIPS-180] ZZ is the shared
   secret value computed in Section 2.1.1. Leading zeros MUST be
   preserved, so that ZZ occupies as many octets as p. For instance, if
   p is 1024 bits, ZZ should be 128 bytes long. }
procedure DHGenerateKM(
          var State: TDHState;
          const CipherOID: array of Integer;
          const CipherKeyBits: Integer;
          const KEKCounter: Integer;
          const PartyAInfo: AnsiString;
          var KM: T160BitDigest);
var S, T : AnsiString;
    L : Integer;
begin
  // ZZ
  L := State.PrimeQBitCount div 8;
  SetLength(S, L);
  HugeWordSetSize(State.ZZ, L div 4);
  Move(State.ZZ.Data^, S[1], L);
  // OtherInfo
  T := S +
       DHGenerateOtherInfo(CipherOID, CipherKeyBits, KEKCounter, PartyAInfo);
  // KM
  KM := CalcSHA1(T);
end;

{  Each key encryption algorithm requires a specific size key (n). The
   KEK is generated by mapping the left n-most bytes of KM onto the key.
   For 3DES, which requires 192 bits of keying material, the algorithm
   must be run twice, once with a counter value of 1 (to generate K1',
   K2', and the first 32 bits of K3') and once with a counter value of 2
   (to generate the last 32 bits of K3). K1',K2' and K3' are then parity
   adjusted to generate the 3 DES keys K1,K2 and K3.  For RC2-128, which
   requires 128 bits of keying material, the algorithm is run once, with
   a counter value of 1, and the left-most 128 bits are directly
   converted to an RC2 key. Similarly, for RC2-40, which requires 40
   bits of keying material, the algorithm is run once, with a counter
   value of 1, and the leftmost 40 bits are used as the key. }
procedure DHGenerateKEK(
          var State: TDHState;
          const CipherOID: array of Integer;
          const CipherKeyBits: Integer;
          const PartyAInfo: AnsiString);
var N, I, L : Integer;
    KEK : AnsiString;
    KMS : AnsiString;
    KM : T160BitDigest;
begin
  KEK := '';
  L := CipherKeyBits;
  N := (L + 159) div 160;
  for I := 0 to N - 1 do
    begin
      DHGenerateKM(State, CipherOID, CipherKeyBits, I + 1, PartyAInfo, KM);
      SetLength(KMS, 20);
      Move(KM, KMS[1], 20);
      if L < 160 then
        SetLength(KMS, L div 8);
      KEK := KEK + KMS;
      Dec(L, 160);
    end;
  State.KEK := KEK;
end;



{                                                                              }
{ Test cases                                                                   }
{                                                                              }
{$IFDEF DEBUG}{$ASSERTIONS ON}
{$IFDEF SELFTEST}
procedure SelfTest;
var D : TDHState;
    S : AnsiString;
begin
  // RFC 2631
  S := DHGenerateOtherInfo(OID_3DESWrap, 192, 1, '');
  Assert(S =
    #$30#$1d +
        #$30#$13 +
            #$06#$0b#$2a#$86#$48#$86#$f7#$0d#$01#$09#$10#$03#$06 +
            #$04#$04 +
                #$00#$00#$00#$01 +
        #$a2#$06 +
            #$04#$04 +
                #$00#$00#$00#$c0);
  // RFC 2631
  S := DHGenerateOtherInfo(OID_RC2Wrap, 128, 1,
      #$01#$23#$45#$67#$89#$ab#$cd#$ef#$fe#$dc#$ba#$98#$76#$54#$32#$01 +
      #$01#$23#$45#$67#$89#$ab#$cd#$ef#$fe#$dc#$ba#$98#$76#$54#$32#$01 +
      #$01#$23#$45#$67#$89#$ab#$cd#$ef#$fe#$dc#$ba#$98#$76#$54#$32#$01 +
      #$01#$23#$45#$67#$89#$ab#$cd#$ef#$fe#$dc#$ba#$98#$76#$54#$32#$01);
  Assert(S =
    #$30#$61 +
        #$30#$13 +
            #$06#$0b#$2a#$86#$48#$86#$f7#$0d#$01#$09#$10#$03#$07 +
                #$04#$04 +
                    #$00#$00#$00#$01 +
    #$a0#$42 +
        #$04#$40 +
            #$01#$23#$45#$67#$89#$ab#$cd#$ef#$fe#$dc#$ba#$98#$76#$54#$32#$01 +
            #$01#$23#$45#$67#$89#$ab#$cd#$ef#$fe#$dc#$ba#$98#$76#$54#$32#$01 +
            #$01#$23#$45#$67#$89#$ab#$cd#$ef#$fe#$dc#$ba#$98#$76#$54#$32#$01 +
            #$01#$23#$45#$67#$89#$ab#$cd#$ef#$fe#$dc#$ba#$98#$76#$54#$32#$01 +
    #$a2#$06 +
        #$04#$04 +
            #$00#$00#$00#$80);
  DHStateInit(D);
  try
    DHInitHashAlgorithm(D, dhhSHA1);
    DHGeneratePrimesPQ(D, 180, 256);
    DHGenerateG(D);
    DHGeneratePrivateKeyX(D);
    DHGeneratePublicKeyY(D);
    // DHGenerateSharedSecretZZ(D,
  finally
    DHStateFinalise(D);
  end;
end;
{$ENDIF}{$ENDIF}



end.

