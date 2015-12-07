{***************************************************************************** }
{                                                                              }
{   Library:          Fundamentals 4.00                                        }
{   File name:        cDataStructs.pas                                         }
{   File version:     4.33                                                     }
{   Description:      Data structures                                          }
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
{ Description:                                                                 }
{                                                                              }
{   This unit implements classes for the following commonly used data          }
{   structures:                                                                }
{     + Arrays                                                                 }
{     + Dictionaries                                                           }
{     + Sparse Arrays                                                          }
{     + Linked Lists                                                           }
{                                                                              }
{   ARRAYS                                                                     }
{                                                                              }
{   Arrays are ordered collections where items are indexed by consecutive      }
{   integer values.                                                            }
{                                                                              }
{   This unit implements array classes for each of the following types:        }
{     + LongInt                                                                }
{     + LongWord                                                               }
{     + Int64                                                                  }
{     + Single                                                                 }
{     + Double                                                                 }
{     + Extended                                                               }
{     + Pointer                                                                }
{     + String                                                                 }
{     + WideString                                                             }
{     + Object                                                                 }
{                                                                              }
{   DICTIONARIES                                                               }
{                                                                              }
{   Dictionaries are associative arrays where the key value is a string.       }
{                                                                              }
{   Associative arrays, also referred to as mappings, are unordered            }
{   collections where an arbitrary key can be used to index a value.           }
{                                                                              }
{   This unit implements dictionary classes for each of the following types:   }
{     + Integer                                                                }
{     + Cardinal                                                               }
{     + Int64                                                                  }
{     + Single                                                                 }
{     + Double                                                                 }
{     + Extended                                                               }
{     + Pointer                                                                }
{     + String                                                                 }
{     + TObject                                                                }
{     + IInterface                                                             }
{                                                                              }
{   For example, the class TIntegerDictionary is used where the key is an      }
{   arbitrary string and the value an integer.                                 }
{                                                                              }
{       Ages := TIntegerDictionary.Create;                                     }
{       Ages['John'] := 29;                                                    }
{       Ages['Tori'] := 35;                                                    }
{       if Ages.HasKey['John'] then                                            }
{         Ages.Delete('John');                                                 }
{       Ages.Free;                                                             }
{                                                                              }
{   SPARSE ARRAYS                                                              }
{                                                                              }
{   Sparse arrays are associative arrays where the index value is an           }
{   arbitrary integer.                                                         }
{                                                                              }
{   Associative arrays, also referred to as mappings, are unordered            }
{   collections where an arbitrary key can be used to index a value.           }
{                                                                              }
{   This unit implements sparse arrays that can hold the following values:     }
{     + String                                                                 }
{     + WideString                                                             }
{     + Int64                                                                  }
{     + Extended                                                               }
{     + TObject                                                                }
{                                                                              }
{   For example, the class TSparseStringArray is used where the key is an      }
{   arbitrary integer and the value a string.                                  }
{                                                                              }
{       Names := TSparseStringArray.Create;                                    }
{       Names[123] := 'John';                                                  }
{       Names[999] := 'Tori';                                                  }
{       if Names.HasItem(123) then                                             }
{         Names.Delete(123);                                                   }
{       Names.Free;                                                            }
{                                                                              }
{ Revision history:                                                            }
{                                                                              }
{   1999/11/12  0.01  Split cTypes from cDataStruct and cHolder.               }
{   1999/11/14  0.02  Added AListType.                                         }
{   2000/02/08  1.03  Initial version. AArray, TArray and TStreamArray.        }
{   2000/06/07  1.04  Base classes (AIntegerArray, ASet).                      }
{   2000/06/08  1.05  Added AObjectArray.                                      }
{   2000/06/03  1.06  Added AArray, AIntegerArray, AExtendedArray,             }
{                     AStringArray and ABitArray (formerly ASet) with some     }
{                     implementations.                                         }
{   2000/06/06  1.07  TFlatBitArray implementation.                            }
{                     Added AInt64Array.                                       }
{   2000/06/08  1.08  Added TObjectArray.                                      }
{   2000/06/10  1.09  Added linked lists.                                      }
{   2000/06/14  1.10  Converted cDataStructs to template.                      }
{   2000/06/16  1.11  Added ADictionary.                                       }
{   2000/07/07  1.12  Added ATypeDictionary.                                   }
{   2001/01/19  1.13  Added THashedStringDictionary.                           }
{   2001/04/13  1.14  Added TObjectDictionary.                                 }
{   2001/07/15  1.15  Changed memory arrays to pre-allocate when growing.      }
{   2001/08/20  2.16  Merged cTypes and cDataStructs to allow object           }
{                     interface implementation in base classes.                }
{   2002/05/15  3.17  Created cArrays unit from cDataStructs.                  }
{                     Refactored for Fundamentals 3.                           }
{   2002/09/30  3.18  Moved stream array classes to unit cStreamArrays.        }
{   2002/12/17  3.19  Added THashedStringArray.                                }
{   2003/03/08  3.20  Renamed Add methods to Append.                           }
{   2003/05/26  3.21  Added Remove methods to object array.                    }
{   2003/07/27  3.22  Initial version (sparse object array).                   }
{   2003/09/11  3.23  Added TInterfaceArray.                                   }
{   2004/01/02  3.24  Bug fixed in TStringArray.SetAsString by Eb.             }
{   2004/01/18  3.25  Added TWideStringArray.                                  }
{   2004/03/31  3.26  Added sparse String, WideString and Int64 arrays.        }
{   2004/07/24  3.27  Fixed bug in Sort with duplicate values. Thanks to Eb    }
{                     and others for reporting it.                             }
{   2004/08/01  3.28  Added AArray.RemoveDuplicates.                           }
{   2005/01/27  3.29  Added sparse Extended array.                             }
{   2006/05/10  3.30  Fixed bug in TDoublyLinkedList.DeleteList as reported    }
{                     by Malinovsky Vladimir.                                  }
{   2007/09/27  4.31  Merged into single unit for Fundamentals 4.              }
{   2009/09/23  4.32  Fixed bug in TDoublyLinkedList.InsertBefore/InsertAfter  }
{                     reported by Steffen Thorkildsen.                         }
{   2011/08/27  4.33  Fixed bugs in THashedAnsiStringArray reported by         }
{                     H Visli.                                                 }
{                                                                              }
{ Supported compilers:                                                         }
{                                                                              }
{   Borland Delphi 5-7 Win32 i386                                              }
{   FreePascal 2 Win32 i386                                                    }
{   FreePascal 2 Linux i386                                                    }
{                                                                              }
{***************************************************************************** }

{$INCLUDE cDefines.inc}
{$IFDEF FREEPASCAL}{$IFDEF DEBUG}
  {$WARNINGS OFF}{$HINTS OFF}
{$ENDIF}{$ENDIF}
unit cDataStructs;

interface

uses
  { System }
  SysUtils,

  { Fundamentals }
  cUtils;



{                                                                              }
{ A note on the class naming convention used in this unit:                     }
{                                                                              }
{   Classes with the A-prefix are abstract base classes. They define the       }
{   interface for the type and must never be instanciated. Implementation      }
{   classes follow the standard naming convention of using the T-prefix.       }
{                                                                              }



{                                                                              }
{ TYPE BASE CLASS                                                              }
{                                                                              }



{                                                                              }
{ AType                                                                        }
{   Abstract base class for data structures.                                   }
{                                                                              }
{   Provides an interface for commonly used data operations such as            }
{   assigning, comparing and duplicating.                                      }
{                                                                              }
{   Duplicate creates a new instance of the object (using CreateInstance) and  }
{   then copies the content (using Assign). Implementations do not have to     }
{   override Duplicate if both CreateInstance and Assign are implemented.      }
{   Assign's default implementation calls the protected AssignTo.              }
{                                                                              }
{   Clear sets an instance's content (value) to an empty/zero state. This      }
{   state should be similar to the state of a new instance created using       }
{   CreateInstance.                                                            }
{                                                                              }
{   IsEqual compares the content of instances. After a call to Assign, an      }
{   equivalent call to IsEqual should return True.                             }
{                                                                              }
{   Compare is the ranking function used by sorting and searching.             }
{   HashValue returns a 'random' number, based on the content (value).         }
{                                                                              }
{   AsAnsiString is the Ascii string representation of the content.            }
{   AsWideString and AsUTF8String is the Unicode equivalent of AsAnsiString.   }
{   AsUTF8String's default implementation calls AsWideString.                  }
{   AsWideString's default implementation calls AsAnsiString.                  }
{   AsString is the default string type representation of the content.         }
{                                                                              }
type
  AType = class
  protected
    procedure RaiseTypeError(const Msg: String; const Error: Exception = nil;
              const ErrorClass: ExceptClass = nil); virtual;
    procedure RaiseMethodNotImplementedError(const Method: String);

    procedure Init; virtual;
    procedure AssignTo(const Dest: TObject); virtual;

    function  GetAsAnsiString: AnsiString; virtual;
    procedure SetAsAnsiString(const S: AnsiString); virtual;

    function  GetAsWideString: WideString; virtual;
    procedure SetAsWideString(const S: WideString); virtual;

    function  GetAsUTF8String: AnsiString; virtual;
    procedure SetAsUTF8String(const S: AnsiString); virtual;

    function  GetAsString: AnsiString; virtual;
    procedure SetAsString(const S: AnsiString); virtual;

  public
    constructor Create;
    class function CreateInstance: AType; virtual;

    function  Duplicate: TObject; virtual;
    procedure Assign(const Source: TObject); overload; virtual;

    procedure Clear; virtual;
    function  IsEmpty: Boolean; virtual;
    function  IsEqual(const V: TObject): Boolean; virtual;
    function  Compare(const V: TObject): TCompareResult; virtual;
    function  HashValue: LongWord; virtual;

    property  AsString: AnsiString read GetAsString write SetAsString;
    property  AsWideString: WideString read GetAsWideString write SetAsWideString;
    property  AsUTF8String: AnsiString read GetAsUTF8String write SetAsUTF8String;
  end;
  EType = class(Exception);
  TypeClass = class of AType;
  ATypeArray = Array of AType;
  TypeClassArray = Array of TypeClass;



{                                                                              }
{ AType helper functions                                                       }
{                                                                              }
function  TypeDuplicate(const V: TObject): TObject;
procedure TypeAssign(const A, B: TObject);
procedure TypeClear(const V: TObject);
function  TypeIsEqual(const A, B: TObject): Boolean;
function  TypeCompare(const A, B: TObject): TCompareResult;
function  TypeHashValue(const A: TObject): LongWord;
function  TypeGetAsString(const V: TObject): AnsiString;
procedure TypeSetAsString(const V: TObject; const S: AnsiString);
function  TypeGetAsWideString(const V: TObject): WideString;
procedure TypeSetAsWideString(const V: TObject; const S: WideString);
function  TypeGetAsUTF8String(const V: TObject): AnsiString;
procedure TypeSetAsUTF8String(const V: TObject; const S: AnsiString);



{                                                                              }
{ ARRAY BASE CLASSES                                                           }
{                                                                              }



{                                                                              }
{ AArray                                                                       }
{   Base class for an array.                                                   }
{                                                                              }
type
  AArray = class(AType)
  protected
    procedure RaiseIndexError(const Idx: Integer); virtual;

    function  GetCount: Integer; virtual; abstract;
    procedure SetCount(const NewCount: Integer); virtual; abstract;

  public
    { AType                                                                    }
    procedure Clear; override;

    { AArray                                                                   }
    property  Count: Integer read GetCount write SetCount;

    function  CompareItems(const Idx1, Idx2: Integer): TCompareResult; virtual; abstract;
    procedure ExchangeItems(const Idx1, Idx2: Integer); virtual; abstract;
    procedure Sort; virtual;
    procedure ReverseOrder; virtual;
    procedure RemoveDuplicates(const IsSortedAscending: Boolean); virtual;

    function  DuplicateRange(const LoIdx, HiIdx: Integer): AArray; virtual; abstract;
    procedure Delete(const Idx: Integer; const Count: Integer = 1); virtual; abstract;
    procedure Insert(const Idx: Integer; const Count: Integer = 1); virtual; abstract;
    function  AppendArray(const V: AArray): Integer; overload; virtual; abstract;
  end;
  EArray = class(EType);
  ArrayClass = class of AArray;



{                                                                              }
{ ALongIntArray                                                                }
{   Base class for an array of LongInt's.                                      }
{                                                                              }
type
  ALongIntArray = class(AArray)
  protected
    function  GetItem(const Idx: Integer): LongInt; virtual; abstract;
    procedure SetItem(const Idx: Integer; const Value: LongInt); virtual; abstract;

    function  GetRange(const LoIdx, HiIdx: Integer): LongIntArray; virtual;
    procedure SetRange(const LoIdx, HiIdx: Integer; const V: LongIntArray); virtual;

    function  GetAsString: AnsiString; override;
    procedure SetAsString(const S: AnsiString); override;

  public
    { AType                                                                    }
    procedure Assign(const Source: TObject); override;
    function  IsEqual(const V: TObject): Boolean; override;

    { AArray                                                                   }
    procedure ExchangeItems(const Idx1, Idx2: Integer); override;
    function  CompareItems(const Idx1, Idx2: Integer): TCompareResult; override;
    function  AppendArray(const V: AArray): Integer; overload; override;
    function  DuplicateRange(const LoIdx, HiIdx: Integer): AArray; override;
    procedure Delete(const Idx: Integer; const Count: Integer = 1); override;
    procedure Insert(const Idx: Integer; const Count: Integer = 1); override;

    { ALongIntArray interface                                                      }
    property  Item[const Idx: Integer]: LongInt read GetItem write SetItem; default;
    property  Range[const LoIdx, HiIdx: Integer]: LongIntArray read GetRange write SetRange;
    procedure Fill(const Idx, Count: Integer; const Value: LongInt); virtual;
    function  AppendItem(const Value: LongInt): Integer; virtual;
    function  AppendArray(const V: LongIntArray): Integer; overload; virtual;
    function  PosNext(const Find: LongInt; const PrevPos: Integer = -1;
              const IsSortedAscending: Boolean = False): Integer;
  end;
  ELongIntArray = class(EArray);



{                                                                              }
{ AIntegerArray                                                                }
{                                                                              }
type
  AIntegerArray = ALongIntArray;
  EIntegerArray = ELongIntArray;



{                                                                              }
{ ALongWordArray                                                               }
{   Base class for an array of LongWord's.                                     }
{                                                                              }
type
  ALongWordArray = class(AArray)
  protected
    function  GetItem(const Idx: Integer): LongWord; virtual; abstract;
    procedure SetItem(const Idx: Integer; const Value: LongWord); virtual; abstract;

    function  GetRange(const LoIdx, HiIdx: Integer): LongWordArray; virtual;
    procedure SetRange(const LoIdx, HiIdx: Integer; const V: LongWordArray); virtual;

    function  GetAsString: AnsiString; override;
    procedure SetAsString(const S: AnsiString); override;

  public
    { AType                                                                    }
    procedure Assign(const Source: TObject); override;
    function  IsEqual(const V: TObject): Boolean; override;

    { AArray                                                                   }
    procedure ExchangeItems(const Idx1, Idx2: Integer); override;
    function  CompareItems(const Idx1, Idx2: Integer): TCompareResult; override;
    function  AppendArray(const V: AArray): Integer; overload; override;
    function  DuplicateRange(const LoIdx, HiIdx: Integer): AArray; override;
    procedure Delete(const Idx: Integer; const Count: Integer = 1); override;
    procedure Insert(const Idx: Integer; const Count: Integer = 1); override;

    { ALongWordArray interface                                                     }
    property  Item[const Idx: Integer]: LongWord read GetItem write SetItem; default;
    property  Range[const LoIdx, HiIdx: Integer]: LongWordArray read GetRange write SetRange;
    procedure Fill(const Idx, Count: Integer; const Value: LongWord); virtual;
    function  AppendItem(const Value: LongWord): Integer; virtual;
    function  AppendArray(const V: LongWordArray): Integer; overload; virtual;
    function  PosNext(const Find: LongWord; const PrevPos: Integer = -1;
              const IsSortedAscending: Boolean = False): Integer;
  end;
  ELongWordArray = class(EArray);



{                                                                              }
{ ACardinalArray                                                               }
{                                                                              }
type
  ACardinalArray = ALongWordArray;
  ECardinalArray = ELongWordArray;



{                                                                              }
{ AInt64Array                                                                  }
{   Base class for an array of Int64's.                                        }
{                                                                              }
type
  AInt64Array = class(AArray)
  protected
    function  GetItem(const Idx: Integer): Int64; virtual; abstract;
    procedure SetItem(const Idx: Integer; const Value: Int64); virtual; abstract;

    function  GetRange(const LoIdx, HiIdx: Integer): Int64Array; virtual;
    procedure SetRange(const LoIdx, HiIdx: Integer; const V: Int64Array); virtual;

    function  GetAsString: AnsiString; override;
    procedure SetAsString(const S: AnsiString); override;

  public
    { AType                                                                    }
    procedure Assign(const Source: TObject); override;
    function  IsEqual(const V: TObject): Boolean; override;

    { AArray                                                                   }
    procedure ExchangeItems(const Idx1, Idx2: Integer); override;
    function  CompareItems(const Idx1, Idx2: Integer): TCompareResult; override;
    function  AppendArray(const V: AArray): Integer; overload; override;
    function  DuplicateRange(const LoIdx, HiIdx: Integer): AArray; override;
    procedure Delete(const Idx: Integer; const Count: Integer = 1); override;
    procedure Insert(const Idx: Integer; const Count: Integer = 1); override;

    { AInt64Array interface                                                        }
    property  Item[const Idx: Integer]: Int64 read GetItem write SetItem; default;
    property  Range[const LoIdx, HiIdx: Integer]: Int64Array read GetRange write SetRange;
    procedure Fill(const Idx, Count: Integer; const Value: Int64); virtual;
    function  AppendItem(const Value: Int64): Integer; virtual;
    function  AppendArray(const V: Int64Array): Integer; overload; virtual;
    function  PosNext(const Find: Int64; const PrevPos: Integer = -1;
              const IsSortedAscending: Boolean = False): Integer;
  end;
  EInt64Array = class(EArray);



{                                                                              }
{ ASingleArray                                                                 }
{   Base class for an array of Single's.                                       }
{                                                                              }
type
  ASingleArray = class(AArray)
  protected
    function  GetItem(const Idx: Integer): Single; virtual; abstract;
    procedure SetItem(const Idx: Integer; const Value: Single); virtual; abstract;

    function  GetRange(const LoIdx, HiIdx: Integer): SingleArray; virtual;
    procedure SetRange(const LoIdx, HiIdx: Integer; const V: SingleArray); virtual;

    function  GetAsString: AnsiString; override;
    procedure SetAsString(const S: AnsiString); override;

  public
    { AType                                                                    }
    procedure Assign(const Source: TObject); override;
    function  IsEqual(const V: TObject): Boolean; override;

    { AArray                                                                   }
    procedure ExchangeItems(const Idx1, Idx2: Integer); override;
    function  CompareItems(const Idx1, Idx2: Integer): TCompareResult; override;
    function  AppendArray(const V: AArray): Integer; overload; override;
    function  DuplicateRange(const LoIdx, HiIdx: Integer): AArray; override;
    procedure Delete(const Idx: Integer; const Count: Integer = 1); override;
    procedure Insert(const Idx: Integer; const Count: Integer = 1); override;

    { ASingleArray interface                                                       }
    property  Item[const Idx: Integer]: Single read GetItem write SetItem; default;
    property  Range[const LoIdx, HiIdx: Integer]: SingleArray read GetRange write SetRange;
    procedure Fill(const Idx, Count: Integer; const Value: Single); virtual;
    function  AppendItem(const Value: Single): Integer; virtual;
    function  AppendArray(const V: SingleArray): Integer; overload; virtual;
    function  PosNext(const Find: Single; const PrevPos: Integer = -1;
              const IsSortedAscending: Boolean = False): Integer;
  end;
  ESingleArray = class(EArray);



{                                                                              }
{ ADoubleArray                                                                 }
{   Base class for an array of Double's.                                       }
{                                                                              }
type
  ADoubleArray = class(AArray)
  protected
    function  GetItem(const Idx: Integer): Double; virtual; abstract;
    procedure SetItem(const Idx: Integer; const Value: Double); virtual; abstract;

    function  GetRange(const LoIdx, HiIdx: Integer): DoubleArray; virtual;
    procedure SetRange(const LoIdx, HiIdx: Integer; const V: DoubleArray); virtual;

    function  GetAsString: AnsiString; override;
    procedure SetAsString(const S: AnsiString); override;

  public
    { AType                                                                    }
    procedure Assign(const Source: TObject); override;
    function  IsEqual(const V: TObject): Boolean; override;

    { AArray                                                                   }
    procedure ExchangeItems(const Idx1, Idx2: Integer); override;
    function  CompareItems(const Idx1, Idx2: Integer): TCompareResult; override;
    function  AppendArray(const V: AArray): Integer; overload; override;
    function  DuplicateRange(const LoIdx, HiIdx: Integer): AArray; override;
    procedure Delete(const Idx: Integer; const Count: Integer = 1); override;
    procedure Insert(const Idx: Integer; const Count: Integer = 1); override;

    { ADoubleArray interface                                                       }
    property  Item[const Idx: Integer]: Double read GetItem write SetItem; default;
    property  Range[const LoIdx, HiIdx: Integer]: DoubleArray read GetRange write SetRange;
    procedure Fill(const Idx, Count: Integer; const Value: Double); virtual;
    function  AppendItem(const Value: Double): Integer; virtual;
    function  AppendArray(const V: DoubleArray): Integer; overload; virtual;
    function  PosNext(const Find: Double; const PrevPos: Integer = -1;
              const IsSortedAscending: Boolean = False): Integer;
  end;
  EDoubleArray = class(EArray);



{                                                                              }
{ AExtendedArray                                                               }
{   Base class for an array of Extended's.                                     }
{                                                                              }
type
  AExtendedArray = class(AArray)
  protected
    function  GetItem(const Idx: Integer): Extended; virtual; abstract;
    procedure SetItem(const Idx: Integer; const Value: Extended); virtual; abstract;

    function  GetRange(const LoIdx, HiIdx: Integer): ExtendedArray; virtual;
    procedure SetRange(const LoIdx, HiIdx: Integer; const V: ExtendedArray); virtual;

    function  GetAsString: AnsiString; override;
    procedure SetAsString(const S: AnsiString); override;

  public
    { AType                                                                    }
    procedure Assign(const Source: TObject); override;
    function  IsEqual(const V: TObject): Boolean; override;

    { AArray                                                                   }
    procedure ExchangeItems(const Idx1, Idx2: Integer); override;
    function  CompareItems(const Idx1, Idx2: Integer): TCompareResult; override;
    function  AppendArray(const V: AArray): Integer; overload; override;
    function  DuplicateRange(const LoIdx, HiIdx: Integer): AArray; override;
    procedure Delete(const Idx: Integer; const Count: Integer = 1); override;
    procedure Insert(const Idx: Integer; const Count: Integer = 1); override;

    { AExtendedArray interface                                                     }
    property  Item[const Idx: Integer]: Extended read GetItem write SetItem; default;
    property  Range[const LoIdx, HiIdx: Integer]: ExtendedArray read GetRange write SetRange;
    procedure Fill(const Idx, Count: Integer; const Value: Extended); virtual;
    function  AppendItem(const Value: Extended): Integer; virtual;
    function  AppendArray(const V: ExtendedArray): Integer; overload; virtual;
    function  PosNext(const Find: Extended; const PrevPos: Integer = -1;
              const IsSortedAscending: Boolean = False): Integer;
  end;
  EExtendedArray = class(EArray);



{                                                                              }
{ APointerArray                                                                }
{   Base class for an array of Pointer's.                                      }
{                                                                              }
type
  APointerArray = class(AArray)
  protected
    function  GetItem(const Idx: Integer): Pointer; virtual; abstract;
    procedure SetItem(const Idx: Integer; const Value: Pointer); virtual; abstract;

    function  GetRange(const LoIdx, HiIdx: Integer): PointerArray; virtual;
    procedure SetRange(const LoIdx, HiIdx: Integer; const V: PointerArray); virtual;

    function  GetAsString: AnsiString; override;
    procedure SetAsString(const S: AnsiString); override;

  public
    { AType                                                                    }
    procedure Assign(const Source: TObject); override;
    function  IsEqual(const V: TObject): Boolean; override;

    { AArray                                                                   }
    procedure ExchangeItems(const Idx1, Idx2: Integer); override;
    function  CompareItems(const Idx1, Idx2: Integer): TCompareResult; override;
    function  AppendArray(const V: AArray): Integer; overload; override;
    function  DuplicateRange(const LoIdx, HiIdx: Integer): AArray; override;
    procedure Delete(const Idx: Integer; const Count: Integer = 1); override;
    procedure Insert(const Idx: Integer; const Count: Integer = 1); override;

    { APointerArray interface                                                      }
    property  Item[const Idx: Integer]: Pointer read GetItem write SetItem; default;
    property  Range[const LoIdx, HiIdx: Integer]: PointerArray read GetRange write SetRange;
    procedure Fill(const Idx, Count: Integer; const Value: Pointer); virtual;
    function  AppendItem(const Value: Pointer): Integer; virtual;
    function  AppendArray(const V: PointerArray): Integer; overload; virtual;
    function  PosNext(const Find: Pointer; const PrevPos: Integer = -1;
              const IsSortedAscending: Boolean = False): Integer;
  end;
  EPointerArray = class(EArray);



{                                                                              }
{ AAnsiStringArray                                                             }
{   Base class for an array of AnsiStrings.                                    }
{                                                                              }
type
  EAnsiStringArray = class(EArray);
  AAnsiStringArray = class(AArray)
  protected
    function  GetItem(const Idx: Integer): AnsiString; virtual; abstract;
    procedure SetItem(const Idx: Integer; const Value: AnsiString); virtual; abstract;
    function  GetRange(const LoIdx, HiIdx: Integer): AnsiStringArray; virtual;
    procedure SetRange(const LoIdx, HiIdx: Integer; const V: AnsiStringArray); virtual;
    function  GetAsString: AnsiString; override;
    procedure SetAsString(const S: AnsiString); override;

  public
    { AType                                                                    }
    procedure Assign(const Source: TObject); override;
    function  IsEqual(const V: TObject): Boolean; override;

    { AArray                                                                   }
    procedure ExchangeItems(const Idx1, Idx2: Integer); override;
    function  CompareItems(const Idx1, Idx2: Integer): TCompareResult; override;
    function  AppendArray(const V: AArray): Integer; overload; override;
    function  DuplicateRange(const LoIdx, HiIdx: Integer): AArray; override;
    procedure Delete(const Idx: Integer; const Count: Integer = 1); override;
    procedure Insert(const Idx: Integer; const Count: Integer = 1); override;

    { AStringArray interface                                                   }
    property  Item[const Idx: Integer]: AnsiString read GetItem write SetItem; default;
    property  Range[const LoIdx, HiIdx: Integer]: AnsiStringArray read GetRange write SetRange;
    procedure Fill(const Idx, Count: Integer; const Value: AnsiString = ''); virtual;
    function  AppendItem(const Value: AnsiString): Integer; virtual;
    function  AppendArray(const V: AnsiStringArray): Integer; overload; virtual;
    function  PosNext(const Find: AnsiString; const PrevPos: Integer = -1;
              const IsSortedAscending: Boolean = False): Integer;
  end;



{                                                                              }
{ AWideStringArray                                                             }
{   Base class for an array of WideStrings.                                    }
{                                                                              }
type
  EWideStringArray = class(EArray);
  AWideStringArray = class(AArray)
  protected
    function  GetItem(const Idx: Integer): WideString; virtual; abstract;
    procedure SetItem(const Idx: Integer; const Value: WideString); virtual; abstract;
    function  GetRange(const LoIdx, HiIdx: Integer): WideStringArray; virtual;
    procedure SetRange(const LoIdx, HiIdx: Integer; const V: WideStringArray); virtual;

  public
    { AType                                                                    }
    procedure Assign(const Source: TObject); override;
    function  IsEqual(const V: TObject): Boolean; override;

    { AArray                                                                   }
    procedure ExchangeItems(const Idx1, Idx2: Integer); override;
    function  CompareItems(const Idx1, Idx2: Integer): TCompareResult; override;
    function  AppendArray(const V: AArray): Integer; overload; override;
    function  DuplicateRange(const LoIdx, HiIdx: Integer): AArray; override;
    procedure Delete(const Idx: Integer; const Count: Integer = 1); override;
    procedure Insert(const Idx: Integer; const Count: Integer = 1); override;

    { AWideStringArray interface                                               }
    property  Item[const Idx: Integer]: WideString read GetItem write SetItem; default;
    property  Range[const LoIdx, HiIdx: Integer]: WideStringArray read GetRange write SetRange;
    procedure Fill(const Idx, Count: Integer; const Value: WideString = ''); virtual;
    function  AppendItem(const Value: WideString): Integer; virtual;
    function  AppendArray(const V: WideStringArray): Integer; overload; virtual;
    function  PosNext(const Find: WideString; const PrevPos: Integer = -1;
              const IsSortedAscending: Boolean = False): Integer;
  end;



{                                                                              }
{ AStringArray                                                                 }
{                                                                              }
type
  {$IFDEF CharIsWide}
  EStringArray = EWideStringArray;
  AStringArray = AWideStringArray;
  {$ELSE}
  EStringArray = EAnsiStringArray;
  AStringArray = AAnsiStringArray;
  {$ENDIF}



{                                                                              }
{ AObjectArray                                                                 }
{   Base class for an array of objects.                                        }
{                                                                              }
type
  EObjectArray = class(EArray);
  AObjectArray = class(AArray)
  protected
    function  GetItem(const Idx: Integer): TObject; virtual; abstract;
    procedure SetItem(const Idx: Integer; const Value: TObject); virtual; abstract;
    function  GetRange(const LoIdx, HiIdx: Integer): ObjectArray; virtual;
    procedure SetRange(const LoIdx, HiIdx: Integer; const V: ObjectArray); virtual;
    function  GetAsString: AnsiString; override;
    function  GetIsItemOwner: Boolean; virtual; abstract;
    procedure SetIsItemOwner(const IsItemOwner: Boolean); virtual; abstract;

  public
    { AType                                                                    }
    procedure Clear; override;
    procedure Assign(const Source: TObject); override;
    function  IsEqual(const V: TObject): Boolean; override;
    function  Compare(const V: TObject): TCompareResult; override;

    { AArray                                                                   }
    procedure ExchangeItems(const Idx1, Idx2: Integer); override;
    function  CompareItems(const Idx1, Idx2: Integer): TCompareResult; override;
    function  AppendArray(const V: AArray): Integer; overload; override;
    procedure Delete(const Idx: Integer; const Count: Integer = 1); override;

    { AObjectArray interface                                                   }
    property  Item[const Idx: Integer]: TObject read GetItem write SetItem; default;
    property  Range[const LoIdx, HiIdx: Integer]: ObjectArray read GetRange write SetRange;
    function  AppendItem(const Value: TObject): Integer; virtual;
    function  AppendArray(const V: ObjectArray): Integer; overload; virtual;

    function  PosNext(const Find: TObject; const PrevPos: Integer): Integer; overload;
    function  PosNext(var Item: TObject; const ClassType: TClass; const PrevPos: Integer = -1): Integer; overload;
    function  PosNext(var Item: TObject; const ClassName: String; const PrevPos: Integer = -1): Integer; overload;
    function  Find(const ClassType: TClass; const Count: Integer = 1): TObject; overload;
    function  Find(const ClassName: String; const Count: Integer = 1): TObject; overload;
    function  FindAll(const ClassType: TClass): ObjectArray; overload;
    function  FindAll(const ClassName: String): ObjectArray; overload;
    function  CountItems(const ClassType: TClass): Integer; overload;
    function  CountItems(const ClassName: String): Integer; overload;
    function  DeleteValue(const Value: TObject): Boolean;
    function  DeleteAll(const Value: TObject): Integer;

    property  IsItemOwner: Boolean read GetIsItemOwner write SetIsItemOwner;
    procedure ReleaseItems; virtual; abstract;
    procedure FreeItems; virtual; abstract;
    function  ReleaseItem(const Idx: Integer): TObject; virtual; abstract;
    function  ReleaseValue(const Value: TObject): Boolean;
    function  RemoveItem(const Idx: Integer): TObject;
    function  RemoveValue(const Value: TObject): Boolean;
  end;



{                                                                              }
{ AInterfaceArray                                                              }
{   Base class for an array of Interface's.                                    }
{                                                                              }
type
  AInterfaceArray = class(AArray)
  protected
    function  GetItem(const Idx: Integer): IInterface; virtual; abstract;
    procedure SetItem(const Idx: Integer; const Value: IInterface); virtual; abstract;

    function  GetRange(const LoIdx, HiIdx: Integer): InterfaceArray; virtual;
    procedure SetRange(const LoIdx, HiIdx: Integer; const V: InterfaceArray); virtual;

  public
    { AType                                                                    }
    procedure Assign(const Source: TObject); override;
    function  IsEqual(const V: TObject): Boolean; override;

    { AArray                                                                   }
    procedure ExchangeItems(const Idx1, Idx2: Integer); override;
    function  CompareItems(const Idx1, Idx2: Integer): TCompareResult; override;
    function  AppendArray(const V: AArray): Integer; overload; override;
    function  DuplicateRange(const LoIdx, HiIdx: Integer): AArray; override;
    procedure Delete(const Idx: Integer; const Count: Integer = 1); override;
    procedure Insert(const Idx: Integer; const Count: Integer = 1); override;

    { AInterfaceArray interface                                                    }
    property  Item[const Idx: Integer]: IInterface read GetItem write SetItem; default;
    property  Range[const LoIdx, HiIdx: Integer]: InterfaceArray read GetRange write SetRange;
    procedure Fill(const Idx, Count: Integer; const Value: IInterface); virtual;
    function  AppendItem(const Value: IInterface): Integer; virtual;
    function  AppendArray(const V: InterfaceArray): Integer; overload; virtual;
    function  PosNext(const Find: IInterface; const PrevPos: Integer = -1;
              const IsSortedAscending: Boolean = False): Integer;
  end;
  EInterfaceArray = class(EArray);



{                                                                              }
{ ABitArray                                                                    }
{   Base class for bit array implementations.                                  }
{   Bits are defined as False at initialization.                               }
{   FindRange finds Count consecutive bits that are equal to Value. It         }
{   returns the index of the leftmost bit or -1 if not found.                  }
{                                                                              }
type
  EBitArray = class(EArray);
  ABitArray = class(AArray)
  protected
    function  GetBit(const Idx: Integer): Boolean; virtual; abstract;
    procedure SetBit(const Idx: Integer; const Value: Boolean); virtual; abstract;
    function  GetRangeL(const Idx: Integer): LongWord; virtual;
    procedure SetRangeL(const Idx: Integer; const Value: LongWord); virtual;

  public
    { AType                                                                    }
    procedure Assign(const Source: TObject); override;
    function  IsEqual(const V: TObject): Boolean; override;

    { AArray                                                                   }
    procedure Delete(const Idx: Integer; const Count: Integer = 1); override;
    procedure Insert(const Idx: Integer; const Count: Integer = 1); override;
    function  AppendArray(const V: AArray): Integer; override;
    procedure ExchangeItems(const Idx1, Idx2: Integer); override;
    function  CompareItems(const Idx1, Idx2: Integer): TCompareResult; override;
    function  DuplicateRange(const LoIdx, HiIdx: Integer): AArray; override;

    { ABitArray interface                                                      }
    property  Bit[const Idx: Integer]: Boolean read GetBit write SetBit; default;
    property  RangeL[const Idx: Integer]: LongWord read GetRangeL write SetRangeL;
    function  IsRange(const LoIdx, HiIdx: Integer; const Value: Boolean): Boolean; virtual;
    procedure Fill(const Idx, Count: Integer; const Value: Boolean); virtual;
    function  AppendItem(const Value: Boolean): Integer; virtual;
    procedure Invert; virtual;

    function  Find(const Value: Boolean = False;
              const Start: Integer = 0): Integer; virtual;
    function  FindRange(const Value: Boolean = False;
              const Start: Integer = 0;
              const Count: Integer = 1): Integer; virtual;
  end;



{                                                                              }
{ ARRAY IMPLEMENTATIONS                                                        }
{                                                                              }



{                                                                              }
{ TLongIntArray                                                                }
{   ALongIntArray implemented using a dynamic array.                           }
{                                                                              }
type
  TLongIntArray = class(ALongIntArray)
  protected
    FData     : LongIntArray;
    FCapacity : Integer;
    FCount    : Integer;

    { ACollection                                                              }
    function  GetCount: Integer; override;
    procedure SetCount(const NewCount: Integer); override;

    { ALongIntArray                                                            }
    function  GetItem(const Idx: Integer): LongInt; override;
    procedure SetItem(const Idx: Integer; const Value: LongInt); override;
    function  GetRange(const LoIdx, HiIdx: Integer): LongIntArray; override;
    procedure SetRange(const LoIdx, HiIdx: Integer; const V: LongIntArray); override;
    procedure SetData(const Data: LongIntArray); virtual;

  public
    constructor Create(const V: LongIntArray = nil); overload;

    { AType                                                                    }
    procedure Assign(const Source: TObject); overload; override;

    { AArray                                                                   }
    procedure ExchangeItems(const Idx1, Idx2: Integer); override;
    function  DuplicateRange(const LoIdx, HiIdx: Integer): AArray; override;
    procedure Delete(const Idx: Integer; const Count: Integer = 1); override;
    procedure Insert(const Idx: Integer; const Count: Integer = 1); override;

    { ALongIntArray                                                            }
    procedure Assign(const V: LongIntArray); overload;
    procedure Assign(const V: Array of LongInt); overload;
    function  AppendItem(const Value: LongInt): Integer; override;

    { TLongIntArray                                                            }
    property  Data: LongIntArray read FData write SetData;
    property  Count: Integer read FCount write SetCount;
  end;



{                                                                              }
{ TIntegerArray                                                                }
{                                                                              }
type
  TIntegerArray = TLongIntArray;



{                                                                              }
{ TLongWordArray                                                               }
{   ALongWordArray implemented using a dynamic array.                          }
{                                                                              }
type
  TLongWordArray = class(ALongWordArray)
  protected
    FData     : LongWordArray;
    FCapacity : Integer;
    FCount    : Integer;

    { ACollection                                                              }
    function  GetCount: Integer; override;
    procedure SetCount(const NewCount: Integer); override;

    { ALongWordArray                                                            }
    function  GetItem(const Idx: Integer): LongWord; override;
    procedure SetItem(const Idx: Integer; const Value: LongWord); override;
    function  GetRange(const LoIdx, HiIdx: Integer): LongWordArray; override;
    procedure SetRange(const LoIdx, HiIdx: Integer; const V: LongWordArray); override;
    procedure SetData(const Data: LongWordArray); virtual;

  public
    constructor Create(const V: LongWordArray = nil); overload;

    { AType                                                                    }
    procedure Assign(const Source: TObject); overload; override;

    { AArray                                                                   }
    procedure ExchangeItems(const Idx1, Idx2: Integer); override;
    function  DuplicateRange(const LoIdx, HiIdx: Integer): AArray; override;
    procedure Delete(const Idx: Integer; const Count: Integer = 1); override;
    procedure Insert(const Idx: Integer; const Count: Integer = 1); override;

    { ALongWordArray                                                            }
    procedure Assign(const V: LongWordArray); overload;
    procedure Assign(const V: Array of LongWord); overload;
    function  AppendItem(const Value: LongWord): Integer; override;

    { TLongWordArray                                                            }
    property  Data: LongWordArray read FData write SetData;
    property  Count: Integer read FCount write SetCount;
  end;



{                                                                              }
{ TCardinalArray                                                               }
{                                                                              }
type
  TCardinalArray = TLongWordArray;



{                                                                              }
{ TInt64Array                                                                  }
{   AInt64Array implemented using a dynamic array.                             }
{                                                                              }
type
  TInt64Array = class(AInt64Array)
  protected
    FData     : Int64Array;
    FCapacity : Integer;
    FCount    : Integer;

    { ACollection                                                              }
    function  GetCount: Integer; override;
    procedure SetCount(const NewCount: Integer); override;

    { AInt64Array                                                            }
    function  GetItem(const Idx: Integer): Int64; override;
    procedure SetItem(const Idx: Integer; const Value: Int64); override;
    function  GetRange(const LoIdx, HiIdx: Integer): Int64Array; override;
    procedure SetRange(const LoIdx, HiIdx: Integer; const V: Int64Array); override;
    procedure SetData(const Data: Int64Array); virtual;

  public
    constructor Create(const V: Int64Array = nil); overload;

    { AType                                                                    }
    procedure Assign(const Source: TObject); overload; override;

    { AArray                                                                   }
    procedure ExchangeItems(const Idx1, Idx2: Integer); override;
    function  DuplicateRange(const LoIdx, HiIdx: Integer): AArray; override;
    procedure Delete(const Idx: Integer; const Count: Integer = 1); override;
    procedure Insert(const Idx: Integer; const Count: Integer = 1); override;

    { AInt64Array                                                            }
    procedure Assign(const V: Int64Array); overload;
    procedure Assign(const V: Array of Int64); overload;
    function  AppendItem(const Value: Int64): Integer; override;

    { TInt64Array                                                            }
    property  Data: Int64Array read FData write SetData;
    property  Count: Integer read FCount write SetCount;
  end;



{                                                                              }
{ TSingleArray                                                                 }
{   ASingleArray implemented using a dynamic array.                            }
{                                                                              }
type
  TSingleArray = class(ASingleArray)
  protected
    FData     : SingleArray;
    FCapacity : Integer;
    FCount    : Integer;

    { ACollection                                                              }
    function  GetCount: Integer; override;
    procedure SetCount(const NewCount: Integer); override;

    { ASingleArray                                                            }
    function  GetItem(const Idx: Integer): Single; override;
    procedure SetItem(const Idx: Integer; const Value: Single); override;
    function  GetRange(const LoIdx, HiIdx: Integer): SingleArray; override;
    procedure SetRange(const LoIdx, HiIdx: Integer; const V: SingleArray); override;
    procedure SetData(const Data: SingleArray); virtual;

  public
    constructor Create(const V: SingleArray = nil); overload;

    { AType                                                                    }
    procedure Assign(const Source: TObject); overload; override;

    { AArray                                                                   }
    procedure ExchangeItems(const Idx1, Idx2: Integer); override;
    function  DuplicateRange(const LoIdx, HiIdx: Integer): AArray; override;
    procedure Delete(const Idx: Integer; const Count: Integer = 1); override;
    procedure Insert(const Idx: Integer; const Count: Integer = 1); override;

    { ASingleArray                                                            }
    procedure Assign(const V: SingleArray); overload;
    procedure Assign(const V: Array of Single); overload;
    function  AppendItem(const Value: Single): Integer; override;

    { TSingleArray                                                            }
    property  Data: SingleArray read FData write SetData;
    property  Count: Integer read FCount write SetCount;
  end;



{                                                                              }
{ TDoubleArray                                                                 }
{   ADoubleArray implemented using a dynamic array.                            }
{                                                                              }
type
  TDoubleArray = class(ADoubleArray)
  protected
    FData     : DoubleArray;
    FCapacity : Integer;
    FCount    : Integer;

    { ACollection                                                              }
    function  GetCount: Integer; override;
    procedure SetCount(const NewCount: Integer); override;

    { ADoubleArray                                                            }
    function  GetItem(const Idx: Integer): Double; override;
    procedure SetItem(const Idx: Integer; const Value: Double); override;
    function  GetRange(const LoIdx, HiIdx: Integer): DoubleArray; override;
    procedure SetRange(const LoIdx, HiIdx: Integer; const V: DoubleArray); override;
    procedure SetData(const Data: DoubleArray); virtual;

  public
    constructor Create(const V: DoubleArray = nil); overload;

    { AType                                                                    }
    procedure Assign(const Source: TObject); overload; override;

    { AArray                                                                   }
    procedure ExchangeItems(const Idx1, Idx2: Integer); override;
    function  DuplicateRange(const LoIdx, HiIdx: Integer): AArray; override;
    procedure Delete(const Idx: Integer; const Count: Integer = 1); override;
    procedure Insert(const Idx: Integer; const Count: Integer = 1); override;

    { ADoubleArray                                                            }
    procedure Assign(const V: DoubleArray); overload;
    procedure Assign(const V: Array of Double); overload;
    function  AppendItem(const Value: Double): Integer; override;

    { TDoubleArray                                                            }
    property  Data: DoubleArray read FData write SetData;
    property  Count: Integer read FCount write SetCount;
  end;



{                                                                              }
{ TExtendedArray                                                               }
{   AExtendedArray implemented using a dynamic array.                          }
{                                                                              }
type
  TExtendedArray = class(AExtendedArray)
  protected
    FData     : ExtendedArray;
    FCapacity : Integer;
    FCount    : Integer;

    { ACollection                                                              }
    function  GetCount: Integer; override;
    procedure SetCount(const NewCount: Integer); override;

    { AExtendedArray                                                            }
    function  GetItem(const Idx: Integer): Extended; override;
    procedure SetItem(const Idx: Integer; const Value: Extended); override;
    function  GetRange(const LoIdx, HiIdx: Integer): ExtendedArray; override;
    procedure SetRange(const LoIdx, HiIdx: Integer; const V: ExtendedArray); override;
    procedure SetData(const Data: ExtendedArray); virtual;

  public
    constructor Create(const V: ExtendedArray = nil); overload;

    { AType                                                                    }
    procedure Assign(const Source: TObject); overload; override;

    { AArray                                                                   }
    procedure ExchangeItems(const Idx1, Idx2: Integer); override;
    function  DuplicateRange(const LoIdx, HiIdx: Integer): AArray; override;
    procedure Delete(const Idx: Integer; const Count: Integer = 1); override;
    procedure Insert(const Idx: Integer; const Count: Integer = 1); override;

    { AExtendedArray                                                            }
    procedure Assign(const V: ExtendedArray); overload;
    procedure Assign(const V: Array of Extended); overload;
    function  AppendItem(const Value: Extended): Integer; override;

    { TExtendedArray                                                            }
    property  Data: ExtendedArray read FData write SetData;
    property  Count: Integer read FCount write SetCount;
  end;



{                                                                              }
{ TPointerArray                                                                }
{   APointerArray implemented using a dynamic array.                           }
{                                                                              }
type
  TPointerArray = class(APointerArray)
  protected
    FData     : PointerArray;
    FCapacity : Integer;
    FCount    : Integer;

    { ACollection                                                              }
    function  GetCount: Integer; override;
    procedure SetCount(const NewCount: Integer); override;

    { APointerArray                                                            }
    function  GetItem(const Idx: Integer): Pointer; override;
    procedure SetItem(const Idx: Integer; const Value: Pointer); override;
    function  GetRange(const LoIdx, HiIdx: Integer): PointerArray; override;
    procedure SetRange(const LoIdx, HiIdx: Integer; const V: PointerArray); override;
    procedure SetData(const Data: PointerArray); virtual;

  public
    constructor Create(const V: PointerArray = nil); overload;

    { AType                                                                    }
    procedure Assign(const Source: TObject); overload; override;

    { AArray                                                                   }
    procedure ExchangeItems(const Idx1, Idx2: Integer); override;
    function  DuplicateRange(const LoIdx, HiIdx: Integer): AArray; override;
    procedure Delete(const Idx: Integer; const Count: Integer = 1); override;
    procedure Insert(const Idx: Integer; const Count: Integer = 1); override;

    { APointerArray                                                            }
    procedure Assign(const V: PointerArray); overload;
    procedure Assign(const V: Array of Pointer); overload;
    function  AppendItem(const Value: Pointer): Integer; override;

    { TPointerArray                                                            }
    property  Data: PointerArray read FData write SetData;
    property  Count: Integer read FCount write SetCount;
  end;



{                                                                              }
{ TAnsiStringArray                                                             }
{   AAnsiStringArray implemented using a dynamic array.                        }
{                                                                              }
type
  TAnsiStringArray = class(AAnsiStringArray)
  protected
    FData     : AnsiStringArray;
    FCapacity : Integer;
    FCount    : Integer;

    { ACollection                                                              }
    function  GetCount: Integer; override;
    procedure SetCount(const NewCount: Integer); override;

    { AAnsiStringArray                                                            }
    function  GetItem(const Idx: Integer): AnsiString; override;
    procedure SetItem(const Idx: Integer; const Value: AnsiString); override;
    function  GetRange(const LoIdx, HiIdx: Integer): AnsiStringArray; override;
    procedure SetRange(const LoIdx, HiIdx: Integer; const V: AnsiStringArray); override;
    procedure SetData(const Data: AnsiStringArray); virtual;

  public
    constructor Create(const V: AnsiStringArray = nil); overload;

    { AType                                                                    }
    procedure Assign(const Source: TObject); overload; override;

    { AArray                                                                   }
    procedure ExchangeItems(const Idx1, Idx2: Integer); override;
    function  DuplicateRange(const LoIdx, HiIdx: Integer): AArray; override;
    procedure Delete(const Idx: Integer; const Count: Integer = 1); override;
    procedure Insert(const Idx: Integer; const Count: Integer = 1); override;

    { AAnsiStringArray                                                            }
    procedure Assign(const V: AnsiStringArray); overload;
    procedure Assign(const V: Array of AnsiString); overload;
    function  AppendItem(const Value: AnsiString): Integer; override;

    { TAnsiStringArray                                                            }
    property  Data: AnsiStringArray read FData write SetData;
    property  Count: Integer read FCount write SetCount;
  end;



{                                                                              }
{ TWideStringArray                                                             }
{   AWideStringArray implemented using a dynamic array.                        }
{                                                                              }
type
  TWideStringArray = class(AWideStringArray)
  protected
    FData     : WideStringArray;
    FCapacity : Integer;
    FCount    : Integer;

    { ACollection                                                              }
    function  GetCount: Integer; override;
    procedure SetCount(const NewCount: Integer); override;

    { AWideStringArray                                                            }
    function  GetItem(const Idx: Integer): WideString; override;
    procedure SetItem(const Idx: Integer; const Value: WideString); override;
    function  GetRange(const LoIdx, HiIdx: Integer): WideStringArray; override;
    procedure SetRange(const LoIdx, HiIdx: Integer; const V: WideStringArray); override;
    procedure SetData(const Data: WideStringArray); virtual;

  public
    constructor Create(const V: WideStringArray = nil); overload;

    { AType                                                                    }
    procedure Assign(const Source: TObject); overload; override;

    { AArray                                                                   }
    procedure ExchangeItems(const Idx1, Idx2: Integer); override;
    function  DuplicateRange(const LoIdx, HiIdx: Integer): AArray; override;
    procedure Delete(const Idx: Integer; const Count: Integer = 1); override;
    procedure Insert(const Idx: Integer; const Count: Integer = 1); override;

    { AWideStringArray                                                            }
    procedure Assign(const V: WideStringArray); overload;
    procedure Assign(const V: Array of WideString); overload;
    function  AppendItem(const Value: WideString): Integer; override;

    { TWideStringArray                                                            }
    property  Data: WideStringArray read FData write SetData;
    property  Count: Integer read FCount write SetCount;
  end;



{                                                                              }
{ TStringArray                                                                 }
{                                                                              }
type
  {$IFDEF CharIsWide}
  TStringArray = TWideStringArray;
  {$ELSE}
  TStringArray = TAnsiStringArray;
  {$ENDIF}



{                                                                              }
{ TObjectArray                                                                 }
{   AObjectArray implemented using a dynamic array.                            }
{                                                                              }
type
  TObjectArray = class(AObjectArray)
  protected
    FData        : ObjectArray;
    FCapacity    : Integer;
    FCount       : Integer;
    FIsItemOwner : Boolean;

    procedure Init; override;
    procedure SetData(const Data: ObjectArray); virtual;

    { AArray                                                                   }
    function  GetCount: Integer; override;
    procedure SetCount(const NewCount: Integer); override;

    { AObjectArray                                                             }
    function  GetItem(const Idx: Integer): TObject; override;
    procedure SetItem(const Idx: Integer; const Value: TObject); override;
    function  GetRange(const LoIdx, HiIdx: Integer): ObjectArray; override;
    function  GetIsItemOwner: Boolean; override;
    procedure SetIsItemOwner(const IsItemOwner: Boolean); override;

  public
    { TObjectArray interface                                                   }
    constructor Create(const V: ObjectArray = nil;
                const IsItemOwner: Boolean = False); reintroduce; overload;
    destructor Destroy; override;

    property  Data: ObjectArray read FData write SetData;
    property  Count: Integer read FCount write SetCount;
    property  IsItemOwner: Boolean read FIsItemOwner write FIsItemOwner;
    procedure FreeItems; override;
    procedure ReleaseItems; override;
    function  ReleaseItem(const Idx: Integer): TObject; override;

    { AArray                                                                   }
    function  DuplicateRange(const LoIdx, HiIdx: Integer): AArray; override;
    procedure Delete(const Idx: Integer; const Count: Integer = 1); override;
    procedure Insert(const Idx: Integer; const Count: Integer = 1); override;

    { AObjectArray                                                             }
    function  AppendItem(const Value: TObject): Integer; override;
  end;



{                                                                              }
{ TInterfaceArray                                                              }
{   AInterfaceArray implemented using a dynamic array.                         }
{                                                                              }
type
  TInterfaceArray = class(AInterfaceArray)
  protected
    FData     : InterfaceArray;
    FCapacity : Integer;
    FCount    : Integer;

    { ACollection                                                              }
    function  GetCount: Integer; override;
    procedure SetCount(const NewCount: Integer); override;

    { AInterfaceArray                                                            }
    function  GetItem(const Idx: Integer): IInterface; override;
    procedure SetItem(const Idx: Integer; const Value: IInterface); override;
    function  GetRange(const LoIdx, HiIdx: Integer): InterfaceArray; override;
    procedure SetRange(const LoIdx, HiIdx: Integer; const V: InterfaceArray); override;
    procedure SetData(const Data: InterfaceArray); virtual;

  public
    constructor Create(const V: InterfaceArray = nil); overload;

    { AType                                                                    }
    procedure Assign(const Source: TObject); overload; override;

    { AArray                                                                   }
    procedure ExchangeItems(const Idx1, Idx2: Integer); override;
    function  DuplicateRange(const LoIdx, HiIdx: Integer): AArray; override;
    procedure Delete(const Idx: Integer; const Count: Integer = 1); override;
    procedure Insert(const Idx: Integer; const Count: Integer = 1); override;

    { AInterfaceArray                                                            }
    procedure Assign(const V: InterfaceArray); overload;
    procedure Assign(const V: Array of IInterface); overload;
    function  AppendItem(const Value: IInterface): Integer; override;

    { TInterfaceArray                                                            }
    property  Data: InterfaceArray read FData write SetData;
    property  Count: Integer read FCount write SetCount;
  end;



{                                                                              }
{ TBitArray                                                                    }
{   ABitArray implemented using a dynamic array.                               }
{                                                                              }
type
  TBitArray = class(ABitArray)
  protected
    FData  : LongWordArray;
    FCount : Integer;

    { AArray                                                                   }
    function  GetCount: Integer; override;
    procedure SetCount(const NewCount: Integer); override;

    { ABitArray                                                                }
    function  GetBit(const Idx: Integer): Boolean; override;
    procedure SetBit(const Idx: Integer; const Value: Boolean); override;
    function  GetRangeL(const Idx: Integer): LongWord; override;
    procedure SetRangeL(const Idx: Integer; const Value: LongWord); override;

  public
    { ABitArray                                                                }
    procedure Fill(const LoIdx, HiIdx: Integer; const Value: Boolean); override;
    function  IsRange(const LoIdx, HiIdx: Integer; const Value: Boolean): Boolean; override;
  end;



{                                                                              }
{ THashedAnsiStringArray                                                       }
{   AAnsiStringArray that maintains a hash lookup table of array values.       }
{                                                                              }
type
  THashedAnsiStringArray = class(TAnsiStringArray)
  protected
    FLookup        : Array of IntegerArray;
    FCaseSensitive : Boolean;

    function  LocateItemHashBuf(const ValueStrPtr: PAnsiChar;
              const ValueStrLen: Integer;
              var LookupList, LookupIdx: Integer): Boolean;
    function  LocateItemHash(const Value: AnsiString;
              var LookupList, LookupIdx: Integer): Boolean;
    procedure Rehash;

    procedure Init; override;
    procedure SetItem(const Idx: Integer; const Value: AnsiString); override;
    procedure SetData(const Data: AnsiStringArray); override;

  public
    constructor Create(const CaseSensitive: Boolean = True);

    procedure Assign(const Source: TObject); override;
    procedure Clear; override;

    procedure ExchangeItems(const Idx1, Idx2: Integer); override;
    procedure Delete(const Idx: Integer; const Count: Integer = 1); override;
    procedure Insert(const Idx: Integer; const Count: Integer = 1); override;
    function  AppendItem(const Value: AnsiString): Integer; override;

    function  PosNextBuf(const FindStrPtr: PAnsiChar; const FindStrLen: Integer;
              const PrevPos: Integer = -1): Integer;
    function  PosNext(const Find: AnsiString; const PrevPos: Integer = -1): Integer;
  end;



{                                                                              }
{ DICTIONARY BASE CLASSES                                                      }
{                                                                              }



{                                                                              }
{ ADictionary                                                                  }
{   Base class for a dictionary.                                               }
{                                                                              }
type
  TDictionaryDuplicatesAction = (ddError,    // raises an exception on duplicate keys
                                 ddAccept,   // allow duplicate keys
                                 ddIgnore);  // silently discard duplicates
  ADictionary = class(AType)
  protected
    procedure RaiseDictionaryError(const Msg: AnsiString;
              const ErrorClass: ExceptClass = nil);
    procedure RaiseKeyNotFoundError(const Key: AnsiString;
              const ErrorClass: ExceptClass = nil);
    procedure RaiseDuplicateKeyError(const Key: AnsiString;
              const ErrorClass: ExceptClass = nil);

    function  GetAddOnSet: Boolean; virtual; abstract;
    procedure SetAddOnSet(const AddOnSet: Boolean); virtual; abstract;
    function  GetDuplicatesAction: TDictionaryDuplicatesAction; virtual; abstract;
    procedure SetDuplicatesAction(const Value: TDictionaryDuplicatesAction); virtual; abstract;
    function  GetKeysCaseSensitive: Boolean; virtual; abstract;

  public
    { ADictionary                                                              }
    procedure Delete(const Key: AnsiString); virtual; abstract;
    function  HasKey(const Key: AnsiString): Boolean; virtual; abstract;
    procedure Rename(const Key, NewKey: AnsiString); virtual; abstract;

    function  Count: Integer; virtual; abstract;
    function  GetKeyByIndex(const Idx: Integer): AnsiString; virtual; abstract;
    procedure DeleteItemByIndex(const Idx: Integer); virtual; abstract;

    property  AddOnSet: Boolean read GetAddOnSet write SetAddOnSet;
    property  DuplicatesAction: TDictionaryDuplicatesAction
              read GetDuplicatesAction write SetDuplicatesAction;
    property  KeysCaseSensitive: Boolean read GetKeysCaseSensitive;
  end;
  EDictionary = class(EType);



{                                                                              }
{ ALongIntDictionary                                                           }
{   A Dictionary with LongInt values and String keys.                          }
{                                                                              }
type
  ALongIntDictionary = class(ADictionary)
  protected
    function  GetAsString: AnsiString; override;

    function  GetItem(const Key: AnsiString): LongInt; virtual;
    procedure SetItem(const Key: AnsiString; const Value: LongInt); virtual; abstract;

  public
    { AType                                                                    }
    procedure Assign(const Source: TObject); override;

    { ALongIntDictionary                                                      }
    property  Item[const Key: AnsiString]: LongInt read GetItem write SetItem; default;
    procedure Add(const Key: AnsiString; const Value: LongInt); virtual; abstract;

    function  GetItemByIndex(const Idx: Integer): LongInt; virtual; abstract;
    function  LocateItem(const Key: AnsiString; var Value: LongInt): Integer; virtual; abstract;
    function  LocateNext(const Key: AnsiString; const Idx: Integer;
              var Value: LongInt): Integer; virtual; abstract;
  end;
  ELongIntDictionary = class(EDictionary);



{                                                                              }
{ AIntegerDictionary                                                           }
{                                                                              }
type
  AIntegerDictionary = ALongIntDictionary;



{                                                                              }
{ ALongWordDictionary                                                          }
{   A Dictionary with LongWord values and String keys.                         }
{                                                                              }
type
  ALongWordDictionary = class(ADictionary)
  protected
    function  GetAsString: AnsiString; override;

    function  GetItem(const Key: AnsiString): LongWord; virtual;
    procedure SetItem(const Key: AnsiString; const Value: LongWord); virtual; abstract;

  public
    { AType                                                                    }
    procedure Assign(const Source: TObject); override;

    { ALongWordDictionary                                                      }
    property  Item[const Key: AnsiString]: LongWord read GetItem write SetItem; default;
    procedure Add(const Key: AnsiString; const Value: LongWord); virtual; abstract;

    function  GetItemByIndex(const Idx: Integer): LongWord; virtual; abstract;
    function  LocateItem(const Key: AnsiString; var Value: LongWord): Integer; virtual; abstract;
    function  LocateNext(const Key: AnsiString; const Idx: Integer;
              var Value: LongWord): Integer; virtual; abstract;
  end;
  ELongWordDictionary = class(EDictionary);



{                                                                              }
{ ACardinalDictionary                                                          }
{                                                                              }
type
  ACardinalDictionary = ALongWordDictionary;



{                                                                              }
{ AInt64Dictionary                                                             }
{   A Dictionary with Int64 values and String keys.                            }
{                                                                              }
type
  AInt64Dictionary = class(ADictionary)
  protected
    function  GetAsString: AnsiString; override;

    function  GetItem(const Key: AnsiString): Int64; virtual;
    procedure SetItem(const Key: AnsiString; const Value: Int64); virtual; abstract;

  public
    { AType                                                                    }
    procedure Assign(const Source: TObject); override;

    { AInt64Dictionary                                                      }
    property  Item[const Key: AnsiString]: Int64 read GetItem write SetItem; default;
    procedure Add(const Key: AnsiString; const Value: Int64); virtual; abstract;

    function  GetItemByIndex(const Idx: Integer): Int64; virtual; abstract;
    function  LocateItem(const Key: AnsiString; var Value: Int64): Integer; virtual; abstract;
    function  LocateNext(const Key: AnsiString; const Idx: Integer;
              var Value: Int64): Integer; virtual; abstract;
  end;
  EInt64Dictionary = class(EDictionary);



{                                                                              }
{ ASingleDictionary                                                            }
{   A Dictionary with Single values and String keys.                           }
{                                                                              }
type
  ASingleDictionary = class(ADictionary)
  protected
    function  GetAsString: AnsiString; override;

    function  GetItem(const Key: AnsiString): Single; virtual;
    procedure SetItem(const Key: AnsiString; const Value: Single); virtual; abstract;

  public
    { AType                                                                    }
    procedure Assign(const Source: TObject); override;

    { ASingleDictionary                                                      }
    property  Item[const Key: AnsiString]: Single read GetItem write SetItem; default;
    procedure Add(const Key: AnsiString; const Value: Single); virtual; abstract;

    function  GetItemByIndex(const Idx: Integer): Single; virtual; abstract;
    function  LocateItem(const Key: AnsiString; var Value: Single): Integer; virtual; abstract;
    function  LocateNext(const Key: AnsiString; const Idx: Integer;
              var Value: Single): Integer; virtual; abstract;
  end;
  ESingleDictionary = class(EDictionary);



{                                                                              }
{ ADoubleDictionary                                                            }
{   A Dictionary with Double values and String keys.                           }
{                                                                              }
type
  ADoubleDictionary = class(ADictionary)
  protected
    function  GetAsString: AnsiString; override;

    function  GetItem(const Key: AnsiString): Double; virtual;
    procedure SetItem(const Key: AnsiString; const Value: Double); virtual; abstract;

  public
    { AType                                                                    }
    procedure Assign(const Source: TObject); override;

    { ADoubleDictionary                                                      }
    property  Item[const Key: AnsiString]: Double read GetItem write SetItem; default;
    procedure Add(const Key: AnsiString; const Value: Double); virtual; abstract;

    function  GetItemByIndex(const Idx: Integer): Double; virtual; abstract;
    function  LocateItem(const Key: AnsiString; var Value: Double): Integer; virtual; abstract;
    function  LocateNext(const Key: AnsiString; const Idx: Integer;
              var Value: Double): Integer; virtual; abstract;
  end;
  EDoubleDictionary = class(EDictionary);



{                                                                              }
{ AExtendedDictionary                                                          }
{   A Dictionary with Extended values and String keys.                         }
{                                                                              }
type
  AExtendedDictionary = class(ADictionary)
  protected
    function  GetAsString: AnsiString; override;

    function  GetItem(const Key: AnsiString): Extended; virtual;
    procedure SetItem(const Key: AnsiString; const Value: Extended); virtual; abstract;

  public
    { AType                                                                    }
    procedure Assign(const Source: TObject); override;

    { AExtendedDictionary                                                      }
    property  Item[const Key: AnsiString]: Extended read GetItem write SetItem; default;
    procedure Add(const Key: AnsiString; const Value: Extended); virtual; abstract;

    function  GetItemByIndex(const Idx: Integer): Extended; virtual; abstract;
    function  LocateItem(const Key: AnsiString; var Value: Extended): Integer; virtual; abstract;
    function  LocateNext(const Key: AnsiString; const Idx: Integer;
              var Value: Extended): Integer; virtual; abstract;
  end;
  EExtendedDictionary = class(EDictionary);



{                                                                              }
{ APointerDictionary                                                           }
{   A Dictionary with Pointer values and String keys.                          }
{                                                                              }
type
  APointerDictionary = class(ADictionary)
  protected
    function  GetAsString: AnsiString; override;

    function  GetItem(const Key: AnsiString): Pointer; virtual;
    procedure SetItem(const Key: AnsiString; const Value: Pointer); virtual; abstract;

  public
    { AType                                                                    }
    procedure Assign(const Source: TObject); override;

    { APointerDictionary                                                      }
    property  Item[const Key: AnsiString]: Pointer read GetItem write SetItem; default;
    procedure Add(const Key: AnsiString; const Value: Pointer); virtual; abstract;

    function  GetItemByIndex(const Idx: Integer): Pointer; virtual; abstract;
    function  LocateItem(const Key: AnsiString; var Value: Pointer): Integer; virtual; abstract;
    function  LocateNext(const Key: AnsiString; const Idx: Integer;
              var Value: Pointer): Integer; virtual; abstract;
  end;
  EPointerDictionary = class(EDictionary);



{                                                                              }
{ AAnsiStringDictionary                                                        }
{   A Dictionary with AnsiString values and String keys.                       }
{                                                                              }
type
  AAnsiStringDictionary = class(ADictionary)
  protected
    function  GetAsString: AnsiString; override;

    function  GetItem(const Key: AnsiString): AnsiString; virtual;
    procedure SetItem(const Key: AnsiString; const Value: AnsiString); virtual; abstract;

  public
    { AType                                                                    }
    procedure Assign(const Source: TObject); override;

    { AAnsiStringDictionary                                                      }
    property  Item[const Key: AnsiString]: AnsiString read GetItem write SetItem; default;
    procedure Add(const Key: AnsiString; const Value: AnsiString); virtual; abstract;

    function  GetItemByIndex(const Idx: Integer): AnsiString; virtual; abstract;
    function  LocateItem(const Key: AnsiString; var Value: AnsiString): Integer; virtual; abstract;
    function  LocateNext(const Key: AnsiString; const Idx: Integer;
              var Value: AnsiString): Integer; virtual; abstract;

    function  GetItemLength(const Key: AnsiString): Integer; virtual;
    function  GetTotalLength: Int64; virtual;
  end;
  EAnsiStringDictionary = class(EDictionary);



{                                                                              }
{ AWideStringDictionary                                                        }
{   A Dictionary with WideString values and String keys.                       }
{                                                                              }
type
  AWideStringDictionary = class(ADictionary)
  protected
    function  GetAsString: AnsiString; override;

    function  GetItem(const Key: AnsiString): WideString; virtual;
    procedure SetItem(const Key: AnsiString; const Value: WideString); virtual; abstract;

  public
    { AType                                                                    }
    procedure Assign(const Source: TObject); override;

    { AWideStringDictionary                                                      }
    property  Item[const Key: AnsiString]: WideString read GetItem write SetItem; default;
    procedure Add(const Key: AnsiString; const Value: WideString); virtual; abstract;

    function  GetItemByIndex(const Idx: Integer): WideString; virtual; abstract;
    function  LocateItem(const Key: AnsiString; var Value: WideString): Integer; virtual; abstract;
    function  LocateNext(const Key: AnsiString; const Idx: Integer;
              var Value: WideString): Integer; virtual; abstract;

    function  GetItemLength(const Key: AnsiString): Integer; virtual;
    function  GetTotalLength: Int64; virtual;
  end;
  EWideStringDictionary = class(EDictionary);






{                                                                              }
{ AStringDictionary                                                            }
{                                                                              }
type
  {$IFDEF CharIsWide}
  AStringDictionary = AWideStringDictionary;
  {$ELSE}
  AStringDictionary = AAnsiStringDictionary;
  {$ENDIF}



{                                                                              }
{ AObjectDictionary                                                            }
{                                                                              }
type
  AObjectDictionary = class(ADictionary)
  protected
    function  GetItem(const Key: AnsiString): TObject; virtual;
    procedure SetItem(const Key: AnsiString; const Value: TObject); virtual; abstract;
    function  GetIsItemOwner: Boolean; virtual; abstract;
    procedure SetIsItemOwner(const IsItemOwner: Boolean); virtual; abstract;

  public
    { AType                                                                    }
    function  GetAsString: AnsiString; override;
    procedure Clear; override;
    procedure Assign(const Source: TObject); overload; override;

    { AObjectDictionary                                                        }
    procedure Add(const Key: AnsiString; const Value: TObject); virtual; abstract;
    property  Item[const Key: AnsiString]: TObject read GetItem write SetItem; default;

    function  GetItemByIndex(const Idx: Integer): TObject; virtual; abstract;
    function  LocateItem(const Key: AnsiString; var Value: TObject): Integer; virtual; abstract;
    function  LocateNext(const Key: AnsiString; const Idx: Integer;
              var Value: TObject): Integer; virtual; abstract;

    property  IsItemOwner: Boolean read GetIsItemOwner write SetIsItemOwner;
    function  ReleaseItem(const Key: AnsiString): TObject; virtual; abstract;
    procedure ReleaseItems; virtual; abstract;
    procedure FreeItems; virtual; abstract;
  end;
  EObjectDictionary = class(EDictionary);



{                                                                              }
{ AInterfaceDictionary                                                         }
{   A Dictionary with Interface values and String keys.                        }
{                                                                              }
type
  AInterfaceDictionary = class(ADictionary)
  protected
    function  GetAsString: AnsiString; override;

    function  GetItem(const Key: AnsiString): IInterface; virtual;
    procedure SetItem(const Key: AnsiString; const Value: IInterface); virtual; abstract;

  public
    { AType                                                                    }
    procedure Assign(const Source: TObject); override;

    { AInterfaceDictionary                                                      }
    property  Item[const Key: AnsiString]: IInterface read GetItem write SetItem; default;
    procedure Add(const Key: AnsiString; const Value: IInterface); virtual; abstract;

    function  GetItemByIndex(const Idx: Integer): IInterface; virtual; abstract;
    function  LocateItem(const Key: AnsiString; var Value: IInterface): Integer; virtual; abstract;
    function  LocateNext(const Key: AnsiString; const Idx: Integer;
              var Value: IInterface): Integer; virtual; abstract;
  end;
  EInterfaceDictionary = class(EDictionary);






{                                                                              }
{ DICTIONARY IMPLEMENTATIONS                                                   }
{                                                                              }



{                                                                              }
{ TLongIntDictionary                                                           }
{   Implements ALongIntDictionary using arrays.                                }
{   A 'chained-hash' lookup table is used for quick access.                    }
{                                                                              }
type
  TGeneralLongIntDictionary = class(ALongIntDictionary)
  protected
    FKeys             : AAnsiStringArray;
    FValues           : ALongIntArray;
    FLookup           : Array of IntegerArray;
    FHashSize         : Integer;
    FCaseSensitive    : Boolean;
    FAddOnSet         : Boolean;
    FDuplicatesAction : TDictionaryDuplicatesAction;

    function  LocateKey(const Key: AnsiString; var LookupIdx: Integer;
              const ErrorIfNotFound: Boolean): Integer; virtual;
    procedure DeleteByIndex(const Idx: Integer; const Hash: Integer = -1);
    procedure Rehash;
    function  GetHashTableSize: Integer;
    procedure RaiseIndexError;

    { ADictionary                                                              }
    function  GetKeysCaseSensitive: Boolean; override;
    function  GetAddOnSet: Boolean; override;
    procedure SetAddOnSet(const AddOnSet: Boolean); override;
    function  GetDuplicatesAction: TDictionaryDuplicatesAction; override;
    procedure SetDuplicatesAction(const DuplicatesAction: TDictionaryDuplicatesAction); override;

    { ALongIntDictionary                                                    }
    procedure SetItem(const Key: AnsiString; const Value: LongInt); override;

  public
    { TGeneralLongIntDictionary                                               }
    constructor Create;
    constructor CreateEx(const Keys: AAnsiStringArray = nil;
                const Values: ALongIntArray = nil;
                const KeysCaseSensitive: Boolean = True;
                const AddOnSet: Boolean = True;
                const DuplicatesAction: TDictionaryDuplicatesAction = ddAccept);
    destructor Destroy; override;

    property  Keys: AAnsiStringArray read FKeys;
    property  Values: ALongIntArray read FValues;
    property  HashTableSize: Integer read GetHashTableSize;

    { AType                                                                    }
    procedure Clear; override;

    { ADictionary                                                              }
    procedure Delete(const Key: AnsiString); override;
    function  HasKey(const Key: AnsiString): Boolean; override;
    procedure Rename(const Key: AnsiString; const NewKey: AnsiString); override;
    function  Count: Integer; override;
    function  GetKeyByIndex(const Idx: Integer): AnsiString; override;
    procedure DeleteItemByIndex(const Idx: Integer); override;

    { ALongIntDictionary                                                    }
    procedure Add(const Key: AnsiString; const Value: LongInt); override;
    function  GetItemByIndex(const Idx: Integer): LongInt; override;
    procedure SetItemByIndex(const Idx: Integer; const Value: LongInt);
    function  LocateItem(const Key: AnsiString; var Value: LongInt): Integer; override;
    function  LocateNext(const Key: AnsiString; const Idx: Integer;
              var Value: LongInt): Integer; override;
  end;

  TLongIntDictionary = class(TGeneralLongIntDictionary)
  protected
    function  GetItem(const Key: AnsiString): LongInt; override;
    function  LocateKey(const Key: AnsiString; var LookupIdx: Integer;
              const ErrorIfNotFound: Boolean): Integer; override;

  public
    constructor CreateEx(const Keys: TAnsiStringArray = nil;
                const Values: TLongIntArray = nil;
                const KeysCaseSensitive: Boolean = True;
                const AddOnSet: Boolean = True;
                const DuplicatesAction: TDictionaryDuplicatesAction = ddAccept);

    function  LocateItem(const Key: AnsiString; var Value: LongInt): Integer; override;
  end;



{                                                                              }
{ TIntegerDictionary                                                           }
{                                                                              }
type
  TGeneralIntegerDictionary = TGeneralLongIntDictionary;
  TIntegerDictionary = TLongIntDictionary;



{                                                                              }
{ TLongWordDictionary                                                          }
{   Implements ALongWordDictionary using arrays.                               }
{   A 'chained-hash' lookup table is used for quick access.                    }
{                                                                              }
type
  TGeneralLongWordDictionary = class(ALongWordDictionary)
  protected
    FKeys             : AAnsiStringArray;
    FValues           : ALongWordArray;
    FLookup           : Array of IntegerArray;
    FHashSize         : Integer;
    FCaseSensitive    : Boolean;
    FAddOnSet         : Boolean;
    FDuplicatesAction : TDictionaryDuplicatesAction;

    function  LocateKey(const Key: AnsiString; var LookupIdx: Integer;
              const ErrorIfNotFound: Boolean): Integer; virtual;
    procedure DeleteByIndex(const Idx: Integer; const Hash: Integer = -1);
    procedure Rehash;
    function  GetHashTableSize: Integer;
    procedure RaiseIndexError;

    { ADictionary                                                              }
    function  GetKeysCaseSensitive: Boolean; override;
    function  GetAddOnSet: Boolean; override;
    procedure SetAddOnSet(const AddOnSet: Boolean); override;
    function  GetDuplicatesAction: TDictionaryDuplicatesAction; override;
    procedure SetDuplicatesAction(const DuplicatesAction: TDictionaryDuplicatesAction); override;

    { ALongWordDictionary                                                    }
    procedure SetItem(const Key: AnsiString; const Value: LongWord); override;

  public
    { TGeneralLongWordDictionary                                               }
    constructor Create;
    constructor CreateEx(const Keys: AAnsiStringArray = nil;
                const Values: ALongWordArray = nil;
                const KeysCaseSensitive: Boolean = True;
                const AddOnSet: Boolean = True;
                const DuplicatesAction: TDictionaryDuplicatesAction = ddAccept);
    destructor Destroy; override;

    property  Keys: AAnsiStringArray read FKeys;
    property  Values: ALongWordArray read FValues;
    property  HashTableSize: Integer read GetHashTableSize;

    { AType                                                                    }
    procedure Clear; override;

    { ADictionary                                                              }
    procedure Delete(const Key: AnsiString); override;
    function  HasKey(const Key: AnsiString): Boolean; override;
    procedure Rename(const Key: AnsiString; const NewKey: AnsiString); override;
    function  Count: Integer; override;
    function  GetKeyByIndex(const Idx: Integer): AnsiString; override;
    procedure DeleteItemByIndex(const Idx: Integer); override;

    { ALongWordDictionary                                                    }
    procedure Add(const Key: AnsiString; const Value: LongWord); override;
    function  GetItemByIndex(const Idx: Integer): LongWord; override;
    procedure SetItemByIndex(const Idx: Integer; const Value: LongWord);
    function  LocateItem(const Key: AnsiString; var Value: LongWord): Integer; override;
    function  LocateNext(const Key: AnsiString; const Idx: Integer;
              var Value: LongWord): Integer; override;
  end;

  TLongWordDictionary = class(TGeneralLongWordDictionary)
  protected
    function  GetItem(const Key: AnsiString): LongWord; override;
    function  LocateKey(const Key: AnsiString; var LookupIdx: Integer;
              const ErrorIfNotFound: Boolean): Integer; override;

  public
    constructor CreateEx(const Keys: TAnsiStringArray = nil;
                const Values: TLongWordArray = nil;
                const KeysCaseSensitive: Boolean = True;
                const AddOnSet: Boolean = True;
                const DuplicatesAction: TDictionaryDuplicatesAction = ddAccept);

    function  LocateItem(const Key: AnsiString; var Value: LongWord): Integer; override;
  end;



{                                                                              }
{ TCardinalDictionary                                                          }
{                                                                              }
type
  TGeneralCardinalDictionary = TGeneralLongWordDictionary;
  TCardinalDictionary = TLongWordDictionary;



{                                                                              }
{ TInt64Dictionary                                                             }
{   Implements AInt64Dictionary using arrays.                                  }
{   A 'chained-hash' lookup table is used for quick access.                    }
{                                                                              }
type
  TGeneralInt64Dictionary = class(AInt64Dictionary)
  protected
    FKeys             : AAnsiStringArray;
    FValues           : AInt64Array;
    FLookup           : Array of IntegerArray;
    FHashSize         : Integer;
    FCaseSensitive    : Boolean;
    FAddOnSet         : Boolean;
    FDuplicatesAction : TDictionaryDuplicatesAction;

    function  LocateKey(const Key: AnsiString; var LookupIdx: Integer;
              const ErrorIfNotFound: Boolean): Integer; virtual;
    procedure DeleteByIndex(const Idx: Integer; const Hash: Integer = -1);
    procedure Rehash;
    function  GetHashTableSize: Integer;
    procedure RaiseIndexError;

    { ADictionary                                                              }
    function  GetKeysCaseSensitive: Boolean; override;
    function  GetAddOnSet: Boolean; override;
    procedure SetAddOnSet(const AddOnSet: Boolean); override;
    function  GetDuplicatesAction: TDictionaryDuplicatesAction; override;
    procedure SetDuplicatesAction(const DuplicatesAction: TDictionaryDuplicatesAction); override;

    { AInt64Dictionary                                                    }
    procedure SetItem(const Key: AnsiString; const Value: Int64); override;

  public
    { TGeneralInt64Dictionary                                               }
    constructor Create;
    constructor CreateEx(const Keys: AAnsiStringArray = nil;
                const Values: AInt64Array = nil;
                const KeysCaseSensitive: Boolean = True;
                const AddOnSet: Boolean = True;
                const DuplicatesAction: TDictionaryDuplicatesAction = ddAccept);
    destructor Destroy; override;

    property  Keys: AAnsiStringArray read FKeys;
    property  Values: AInt64Array read FValues;
    property  HashTableSize: Integer read GetHashTableSize;

    { AType                                                                    }
    procedure Clear; override;

    { ADictionary                                                              }
    procedure Delete(const Key: AnsiString); override;
    function  HasKey(const Key: AnsiString): Boolean; override;
    procedure Rename(const Key: AnsiString; const NewKey: AnsiString); override;
    function  Count: Integer; override;
    function  GetKeyByIndex(const Idx: Integer): AnsiString; override;
    procedure DeleteItemByIndex(const Idx: Integer); override;

    { AInt64Dictionary                                                    }
    procedure Add(const Key: AnsiString; const Value: Int64); override;
    function  GetItemByIndex(const Idx: Integer): Int64; override;
    procedure SetItemByIndex(const Idx: Integer; const Value: Int64);
    function  LocateItem(const Key: AnsiString; var Value: Int64): Integer; override;
    function  LocateNext(const Key: AnsiString; const Idx: Integer;
              var Value: Int64): Integer; override;
  end;

  TInt64Dictionary = class(TGeneralInt64Dictionary)
  protected
    function  GetItem(const Key: AnsiString): Int64; override;
    function  LocateKey(const Key: AnsiString; var LookupIdx: Integer;
              const ErrorIfNotFound: Boolean): Integer; override;

  public
    constructor CreateEx(const Keys: TAnsiStringArray = nil;
                const Values: TInt64Array = nil;
                const KeysCaseSensitive: Boolean = True;
                const AddOnSet: Boolean = True;
                const DuplicatesAction: TDictionaryDuplicatesAction = ddAccept);

    function  LocateItem(const Key: AnsiString; var Value: Int64): Integer; override;
  end;



{                                                                              }
{ TSingleDictionary                                                            }
{   Implements ASingleDictionary using arrays.                                 }
{   A 'chained-hash' lookup table is used for quick access.                    }
{                                                                              }
type
  TGeneralSingleDictionary = class(ASingleDictionary)
  protected
    FKeys             : AAnsiStringArray;
    FValues           : ASingleArray;
    FLookup           : Array of IntegerArray;
    FHashSize         : Integer;
    FCaseSensitive    : Boolean;
    FAddOnSet         : Boolean;
    FDuplicatesAction : TDictionaryDuplicatesAction;

    function  LocateKey(const Key: AnsiString; var LookupIdx: Integer;
              const ErrorIfNotFound: Boolean): Integer; virtual;
    procedure DeleteByIndex(const Idx: Integer; const Hash: Integer = -1);
    procedure Rehash;
    function  GetHashTableSize: Integer;
    procedure RaiseIndexError;

    { ADictionary                                                              }
    function  GetKeysCaseSensitive: Boolean; override;
    function  GetAddOnSet: Boolean; override;
    procedure SetAddOnSet(const AddOnSet: Boolean); override;
    function  GetDuplicatesAction: TDictionaryDuplicatesAction; override;
    procedure SetDuplicatesAction(const DuplicatesAction: TDictionaryDuplicatesAction); override;

    { ASingleDictionary                                                    }
    procedure SetItem(const Key: AnsiString; const Value: Single); override;

  public
    { TGeneralSingleDictionary                                               }
    constructor Create;
    constructor CreateEx(const Keys: AAnsiStringArray = nil;
                const Values: ASingleArray = nil;
                const KeysCaseSensitive: Boolean = True;
                const AddOnSet: Boolean = True;
                const DuplicatesAction: TDictionaryDuplicatesAction = ddAccept);
    destructor Destroy; override;

    property  Keys: AAnsiStringArray read FKeys;
    property  Values: ASingleArray read FValues;
    property  HashTableSize: Integer read GetHashTableSize;

    { AType                                                                    }
    procedure Clear; override;

    { ADictionary                                                              }
    procedure Delete(const Key: AnsiString); override;
    function  HasKey(const Key: AnsiString): Boolean; override;
    procedure Rename(const Key: AnsiString; const NewKey: AnsiString); override;
    function  Count: Integer; override;
    function  GetKeyByIndex(const Idx: Integer): AnsiString; override;
    procedure DeleteItemByIndex(const Idx: Integer); override;

    { ASingleDictionary                                                    }
    procedure Add(const Key: AnsiString; const Value: Single); override;
    function  GetItemByIndex(const Idx: Integer): Single; override;
    procedure SetItemByIndex(const Idx: Integer; const Value: Single);
    function  LocateItem(const Key: AnsiString; var Value: Single): Integer; override;
    function  LocateNext(const Key: AnsiString; const Idx: Integer;
              var Value: Single): Integer; override;
  end;

  TSingleDictionary = class(TGeneralSingleDictionary)
  protected
    function  GetItem(const Key: AnsiString): Single; override;
    function  LocateKey(const Key: AnsiString; var LookupIdx: Integer;
              const ErrorIfNotFound: Boolean): Integer; override;

  public
    constructor CreateEx(const Keys: TAnsiStringArray = nil;
                const Values: TSingleArray = nil;
                const KeysCaseSensitive: Boolean = True;
                const AddOnSet: Boolean = True;
                const DuplicatesAction: TDictionaryDuplicatesAction = ddAccept);

    function  LocateItem(const Key: AnsiString; var Value: Single): Integer; override;
  end;



{                                                                              }
{ TDoubleDictionary                                                            }
{   Implements ADoubleDictionary using arrays.                                 }
{   A 'chained-hash' lookup table is used for quick access.                    }
{                                                                              }
type
  TGeneralDoubleDictionary = class(ADoubleDictionary)
  protected
    FKeys             : AAnsiStringArray;
    FValues           : ADoubleArray;
    FLookup           : Array of IntegerArray;
    FHashSize         : Integer;
    FCaseSensitive    : Boolean;
    FAddOnSet         : Boolean;
    FDuplicatesAction : TDictionaryDuplicatesAction;

    function  LocateKey(const Key: AnsiString; var LookupIdx: Integer;
              const ErrorIfNotFound: Boolean): Integer; virtual;
    procedure DeleteByIndex(const Idx: Integer; const Hash: Integer = -1);
    procedure Rehash;
    function  GetHashTableSize: Integer;
    procedure RaiseIndexError;

    { ADictionary                                                              }
    function  GetKeysCaseSensitive: Boolean; override;
    function  GetAddOnSet: Boolean; override;
    procedure SetAddOnSet(const AddOnSet: Boolean); override;
    function  GetDuplicatesAction: TDictionaryDuplicatesAction; override;
    procedure SetDuplicatesAction(const DuplicatesAction: TDictionaryDuplicatesAction); override;

    { ADoubleDictionary                                                    }
    procedure SetItem(const Key: AnsiString; const Value: Double); override;

  public
    { TGeneralDoubleDictionary                                               }
    constructor Create;
    constructor CreateEx(const Keys: AAnsiStringArray = nil;
                const Values: ADoubleArray = nil;
                const KeysCaseSensitive: Boolean = True;
                const AddOnSet: Boolean = True;
                const DuplicatesAction: TDictionaryDuplicatesAction = ddAccept);
    destructor Destroy; override;

    property  Keys: AAnsiStringArray read FKeys;
    property  Values: ADoubleArray read FValues;
    property  HashTableSize: Integer read GetHashTableSize;

    { AType                                                                    }
    procedure Clear; override;

    { ADictionary                                                              }
    procedure Delete(const Key: AnsiString); override;
    function  HasKey(const Key: AnsiString): Boolean; override;
    procedure Rename(const Key: AnsiString; const NewKey: AnsiString); override;
    function  Count: Integer; override;
    function  GetKeyByIndex(const Idx: Integer): AnsiString; override;
    procedure DeleteItemByIndex(const Idx: Integer); override;

    { ADoubleDictionary                                                    }
    procedure Add(const Key: AnsiString; const Value: Double); override;
    function  GetItemByIndex(const Idx: Integer): Double; override;
    procedure SetItemByIndex(const Idx: Integer; const Value: Double);
    function  LocateItem(const Key: AnsiString; var Value: Double): Integer; override;
    function  LocateNext(const Key: AnsiString; const Idx: Integer;
              var Value: Double): Integer; override;
  end;

  TDoubleDictionary = class(TGeneralDoubleDictionary)
  protected
    function  GetItem(const Key: AnsiString): Double; override;
    function  LocateKey(const Key: AnsiString; var LookupIdx: Integer;
              const ErrorIfNotFound: Boolean): Integer; override;

  public
    constructor CreateEx(const Keys: TAnsiStringArray = nil;
                const Values: TDoubleArray = nil;
                const KeysCaseSensitive: Boolean = True;
                const AddOnSet: Boolean = True;
                const DuplicatesAction: TDictionaryDuplicatesAction = ddAccept);

    function  LocateItem(const Key: AnsiString; var Value: Double): Integer; override;
  end;



{                                                                              }
{ TExtendedDictionary                                                          }
{   Implements AExtendedDictionary using arrays.                               }
{   A 'chained-hash' lookup table is used for quick access.                    }
{                                                                              }
type
  TGeneralExtendedDictionary = class(AExtendedDictionary)
  protected
    FKeys             : AAnsiStringArray;
    FValues           : AExtendedArray;
    FLookup           : Array of IntegerArray;
    FHashSize         : Integer;
    FCaseSensitive    : Boolean;
    FAddOnSet         : Boolean;
    FDuplicatesAction : TDictionaryDuplicatesAction;

    function  LocateKey(const Key: AnsiString; var LookupIdx: Integer;
              const ErrorIfNotFound: Boolean): Integer; virtual;
    procedure DeleteByIndex(const Idx: Integer; const Hash: Integer = -1);
    procedure Rehash;
    function  GetHashTableSize: Integer;
    procedure RaiseIndexError;

    { ADictionary                                                              }
    function  GetKeysCaseSensitive: Boolean; override;
    function  GetAddOnSet: Boolean; override;
    procedure SetAddOnSet(const AddOnSet: Boolean); override;
    function  GetDuplicatesAction: TDictionaryDuplicatesAction; override;
    procedure SetDuplicatesAction(const DuplicatesAction: TDictionaryDuplicatesAction); override;

    { AExtendedDictionary                                                    }
    procedure SetItem(const Key: AnsiString; const Value: Extended); override;

  public
    { TGeneralExtendedDictionary                                               }
    constructor Create;
    constructor CreateEx(const Keys: AAnsiStringArray = nil;
                const Values: AExtendedArray = nil;
                const KeysCaseSensitive: Boolean = True;
                const AddOnSet: Boolean = True;
                const DuplicatesAction: TDictionaryDuplicatesAction = ddAccept);
    destructor Destroy; override;

    property  Keys: AAnsiStringArray read FKeys;
    property  Values: AExtendedArray read FValues;
    property  HashTableSize: Integer read GetHashTableSize;

    { AType                                                                    }
    procedure Clear; override;

    { ADictionary                                                              }
    procedure Delete(const Key: AnsiString); override;
    function  HasKey(const Key: AnsiString): Boolean; override;
    procedure Rename(const Key: AnsiString; const NewKey: AnsiString); override;
    function  Count: Integer; override;
    function  GetKeyByIndex(const Idx: Integer): AnsiString; override;
    procedure DeleteItemByIndex(const Idx: Integer); override;

    { AExtendedDictionary                                                    }
    procedure Add(const Key: AnsiString; const Value: Extended); override;
    function  GetItemByIndex(const Idx: Integer): Extended; override;
    procedure SetItemByIndex(const Idx: Integer; const Value: Extended);
    function  LocateItem(const Key: AnsiString; var Value: Extended): Integer; override;
    function  LocateNext(const Key: AnsiString; const Idx: Integer;
              var Value: Extended): Integer; override;
  end;

  TExtendedDictionary = class(TGeneralExtendedDictionary)
  protected
    function  GetItem(const Key: AnsiString): Extended; override;
    function  LocateKey(const Key: AnsiString; var LookupIdx: Integer;
              const ErrorIfNotFound: Boolean): Integer; override;

  public
    constructor CreateEx(const Keys: TAnsiStringArray = nil;
                const Values: TExtendedArray = nil;
                const KeysCaseSensitive: Boolean = True;
                const AddOnSet: Boolean = True;
                const DuplicatesAction: TDictionaryDuplicatesAction = ddAccept);

    function  LocateItem(const Key: AnsiString; var Value: Extended): Integer; override;
  end;



{                                                                              }
{ TPointerDictionary                                                           }
{   Implements APointerDictionary using arrays.                                }
{   A 'chained-hash' lookup table is used for quick access.                    }
{                                                                              }
type
  TGeneralPointerDictionary = class(APointerDictionary)
  protected
    FKeys             : AAnsiStringArray;
    FValues           : APointerArray;
    FLookup           : Array of IntegerArray;
    FHashSize         : Integer;
    FCaseSensitive    : Boolean;
    FAddOnSet         : Boolean;
    FDuplicatesAction : TDictionaryDuplicatesAction;

    function  LocateKey(const Key: AnsiString; var LookupIdx: Integer;
              const ErrorIfNotFound: Boolean): Integer; virtual;
    procedure DeleteByIndex(const Idx: Integer; const Hash: Integer = -1);
    procedure Rehash;
    function  GetHashTableSize: Integer;
    procedure RaiseIndexError;

    { ADictionary                                                              }
    function  GetKeysCaseSensitive: Boolean; override;
    function  GetAddOnSet: Boolean; override;
    procedure SetAddOnSet(const AddOnSet: Boolean); override;
    function  GetDuplicatesAction: TDictionaryDuplicatesAction; override;
    procedure SetDuplicatesAction(const DuplicatesAction: TDictionaryDuplicatesAction); override;

    { APointerDictionary                                                    }
    procedure SetItem(const Key: AnsiString; const Value: Pointer); override;

  public
    { TGeneralPointerDictionary                                               }
    constructor Create;
    constructor CreateEx(const Keys: AAnsiStringArray = nil;
                const Values: APointerArray = nil;
                const KeysCaseSensitive: Boolean = True;
                const AddOnSet: Boolean = True;
                const DuplicatesAction: TDictionaryDuplicatesAction = ddAccept);
    destructor Destroy; override;

    property  Keys: AAnsiStringArray read FKeys;
    property  Values: APointerArray read FValues;
    property  HashTableSize: Integer read GetHashTableSize;

    { AType                                                                    }
    procedure Clear; override;

    { ADictionary                                                              }
    procedure Delete(const Key: AnsiString); override;
    function  HasKey(const Key: AnsiString): Boolean; override;
    procedure Rename(const Key: AnsiString; const NewKey: AnsiString); override;
    function  Count: Integer; override;
    function  GetKeyByIndex(const Idx: Integer): AnsiString; override;
    procedure DeleteItemByIndex(const Idx: Integer); override;

    { APointerDictionary                                                    }
    procedure Add(const Key: AnsiString; const Value: Pointer); override;
    function  GetItemByIndex(const Idx: Integer): Pointer; override;
    procedure SetItemByIndex(const Idx: Integer; const Value: Pointer);
    function  LocateItem(const Key: AnsiString; var Value: Pointer): Integer; override;
    function  LocateNext(const Key: AnsiString; const Idx: Integer;
              var Value: Pointer): Integer; override;
  end;

  TPointerDictionary = class(TGeneralPointerDictionary)
  protected
    function  GetItem(const Key: AnsiString): Pointer; override;
    function  LocateKey(const Key: AnsiString; var LookupIdx: Integer;
              const ErrorIfNotFound: Boolean): Integer; override;

  public
    constructor CreateEx(const Keys: TAnsiStringArray = nil;
                const Values: TPointerArray = nil;
                const KeysCaseSensitive: Boolean = True;
                const AddOnSet: Boolean = True;
                const DuplicatesAction: TDictionaryDuplicatesAction = ddAccept);

    function  LocateItem(const Key: AnsiString; var Value: Pointer): Integer; override;
  end;



{                                                                              }
{ TAnsiStringDictionary                                                        }
{   Implements AAnsiStringDictionary using arrays.                             }
{   A 'chained-hash' lookup table is used for quick access.                    }
{                                                                              }
type
  TGeneralAnsiStringDictionary = class(AAnsiStringDictionary)
  protected
    FKeys             : AAnsiStringArray;
    FValues           : AAnsiStringArray;
    FLookup           : Array of IntegerArray;
    FHashSize         : Integer;
    FCaseSensitive    : Boolean;
    FAddOnSet         : Boolean;
    FDuplicatesAction : TDictionaryDuplicatesAction;

    function  LocateKey(const Key: AnsiString; var LookupIdx: Integer;
              const ErrorIfNotFound: Boolean): Integer; virtual;
    procedure DeleteByIndex(const Idx: Integer; const Hash: Integer = -1);
    procedure Rehash;
    function  GetHashTableSize: Integer;
    procedure RaiseIndexError;

    { ADictionary                                                              }
    function  GetKeysCaseSensitive: Boolean; override;
    function  GetAddOnSet: Boolean; override;
    procedure SetAddOnSet(const AddOnSet: Boolean); override;
    function  GetDuplicatesAction: TDictionaryDuplicatesAction; override;
    procedure SetDuplicatesAction(const DuplicatesAction: TDictionaryDuplicatesAction); override;

    { AAnsiStringDictionary                                                    }
    procedure SetItem(const Key: AnsiString; const Value: AnsiString); override;

  public
    { TGeneralAnsiStringDictionary                                               }
    constructor Create;
    constructor CreateEx(const Keys: AAnsiStringArray = nil;
                const Values: AAnsiStringArray = nil;
                const KeysCaseSensitive: Boolean = True;
                const AddOnSet: Boolean = True;
                const DuplicatesAction: TDictionaryDuplicatesAction = ddAccept);
    destructor Destroy; override;

    property  Keys: AAnsiStringArray read FKeys;
    property  Values: AAnsiStringArray read FValues;
    property  HashTableSize: Integer read GetHashTableSize;

    { AType                                                                    }
    procedure Clear; override;

    { ADictionary                                                              }
    procedure Delete(const Key: AnsiString); override;
    function  HasKey(const Key: AnsiString): Boolean; override;
    procedure Rename(const Key: AnsiString; const NewKey: AnsiString); override;
    function  Count: Integer; override;
    function  GetKeyByIndex(const Idx: Integer): AnsiString; override;
    procedure DeleteItemByIndex(const Idx: Integer); override;

    { AAnsiStringDictionary                                                    }
    procedure Add(const Key: AnsiString; const Value: AnsiString); override;
    function  GetItemByIndex(const Idx: Integer): AnsiString; override;
    procedure SetItemByIndex(const Idx: Integer; const Value: AnsiString);
    function  LocateItem(const Key: AnsiString; var Value: AnsiString): Integer; override;
    function  LocateNext(const Key: AnsiString; const Idx: Integer;
              var Value: AnsiString): Integer; override;
  end;

  TAnsiStringDictionary = class(TGeneralAnsiStringDictionary)
  protected
    function  GetItem(const Key: AnsiString): AnsiString; override;
    function  LocateKey(const Key: AnsiString; var LookupIdx: Integer;
              const ErrorIfNotFound: Boolean): Integer; override;

  public
    constructor CreateEx(const Keys: TAnsiStringArray = nil;
                const Values: TAnsiStringArray = nil;
                const KeysCaseSensitive: Boolean = True;
                const AddOnSet: Boolean = True;
                const DuplicatesAction: TDictionaryDuplicatesAction = ddAccept);

    function  LocateItem(const Key: AnsiString; var Value: AnsiString): Integer; override;
  end;



{                                                                              }
{ TWideStringDictionary                                                        }
{   Implements AWideStringDictionary using arrays.                             }
{   A 'chained-hash' lookup table is used for quick access.                    }
{                                                                              }
type
  TGeneralWideStringDictionary = class(AWideStringDictionary)
  protected
    FKeys             : AAnsiStringArray;
    FValues           : AWideStringArray;
    FLookup           : Array of IntegerArray;
    FHashSize         : Integer;
    FCaseSensitive    : Boolean;
    FAddOnSet         : Boolean;
    FDuplicatesAction : TDictionaryDuplicatesAction;

    function  LocateKey(const Key: AnsiString; var LookupIdx: Integer;
              const ErrorIfNotFound: Boolean): Integer; virtual;
    procedure DeleteByIndex(const Idx: Integer; const Hash: Integer = -1);
    procedure Rehash;
    function  GetHashTableSize: Integer;
    procedure RaiseIndexError;

    { ADictionary                                                              }
    function  GetKeysCaseSensitive: Boolean; override;
    function  GetAddOnSet: Boolean; override;
    procedure SetAddOnSet(const AddOnSet: Boolean); override;
    function  GetDuplicatesAction: TDictionaryDuplicatesAction; override;
    procedure SetDuplicatesAction(const DuplicatesAction: TDictionaryDuplicatesAction); override;

    { AWideStringDictionary                                                    }
    procedure SetItem(const Key: AnsiString; const Value: WideString); override;

  public
    { TGeneralWideStringDictionary                                               }
    constructor Create;
    constructor CreateEx(const Keys: AAnsiStringArray = nil;
                const Values: AWideStringArray = nil;
                const KeysCaseSensitive: Boolean = True;
                const AddOnSet: Boolean = True;
                const DuplicatesAction: TDictionaryDuplicatesAction = ddAccept);
    destructor Destroy; override;

    property  Keys: AAnsiStringArray read FKeys;
    property  Values: AWideStringArray read FValues;
    property  HashTableSize: Integer read GetHashTableSize;

    { AType                                                                    }
    procedure Clear; override;

    { ADictionary                                                              }
    procedure Delete(const Key: AnsiString); override;
    function  HasKey(const Key: AnsiString): Boolean; override;
    procedure Rename(const Key: AnsiString; const NewKey: AnsiString); override;
    function  Count: Integer; override;
    function  GetKeyByIndex(const Idx: Integer): AnsiString; override;
    procedure DeleteItemByIndex(const Idx: Integer); override;

    { AWideStringDictionary                                                    }
    procedure Add(const Key: AnsiString; const Value: WideString); override;
    function  GetItemByIndex(const Idx: Integer): WideString; override;
    procedure SetItemByIndex(const Idx: Integer; const Value: WideString);
    function  LocateItem(const Key: AnsiString; var Value: WideString): Integer; override;
    function  LocateNext(const Key: AnsiString; const Idx: Integer;
              var Value: WideString): Integer; override;
  end;

  TWideStringDictionary = class(TGeneralWideStringDictionary)
  protected
    function  GetItem(const Key: AnsiString): WideString; override;
    function  LocateKey(const Key: AnsiString; var LookupIdx: Integer;
              const ErrorIfNotFound: Boolean): Integer; override;

  public
    constructor CreateEx(const Keys: TAnsiStringArray = nil;
                const Values: TWideStringArray = nil;
                const KeysCaseSensitive: Boolean = True;
                const AddOnSet: Boolean = True;
                const DuplicatesAction: TDictionaryDuplicatesAction = ddAccept);

    function  LocateItem(const Key: AnsiString; var Value: WideString): Integer; override;
  end;



{                                                                              }
{ TObjectDictionary                                                            }
{   Implements AObjectDictionary using arrays.                                 }
{   A 'chained-hash' lookup table is used for quick access.                    }
{                                                                              }
type
  TGeneralObjectDictionary = class(AObjectDictionary)
  protected
    FKeys             : AAnsiStringArray;
    FValues           : AObjectArray;
    FLookup           : Array of IntegerArray;
    FHashSize         : Integer;
    FCaseSensitive    : Boolean;
    FAddOnSet         : Boolean;
    FDuplicatesAction : TDictionaryDuplicatesAction;

    function  LocateKey(const Key: AnsiString; var LookupIdx: Integer;
              const ErrorIfNotFound: Boolean): Integer; virtual;
    procedure DeleteByIndex(const Idx: Integer; const Hash: Integer = -1);
    procedure Rehash;
    function  GetHashTableSize: Integer;
    procedure RaiseIndexError;

    { ADictionary                                                              }
    function  GetKeysCaseSensitive: Boolean; override;
    function  GetAddOnSet: Boolean; override;
    procedure SetAddOnSet(const AddOnSet: Boolean); override;
    function  GetDuplicatesAction: TDictionaryDuplicatesAction; override;
    procedure SetDuplicatesAction(const DuplicatesAction: TDictionaryDuplicatesAction); override;

    { AObjectDictionary                                                        }
    function  GetIsItemOwner: Boolean; override;
    procedure SetIsItemOwner(const IsItemOwner: Boolean); override;
    
    procedure SetItem(const Key: AnsiString; const Value: TObject); override;

  public
    { TGeneralObjectDictionary                                               }
    constructor Create;
    constructor CreateEx(const Keys: AAnsiStringArray = nil;
                const Values: AObjectArray = nil;
                const IsItemOwner: Boolean = False;
                const KeysCaseSensitive: Boolean = True;
                const AddOnSet: Boolean = True;
                const DuplicatesAction: TDictionaryDuplicatesAction = ddAccept);
    destructor Destroy; override;

    property  Keys: AAnsiStringArray read FKeys;
    property  Values: AObjectArray read FValues;
    property  HashTableSize: Integer read GetHashTableSize;

    { AType                                                                    }
    procedure Clear; override;

    { ADictionary                                                              }
    procedure Delete(const Key: AnsiString); override;
    function  HasKey(const Key: AnsiString): Boolean; override;
    procedure Rename(const Key: AnsiString; const NewKey: AnsiString); override;
    function  Count: Integer; override;
    function  GetKeyByIndex(const Idx: Integer): AnsiString; override;
    procedure DeleteItemByIndex(const Idx: Integer); override;

    { AObjectDictionary                                                        }
    procedure Add(const Key: AnsiString; const Value: TObject); override;
    function  GetItemByIndex(const Idx: Integer): TObject; override;
    procedure SetItemByIndex(const Idx: Integer; const Value: TObject);
    function  LocateItem(const Key: AnsiString; var Value: TObject): Integer; override;
    function  LocateNext(const Key: AnsiString; const Idx: Integer;
              var Value: TObject): Integer; override;

    function  ReleaseItem(const Key: AnsiString): TObject; override;
    procedure ReleaseItems; override;
    procedure FreeItems; override;
  end;

  TObjectDictionary = class(TGeneralObjectDictionary)
  protected
    function  GetItem(const Key: AnsiString): TObject; override;
    function  LocateKey(const Key: AnsiString; var LookupIdx: Integer;
              const ErrorIfNotFound: Boolean): Integer; override;

  public
    constructor CreateEx(const Keys: TAnsiStringArray = nil;
                const Values: TObjectArray = nil;
                const IsItemOwner: Boolean = False;
                const KeysCaseSensitive: Boolean = True;
                const AddOnSet: Boolean = True;
                const DuplicatesAction: TDictionaryDuplicatesAction = ddAccept);

    function  LocateItem(const Key: AnsiString; var Value: TObject): Integer; override;
  end;



{                                                                              }
{ TInterfaceDictionary                                                         }
{   Implements AInterfaceDictionary using arrays.                              }
{   A 'chained-hash' lookup table is used for quick access.                    }
{                                                                              }
type
  TGeneralInterfaceDictionary = class(AInterfaceDictionary)
  protected
    FKeys             : AAnsiStringArray;
    FValues           : AInterfaceArray;
    FLookup           : Array of IntegerArray;
    FHashSize         : Integer;
    FCaseSensitive    : Boolean;
    FAddOnSet         : Boolean;
    FDuplicatesAction : TDictionaryDuplicatesAction;

    function  LocateKey(const Key: AnsiString; var LookupIdx: Integer;
              const ErrorIfNotFound: Boolean): Integer; virtual;
    procedure DeleteByIndex(const Idx: Integer; const Hash: Integer = -1);
    procedure Rehash;
    function  GetHashTableSize: Integer;
    procedure RaiseIndexError;

    { ADictionary                                                              }
    function  GetKeysCaseSensitive: Boolean; override;
    function  GetAddOnSet: Boolean; override;
    procedure SetAddOnSet(const AddOnSet: Boolean); override;
    function  GetDuplicatesAction: TDictionaryDuplicatesAction; override;
    procedure SetDuplicatesAction(const DuplicatesAction: TDictionaryDuplicatesAction); override;

    { AInterfaceDictionary                                                    }
    procedure SetItem(const Key: AnsiString; const Value: IInterface); override;

  public
    { TGeneralInterfaceDictionary                                               }
    constructor Create;
    constructor CreateEx(const Keys: AAnsiStringArray = nil;
                const Values: AInterfaceArray = nil;
                const KeysCaseSensitive: Boolean = True;
                const AddOnSet: Boolean = True;
                const DuplicatesAction: TDictionaryDuplicatesAction = ddAccept);
    destructor Destroy; override;

    property  Keys: AAnsiStringArray read FKeys;
    property  Values: AInterfaceArray read FValues;
    property  HashTableSize: Integer read GetHashTableSize;

    { AType                                                                    }
    procedure Clear; override;

    { ADictionary                                                              }
    procedure Delete(const Key: AnsiString); override;
    function  HasKey(const Key: AnsiString): Boolean; override;
    procedure Rename(const Key: AnsiString; const NewKey: AnsiString); override;
    function  Count: Integer; override;
    function  GetKeyByIndex(const Idx: Integer): AnsiString; override;
    procedure DeleteItemByIndex(const Idx: Integer); override;

    { AInterfaceDictionary                                                    }
    procedure Add(const Key: AnsiString; const Value: IInterface); override;
    function  GetItemByIndex(const Idx: Integer): IInterface; override;
    procedure SetItemByIndex(const Idx: Integer; const Value: IInterface);
    function  LocateItem(const Key: AnsiString; var Value: IInterface): Integer; override;
    function  LocateNext(const Key: AnsiString; const Idx: Integer;
              var Value: IInterface): Integer; override;
  end;

  TInterfaceDictionary = class(TGeneralInterfaceDictionary)
  protected
    function  GetItem(const Key: AnsiString): IInterface; override;
    function  LocateKey(const Key: AnsiString; var LookupIdx: Integer;
              const ErrorIfNotFound: Boolean): Integer; override;

  public
    constructor CreateEx(const Keys: TAnsiStringArray = nil;
                const Values: TInterfaceArray = nil;
                const KeysCaseSensitive: Boolean = True;
                const AddOnSet: Boolean = True;
                const DuplicatesAction: TDictionaryDuplicatesAction = ddAccept);

    function  LocateItem(const Key: AnsiString; var Value: IInterface): Integer; override;
  end;



{                                                                              }
{ TGeneralStringDictionary                                                     }
{                                                                              }
type
  {$IFDEF CharIsWide}
  TGeneralStringDictionary = TGeneralAnsiStringDictionary;
  {$ELSE}
  TGeneralStringDictionary = TGeneralWideStringDictionary;
  {$ENDIF}
  TStringDictionary = TGeneralStringDictionary;



{                                                                              }
{ Dictionary functions                                                         }
{                                                                              }
const
  DictionaryAverageHashChainSize = 4;

function  DictionaryRehashSize(const Count: Integer): Integer;



{                                                                              }
{ SPARSE ARRAY BASE CLASSES                                                    }
{                                                                              }



{                                                                              }
{ ASparseArray                                                                 }
{   Sparse array base class.                                                   }
{                                                                              }
type
  ASparseArray = class(AType)
  protected
    procedure IndexError(const ErrorClass: ExceptClass);
    function  GetCount: Integer; virtual; abstract;

  public
    property  Count: Integer read GetCount;
    function  IsEmpty: Boolean; override;
    procedure Delete(const Idx: Integer); virtual; abstract;
    function  HasItem(const Idx: Integer): Boolean; virtual; abstract;
  end;
  ESparseArray = class(EType);



{                                                                              }
{ SPARSE ARRAY IMPLEMENTATIONS                                                 }
{                                                                              }



{                                                                              }
{ TSparseStringArray                                                           }
{   Sparse array that holds String values.                                     }
{                                                                              }
type
  TSparseStringRecord = record
    Idx   : Integer;
    Value : AnsiString;
  end;
  PSparseStringRecord = ^TSparseStringRecord;
  TSparseStringRecordArray = Array of TSparseStringRecord;
  TSparseStringArrayHashList = Array of TSparseStringRecordArray;

  TSparseStringArray = class(ASparseArray)
  private
    FHashList : TSparseStringArrayHashList;
    FHashSize : Integer;
    FCount    : Integer;

  protected
    function  LocateItemRecord(const Idx: Integer;
              var LookupIdx, ChainIdx: Integer): PSparseStringRecord;
    procedure Rehash;

    function  GetCount: Integer; override;
    function  GetItem(const Idx: Integer): AnsiString;
    procedure SetItem(const Idx: Integer; const Value: AnsiString);

  public
    procedure Assign(const Source: TObject); override;
    function  IsEqual(const V: TObject): Boolean; override;

    property  Item[const Idx: Integer]: AnsiString read GetItem write SetItem; default;
    function  LocateItem(const Idx: Integer; var Value: AnsiString): Boolean;

    property  Count: Integer read FCount;
    function  IsEmpty: Boolean; override;
    procedure Clear; override;

    procedure Delete(const Idx: Integer); override;

    function  HasItem(const Idx: Integer): Boolean; override;
    function  FindFirst(var Idx: Integer; var Value: AnsiString): Boolean;
    function  FindNext(var Idx: Integer; var Value: AnsiString): Boolean;
  end;
  ESparseStringArray = class(ESparseArray);



{                                                                              }
{ TSparseWideStringArray                                                       }
{   Sparse array that holds WideString values.                                 }
{                                                                              }
type
  TSparseWideStringRecord = record
    Idx   : Integer;
    Value : WideString;
  end;
  PSparseWideStringRecord = ^TSparseWideStringRecord;
  TSparseWideStringRecordArray = Array of TSparseWideStringRecord;
  TSparseWideStringArrayHashList = Array of TSparseWideStringRecordArray;

  TSparseWideStringArray = class(ASparseArray)
  private
    FHashList : TSparseWideStringArrayHashList;
    FHashSize : Integer;
    FCount    : Integer;

  protected
    function  LocateItemRecord(const Idx: Integer;
              var LookupIdx, ChainIdx: Integer): PSparseWideStringRecord;
    procedure Rehash;

    function  GetCount: Integer; override;
    function  GetItem(const Idx: Integer): WideString;
    procedure SetItem(const Idx: Integer; const Value: WideString);

  public
    procedure Assign(const Source: TObject); override;
    function  IsEqual(const V: TObject): Boolean; override;

    property  Item[const Idx: Integer]: WideString read GetItem write SetItem; default;
    function  LocateItem(const Idx: Integer; var Value: WideString): Boolean;

    property  Count: Integer read FCount;
    function  IsEmpty: Boolean; override;
    procedure Clear; override;

    procedure Delete(const Idx: Integer); override;

    function  HasItem(const Idx: Integer): Boolean; override;
    function  FindFirst(var Idx: Integer; var Value: WideString): Boolean;
    function  FindNext(var Idx: Integer; var Value: WideString): Boolean;
  end;
  ESparseWideStringArray = class(ESparseArray);



{                                                                              }
{ TSparseInt64Array                                                            }
{   Sparse array that holds Int64 values.                                      }
{                                                                              }
type
  TSparseInt64Record = record
    Idx   : Integer;
    Value : Int64;
  end;
  PSparseInt64Record = ^TSparseInt64Record;
  TSparseInt64RecordArray = Array of TSparseInt64Record;
  TSparseInt64ArrayHashList = Array of TSparseInt64RecordArray;

  TSparseInt64Array = class(ASparseArray)
  private
    FHashList : TSparseInt64ArrayHashList;
    FHashSize : Integer;
    FCount    : Integer;

  protected
    function  LocateItemRecord(const Idx: Integer;
              var LookupIdx, ChainIdx: Integer): PSparseInt64Record;
    procedure Rehash;

    function  GetCount: Integer; override;
    function  GetItem(const Idx: Integer): Int64;
    procedure SetItem(const Idx: Integer; const Value: Int64);

  public
    procedure Assign(const Source: TObject); override;
    function  IsEqual(const V: TObject): Boolean; override;

    property  Item[const Idx: Integer]: Int64 read GetItem write SetItem; default;
    function  LocateItem(const Idx: Integer; var Value: Int64): Boolean;

    property  Count: Integer read FCount;
    function  IsEmpty: Boolean; override;
    procedure Clear; override;

    procedure Delete(const Idx: Integer); override;

    function  HasItem(const Idx: Integer): Boolean; override;
    function  FindFirst(var Idx: Integer; var Value: Int64): Boolean;
    function  FindNext(var Idx: Integer; var Value: Int64): Boolean;
  end;
  ESparseInt64Array = class(ESparseArray);



{                                                                              }
{ TSparseExtendedArray                                                         }
{   Sparse array that holds Extended values.                                   }
{                                                                              }
type
  TSparseExtendedRecord = record
    Idx   : Integer;
    Value : Extended;
  end;
  PSparseExtendedRecord = ^TSparseExtendedRecord;
  TSparseExtendedRecordArray = Array of TSparseExtendedRecord;
  TSparseExtendedArrayHashList = Array of TSparseExtendedRecordArray;

  TSparseExtendedArray = class(ASparseArray)
  private
    FHashList : TSparseExtendedArrayHashList;
    FHashSize : Integer;
    FCount    : Integer;

  protected
    function  LocateItemRecord(const Idx: Integer;
              var LookupIdx, ChainIdx: Integer): PSparseExtendedRecord;
    procedure Rehash;

    function  GetCount: Integer; override;
    function  GetItem(const Idx: Integer): Extended;
    procedure SetItem(const Idx: Integer; const Value: Extended);

  public
    procedure Assign(const Source: TObject); override;
    function  IsEqual(const V: TObject): Boolean; override;

    property  Item[const Idx: Integer]: Extended read GetItem write SetItem; default;
    function  LocateItem(const Idx: Integer; var Value: Extended): Boolean;

    property  Count: Integer read FCount;
    function  IsEmpty: Boolean; override;
    procedure Clear; override;

    procedure Delete(const Idx: Integer); override;

    function  HasItem(const Idx: Integer): Boolean; override;
    function  FindFirst(var Idx: Integer; var Value: Extended): Boolean;
    function  FindNext(var Idx: Integer; var Value: Extended): Boolean;
  end;
  ESparseExtendedArray = class(ESparseArray);



{                                                                              }
{ TSparseObjectArray                                                           }
{   Sparse array that holds TObject values.                                    }
{                                                                              }
type
  TSparseObjectRecord = record
    Idx   : Integer;
    Value : TObject;
  end;
  PSparseObjectRecord = ^TSparseObjectRecord;
  TSparseObjectRecordArray = Array of TSparseObjectRecord;
  TSparseObjectArrayHashList = Array of TSparseObjectRecordArray;

  TSparseObjectArray = class(ASparseArray)
  private
    FHashList    : TSparseObjectArrayHashList;
    FHashSize    : Integer;
    FCount       : Integer;
    FIsItemOwner : Boolean;

  protected
    procedure Init; override;

    function  LocateItemRecord(const Idx: Integer;
              var LookupIdx, ChainIdx: Integer): PSparseObjectRecord;
    procedure Rehash;

    function  GetCount: Integer; override;
    function  GetItem(const Idx: Integer): TObject;
    procedure SetItem(const Idx: Integer; const Value: TObject);

  public
    constructor Create(const IsItemOwner: Boolean = False);
    destructor Destroy; override;

    procedure Assign(const Source: TObject); override;
    function  IsEqual(const V: TObject): Boolean; override;

    property  IsItemOwner: Boolean read FIsItemOwner write FIsItemOwner;
    property  Item[const Idx: Integer]: TObject read GetItem write SetItem; default;
    function  LocateItem(const Idx: Integer; var Value: TObject): Boolean;

    property  Count: Integer read FCount;
    function  IsEmpty: Boolean; override;
    procedure Clear; override;

    procedure Delete(const Idx: Integer); override;
    function  ReleaseItem(const Idx: Integer): TObject;

    function  HasItem(const Idx: Integer): Boolean; override;
    function  FindFirst(var Idx: Integer; var Value: TObject): Boolean;
    function  FindNext(var Idx: Integer; var Value: TObject): Boolean;
  end;
  ESparseObjectArray = class(ESparseArray);



{                                                                              }
{ Linked lists                                                                 }
{                                                                              }
type
  TDoublyLinkedItem = class
  protected
    FNext : TDoublyLinkedItem;
    FPrev : TDoublyLinkedItem;

  public
    destructor DestroyList;

    property  Next: TDoublyLinkedItem read FNext write FNext;
    property  Prev: TDoublyLinkedItem read FPrev write FPrev;

    function  HasNext: Boolean;
    function  HasPrev: Boolean;
    function  Last: TDoublyLinkedItem;
    function  First: TDoublyLinkedItem;
    function  Count: Integer;

    procedure Remove;
    function  RemoveNext: TDoublyLinkedItem;
    procedure DeleteNext;
    function  RemovePrev: TDoublyLinkedItem;
    procedure DeletePrev;
    procedure InsertAfter(const Item: TDoublyLinkedItem);
    procedure InsertBefore(const Item: TDoublyLinkedItem);
    procedure Delete;
  end;

  TDoublyLinkedInteger = class(TDoublyLinkedItem)
  public
    Value : Integer;

    constructor Create(const V: Integer);

    procedure InsertAfter(const V: Integer); overload;
    procedure InsertBefore(const V: Integer); overload;
    procedure InsertFirst(const V: Integer);
    procedure Append(const V: Integer);
    function  FindNext(const Find: Integer): TDoublyLinkedInteger;
    function  FindPrev(const Find: Integer): TDoublyLinkedInteger;
  end;

  TDoublyLinkedExtended = class(TDoublyLinkedItem)
  public
    Value : Extended;

    constructor Create(const V: Extended);

    procedure InsertAfter(const V: Extended); overload;
    procedure InsertBefore(const V: Extended); overload;
    procedure InsertFirst(const V: Extended);
    procedure Append(const V: Extended);
    function  FindNext(const Find: Extended): TDoublyLinkedExtended;
    function  FindPrev(const Find: Extended): TDoublyLinkedExtended;
  end;

  TDoublyLinkedString = class(TDoublyLinkedItem)
  public
    Value : AnsiString;

    constructor Create(const V: AnsiString);

    procedure InsertAfter(const V: AnsiString); overload;
    procedure InsertBefore(const V: AnsiString); overload;
    procedure InsertFirst(const V: AnsiString);
    procedure Append(const V: AnsiString);
    function  FindNext(const Find: AnsiString): TDoublyLinkedString;
    function  FindPrev(const Find: AnsiString): TDoublyLinkedString;
  end;

  TDoublyLinkedObject = class(TDoublyLinkedItem)
  public
    Value : TObject;

    constructor Create(const V: TObject);

    procedure InsertAfter(const V: TObject); overload;
    procedure InsertBefore(const V: TObject); overload;
    procedure InsertFirst(const V: TObject);
    procedure Append(const V: TObject);
    function  FindNext(const Find: TObject): TDoublyLinkedObject;
    function  FindPrev(const Find: TObject): TDoublyLinkedObject;
  end;


function  AsDoublyLinkedIntegerList(const V: Array of Integer): TDoublyLinkedInteger;
function  AsDoublyLinkedExtendedList(const V: Array of Extended): TDoublyLinkedExtended;
function  AsDoublyLinkedStringList(const V: Array of AnsiString): TDoublyLinkedString;



{                                                                              }
{ TDoublyLinkedList                                                            }
{                                                                              }
type
  TDoublyLinkedList = class
  protected
    FFirst : TDoublyLinkedItem;
    FLast  : TDoublyLinkedItem;
    FCount : Integer;

  public
    destructor Destroy; override;

    property  First: TDoublyLinkedItem read FFirst;
    property  Last: TDoublyLinkedItem read FLast;
    function  IsEmpty: Boolean;
    property  Count: Integer read FCount;

    procedure Remove(const Item: TDoublyLinkedItem);
    function  RemoveFirst: TDoublyLinkedItem;
    function  RemoveLast: TDoublyLinkedItem;

    procedure Delete(const Item: TDoublyLinkedItem);
    procedure DeleteFirst;
    procedure DeleteLast;
    procedure DeleteList;

    procedure Append(const Item: TDoublyLinkedItem);
    procedure InsertFront(const Item: TDoublyLinkedItem);
  end;



{                                                                              }
{ Self testing code                                                            }
{                                                                              }
procedure SelfTest;



implementation

uses
  { Fundamentals }
  cStrings;



{                                                                              }
{ AType                                                                        }
{                                                                              }
constructor AType.Create;
begin
  inherited Create;
  Init;
end;

procedure AType.Init;
begin
end;

procedure AType.RaiseTypeError(const Msg: String; const Error: Exception;
    const ErrorClass: ExceptClass);
var S: String;
begin
  S := Msg;
  if Assigned(Error) then
    S := S + ': ' + Error.Message;
  if Assigned(ErrorClass) then
    raise ErrorClass.Create(S)
  else
    raise EType.Create(S);
end;

procedure AType.RaiseMethodNotImplementedError(const Method: String);
begin
  RaiseTypeError('Method ' + ClassName + '.' + Method + ' not implemented');
end;

class function AType.CreateInstance: AType;
begin
  Result := AType(TypeClass(self).Create);
end;

procedure AType.Clear;
begin
  RaiseMethodNotImplementedError('Clear');
end;

{$WARNINGS OFF}
function AType.IsEmpty: Boolean;
begin
  RaiseMethodNotImplementedError('IsEmpty');
end;
{$IFDEF DEBUG}{$IFNDEF FREEPASCAL}{$WARNINGS ON}{$ENDIF}{$ENDIF}

function AType.Duplicate: TObject;
begin
  try
    Result := CreateInstance;
    try
      AType(Result).Assign(self);
    except
      FreeAndNil(Result);
      raise;
    end;
  except
    on E: Exception do RaiseTypeError('Duplicate failed', E);
  end;
end;

procedure AType.Assign(const Source: TObject);
var R : Boolean;
begin
  if Source is AType then
    try
      AType(Source).AssignTo(self);
      R := True;
    except
      R := False;
    end else
    R := False;
  if not R then
    RaiseTypeError(ClassName + ' cannot assign from ' + ObjectClassName(Source));
end;

procedure AType.AssignTo(const Dest: TObject);
begin
  RaiseTypeError(ClassName + ' cannot assign to ' + ObjectClassName(Dest));
end;

{$WARNINGS OFF}
function AType.IsEqual(const V: TObject): Boolean;
begin
  RaiseTypeError(ClassName + ' cannot compare with ' + ObjectClassName(V));
end;

function AType.Compare(const V: TObject): TCompareResult;
begin
  RaiseTypeError(ClassName + ' cannot compare with ' + ObjectClassName(V));
end;

function AType.HashValue: LongWord;
begin
  try
    Result := HashStr(GetAsString, 0, True);
  except
    on E : Exception do RaiseTypeError('Hash error', E);
  end;
end;

function AType.GetAsAnsiString: AnsiString;
begin
  RaiseMethodNotImplementedError('GetAsAnsiString');
end;

function AType.GetAsWideString: WideString;
begin
  Result := GetAsAnsiString;
end;

function AType.GetAsString: AnsiString;
begin
(*
  {$IFDEF DELPHI2009_UP}
  Result := GetAsWideString;
  {$ELSE}
  Result := GetAsAnsiString;
  {$ENDIF}
*)
  Result := GetAsAnsiString;
end;

function AType.GetAsUTF8String: AnsiString;
begin
  {$IFDEF DELPHI6_UP}
  Result := UTF8Encode(GetAsWideString);
  {$ELSE}
  RaiseMethodNotImplementedError('GetAsUTF8String');
  {$ENDIF}
end;
{$IFDEF DEBUG}{$IFNDEF FREEPASCAL}{$WARNINGS ON}{$ENDIF}{$ENDIF}

procedure AType.SetAsAnsiString(const S: AnsiString);
begin
  RaiseMethodNotImplementedError('SetAsAnsiString');
end;

procedure AType.SetAsWideString(const S: WideString);
begin
  RaiseMethodNotImplementedError('SetAsWideString');
end;

procedure AType.SetAsUTF8String(const S: AnsiString);
begin
  RaiseMethodNotImplementedError('SetAsUTF8String');
end;

procedure AType.SetAsString(const S: AnsiString);
begin
  RaiseMethodNotImplementedError('SetAsString');
end;



{                                                                              }
{ AType helper functions                                                       }
{                                                                              }
function TypeGetAsString(const V: TObject): AnsiString;
begin
  if V is AType then
    Result := AType(V).GetAsString
  else
    raise EType.Create(ObjectClassName(V) + ' cannot convert to string');
end;

procedure TypeSetAsString(const V: TObject; const S: AnsiString);
begin
  if V is AType then
    AType(V).SetAsString(S)
  else
    raise EType.Create(ObjectClassName(V) + ' cannot set as string');
end;

function TypeGetAsWideString(const V: TObject): WideString;
begin
  if V is AType then
    Result := AType(V).GetAsWideString
  else
    raise EType.Create(ObjectClassName(V) + ' cannot convert to wide string');
end;

procedure TypeSetAsWideString(const V: TObject; const S: WideString);
begin
  if V is AType then
    AType(V).SetAsWideString(S)
  else
    raise EType.Create(ObjectClassName(V) + ' cannot set as wide string');
end;

function TypeGetAsUTF8String(const V: TObject): AnsiString;
begin
  if V is AType then
    Result := AType(V).GetAsUTF8String
  else
    raise EType.Create(ObjectClassName(V) + ' cannot convert to utf-8 string');
end;

procedure TypeSetAsUTF8String(const V: TObject; const S: AnsiString);
begin
  if V is AType then
    AType(V).SetAsUTF8String(S)
  else
    raise EType.Create(ObjectClassName(V) + ' cannot set as utf-8 string');
end;

function TypeDuplicate(const V: TObject): TObject;
begin
  if V is AType then
    Result := AType(V).Duplicate else
  if not Assigned(V) then
    Result := nil
  else
    raise EType.Create(ObjectClassName(V) + ' cannot duplicate');
end;

procedure TypeClear(const V: TObject);
begin
  if V is AType then
    AType(V).Clear else
  if Assigned(V) then
    raise EType.Create(ObjectClassName(V) + ' cannot clear');
end;

function TypeIsEqual(const A, B: TObject): Boolean;
begin
  if A = B then
    Result := True else
  if not Assigned(A) or not Assigned(B) then
    Result := False else
  if A is AType then
    Result := AType(A).IsEqual(B) else
  if B is AType then
    Result := AType(B).IsEqual(A)
  else
    raise EType.Create(ObjectClassName(A) + ' and ' + ObjectClassName(B) +
        ' cannot compare');
end;

function TypeCompare(const A, B: TObject): TCompareResult;
begin
  if A = B then
    Result := crEqual else
  if A is AType then
    Result := AType(A).Compare(B) else
  if B is AType then
    Result := ReverseCompareResult(AType(B).Compare(A))
  else
    Result := crUndefined;
end;

procedure TypeAssign(const A, B: TObject);
begin
  if A = B then
    exit else
  if A is AType then
    AType(A).Assign(B) else
  if B is AType then
    AType(B).AssignTo(A)
  else
    raise EType.Create(ObjectClassName(A) + ' cannot assign ' +
        ObjectClassName(B));
end;

function TypeHashValue(const A: TObject): LongWord;
begin
  if not Assigned(A) then
    Result := 0 else
  if A is AType then
    Result := AType(A).HashValue
  else
    raise EType.Create(A.ClassName + ' cannot calculate hash value');
end;



{                                                                              }
{                                                                              }
{ TYPE BASE CLASSES                                                            }
{                                                                              }
{                                                                              }



{                                                                              }
{ AArray                                                                       }
{                                                                              }
procedure AArray.RaiseIndexError(const Idx: Integer);
begin
  RaiseTypeError('Array index out of bounds'
      {$IFDEF DEBUG} + ': ' + IntToStr(Idx) + '/' + IntToStr(GetCount){$ENDIF},
      nil, EArray);
end;

procedure AArray.Clear;
begin
  Count := 0;
end;

procedure AArray.Sort;

  procedure QuickSort(L, R: Integer);
  var I, J : Integer;
      M    : Integer;
    begin
      repeat
        I := L;
        J := R;
        M := (L + R) shr 1;
        repeat
          while CompareItems(I, M) = crLess do
            Inc(I);
          while CompareItems(J, M) = crGreater do
            Dec(J);
          if I <= J then
            begin
              ExchangeItems(I, J);
              if M = I then
                M := J else
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

var I : Integer;
begin
  I := Count;
  if I > 0 then
    QuickSort(0, I - 1);
end;

procedure AArray.ReverseOrder;
var I, L : Integer;
begin
  L := Count;
  for I := 1 to L div 2 do
    ExchangeItems(I - 1, L - I);
end;

procedure AArray.RemoveDuplicates(const IsSortedAscending: Boolean);
var I, C, J, L : Integer;
begin
  L := GetCount;
  if L = 0 then
    exit;
  if IsSortedAscending then
    begin
      J := 0;
      repeat
        I := J + 1;
        while (I < L) and (CompareItems(I, J) = crEqual) do
          Inc(I);
        C := I - J;
        if C > 1 then
          begin
            Delete(J + 1, C - 1);
            Dec(L, C - 1);
            Inc(J);
          end
        else
          J := I;
      until J >= L;
    end else
    begin
      J := 0;
      while J < L - 1 do
        begin
          I := J + 1;
          while I <= L - 1 do
            if CompareItems(J, I) = crEqual then
              begin
                Delete(I, 1);
                Dec(L);
              end else
              Inc(I);
          Inc(J);
        end;
    end;
end;



{                                                                              }
{ ALongIntArray                                                                }
{                                                                              }
procedure ALongIntArray.ExchangeItems(const Idx1, Idx2: Integer);
var I : LongInt;
begin
  I := Item[Idx1];
  Item[Idx1] := Item[Idx2];
  Item[Idx2] := I;
end;

function ALongIntArray.AppendItem(const Value: LongInt): Integer;
begin
  Result := Count;
  Count := Result + 1;
  Item[Result] := Value;
end;

function ALongIntArray.GetRange(const LoIdx, HiIdx: Integer): LongIntArray;
var I, L, H, C : Integer;
begin
  L := MaxI(0, LoIdx);
  H := MinI(Count - 1, HiIdx);
  C := H - L + 1;
  SetLength(Result, C);
  for I := 0 to C - 1 do
    Result[I] := Item[L + I];
end;

function ALongIntArray.DuplicateRange(const LoIdx, HiIdx: Integer): AArray;
var I, L, H, C : Integer;
begin
  Result := ALongIntArray(CreateInstance);
  L := MaxI(0, LoIdx);
  H := MinI(Count - 1, HiIdx);
  C := H - L + 1;
  ALongIntArray(Result).Count := C;
  for I := 0 to C - 1 do
    ALongIntArray(Result)[I] := Item[L + I];
end;

procedure ALongIntArray.SetRange(const LoIdx, HiIdx: Integer; const V: LongIntArray);
var I, L, H, C : Integer;
begin
  L := MaxI(0, LoIdx);
  H := MinI(Count - 1, HiIdx);
  C := MinI(Length(V), H - L + 1);
  for I := 0 to C - 1 do
    Item[L + I] := V[I];
end;

procedure ALongIntArray.Fill(const Idx, Count: Integer; const Value: LongInt);
var I : Integer;
begin
  for I := Idx to Idx + Count - 1 do
    Item[I] := Value;
end;

function ALongIntArray.AppendArray(const V: LongIntArray): Integer;
begin
  Result := Count;
  Count := Result + Length(V);
  Range[Result, Count - 1] := V;
end;

function ALongIntArray.CompareItems(const Idx1, Idx2: Integer): TCompareResult;
var I, J : LongInt;
begin
  I := Item[Idx1];
  J := Item[Idx2];
  if I < J then
    Result := crLess else
  if I > J then
    Result := crGreater else
    Result := crEqual;
end;

function ALongIntArray.PosNext(const Find: LongInt;
    const PrevPos: Integer; const IsSortedAscending: Boolean): Integer;
var I, L, H : Integer;
    D       : LongInt;
begin
  if IsSortedAscending then // binary search
    begin
      if MaxI(PrevPos + 1, 0) = 0 then // find first
        begin
          L := 0;
          H := Count - 1;
          repeat
            I := (L + H) div 2;
            D := Item[I];
            if D = Find then
              begin
                while (I > 0) and (Item[I - 1] = Find) do
                  Dec(I);
                Result := I;
                exit;
              end else
            if D > Find then
              H := I - 1 else
              L := I + 1;
          until L > H;
          Result := -1;
        end else // find next
        if PrevPos >= Count - 1 then
          Result := -1 else
          if Item[PrevPos + 1] = Find then
            Result := PrevPos + 1 else
            Result := -1;
    end else // linear search
    begin
      for I := MaxI(PrevPos + 1, 0) to Count - 1 do
        if Item[I] = Find then
          begin
            Result := I;
            exit;
          end;
      Result := -1;
    end;
end;

function ALongIntArray.GetAsString: AnsiString;
var I, L : Integer;
begin
  L := Count;
  if L = 0 then
    begin
      Result := '';
      exit;
    end;
  Result := IntToStr(Item[0]);
  for I := 1 to L - 1 do
    Result := Result + ',' + IntToStr(Item[I]);
end;

procedure ALongIntArray.SetAsString(const S: AnsiString);
var F, G, L, C : Integer;
begin
  L := Length(S);
  if L = 0 then
    begin
      Count := 0;
      exit;
    end;
  L := 0;
  F := 1;
  C := Length(S);
  while F < C do
    begin
      G := 0;
      while (F + G <= C) and (S[F + G] <> ',') do
        Inc(G);
      Inc(L);
      Count := L;
      if G = 0 then
        Item[L - 1] := 0
      else
        Item[L - 1] := StrToInt(Copy(S, F, G));
      Inc(F, G + 1);
    end;
end;

procedure ALongIntArray.Assign(const Source: TObject);
var I, L : Integer;
begin
  if Source is ALongIntArray then
    begin
      L := ALongIntArray(Source).Count;
      Count := L;
      for I := 0 to L - 1 do
        Item[I] := ALongIntArray(Source).Item[I];
    end else
    inherited Assign(Source);
end;

function ALongIntArray.IsEqual(const V: TObject): Boolean;
var I, L : Integer;
begin
  if V is ALongIntArray then
    begin
      L := ALongIntArray(V).Count;
      Result := L = Count;
      if not Result then
        exit;
      for I := 0 to L - 1 do
        if Item[I] <> ALongIntArray(V).Item[I] then
          begin
            Result := False;
            exit;
          end;
    end else
    Result := inherited IsEqual(V);
end;

function ALongIntArray.AppendArray(const V: AArray): Integer;
var I, L : Integer;
begin
  Result := Count;
  if V is ALongIntArray then
    begin
      L := V.Count;
      Count := Result + L;
      for I := 0 to L - 1 do
        Item[Result + I] := ALongIntArray(V)[I];
    end
  else
    RaiseTypeError(ClassName + ' can not append ' + ObjectClassName(V), nil, ELongIntArray);
end;

procedure ALongIntArray.Delete(const Idx: Integer; const Count: Integer);
var I, C, J, L : Integer;
begin
  J := MaxI(Idx, 0);
  C := GetCount;
  L := MinI(Count, C - J);
  if L > 0 then
    begin
      for I := J to J + C - 1 do
        SetItem(I, GetItem(I + Count));
      SetCount(C - L);
    end;
end;

procedure ALongIntArray.Insert(const Idx: Integer; const Count: Integer);
var I, C, J, L : Integer;
begin
  if Count <= 0 then
    exit;
  C := GetCount;
  SetCount(C + Count);
  J := MinI(MaxI(Idx, 0), C);
  L := C - J;
  for I := C - 1 downto C - L do
    SetItem(I + Count, GetItem(I));
end;



{                                                                              }
{ ALongWordArray                                                               }
{                                                                              }
procedure ALongWordArray.ExchangeItems(const Idx1, Idx2: Integer);
var I : LongWord;
begin
  I := Item[Idx1];
  Item[Idx1] := Item[Idx2];
  Item[Idx2] := I;
end;

function ALongWordArray.AppendItem(const Value: LongWord): Integer;
begin
  Result := Count;
  Count := Result + 1;
  Item[Result] := Value;
end;

function ALongWordArray.GetRange(const LoIdx, HiIdx: Integer): LongWordArray;
var I, L, H, C : Integer;
begin
  L := MaxI(0, LoIdx);
  H := MinI(Count - 1, HiIdx);
  C := H - L + 1;
  SetLength(Result, C);
  for I := 0 to C - 1 do
    Result[I] := Item[L + I];
end;

function ALongWordArray.DuplicateRange(const LoIdx, HiIdx: Integer): AArray;
var I, L, H, C : Integer;
begin
  Result := ALongWordArray(CreateInstance);
  L := MaxI(0, LoIdx);
  H := MinI(Count - 1, HiIdx);
  C := H - L + 1;
  ALongWordArray(Result).Count := C;
  for I := 0 to C - 1 do
    ALongWordArray(Result)[I] := Item[L + I];
end;

procedure ALongWordArray.SetRange(const LoIdx, HiIdx: Integer; const V: LongWordArray);
var I, L, H, C : Integer;
begin
  L := MaxI(0, LoIdx);
  H := MinI(Count - 1, HiIdx);
  C := MinI(Length(V), H - L + 1);
  for I := 0 to C - 1 do
    Item[L + I] := V[I];
end;

procedure ALongWordArray.Fill(const Idx, Count: Integer; const Value: LongWord);
var I : Integer;
begin
  for I := Idx to Idx + Count - 1 do
    Item[I] := Value;
end;

function ALongWordArray.AppendArray(const V: LongWordArray): Integer;
begin
  Result := Count;
  Count := Result + Length(V);
  Range[Result, Count - 1] := V;
end;

function ALongWordArray.CompareItems(const Idx1, Idx2: Integer): TCompareResult;
var I, J : LongWord;
begin
  I := Item[Idx1];
  J := Item[Idx2];
  if I < J then
    Result := crLess else
  if I > J then
    Result := crGreater else
    Result := crEqual;
end;

function ALongWordArray.PosNext(const Find: LongWord;
    const PrevPos: Integer; const IsSortedAscending: Boolean): Integer;
var I, L, H : Integer;
    D       : LongWord;
begin
  if IsSortedAscending then // binary search
    begin
      if MaxI(PrevPos + 1, 0) = 0 then // find first
        begin
          L := 0;
          H := Count - 1;
          repeat
            I := (L + H) div 2;
            D := Item[I];
            if D = Find then
              begin
                while (I > 0) and (Item[I - 1] = Find) do
                  Dec(I);
                Result := I;
                exit;
              end else
            if D > Find then
              H := I - 1 else
              L := I + 1;
          until L > H;
          Result := -1;
        end else // find next
        if PrevPos >= Count - 1 then
          Result := -1 else
          if Item[PrevPos + 1] = Find then
            Result := PrevPos + 1 else
            Result := -1;
    end else // linear search
    begin
      for I := MaxI(PrevPos + 1, 0) to Count - 1 do
        if Item[I] = Find then
          begin
            Result := I;
            exit;
          end;
      Result := -1;
    end;
end;

function ALongWordArray.GetAsString: AnsiString;
var I, L : Integer;
begin
  L := Count;
  if L = 0 then
    begin
      Result := '';
      exit;
    end;
  Result := IntToStr(Item[0]);
  for I := 1 to L - 1 do
    Result := Result + ',' + IntToStr(Item[I]);
end;

procedure ALongWordArray.SetAsString(const S: AnsiString);
var F, G, L, C : Integer;
begin
  L := Length(S);
  if L = 0 then
    begin
      Count := 0;
      exit;
    end;
  L := 0;
  F := 1;
  C := Length(S);
  while F < C do
    begin
      G := 0;
      while (F + G <= C) and (S[F + G] <> ',') do
        Inc(G);
      Inc(L);
      Count := L;
      if G = 0 then
        Item[L - 1] := 0
      else
        Item[L - 1] := StrToInt(Copy(S, F, G));
      Inc(F, G + 1);
    end;
end;

procedure ALongWordArray.Assign(const Source: TObject);
var I, L : Integer;
begin
  if Source is ALongWordArray then
    begin
      L := ALongWordArray(Source).Count;
      Count := L;
      for I := 0 to L - 1 do
        Item[I] := ALongWordArray(Source).Item[I];
    end else
    inherited Assign(Source);
end;

function ALongWordArray.IsEqual(const V: TObject): Boolean;
var I, L : Integer;
begin
  if V is ALongWordArray then
    begin
      L := ALongWordArray(V).Count;
      Result := L = Count;
      if not Result then
        exit;
      for I := 0 to L - 1 do
        if Item[I] <> ALongWordArray(V).Item[I] then
          begin
            Result := False;
            exit;
          end;
    end else
    Result := inherited IsEqual(V);
end;

function ALongWordArray.AppendArray(const V: AArray): Integer;
var I, L : Integer;
begin
  Result := Count;
  if V is ALongWordArray then
    begin
      L := V.Count;
      Count := Result + L;
      for I := 0 to L - 1 do
        Item[Result + I] := ALongWordArray(V)[I];
    end
  else
    RaiseTypeError(ClassName + ' can not append ' + ObjectClassName(V), nil, ELongWordArray);
end;

procedure ALongWordArray.Delete(const Idx: Integer; const Count: Integer);
var I, C, J, L : Integer;
begin
  J := MaxI(Idx, 0);
  C := GetCount;
  L := MinI(Count, C - J);
  if L > 0 then
    begin
      for I := J to J + C - 1 do
        SetItem(I, GetItem(I + Count));
      SetCount(C - L);
    end;
end;

procedure ALongWordArray.Insert(const Idx: Integer; const Count: Integer);
var I, C, J, L : Integer;
begin
  if Count <= 0 then
    exit;
  C := GetCount;
  SetCount(C + Count);
  J := MinI(MaxI(Idx, 0), C);
  L := C - J;
  for I := C - 1 downto C - L do
    SetItem(I + Count, GetItem(I));
end;



{                                                                              }
{ AInt64Array                                                                  }
{                                                                              }
procedure AInt64Array.ExchangeItems(const Idx1, Idx2: Integer);
var I : Int64;
begin
  I := Item[Idx1];
  Item[Idx1] := Item[Idx2];
  Item[Idx2] := I;
end;

function AInt64Array.AppendItem(const Value: Int64): Integer;
begin
  Result := Count;
  Count := Result + 1;
  Item[Result] := Value;
end;

function AInt64Array.GetRange(const LoIdx, HiIdx: Integer): Int64Array;
var I, L, H, C : Integer;
begin
  L := MaxI(0, LoIdx);
  H := MinI(Count - 1, HiIdx);
  C := H - L + 1;
  SetLength(Result, C);
  for I := 0 to C - 1 do
    Result[I] := Item[L + I];
end;

function AInt64Array.DuplicateRange(const LoIdx, HiIdx: Integer): AArray;
var I, L, H, C : Integer;
begin
  Result := AInt64Array(CreateInstance);
  L := MaxI(0, LoIdx);
  H := MinI(Count - 1, HiIdx);
  C := H - L + 1;
  AInt64Array(Result).Count := C;
  for I := 0 to C - 1 do
    AInt64Array(Result)[I] := Item[L + I];
end;

procedure AInt64Array.SetRange(const LoIdx, HiIdx: Integer; const V: Int64Array);
var I, L, H, C : Integer;
begin
  L := MaxI(0, LoIdx);
  H := MinI(Count - 1, HiIdx);
  C := MinI(Length(V), H - L + 1);
  for I := 0 to C - 1 do
    Item[L + I] := V[I];
end;

procedure AInt64Array.Fill(const Idx, Count: Integer; const Value: Int64);
var I : Integer;
begin
  for I := Idx to Idx + Count - 1 do
    Item[I] := Value;
end;

function AInt64Array.AppendArray(const V: Int64Array): Integer;
begin
  Result := Count;
  Count := Result + Length(V);
  Range[Result, Count - 1] := V;
end;

function AInt64Array.CompareItems(const Idx1, Idx2: Integer): TCompareResult;
var I, J : Int64;
begin
  I := Item[Idx1];
  J := Item[Idx2];
  if I < J then
    Result := crLess else
  if I > J then
    Result := crGreater else
    Result := crEqual;
end;

function AInt64Array.PosNext(const Find: Int64;
    const PrevPos: Integer; const IsSortedAscending: Boolean): Integer;
var I, L, H : Integer;
    D       : Int64;
begin
  if IsSortedAscending then // binary search
    begin
      if MaxI(PrevPos + 1, 0) = 0 then // find first
        begin
          L := 0;
          H := Count - 1;
          repeat
            I := (L + H) div 2;
            D := Item[I];
            if D = Find then
              begin
                while (I > 0) and (Item[I - 1] = Find) do
                  Dec(I);
                Result := I;
                exit;
              end else
            if D > Find then
              H := I - 1 else
              L := I + 1;
          until L > H;
          Result := -1;
        end else // find next
        if PrevPos >= Count - 1 then
          Result := -1 else
          if Item[PrevPos + 1] = Find then
            Result := PrevPos + 1 else
            Result := -1;
    end else // linear search
    begin
      for I := MaxI(PrevPos + 1, 0) to Count - 1 do
        if Item[I] = Find then
          begin
            Result := I;
            exit;
          end;
      Result := -1;
    end;
end;

function AInt64Array.GetAsString: AnsiString;
var I, L : Integer;
begin
  L := Count;
  if L = 0 then
    begin
      Result := '';
      exit;
    end;
  Result := IntToStr(Item[0]);
  for I := 1 to L - 1 do
    Result := Result + ',' + IntToStr(Item[I]);
end;

procedure AInt64Array.SetAsString(const S: AnsiString);
var F, G, L, C : Integer;
begin
  L := Length(S);
  if L = 0 then
    begin
      Count := 0;
      exit;
    end;
  L := 0;
  F := 1;
  C := Length(S);
  while F < C do
    begin
      G := 0;
      while (F + G <= C) and (S[F + G] <> ',') do
        Inc(G);
      Inc(L);
      Count := L;
      if G = 0 then
        Item[L - 1] := 0
      else
        Item[L - 1] := StrToInt(Copy(S, F, G));
      Inc(F, G + 1);
    end;
end;

procedure AInt64Array.Assign(const Source: TObject);
var I, L : Integer;
begin
  if Source is AInt64Array then
    begin
      L := AInt64Array(Source).Count;
      Count := L;
      for I := 0 to L - 1 do
        Item[I] := AInt64Array(Source).Item[I];
    end else
  if Source is ALongIntArray then
    begin
      L := ALongIntArray(Source).Count;
      Count := L;
      for I := 0 to L - 1 do
        Item[I] := ALongIntArray(Source).Item[I];
    end else
    inherited Assign(Source);
end;

function AInt64Array.IsEqual(const V: TObject): Boolean;
var I, L : Integer;
begin
  if V is AInt64Array then
    begin
      L := AInt64Array(V).Count;
      Result := L = Count;
      if not Result then
        exit;
      for I := 0 to L - 1 do
        if Item[I] <> AInt64Array(V).Item[I] then
          begin
            Result := False;
            exit;
          end;
    end else
    Result := inherited IsEqual(V);
end;

function AInt64Array.AppendArray(const V: AArray): Integer;
var I, L : Integer;
begin
  Result := Count;
  if V is AInt64Array then
    begin
      L := V.Count;
      Count := Result + L;
      for I := 0 to L - 1 do
        Item[Result + I] := AInt64Array(V)[I];
    end
  else
    RaiseTypeError(ClassName + ' can not append ' + ObjectClassName(V), nil, EInt64Array);
end;

procedure AInt64Array.Delete(const Idx: Integer; const Count: Integer);
var I, C, J, L : Integer;
begin
  J := MaxI(Idx, 0);
  C := GetCount;
  L := MinI(Count, C - J);
  if L > 0 then
    begin
      for I := J to J + C - 1 do
        SetItem(I, GetItem(I + Count));
      SetCount(C - L);
    end;
end;

procedure AInt64Array.Insert(const Idx: Integer; const Count: Integer);
var I, C, J, L : Integer;
begin
  if Count <= 0 then
    exit;
  C := GetCount;
  SetCount(C + Count);
  J := MinI(MaxI(Idx, 0), C);
  L := C - J;
  for I := C - 1 downto C - L do
    SetItem(I + Count, GetItem(I));
end;



{                                                                              }
{ ASingleArray                                                                 }
{                                                                              }
procedure ASingleArray.ExchangeItems(const Idx1, Idx2: Integer);
var I : Single;
begin
  I := Item[Idx1];
  Item[Idx1] := Item[Idx2];
  Item[Idx2] := I;
end;

function ASingleArray.AppendItem(const Value: Single): Integer;
begin
  Result := Count;
  Count := Result + 1;
  Item[Result] := Value;
end;

function ASingleArray.GetRange(const LoIdx, HiIdx: Integer): SingleArray;
var I, L, H, C : Integer;
begin
  L := MaxI(0, LoIdx);
  H := MinI(Count - 1, HiIdx);
  C := H - L + 1;
  SetLength(Result, C);
  for I := 0 to C - 1 do
    Result[I] := Item[L + I];
end;

function ASingleArray.DuplicateRange(const LoIdx, HiIdx: Integer): AArray;
var I, L, H, C : Integer;
begin
  Result := ASingleArray(CreateInstance);
  L := MaxI(0, LoIdx);
  H := MinI(Count - 1, HiIdx);
  C := H - L + 1;
  ASingleArray(Result).Count := C;
  for I := 0 to C - 1 do
    ASingleArray(Result)[I] := Item[L + I];
end;

procedure ASingleArray.SetRange(const LoIdx, HiIdx: Integer; const V: SingleArray);
var I, L, H, C : Integer;
begin
  L := MaxI(0, LoIdx);
  H := MinI(Count - 1, HiIdx);
  C := MinI(Length(V), H - L + 1);
  for I := 0 to C - 1 do
    Item[L + I] := V[I];
end;

procedure ASingleArray.Fill(const Idx, Count: Integer; const Value: Single);
var I : Integer;
begin
  for I := Idx to Idx + Count - 1 do
    Item[I] := Value;
end;

function ASingleArray.AppendArray(const V: SingleArray): Integer;
begin
  Result := Count;
  Count := Result + Length(V);
  Range[Result, Count - 1] := V;
end;

function ASingleArray.CompareItems(const Idx1, Idx2: Integer): TCompareResult;
var I, J : Single;
begin
  I := Item[Idx1];
  J := Item[Idx2];
  if I < J then
    Result := crLess else
  if I > J then
    Result := crGreater else
    Result := crEqual;
end;

function ASingleArray.PosNext(const Find: Single;
    const PrevPos: Integer; const IsSortedAscending: Boolean): Integer;
var I, L, H : Integer;
    D       : Single;
begin
  if IsSortedAscending then // binary search
    begin
      if MaxI(PrevPos + 1, 0) = 0 then // find first
        begin
          L := 0;
          H := Count - 1;
          repeat
            I := (L + H) div 2;
            D := Item[I];
            if D = Find then
              begin
                while (I > 0) and (Item[I - 1] = Find) do
                  Dec(I);
                Result := I;
                exit;
              end else
            if D > Find then
              H := I - 1 else
              L := I + 1;
          until L > H;
          Result := -1;
        end else // find next
        if PrevPos >= Count - 1 then
          Result := -1 else
          if Item[PrevPos + 1] = Find then
            Result := PrevPos + 1 else
            Result := -1;
    end else // linear search
    begin
      for I := MaxI(PrevPos + 1, 0) to Count - 1 do
        if Item[I] = Find then
          begin
            Result := I;
            exit;
          end;
      Result := -1;
    end;
end;

function ASingleArray.GetAsString: AnsiString;
var I, L : Integer;
begin
  L := Count;
  if L = 0 then
    begin
      Result := '';
      exit;
    end;
  Result := FloatToStr(Item[0]);
  for I := 1 to L - 1 do
    Result := Result + ',' + FloatToStr(Item[I]);
end;

procedure ASingleArray.SetAsString(const S: AnsiString);
var F, G, L, C : Integer;
begin
  L := Length(S);
  if L = 0 then
    begin
      Count := 0;
      exit;
    end;
  L := 0;
  F := 1;
  C := Length(S);
  while F < C do
    begin
      G := 0;
      while (F + G <= C) and (S[F + G] <> ',') do
        Inc(G);
      Inc(L);
      Count := L;
      if G = 0 then
        Item[L - 1] := 0.0
      else
        Item[L - 1] := StrToFloat(Copy(S, F, G));
      Inc(F, G + 1);
    end;
end;

procedure ASingleArray.Assign(const Source: TObject);
var I, L : Integer;
begin
  if Source is ASingleArray then
    begin
      L := ASingleArray(Source).Count;
      Count := L;
      for I := 0 to L - 1 do
        Item[I] := ASingleArray(Source).Item[I];
    end else
  if Source is AInt64Array then
    begin
      L := AInt64Array(Source).Count;
      Count := L;
      for I := 0 to L - 1 do
        Item[I] := AInt64Array(Source).Item[I];
    end else
    inherited Assign(Source);
end;

function ASingleArray.IsEqual(const V: TObject): Boolean;
var I, L : Integer;
begin
  if V is ASingleArray then
    begin
      L := ASingleArray(V).Count;
      Result := L = Count;
      if not Result then
        exit;
      for I := 0 to L - 1 do
        if Item[I] <> ASingleArray(V).Item[I] then
          begin
            Result := False;
            exit;
          end;
    end else
    Result := inherited IsEqual(V);
end;

function ASingleArray.AppendArray(const V: AArray): Integer;
var I, L : Integer;
begin
  Result := Count;
  if V is ASingleArray then
    begin
      L := V.Count;
      Count := Result + L;
      for I := 0 to L - 1 do
        Item[Result + I] := ASingleArray(V)[I];
    end
  else
    RaiseTypeError(ClassName + ' can not append ' + ObjectClassName(V), nil, ESingleArray);
end;

procedure ASingleArray.Delete(const Idx: Integer; const Count: Integer);
var I, C, J, L : Integer;
begin
  J := MaxI(Idx, 0);
  C := GetCount;
  L := MinI(Count, C - J);
  if L > 0 then
    begin
      for I := J to J + C - 1 do
        SetItem(I, GetItem(I + Count));
      SetCount(C - L);
    end;
end;

procedure ASingleArray.Insert(const Idx: Integer; const Count: Integer);
var I, C, J, L : Integer;
begin
  if Count <= 0 then
    exit;
  C := GetCount;
  SetCount(C + Count);
  J := MinI(MaxI(Idx, 0), C);
  L := C - J;
  for I := C - 1 downto C - L do
    SetItem(I + Count, GetItem(I));
end;



{                                                                              }
{ ADoubleArray                                                                 }
{                                                                              }
procedure ADoubleArray.ExchangeItems(const Idx1, Idx2: Integer);
var I : Double;
begin
  I := Item[Idx1];
  Item[Idx1] := Item[Idx2];
  Item[Idx2] := I;
end;

function ADoubleArray.AppendItem(const Value: Double): Integer;
begin
  Result := Count;
  Count := Result + 1;
  Item[Result] := Value;
end;

function ADoubleArray.GetRange(const LoIdx, HiIdx: Integer): DoubleArray;
var I, L, H, C : Integer;
begin
  L := MaxI(0, LoIdx);
  H := MinI(Count - 1, HiIdx);
  C := H - L + 1;
  SetLength(Result, C);
  for I := 0 to C - 1 do
    Result[I] := Item[L + I];
end;

function ADoubleArray.DuplicateRange(const LoIdx, HiIdx: Integer): AArray;
var I, L, H, C : Integer;
begin
  Result := ADoubleArray(CreateInstance);
  L := MaxI(0, LoIdx);
  H := MinI(Count - 1, HiIdx);
  C := H - L + 1;
  ADoubleArray(Result).Count := C;
  for I := 0 to C - 1 do
    ADoubleArray(Result)[I] := Item[L + I];
end;

procedure ADoubleArray.SetRange(const LoIdx, HiIdx: Integer; const V: DoubleArray);
var I, L, H, C : Integer;
begin
  L := MaxI(0, LoIdx);
  H := MinI(Count - 1, HiIdx);
  C := MinI(Length(V), H - L + 1);
  for I := 0 to C - 1 do
    Item[L + I] := V[I];
end;

procedure ADoubleArray.Fill(const Idx, Count: Integer; const Value: Double);
var I : Integer;
begin
  for I := Idx to Idx + Count - 1 do
    Item[I] := Value;
end;

function ADoubleArray.AppendArray(const V: DoubleArray): Integer;
begin
  Result := Count;
  Count := Result + Length(V);
  Range[Result, Count - 1] := V;
end;

function ADoubleArray.CompareItems(const Idx1, Idx2: Integer): TCompareResult;
var I, J : Double;
begin
  I := Item[Idx1];
  J := Item[Idx2];
  if I < J then
    Result := crLess else
  if I > J then
    Result := crGreater else
    Result := crEqual;
end;

function ADoubleArray.PosNext(const Find: Double;
    const PrevPos: Integer; const IsSortedAscending: Boolean): Integer;
var I, L, H : Integer;
    D       : Double;
begin
  if IsSortedAscending then // binary search
    begin
      if MaxI(PrevPos + 1, 0) = 0 then // find first
        begin
          L := 0;
          H := Count - 1;
          repeat
            I := (L + H) div 2;
            D := Item[I];
            if D = Find then
              begin
                while (I > 0) and (Item[I - 1] = Find) do
                  Dec(I);
                Result := I;
                exit;
              end else
            if D > Find then
              H := I - 1 else
              L := I + 1;
          until L > H;
          Result := -1;
        end else // find next
        if PrevPos >= Count - 1 then
          Result := -1 else
          if Item[PrevPos + 1] = Find then
            Result := PrevPos + 1 else
            Result := -1;
    end else // linear search
    begin
      for I := MaxI(PrevPos + 1, 0) to Count - 1 do
        if Item[I] = Find then
          begin
            Result := I;
            exit;
          end;
      Result := -1;
    end;
end;

function ADoubleArray.GetAsString: AnsiString;
var I, L : Integer;
begin
  L := Count;
  if L = 0 then
    begin
      Result := '';
      exit;
    end;
  Result := FloatToStr(Item[0]);
  for I := 1 to L - 1 do
    Result := Result + ',' + FloatToStr(Item[I]);
end;

procedure ADoubleArray.SetAsString(const S: AnsiString);
var F, G, L, C : Integer;
begin
  L := Length(S);
  if L = 0 then
    begin
      Count := 0;
      exit;
    end;
  L := 0;
  F := 1;
  C := Length(S);
  while F < C do
    begin
      G := 0;
      while (F + G <= C) and (S[F + G] <> ',') do
        Inc(G);
      Inc(L);
      Count := L;
      if G = 0 then
        Item[L - 1] := 0.0
      else
        Item[L - 1] := StrToFloat(Copy(S, F, G));
      Inc(F, G + 1);
    end;
end;

procedure ADoubleArray.Assign(const Source: TObject);
var I, L : Integer;
begin
  if Source is ADoubleArray then
    begin
      L := ADoubleArray(Source).Count;
      Count := L;
      for I := 0 to L - 1 do
        Item[I] := ADoubleArray(Source).Item[I];
    end else
  if Source is AInt64Array then
    begin
      L := AInt64Array(Source).Count;
      Count := L;
      for I := 0 to L - 1 do
        Item[I] := AInt64Array(Source).Item[I];
    end else
    inherited Assign(Source);
end;

function ADoubleArray.IsEqual(const V: TObject): Boolean;
var I, L : Integer;
begin
  if V is ADoubleArray then
    begin
      L := ADoubleArray(V).Count;
      Result := L = Count;
      if not Result then
        exit;
      for I := 0 to L - 1 do
        if Item[I] <> ADoubleArray(V).Item[I] then
          begin
            Result := False;
            exit;
          end;
    end else
    Result := inherited IsEqual(V);
end;

function ADoubleArray.AppendArray(const V: AArray): Integer;
var I, L : Integer;
begin
  Result := Count;
  if V is ADoubleArray then
    begin
      L := V.Count;
      Count := Result + L;
      for I := 0 to L - 1 do
        Item[Result + I] := ADoubleArray(V)[I];
    end
  else
    RaiseTypeError(ClassName + ' can not append ' + ObjectClassName(V), nil, EDoubleArray);
end;

procedure ADoubleArray.Delete(const Idx: Integer; const Count: Integer);
var I, C, J, L : Integer;
begin
  J := MaxI(Idx, 0);
  C := GetCount;
  L := MinI(Count, C - J);
  if L > 0 then
    begin
      for I := J to J + C - 1 do
        SetItem(I, GetItem(I + Count));
      SetCount(C - L);
    end;
end;

procedure ADoubleArray.Insert(const Idx: Integer; const Count: Integer);
var I, C, J, L : Integer;
begin
  if Count <= 0 then
    exit;
  C := GetCount;
  SetCount(C + Count);
  J := MinI(MaxI(Idx, 0), C);
  L := C - J;
  for I := C - 1 downto C - L do
    SetItem(I + Count, GetItem(I));
end;



{                                                                              }
{ AExtendedArray                                                               }
{                                                                              }
procedure AExtendedArray.ExchangeItems(const Idx1, Idx2: Integer);
var I : Extended;
begin
  I := Item[Idx1];
  Item[Idx1] := Item[Idx2];
  Item[Idx2] := I;
end;

function AExtendedArray.AppendItem(const Value: Extended): Integer;
begin
  Result := Count;
  Count := Result + 1;
  Item[Result] := Value;
end;

function AExtendedArray.GetRange(const LoIdx, HiIdx: Integer): ExtendedArray;
var I, L, H, C : Integer;
begin
  L := MaxI(0, LoIdx);
  H := MinI(Count - 1, HiIdx);
  C := H - L + 1;
  SetLength(Result, C);
  for I := 0 to C - 1 do
    Result[I] := Item[L + I];
end;

function AExtendedArray.DuplicateRange(const LoIdx, HiIdx: Integer): AArray;
var I, L, H, C : Integer;
begin
  Result := AExtendedArray(CreateInstance);
  L := MaxI(0, LoIdx);
  H := MinI(Count - 1, HiIdx);
  C := H - L + 1;
  AExtendedArray(Result).Count := C;
  for I := 0 to C - 1 do
    AExtendedArray(Result)[I] := Item[L + I];
end;

procedure AExtendedArray.SetRange(const LoIdx, HiIdx: Integer; const V: ExtendedArray);
var I, L, H, C : Integer;
begin
  L := MaxI(0, LoIdx);
  H := MinI(Count - 1, HiIdx);
  C := MinI(Length(V), H - L + 1);
  for I := 0 to C - 1 do
    Item[L + I] := V[I];
end;

procedure AExtendedArray.Fill(const Idx, Count: Integer; const Value: Extended);
var I : Integer;
begin
  for I := Idx to Idx + Count - 1 do
    Item[I] := Value;
end;

function AExtendedArray.AppendArray(const V: ExtendedArray): Integer;
begin
  Result := Count;
  Count := Result + Length(V);
  Range[Result, Count - 1] := V;
end;

function AExtendedArray.CompareItems(const Idx1, Idx2: Integer): TCompareResult;
var I, J : Extended;
begin
  I := Item[Idx1];
  J := Item[Idx2];
  if I < J then
    Result := crLess else
  if I > J then
    Result := crGreater else
    Result := crEqual;
end;

function AExtendedArray.PosNext(const Find: Extended;
    const PrevPos: Integer; const IsSortedAscending: Boolean): Integer;
var I, L, H : Integer;
    D       : Extended;
begin
  if IsSortedAscending then // binary search
    begin
      if MaxI(PrevPos + 1, 0) = 0 then // find first
        begin
          L := 0;
          H := Count - 1;
          repeat
            I := (L + H) div 2;
            D := Item[I];
            if D = Find then
              begin
                while (I > 0) and (Item[I - 1] = Find) do
                  Dec(I);
                Result := I;
                exit;
              end else
            if D > Find then
              H := I - 1 else
              L := I + 1;
          until L > H;
          Result := -1;
        end else // find next
        if PrevPos >= Count - 1 then
          Result := -1 else
          if Item[PrevPos + 1] = Find then
            Result := PrevPos + 1 else
            Result := -1;
    end else // linear search
    begin
      for I := MaxI(PrevPos + 1, 0) to Count - 1 do
        if Item[I] = Find then
          begin
            Result := I;
            exit;
          end;
      Result := -1;
    end;
end;

function AExtendedArray.GetAsString: AnsiString;
var I, L : Integer;
begin
  L := Count;
  if L = 0 then
    begin
      Result := '';
      exit;
    end;
  Result := FloatToStr(Item[0]);
  for I := 1 to L - 1 do
    Result := Result + ',' + FloatToStr(Item[I]);
end;

procedure AExtendedArray.SetAsString(const S: AnsiString);
var F, G, L, C : Integer;
begin
  L := Length(S);
  if L = 0 then
    begin
      Count := 0;
      exit;
    end;
  L := 0;
  F := 1;
  C := Length(S);
  while F < C do
    begin
      G := 0;
      while (F + G <= C) and (S[F + G] <> ',') do
        Inc(G);
      Inc(L);
      Count := L;
      if G = 0 then
        Item[L - 1] := 0.0
      else
        Item[L - 1] := StrToFloat(Copy(S, F, G));
      Inc(F, G + 1);
    end;
end;

procedure AExtendedArray.Assign(const Source: TObject);
var I, L : Integer;
begin
  if Source is AExtendedArray then
    begin
      L := AExtendedArray(Source).Count;
      Count := L;
      for I := 0 to L - 1 do
        Item[I] := AExtendedArray(Source).Item[I];
    end else
  if Source is AInt64Array then
    begin
      L := AInt64Array(Source).Count;
      Count := L;
      for I := 0 to L - 1 do
        Item[I] := AInt64Array(Source).Item[I];
    end else
    inherited Assign(Source);
end;

function AExtendedArray.IsEqual(const V: TObject): Boolean;
var I, L : Integer;
begin
  if V is AExtendedArray then
    begin
      L := AExtendedArray(V).Count;
      Result := L = Count;
      if not Result then
        exit;
      for I := 0 to L - 1 do
        if Item[I] <> AExtendedArray(V).Item[I] then
          begin
            Result := False;
            exit;
          end;
    end else
    Result := inherited IsEqual(V);
end;

function AExtendedArray.AppendArray(const V: AArray): Integer;
var I, L : Integer;
begin
  Result := Count;
  if V is AExtendedArray then
    begin
      L := V.Count;
      Count := Result + L;
      for I := 0 to L - 1 do
        Item[Result + I] := AExtendedArray(V)[I];
    end
  else
    RaiseTypeError(ClassName + ' can not append ' + ObjectClassName(V), nil, EExtendedArray);
end;

procedure AExtendedArray.Delete(const Idx: Integer; const Count: Integer);
var I, C, J, L : Integer;
begin
  J := MaxI(Idx, 0);
  C := GetCount;
  L := MinI(Count, C - J);
  if L > 0 then
    begin
      for I := J to J + C - 1 do
        SetItem(I, GetItem(I + Count));
      SetCount(C - L);
    end;
end;

procedure AExtendedArray.Insert(const Idx: Integer; const Count: Integer);
var I, C, J, L : Integer;
begin
  if Count <= 0 then
    exit;
  C := GetCount;
  SetCount(C + Count);
  J := MinI(MaxI(Idx, 0), C);
  L := C - J;
  for I := C - 1 downto C - L do
    SetItem(I + Count, GetItem(I));
end;



{                                                                              }
{ APointerArray                                                                }
{                                                                              }
procedure APointerArray.ExchangeItems(const Idx1, Idx2: Integer);
var I : Pointer;
begin
  I := Item[Idx1];
  Item[Idx1] := Item[Idx2];
  Item[Idx2] := I;
end;

function APointerArray.AppendItem(const Value: Pointer): Integer;
begin
  Result := Count;
  Count := Result + 1;
  Item[Result] := Value;
end;

function APointerArray.GetRange(const LoIdx, HiIdx: Integer): PointerArray;
var I, L, H, C : Integer;
begin
  L := MaxI(0, LoIdx);
  H := MinI(Count - 1, HiIdx);
  C := H - L + 1;
  SetLength(Result, C);
  for I := 0 to C - 1 do
    Result[I] := Item[L + I];
end;

function APointerArray.DuplicateRange(const LoIdx, HiIdx: Integer): AArray;
var I, L, H, C : Integer;
begin
  Result := APointerArray(CreateInstance);
  L := MaxI(0, LoIdx);
  H := MinI(Count - 1, HiIdx);
  C := H - L + 1;
  APointerArray(Result).Count := C;
  for I := 0 to C - 1 do
    APointerArray(Result)[I] := Item[L + I];
end;

procedure APointerArray.SetRange(const LoIdx, HiIdx: Integer; const V: PointerArray);
var I, L, H, C : Integer;
begin
  L := MaxI(0, LoIdx);
  H := MinI(Count - 1, HiIdx);
  C := MinI(Length(V), H - L + 1);
  for I := 0 to C - 1 do
    Item[L + I] := V[I];
end;

procedure APointerArray.Fill(const Idx, Count: Integer; const Value: Pointer);
var I : Integer;
begin
  for I := Idx to Idx + Count - 1 do
    Item[I] := Value;
end;

function APointerArray.AppendArray(const V: PointerArray): Integer;
begin
  Result := Count;
  Count := Result + Length(V);
  Range[Result, Count - 1] := V;
end;

function APointerArray.CompareItems(const Idx1, Idx2: Integer): TCompareResult;
var I, J : Pointer;
begin
  I := Item[Idx1];
  J := Item[Idx2];
  if LongWord(I) < LongWord(J) then
    Result := crLess else
  if LongWord(I) > LongWord(J) then
    Result := crGreater else
    Result := crEqual;
end;

function APointerArray.PosNext(const Find: Pointer;
    const PrevPos: Integer; const IsSortedAscending: Boolean): Integer;
var I, L, H : Integer;
    D       : Pointer;
begin
  if IsSortedAscending then // binary search
    begin
      if MaxI(PrevPos + 1, 0) = 0 then // find first
        begin
          L := 0;
          H := Count - 1;
          repeat
            I := (L + H) div 2;
            D := Item[I];
            if D = Find then
              begin
                while (I > 0) and (Item[I - 1] = Find) do
                  Dec(I);
                Result := I;
                exit;
              end else
            if LongWord(D) > LongWord(Find) then
              H := I - 1 else
              L := I + 1;
          until L > H;
          Result := -1;
        end else // find next
        if PrevPos >= Count - 1 then
          Result := -1 else
          if Item[PrevPos + 1] = Find then
            Result := PrevPos + 1 else
            Result := -1;
    end else // linear search
    begin
      for I := MaxI(PrevPos + 1, 0) to Count - 1 do
        if Item[I] = Find then
          begin
            Result := I;
            exit;
          end;
      Result := -1;
    end;
end;

function APointerArray.GetAsString: AnsiString;
var I, L : Integer;
begin
  L := Count;
  if L = 0 then
    begin
      Result := '';
      exit;
    end;
  Result := PointerToStr(Item[0]);
  for I := 1 to L - 1 do
    Result := Result + ',' + PointerToStr(Item[I]);
end;

procedure APointerArray.SetAsString(const S: AnsiString);
var F, G, L, C : Integer;
begin
  L := Length(S);
  if L = 0 then
    begin
      Count := 0;
      exit;
    end;
  L := 0;
  F := 1;
  C := Length(S);
  while F < C do
    begin
      G := 0;
      while (F + G <= C) and (S[F + G] <> ',') do
        Inc(G);
      Inc(L);
      Count := L;
      if G = 0 then
        Item[L - 1] := nil
      else
        Item[L - 1] := StrToPointer(Copy(S, F, G));
      Inc(F, G + 1);
    end;
end;

procedure APointerArray.Assign(const Source: TObject);
var I, L : Integer;
begin
  if Source is APointerArray then
    begin
      L := APointerArray(Source).Count;
      Count := L;
      for I := 0 to L - 1 do
        Item[I] := APointerArray(Source).Item[I];
    end else
    inherited Assign(Source);
end;

function APointerArray.IsEqual(const V: TObject): Boolean;
var I, L : Integer;
begin
  if V is APointerArray then
    begin
      L := APointerArray(V).Count;
      Result := L = Count;
      if not Result then
        exit;
      for I := 0 to L - 1 do
        if Item[I] <> APointerArray(V).Item[I] then
          begin
            Result := False;
            exit;
          end;
    end else
    Result := inherited IsEqual(V);
end;

function APointerArray.AppendArray(const V: AArray): Integer;
var I, L : Integer;
begin
  Result := Count;
  if V is APointerArray then
    begin
      L := V.Count;
      Count := Result + L;
      for I := 0 to L - 1 do
        Item[Result + I] := APointerArray(V)[I];
    end
  else
    RaiseTypeError(ClassName + ' can not append ' + ObjectClassName(V), nil, EPointerArray);
end;

procedure APointerArray.Delete(const Idx: Integer; const Count: Integer);
var I, C, J, L : Integer;
begin
  J := MaxI(Idx, 0);
  C := GetCount;
  L := MinI(Count, C - J);
  if L > 0 then
    begin
      for I := J to J + C - 1 do
        SetItem(I, GetItem(I + Count));
      SetCount(C - L);
    end;
end;

procedure APointerArray.Insert(const Idx: Integer; const Count: Integer);
var I, C, J, L : Integer;
begin
  if Count <= 0 then
    exit;
  C := GetCount;
  SetCount(C + Count);
  J := MinI(MaxI(Idx, 0), C);
  L := C - J;
  for I := C - 1 downto C - L do
    SetItem(I + Count, GetItem(I));
end;



{                                                                              }
{ AAnsiStringArray                                                             }
{                                                                              }
procedure AAnsiStringArray.ExchangeItems(const Idx1, Idx2: Integer);
var I : AnsiString;
begin
  I := Item[Idx1];
  Item[Idx1] := Item[Idx2];
  Item[Idx2] := I;
end;

function AAnsiStringArray.AppendItem(const Value: AnsiString): Integer;
begin
  Result := Count;
  Count := Result + 1;
  Item[Result] := Value;
end;

function AAnsiStringArray.GetRange(const LoIdx, HiIdx: Integer): AnsiStringArray;
var I, L, H, C : Integer;
begin
  L := MaxI(0, LoIdx);
  H := MinI(Count - 1, HiIdx);
  C := H - L + 1;
  SetLength(Result, C);
  for I := 0 to C - 1 do
    Result[I] := Item[L + I];
end;

function AAnsiStringArray.DuplicateRange(const LoIdx, HiIdx: Integer): AArray;
var I, L, H, C : Integer;
begin
  Result := AAnsiStringArray(CreateInstance);
  L := MaxI(0, LoIdx);
  H := MinI(Count - 1, HiIdx);
  C := H - L + 1;
  AAnsiStringArray(Result).Count := C;
  for I := 0 to C - 1 do
    AAnsiStringArray(Result)[I] := Item[L + I];
end;

procedure AAnsiStringArray.SetRange(const LoIdx, HiIdx: Integer; const V: AnsiStringArray);
var I, L, H, C : Integer;
begin
  L := MaxI(0, LoIdx);
  H := MinI(Count - 1, HiIdx);
  C := MinI(Length(V), H - L + 1);
  for I := 0 to C - 1 do
    Item[L + I] := V[I];
end;

procedure AAnsiStringArray.Fill(const Idx, Count: Integer; const Value: AnsiString);
var I : Integer;
begin
  for I := Idx to Idx + Count - 1 do
    Item[I] := Value;
end;

function AAnsiStringArray.AppendArray(const V: AnsiStringArray): Integer;
begin
  Result := Count;
  Count := Result + Length(V);
  Range[Result, Count - 1] := V;
end;

function AAnsiStringArray.CompareItems(const Idx1, Idx2: Integer): TCompareResult;
var I, J : AnsiString;
begin
  I := Item[Idx1];
  J := Item[Idx2];
  if I < J then
    Result := crLess else
  if I > J then
    Result := crGreater else
    Result := crEqual;
end;

function AAnsiStringArray.PosNext(const Find: AnsiString;
    const PrevPos: Integer; const IsSortedAscending: Boolean): Integer;
var I, L, H : Integer;
    D       : AnsiString;
begin
  if IsSortedAscending then // binary search
    begin
      if MaxI(PrevPos + 1, 0) = 0 then // find first
        begin
          L := 0;
          H := Count - 1;
          repeat
            I := (L + H) div 2;
            D := Item[I];
            if D = Find then
              begin
                while (I > 0) and (Item[I - 1] = Find) do
                  Dec(I);
                Result := I;
                exit;
              end else
            if D > Find then
              H := I - 1 else
              L := I + 1;
          until L > H;
          Result := -1;
        end else // find next
        if PrevPos >= Count - 1 then
          Result := -1 else
          if Item[PrevPos + 1] = Find then
            Result := PrevPos + 1 else
            Result := -1;
    end else // linear search
    begin
      for I := MaxI(PrevPos + 1, 0) to Count - 1 do
        if Item[I] = Find then
          begin
            Result := I;
            exit;
          end;
      Result := -1;
    end;
end;

function AAnsiStringArray.GetAsString: AnsiString;
var I, L : Integer;
begin
  L := Count;
  if L = 0 then
    begin
      Result := '';
      exit;
    end;
  Result := StrQuoteA(Item[0]);
  for I := 1 to L - 1 do
    Result := Result + ',' + StrQuoteA(Item[I]);
end;

procedure AAnsiStringArray.SetAsString(const S: AnsiString);
var F, G, L, C : Integer;
begin
  L := Length(S);
  if L = 0 then
    begin
      Count := 0;
      exit;
    end;
  L := 0;
  F := 1;
  C := Length(S);
  while F < C do
    begin
      G := 0;
      while (F + G <= C) and (S[F + G] <> ',') do
        Inc(G);
      Inc(L);
      Count := L;
      if G = 0 then
        Item[L - 1] := ''
      else
        Item[L - 1] := StrUnquoteA(Copy(S, F, G));
      Inc(F, G + 1);
    end;
end;

procedure AAnsiStringArray.Assign(const Source: TObject);
var I, L : Integer;
begin
  if Source is AAnsiStringArray then
    begin
      L := AAnsiStringArray(Source).Count;
      Count := L;
      for I := 0 to L - 1 do
        Item[I] := AAnsiStringArray(Source).Item[I];
    end else
    inherited Assign(Source);
end;

function AAnsiStringArray.IsEqual(const V: TObject): Boolean;
var I, L : Integer;
begin
  if V is AAnsiStringArray then
    begin
      L := AAnsiStringArray(V).Count;
      Result := L = Count;
      if not Result then
        exit;
      for I := 0 to L - 1 do
        if Item[I] <> AAnsiStringArray(V).Item[I] then
          begin
            Result := False;
            exit;
          end;
    end else
    Result := inherited IsEqual(V);
end;

function AAnsiStringArray.AppendArray(const V: AArray): Integer;
var I, L : Integer;
begin
  Result := Count;
  if V is AAnsiStringArray then
    begin
      L := V.Count;
      Count := Result + L;
      for I := 0 to L - 1 do
        Item[Result + I] := AAnsiStringArray(V)[I];
    end
  else
    RaiseTypeError(ClassName + ' can not append ' + ObjectClassName(V), nil, EAnsiStringArray);
end;

procedure AAnsiStringArray.Delete(const Idx: Integer; const Count: Integer);
var I, C, J, L : Integer;
begin
  J := MaxI(Idx, 0);
  C := GetCount;
  L := MinI(Count, C - J);
  if L > 0 then
    begin
      for I := J to J + C - 1 do
        SetItem(I, GetItem(I + Count));
      SetCount(C - L);
    end;
end;

procedure AAnsiStringArray.Insert(const Idx: Integer; const Count: Integer);
var I, C, J, L : Integer;
begin
  if Count <= 0 then
    exit;
  C := GetCount;
  SetCount(C + Count);
  J := MinI(MaxI(Idx, 0), C);
  L := C - J;
  for I := C - 1 downto C - L do
    SetItem(I + Count, GetItem(I));
end;



{                                                                              }
{ AWideStringArray                                                             }
{                                                                              }
procedure AWideStringArray.ExchangeItems(const Idx1, Idx2: Integer);
var I : WideString;
begin
  I := Item[Idx1];
  Item[Idx1] := Item[Idx2];
  Item[Idx2] := I;
end;

function AWideStringArray.AppendItem(const Value: WideString): Integer;
begin
  Result := Count;
  Count := Result + 1;
  Item[Result] := Value;
end;

function AWideStringArray.GetRange(const LoIdx, HiIdx: Integer): WideStringArray;
var I, L, H, C : Integer;
begin
  L := MaxI(0, LoIdx);
  H := MinI(Count - 1, HiIdx);
  C := H - L + 1;
  SetLength(Result, C);
  for I := 0 to C - 1 do
    Result[I] := Item[L + I];
end;

function AWideStringArray.DuplicateRange(const LoIdx, HiIdx: Integer): AArray;
var I, L, H, C : Integer;
begin
  Result := AWideStringArray(CreateInstance);
  L := MaxI(0, LoIdx);
  H := MinI(Count - 1, HiIdx);
  C := H - L + 1;
  AWideStringArray(Result).Count := C;
  for I := 0 to C - 1 do
    AWideStringArray(Result)[I] := Item[L + I];
end;

procedure AWideStringArray.SetRange(const LoIdx, HiIdx: Integer; const V: WideStringArray);
var I, L, H, C : Integer;
begin
  L := MaxI(0, LoIdx);
  H := MinI(Count - 1, HiIdx);
  C := MinI(Length(V), H - L + 1);
  for I := 0 to C - 1 do
    Item[L + I] := V[I];
end;

procedure AWideStringArray.Fill(const Idx, Count: Integer; const Value: WideString);
var I : Integer;
begin
  for I := Idx to Idx + Count - 1 do
    Item[I] := Value;
end;

function AWideStringArray.AppendArray(const V: WideStringArray): Integer;
begin
  Result := Count;
  Count := Result + Length(V);
  Range[Result, Count - 1] := V;
end;

function AWideStringArray.CompareItems(const Idx1, Idx2: Integer): TCompareResult;
var I, J : WideString;
begin
  I := Item[Idx1];
  J := Item[Idx2];
  if I < J then
    Result := crLess else
  if I > J then
    Result := crGreater else
    Result := crEqual;
end;

function AWideStringArray.PosNext(const Find: WideString;
    const PrevPos: Integer; const IsSortedAscending: Boolean): Integer;
var I, L, H : Integer;
    D       : WideString;
begin
  if IsSortedAscending then // binary search
    begin
      if MaxI(PrevPos + 1, 0) = 0 then // find first
        begin
          L := 0;
          H := Count - 1;
          repeat
            I := (L + H) div 2;
            D := Item[I];
            if D = Find then
              begin
                while (I > 0) and (Item[I - 1] = Find) do
                  Dec(I);
                Result := I;
                exit;
              end else
            if D > Find then
              H := I - 1 else
              L := I + 1;
          until L > H;
          Result := -1;
        end else // find next
        if PrevPos >= Count - 1 then
          Result := -1 else
          if Item[PrevPos + 1] = Find then
            Result := PrevPos + 1 else
            Result := -1;
    end else // linear search
    begin
      for I := MaxI(PrevPos + 1, 0) to Count - 1 do
        if Item[I] = Find then
          begin
            Result := I;
            exit;
          end;
      Result := -1;
    end;
end;

procedure AWideStringArray.Assign(const Source: TObject);
var I, L : Integer;
begin
  if Source is AWideStringArray then
    begin
      L := AWideStringArray(Source).Count;
      Count := L;
      for I := 0 to L - 1 do
        Item[I] := AWideStringArray(Source).Item[I];
    end else
    inherited Assign(Source);
end;

function AWideStringArray.IsEqual(const V: TObject): Boolean;
var I, L : Integer;
begin
  if V is AWideStringArray then
    begin
      L := AWideStringArray(V).Count;
      Result := L = Count;
      if not Result then
        exit;
      for I := 0 to L - 1 do
        if Item[I] <> AWideStringArray(V).Item[I] then
          begin
            Result := False;
            exit;
          end;
    end else
    Result := inherited IsEqual(V);
end;

function AWideStringArray.AppendArray(const V: AArray): Integer;
var I, L : Integer;
begin
  Result := Count;
  if V is AWideStringArray then
    begin
      L := V.Count;
      Count := Result + L;
      for I := 0 to L - 1 do
        Item[Result + I] := AWideStringArray(V)[I];
    end
  else
    RaiseTypeError(ClassName + ' can not append ' + ObjectClassName(V), nil, EWideStringArray);
end;

procedure AWideStringArray.Delete(const Idx: Integer; const Count: Integer);
var I, C, J, L : Integer;
begin
  J := MaxI(Idx, 0);
  C := GetCount;
  L := MinI(Count, C - J);
  if L > 0 then
    begin
      for I := J to J + C - 1 do
        SetItem(I, GetItem(I + Count));
      SetCount(C - L);
    end;
end;

procedure AWideStringArray.Insert(const Idx: Integer; const Count: Integer);
var I, C, J, L : Integer;
begin
  if Count <= 0 then
    exit;
  C := GetCount;
  SetCount(C + Count);
  J := MinI(MaxI(Idx, 0), C);
  L := C - J;
  for I := C - 1 downto C - L do
    SetItem(I + Count, GetItem(I));
end;



{                                                                              }
{ AObjectArray                                                                 }
{                                                                              }
procedure AObjectArray.Clear;
begin
  if IsItemOwner then
    FreeItems
  else
    ReleaseItems;
end;

procedure AObjectArray.Assign(const Source: TObject);
var I, L : Integer;
    V    : TObject;
begin
  if Source is AObjectArray then
    begin
      FreeItems;
      IsItemOwner := AObjectArray(Source).IsItemOwner;
      L := AObjectArray(Source).Count;
      Count := L;
      if GetIsItemOwner then
        for I := 0 to L - 1 do
          begin
            V := AObjectArray(Source)[I];
            if V is AArray then
              Item[I] := AArray(V).Duplicate else
              Item[I] := V;
          end
      else
        for I := 0 to L - 1 do
          Item[I] := AObjectArray(Source)[I];
    end else
    inherited Assign(Source);
end;

function AObjectArray.IsEqual(const V: TObject): Boolean;
var I, L : Integer;
    A, B : TObject;
begin
  if V is AObjectArray then
    begin
      L := AArray(V).Count;
      if Count <> L then
        begin
          Result := False;
          exit;
        end;
      for I := 0 to L - 1 do
        begin
          A := Item[I];
          B := AObjectArray(V)[I];
          Result := A = B;
          if not Result then
            exit;
          end;
      Result := True;
    end else
    Result := inherited IsEqual(V);
end;

function AObjectArray.Compare(const V: TObject): TCompareResult;
var I, C1, C2 : Integer;
    A, B : TObject;
begin
  if V is AObjectArray then
    begin
      C1 := GetCount;
      C2 := AObjectArray(V).GetCount;
      if C1 < C2 then
        Result := crLess else
      if C1 > C2 then
        Result := crGreater else
        begin
          Result := crEqual;
          for I := 0 to GetCount - 1 do
            begin
              A := Item[I];
              B := AObjectArray(V)[I];
              if A <> B then
                begin
                  Result := crUndefined;
                  exit;
                end;
            end;
        end;
    end else
    Result := inherited Compare(V);
end;

function AObjectArray.GetRange(const LoIdx, HiIdx: Integer): ObjectArray;
var I, L, H, C : Integer;
begin
  L := MaxI(0, LoIdx);
  H := MinI(Count - 1, HiIdx);
  C := H - L  + 1;
  SetLength(Result, C);
  for I := 0 to C - 1 do
    Result[L + I] := Item[I];
end;

procedure AObjectArray.SetRange(const LoIdx, HiIdx: Integer; const V: ObjectArray);
var I, L, H, C : Integer;
begin
  L := MaxI(0, LoIdx);
  H := MinI(Count - 1, HiIdx);
  C := MinI(Length(V), H - L  + 1);
  for I := 0 to C - 1 do
    Item[L + I] := V[I];
end;

function AObjectArray.GetAsString: AnsiString;
var I, L : Integer;
    V : TObject;
begin
  Result := '';
  L := Count;
  for I := 0 to L - 1 do
    begin
      V := Item[I];
      Result := Result + PointerToStr(V);
      if I < L - 1 then
        Result := Result + ',';
    end;
end;

procedure AObjectArray.ExchangeItems(const Idx1, Idx2: Integer);
var I : TObject;
begin
  I := Item[Idx1];
  Item[Idx1] := Item[Idx2];
  Item[Idx2] := I;
end;

function AObjectArray.AppendItem(const Value: TObject): Integer;
begin
  Result := Count;
  Count := Result + 1;
  Item[Result] := Value;
end;

function AObjectArray.AppendArray(const V: ObjectArray): Integer;
begin
  Result := Count;
  Count := Result + Length(V);
  Range[Result, Count - 1] := V;
end;

{$WARNINGS OFF}
function AObjectArray.AppendArray(const V: AArray): Integer;
var I, L : Integer;
begin
  if V is AObjectArray then
    begin
      Result := Count;
      L := V.Count;
      Count := Result + L;
      for I := 0 to L - 1 do
        Item[Result + I] := AObjectArray(V)[I];
    end
  else
    RaiseTypeError(ClassName + ' can not append ' + ObjectClassName(V), nil, EObjectArray);
end;
{$IFDEF DEBUG}{$IFNDEF FREEPASCAL}{$WARNINGS ON}{$ENDIF}{$ENDIF}

procedure AObjectArray.Delete(const Idx, Count: Integer);
var I, C, J, L : Integer;
begin
  J := MaxI(Idx, 0);
  C := GetCount;
  L := MinI(Count, C - J);
  if L > 0 then
    begin
      for I := J to J + C - 1 do
        SetItem(Idx + I, GetItem(Idx + Count + I));
      SetCount(C - L);
    end;
end;

function AObjectArray.PosNext(const Find: TObject; const PrevPos: Integer): Integer;
var I : Integer;
begin
  for I := MaxI(PrevPos + 1, 0) to Count - 1 do
    if Find = Item[I] then
      begin
        Result := I;
        exit;
      end;
  Result := -1;
end;

function AObjectArray.PosNext(var Item: TObject; const ClassType: TClass;
    const PrevPos: Integer): Integer;
var I : Integer;
begin
  for I := MaxI(PrevPos + 1, 0) to Count - 1 do
    begin
      Item := GetItem(I);
      if Item.InheritsFrom(ClassType) then
        begin
          Result := I;
          exit;
        end;
    end;
  Item := nil;
  Result := -1;
end;

function AObjectArray.PosNext(var Item: TObject; const ClassName: String;
    const PrevPos: Integer): Integer;
var I : Integer;
begin
  for I := MaxI(PrevPos + 1, 0) to Count - 1 do
    begin
      Item := GetItem(I);
      if Assigned(Item) and Item.ClassNameIs(ClassName) then
        begin
          Result := I;
          exit;
        end;
    end;
  Item := nil;
  Result := -1;
end;

function AObjectArray.Find(const ClassType: TClass; const Count: Integer): TObject;
var I, J : Integer;
begin
  Result := nil;
  I := -1;
  for J := 1 to Count do
    begin
      I := PosNext(Result, ClassType, I);
      if I = -1 then
        break;
    end;
end;

function AObjectArray.Find(const ClassName: String; const Count: Integer): TObject;
var I, J : Integer;
begin
  Result := nil;
  I := -1;
  for J := 1 to Count do
    begin
      I := PosNext(Result, ClassName, I);
      if I = -1 then
        break;
    end;
end;

function AObjectArray.FindAll(const ClassType: TClass): ObjectArray;
var I : Integer;
    V : TObject;
begin
  SetLength(Result, 0);
  I := PosNext(V, ClassType);
  while I >= 0 do
    begin
      Append(Result, V);
      I := PosNext(V, ClassType, I);
    end;
end;

function AObjectArray.FindAll(const ClassName: String): ObjectArray;
var I : Integer;
    V : TObject;
begin
  SetLength(Result, 0);
  I := PosNext(V, ClassName);
  while I >= 0 do
    begin
      Append(Result, V);
      I := PosNext(V, ClassName, I);
    end;
end;

function AObjectArray.CountItems(const ClassType: TClass): Integer;
var I : Integer;
    V : TObject;
begin
  Result := 0;
  I := PosNext(V, ClassType);
  while I >= 0 do
    begin
      Inc(Result);
      I := PosNext(V, ClassType, I);
    end;
end;

function AObjectArray.CountItems(const ClassName: String): Integer;
var I : Integer;
    V : TObject;
begin
  Result := 0;
  I := PosNext(V, ClassName);
  while I >= 0 do
    begin
      Inc(Result);
      I := PosNext(V, ClassName, I);
    end;
end;

function AObjectArray.CompareItems(const Idx1, Idx2: Integer): TCompareResult;
var A, B : TObject;
begin
  A := Item[Idx1];
  B := Item[Idx2];
  if A = B then
    Result := crEqual else
    Result := crUndefined;
end;

function AObjectArray.DeleteValue(const Value: TObject): Boolean;
var I : Integer;
begin
  I := PosNext(Value, -1);
  Result := I >= 0;
  if Result then
    Delete(I, 1);
end;

function AObjectArray.DeleteAll(const Value: TObject): Integer;
begin
  Result := 0;
  while DeleteValue(Value) do
    Inc(Result);
end;

function AObjectArray.ReleaseValue(const Value: TObject): Boolean;
var I : Integer;
begin
  I := PosNext(Value, -1);
  Result := I >= 0;
  if Result then
    ReleaseItem(I);
end;

function AObjectArray.RemoveItem(const Idx: Integer): TObject;
begin
  Result := ReleaseItem(Idx);
  Delete(Idx, 1);
end;

function AObjectArray.RemoveValue(const Value: TObject): Boolean;
var I : Integer;
begin
  I := PosNext(Value, -1);
  Result := I >= 0;
  if Result then
    RemoveItem(I);
end;



{                                                                              }
{ AInterfaceArray                                                              }
{                                                                              }
procedure AInterfaceArray.ExchangeItems(const Idx1, Idx2: Integer);
var I : IInterface;
begin
  I := Item[Idx1];
  Item[Idx1] := Item[Idx2];
  Item[Idx2] := I;
end;

function AInterfaceArray.AppendItem(const Value: IInterface): Integer;
begin
  Result := Count;
  Count := Result + 1;
  Item[Result] := Value;
end;

function AInterfaceArray.GetRange(const LoIdx, HiIdx: Integer): InterfaceArray;
var I, L, H, C : Integer;
begin
  L := MaxI(0, LoIdx);
  H := MinI(Count - 1, HiIdx);
  C := H - L + 1;
  SetLength(Result, C);
  for I := 0 to C - 1 do
    Result[I] := Item[L + I];
end;

function AInterfaceArray.DuplicateRange(const LoIdx, HiIdx: Integer): AArray;
var I, L, H, C : Integer;
begin
  Result := AInterfaceArray(CreateInstance);
  L := MaxI(0, LoIdx);
  H := MinI(Count - 1, HiIdx);
  C := H - L + 1;
  AInterfaceArray(Result).Count := C;
  for I := 0 to C - 1 do
    AInterfaceArray(Result)[I] := Item[L + I];
end;

procedure AInterfaceArray.SetRange(const LoIdx, HiIdx: Integer; const V: InterfaceArray);
var I, L, H, C : Integer;
begin
  L := MaxI(0, LoIdx);
  H := MinI(Count - 1, HiIdx);
  C := MinI(Length(V), H - L + 1);
  for I := 0 to C - 1 do
    Item[L + I] := V[I];
end;

procedure AInterfaceArray.Fill(const Idx, Count: Integer; const Value: IInterface);
var I : Integer;
begin
  for I := Idx to Idx + Count - 1 do
    Item[I] := Value;
end;

function AInterfaceArray.AppendArray(const V: InterfaceArray): Integer;
begin
  Result := Count;
  Count := Result + Length(V);
  Range[Result, Count - 1] := V;
end;

function AInterfaceArray.CompareItems(const Idx1, Idx2: Integer): TCompareResult;
var I, J : IInterface;
begin
  I := Item[Idx1];
  J := Item[Idx2];
  if LongWord(I) < LongWord(J) then
    Result := crLess else
  if LongWord(I) > LongWord(J) then
    Result := crGreater else
    Result := crEqual;
end;

function AInterfaceArray.PosNext(const Find: IInterface;
    const PrevPos: Integer; const IsSortedAscending: Boolean): Integer;
var I, L, H : Integer;
    D       : IInterface;
begin
  if IsSortedAscending then // binary search
    begin
      if MaxI(PrevPos + 1, 0) = 0 then // find first
        begin
          L := 0;
          H := Count - 1;
          repeat
            I := (L + H) div 2;
            D := Item[I];
            if D = Find then
              begin
                while (I > 0) and (Item[I - 1] = Find) do
                  Dec(I);
                Result := I;
                exit;
              end else
            if LongWord(D) > LongWord(Find) then
              H := I - 1 else
              L := I + 1;
          until L > H;
          Result := -1;
        end else // find next
        if PrevPos >= Count - 1 then
          Result := -1 else
          if Item[PrevPos + 1] = Find then
            Result := PrevPos + 1 else
            Result := -1;
    end else // linear search
    begin
      for I := MaxI(PrevPos + 1, 0) to Count - 1 do
        if Item[I] = Find then
          begin
            Result := I;
            exit;
          end;
      Result := -1;
    end;
end;

procedure AInterfaceArray.Assign(const Source: TObject);
var I, L : Integer;
begin
  if Source is AInterfaceArray then
    begin
      L := AInterfaceArray(Source).Count;
      Count := L;
      for I := 0 to L - 1 do
        Item[I] := AInterfaceArray(Source).Item[I];
    end else
    inherited Assign(Source);
end;

function AInterfaceArray.IsEqual(const V: TObject): Boolean;
var I, L : Integer;
begin
  if V is AInterfaceArray then
    begin
      L := AInterfaceArray(V).Count;
      Result := L = Count;
      if not Result then
        exit;
      for I := 0 to L - 1 do
        if Item[I] <> AInterfaceArray(V).Item[I] then
          begin
            Result := False;
            exit;
          end;
    end else
    Result := inherited IsEqual(V);
end;

function AInterfaceArray.AppendArray(const V: AArray): Integer;
var I, L : Integer;
begin
  Result := Count;
  if V is AInterfaceArray then
    begin
      L := V.Count;
      Count := Result + L;
      for I := 0 to L - 1 do
        Item[Result + I] := AInterfaceArray(V)[I];
    end
  else
    RaiseTypeError(ClassName + ' can not append ' + ObjectClassName(V), nil, EInterfaceArray);
end;

procedure AInterfaceArray.Delete(const Idx: Integer; const Count: Integer);
var I, C, J, L : Integer;
begin
  J := MaxI(Idx, 0);
  C := GetCount;
  L := MinI(Count, C - J);
  if L > 0 then
    begin
      for I := J to J + C - 1 do
        SetItem(I, GetItem(I + Count));
      SetCount(C - L);
    end;
end;

procedure AInterfaceArray.Insert(const Idx: Integer; const Count: Integer);
var I, C, J, L : Integer;
begin
  if Count <= 0 then
    exit;
  C := GetCount;
  SetCount(C + Count);
  J := MinI(MaxI(Idx, 0), C);
  L := C - J;
  for I := C - 1 downto C - L do
    SetItem(I + Count, GetItem(I));
end;



{                                                                              }
{ ABitArray                                                                    }
{                                                                              }
function ABitArray.GetRangeL(const Idx: Integer): LongWord;
var I : Integer;
begin
  Result := 0;
  for I := 0 to BitsPerLongWord - 1 do
    if Bit[Idx + I] then
      Result := Result or BitMaskTable[I];
end;

procedure ABitArray.SetRangeL(const Idx: Integer; const Value: LongWord);
var I : Integer;
    C : LongWord;
begin
  C := 1;
  for I := Idx to Idx + BitsPerLongWord - 1 do
    begin
      Bit[I] := Value and C <> 0;
      C := C shl 1;
    end;
end;

procedure ABitArray.Fill(const Idx, Count: Integer; const Value: Boolean);
var I : Integer;
begin
  for I := Idx to Idx + Count - 1 do
    Bit[I] := Value;
end;

function ABitArray.IsRange(const LoIdx, HiIdx: Integer; const Value: Boolean): Boolean;
var I : Integer;
begin
  for I := LoIdx to HiIdx do
    if Bit[I] <> Value then
      begin
        Result := False;
        exit;
      end;
  Result := True;
end;

procedure ABitArray.Assign(const Source: TObject);
var I, L : Integer;
begin
  if Source is ABitArray then
    begin
      L := AArray(Source).Count;
      Count := L;
      for I := 0 to L - 1 do
        Bit[I] := ABitArray(Source)[I];
    end
  else
    inherited Assign(Source);
end;

function ABitArray.IsEqual(const V: TObject): Boolean;
var I, L : Integer;
begin
  if V is ABitArray then
    begin
      L := AArray(V).Count;
      if Count <> L then
        begin
          Result := False;
          exit;
        end;
      for I := 0 to L - 1 do
        if Bit[I] <> ABitArray(V)[I] then
          begin
            Result := False;
            exit;
          end;
      Result := True;
    end
  else
    Result := inherited IsEqual(V);
end;

procedure ABitArray.ExchangeItems(const Idx1, Idx2: Integer);
var I : Boolean;
begin
  I := Bit[Idx1];
  Bit[Idx1] := Bit[Idx2];
  Bit[Idx2] := I;
end;

function ABitArray.AppendItem(const Value: Boolean): Integer;
begin
  Result := Count;
  Count := Result + 1;
  Bit[Result] := Value;
end;

function ABitArray.CompareItems(const Idx1, Idx2: Integer): TCompareResult;
begin
  Result := cUtils.Compare(Bit[Idx1], Bit[Idx2]);
end;

procedure ABitArray.Invert;
var I : Integer;
begin
  for I := 0 to Count - 1 do
    Bit[I] := not Bit[I];
end;

function ABitArray.Find(const Value: Boolean; const Start: Integer): Integer;
var I, C : Integer;
begin
  if Start < 0 then
    I := 0
  else
    I := Start;
  C := Count;
  while I < C do
    if Bit[I] = Value then
      begin
        Result := I;
        exit;
      end
    else
      Inc(I);
  Result := -1;
end;

function ABitArray.FindRange(const Value: Boolean; const Start: Integer;
    const Count: Integer): Integer;
var I, C, F : Integer;
begin
  if Count <= 0 then
    begin
      Result := -1;
      exit;
    end;
  if Start < 0 then
    I := 0
  else
    I := Start;
  C := self.Count;
  F := 0;
  while I + F < C do
    if Bit[I + F] = Value then
      begin
        Inc(F);
        if F = Count then
          begin
            Result := I;
            exit;
          end;
      end
    else
      begin
        Inc(I, F + 1);
        F := 0;
      end;
  Result := -1;
end;

procedure ABitArray.Delete(const Idx: Integer; const Count: Integer);
var I, C : Integer;
begin
  C := GetCount;
  {$IFOPT R+}
  if (Idx < 0) or (Idx + Count > C) then
    RaiseIndexError(Idx);
  {$ENDIF}
  for I := Idx + Count to C - 1 do
    SetBit(I - Count, GetBit(I));
  SetCount(C - Count);
end;

procedure ABitArray.Insert(const Idx: Integer; const Count: Integer);
var I, C : Integer;
begin
  C := GetCount;
  {$IFOPT R+}
  if (Idx < 0) or (Idx > C) then
    RaiseIndexError(Idx);
  {$ENDIF}
  SetCount(C + Count);
  for I := Idx to C - 1 do
    SetBit(I + Count, GetBit(I));
  Fill(Idx, Idx + Count - 1, False);
end;

function ABitArray.DuplicateRange(const LoIdx, HiIdx: Integer): AArray;
var I, C : Integer;
begin
  C := GetCount;
  {$IFOPT R+}
  if (LoIdx < 0) or (LoIdx > HiIdx) or (HiIdx >= C) then
    RaiseIndexError(HiIdx);
  {$ENDIF}
  Result := ABitArray(CreateInstance);
  C := HiIdx - LoIdx + 1;
  Result.Count := C;
  for I := 0 to C - 1 do
    ABitArray(Result)[I] := GetBit(LoIdx + I);
end;

function ABitArray.AppendArray(const V: AArray): Integer;
var I, C : Integer;
begin
  if V is ABitArray then
    begin
      Result := Count;
      C := ABitArray(V).Count;
      if C = 0 then
        exit;
      SetCount(Result + C);
      for I := 0 to C - 1 do
        SetBit(Result + I, ABitArray(V).GetBit(I));
    end
  else
    begin
      RaiseTypeError(ClassName + ' can not append ' + ObjectClassName(V), nil, EBitArray);
      Result := -1;
    end;
end;



{                                                                              }
{ ARRAY IMPLEMENTATIONS                                                        }
{                                                                              }
{   Memory allocation strategy to reduce memory copies:                        }
{     * For first allocation: allocate the exact size.                         }
{     * For change to < 16: allocate 16 entries.                               }
{     * For growing to >= 16: pre-allocate 1/8th of NewCount.                  }
{     * For shrinking blocks: shrink actual allocation when Count is less      }
{          than half of the allocated size.                                    }
{                                                                              }

{                                                                              }
{ TLongIntArray                                                                }
{                                                                              }
function TLongIntArray.GetItem(const Idx: Integer): LongInt;
begin
  {$IFOPT R+}
  if (Idx < 0) or (Idx >= FCount) then
    RaiseIndexError(Idx);
  {$ENDIF}
  Result := FData[Idx];
end;

procedure TLongIntArray.SetItem(const Idx: Integer; const Value: LongInt);
begin
  {$IFOPT R+}
  if (Idx < 0) or (Idx >= FCount) then
    RaiseIndexError(Idx);
  {$ENDIF}
  FData[Idx] := Value;
end;

procedure TLongIntArray.ExchangeItems(const Idx1, Idx2: Integer);
var I : LongInt;
begin
  {$IFOPT R+}
  if (Idx1 < 0) or (Idx1 >= FCount) then
    RaiseIndexError(Idx1);
  if (Idx2 < 0) or (Idx2 >= FCount) then
    RaiseIndexError(Idx2);
  {$ENDIF}
  I := FData[Idx1];
  FData[Idx1] := FData[Idx2];
  FData[Idx2] := I;
end;

function TLongIntArray.GetCount: Integer;
begin
  Result := FCount;
end;

procedure TLongIntArray.SetCount(const NewCount: Integer);
var L, N : Integer;
begin
  N := NewCount;
  if FCount = N then
    exit;
  FCount := N;
  L := FCapacity;
  if L > 0 then
    if N < 16 then
      N := 16 else
    if N > L then
      N := N + N shr 3 else
    if N > L shr 1 then
      exit;
  if N <> L then
    begin
      SetLengthAndZero(FData, N);
      FCapacity := N;
    end;
end;

function TLongIntArray.AppendItem(const Value: LongInt): Integer;
begin
  Result := FCount;
  if Result >= FCapacity then
    SetCount(Result + 1)
  else
    FCount := Result + 1;
  FData[Result] := Value;
end;

procedure TLongIntArray.Delete(const Idx: Integer; const Count: Integer = 1);
var N : Integer;
begin
  N := Remove(FData, Idx, Count);
  Dec(FCapacity, N);
  Dec(FCount, N);
end;

procedure TLongIntArray.Insert(const Idx: Integer; const Count: Integer = 1);
var I : Integer;
begin
  I := ArrayInsert(FData, Idx, Count);
  if I >= 0 then
    begin
      Inc(FCapacity, Count);
      Inc(FCount, Count);
    end;
end;

function TLongIntArray.GetRange(const LoIdx, HiIdx: Integer): LongIntArray;
var L, H : Integer;
begin
  L := MaxI(0, LoIdx);
  H := MinI(HiIdx, FCount);
  if H >= L then
    Result := Copy(FData, L, H - L + 1) else
    Result := nil;
end;

procedure TLongIntArray.SetRange(const LoIdx, HiIdx: Integer; const V: LongIntArray);
var L, H, C : Integer;
begin
  L := MaxI(0, LoIdx);
  H := MinI(HiIdx, FCount);
  C := MaxI(MinI(Length(V), H - L + 1), 0);
  if C > 0 then
    Move(V[0], FData[L], C * Sizeof(LongInt));
end;

constructor TLongIntArray.Create(const V: LongIntArray);
begin
  inherited Create;
  SetData(V);
end;

procedure TLongIntArray.SetData(const Data: LongIntArray);
begin
  FData := Data;
  FCount := Length(FData);
  FCapacity := FCount;
end;

function TLongIntArray.DuplicateRange(const LoIdx, HiIdx: Integer): AArray;
var L, H, C : Integer;
begin
  L := MaxI(0, LoIdx);
  H := MinI(HiIdx, FCount);
  C := MaxI(0, H - L + 1);
  Result := CreateInstance as TLongIntArray;
  TLongIntArray(Result).FCount := C;
  if C > 0 then
    TLongIntArray(Result).FData := Copy(FData, L, C);
end;

procedure TLongIntArray.Assign(const V: LongIntArray);
begin
  FData := Copy(V);
  FCount := Length(FData);
  FCapacity := FCount;
end;

procedure TLongIntArray.Assign(const V: Array of LongInt);
begin
  FData := AsLongIntArray(V);
  FCount := Length(FData);
  FCapacity := FCount;
end;

procedure TLongIntArray.Assign(const Source: TObject);
begin
  if Source is TLongIntArray then
    begin
      FCount := TLongIntArray(Source).FCount;
      FData := Copy(TLongIntArray(Source).FData, 0, FCount);
    end
  else
    inherited Assign(Source);
end;



{                                                                              }
{ TLongWordArray                                                               }
{                                                                              }
function TLongWordArray.GetItem(const Idx: Integer): LongWord;
begin
  {$IFOPT R+}
  if (Idx < 0) or (Idx >= FCount) then
    RaiseIndexError(Idx);
  {$ENDIF}
  Result := FData[Idx];
end;

procedure TLongWordArray.SetItem(const Idx: Integer; const Value: LongWord);
begin
  {$IFOPT R+}
  if (Idx < 0) or (Idx >= FCount) then
    RaiseIndexError(Idx);
  {$ENDIF}
  FData[Idx] := Value;
end;

procedure TLongWordArray.ExchangeItems(const Idx1, Idx2: Integer);
var I : LongWord;
begin
  {$IFOPT R+}
  if (Idx1 < 0) or (Idx1 >= FCount) then
    RaiseIndexError(Idx1);
  if (Idx2 < 0) or (Idx2 >= FCount) then
    RaiseIndexError(Idx2);
  {$ENDIF}
  I := FData[Idx1];
  FData[Idx1] := FData[Idx2];
  FData[Idx2] := I;
end;

function TLongWordArray.GetCount: Integer;
begin
  Result := FCount;
end;

procedure TLongWordArray.SetCount(const NewCount: Integer);
var L, N : Integer;
begin
  N := NewCount;
  if FCount = N then
    exit;
  FCount := N;
  L := FCapacity;
  if L > 0 then
    if N < 16 then
      N := 16 else
    if N > L then
      N := N + N shr 3 else
    if N > L shr 1 then
      exit;
  if N <> L then
    begin
      SetLengthAndZero(FData, N);
      FCapacity := N;
    end;
end;

function TLongWordArray.AppendItem(const Value: LongWord): Integer;
begin
  Result := FCount;
  if Result >= FCapacity then
    SetCount(Result + 1)
  else
    FCount := Result + 1;
  FData[Result] := Value;
end;

procedure TLongWordArray.Delete(const Idx: Integer; const Count: Integer = 1);
var N : Integer;
begin
  N := Remove(FData, Idx, Count);
  Dec(FCapacity, N);
  Dec(FCount, N);
end;

procedure TLongWordArray.Insert(const Idx: Integer; const Count: Integer = 1);
var I : Integer;
begin
  I := ArrayInsert(FData, Idx, Count);
  if I >= 0 then
    begin
      Inc(FCapacity, Count);
      Inc(FCount, Count);
    end;
end;

function TLongWordArray.GetRange(const LoIdx, HiIdx: Integer): LongWordArray;
var L, H : Integer;
begin
  L := MaxI(0, LoIdx);
  H := MinI(HiIdx, FCount);
  if H >= L then
    Result := Copy(FData, L, H - L + 1) else
    Result := nil;
end;

procedure TLongWordArray.SetRange(const LoIdx, HiIdx: Integer; const V: LongWordArray);
var L, H, C : Integer;
begin
  L := MaxI(0, LoIdx);
  H := MinI(HiIdx, FCount);
  C := MaxI(MinI(Length(V), H - L + 1), 0);
  if C > 0 then
    Move(V[0], FData[L], C * Sizeof(LongWord));
end;

constructor TLongWordArray.Create(const V: LongWordArray);
begin
  inherited Create;
  SetData(V);
end;

procedure TLongWordArray.SetData(const Data: LongWordArray);
begin
  FData := Data;
  FCount := Length(FData);
  FCapacity := FCount;
end;

function TLongWordArray.DuplicateRange(const LoIdx, HiIdx: Integer): AArray;
var L, H, C : Integer;
begin
  L := MaxI(0, LoIdx);
  H := MinI(HiIdx, FCount);
  C := MaxI(0, H - L + 1);
  Result := CreateInstance as TLongWordArray;
  TLongWordArray(Result).FCount := C;
  if C > 0 then
    TLongWordArray(Result).FData := Copy(FData, L, C);
end;

procedure TLongWordArray.Assign(const V: LongWordArray);
begin
  FData := Copy(V);
  FCount := Length(FData);
  FCapacity := FCount;
end;

procedure TLongWordArray.Assign(const V: Array of LongWord);
begin
  FData := AsLongWordArray(V);
  FCount := Length(FData);
  FCapacity := FCount;
end;

procedure TLongWordArray.Assign(const Source: TObject);
begin
  if Source is TLongWordArray then
    begin
      FCount := TLongWordArray(Source).FCount;
      FData := Copy(TLongWordArray(Source).FData, 0, FCount);
    end
  else
    inherited Assign(Source);
end;



{                                                                              }
{ TInt64Array                                                                  }
{                                                                              }
function TInt64Array.GetItem(const Idx: Integer): Int64;
begin
  {$IFOPT R+}
  if (Idx < 0) or (Idx >= FCount) then
    RaiseIndexError(Idx);
  {$ENDIF}
  Result := FData[Idx];
end;

procedure TInt64Array.SetItem(const Idx: Integer; const Value: Int64);
begin
  {$IFOPT R+}
  if (Idx < 0) or (Idx >= FCount) then
    RaiseIndexError(Idx);
  {$ENDIF}
  FData[Idx] := Value;
end;

procedure TInt64Array.ExchangeItems(const Idx1, Idx2: Integer);
var I : Int64;
begin
  {$IFOPT R+}
  if (Idx1 < 0) or (Idx1 >= FCount) then
    RaiseIndexError(Idx1);
  if (Idx2 < 0) or (Idx2 >= FCount) then
    RaiseIndexError(Idx2);
  {$ENDIF}
  I := FData[Idx1];
  FData[Idx1] := FData[Idx2];
  FData[Idx2] := I;
end;

function TInt64Array.GetCount: Integer;
begin
  Result := FCount;
end;

procedure TInt64Array.SetCount(const NewCount: Integer);
var L, N : Integer;
begin
  N := NewCount;
  if FCount = N then
    exit;
  FCount := N;
  L := FCapacity;
  if L > 0 then
    if N < 16 then
      N := 16 else
    if N > L then
      N := N + N shr 3 else
    if N > L shr 1 then
      exit;
  if N <> L then
    begin
      SetLengthAndZero(FData, N);
      FCapacity := N;
    end;
end;

function TInt64Array.AppendItem(const Value: Int64): Integer;
begin
  Result := FCount;
  if Result >= FCapacity then
    SetCount(Result + 1)
  else
    FCount := Result + 1;
  FData[Result] := Value;
end;

procedure TInt64Array.Delete(const Idx: Integer; const Count: Integer = 1);
var N : Integer;
begin
  N := Remove(FData, Idx, Count);
  Dec(FCapacity, N);
  Dec(FCount, N);
end;

procedure TInt64Array.Insert(const Idx: Integer; const Count: Integer = 1);
var I : Integer;
begin
  I := ArrayInsert(FData, Idx, Count);
  if I >= 0 then
    begin
      Inc(FCapacity, Count);
      Inc(FCount, Count);
    end;
end;

function TInt64Array.GetRange(const LoIdx, HiIdx: Integer): Int64Array;
var L, H : Integer;
begin
  L := MaxI(0, LoIdx);
  H := MinI(HiIdx, FCount);
  if H >= L then
    Result := Copy(FData, L, H - L + 1) else
    Result := nil;
end;

procedure TInt64Array.SetRange(const LoIdx, HiIdx: Integer; const V: Int64Array);
var L, H, C : Integer;
begin
  L := MaxI(0, LoIdx);
  H := MinI(HiIdx, FCount);
  C := MaxI(MinI(Length(V), H - L + 1), 0);
  if C > 0 then
    Move(V[0], FData[L], C * Sizeof(Int64));
end;

constructor TInt64Array.Create(const V: Int64Array);
begin
  inherited Create;
  SetData(V);
end;

procedure TInt64Array.SetData(const Data: Int64Array);
begin
  FData := Data;
  FCount := Length(FData);
  FCapacity := FCount;
end;

function TInt64Array.DuplicateRange(const LoIdx, HiIdx: Integer): AArray;
var L, H, C : Integer;
begin
  L := MaxI(0, LoIdx);
  H := MinI(HiIdx, FCount);
  C := MaxI(0, H - L + 1);
  Result := CreateInstance as TInt64Array;
  TInt64Array(Result).FCount := C;
  if C > 0 then
    TInt64Array(Result).FData := Copy(FData, L, C);
end;

procedure TInt64Array.Assign(const V: Int64Array);
begin
  FData := Copy(V);
  FCount := Length(FData);
  FCapacity := FCount;
end;

procedure TInt64Array.Assign(const V: Array of Int64);
begin
  FData := AsInt64Array(V);
  FCount := Length(FData);
  FCapacity := FCount;
end;

procedure TInt64Array.Assign(const Source: TObject);
begin
  if Source is TInt64Array then
    begin
      FCount := TInt64Array(Source).FCount;
      FData := Copy(TInt64Array(Source).FData, 0, FCount);
    end
  else
    inherited Assign(Source);
end;



{                                                                              }
{ TSingleArray                                                                 }
{                                                                              }
function TSingleArray.GetItem(const Idx: Integer): Single;
begin
  {$IFOPT R+}
  if (Idx < 0) or (Idx >= FCount) then
    RaiseIndexError(Idx);
  {$ENDIF}
  Result := FData[Idx];
end;

procedure TSingleArray.SetItem(const Idx: Integer; const Value: Single);
begin
  {$IFOPT R+}
  if (Idx < 0) or (Idx >= FCount) then
    RaiseIndexError(Idx);
  {$ENDIF}
  FData[Idx] := Value;
end;

procedure TSingleArray.ExchangeItems(const Idx1, Idx2: Integer);
var I : Single;
begin
  {$IFOPT R+}
  if (Idx1 < 0) or (Idx1 >= FCount) then
    RaiseIndexError(Idx1);
  if (Idx2 < 0) or (Idx2 >= FCount) then
    RaiseIndexError(Idx2);
  {$ENDIF}
  I := FData[Idx1];
  FData[Idx1] := FData[Idx2];
  FData[Idx2] := I;
end;

function TSingleArray.GetCount: Integer;
begin
  Result := FCount;
end;

procedure TSingleArray.SetCount(const NewCount: Integer);
var L, N : Integer;
begin
  N := NewCount;
  if FCount = N then
    exit;
  FCount := N;
  L := FCapacity;
  if L > 0 then
    if N < 16 then
      N := 16 else
    if N > L then
      N := N + N shr 3 else
    if N > L shr 1 then
      exit;
  if N <> L then
    begin
      SetLengthAndZero(FData, N);
      FCapacity := N;
    end;
end;

function TSingleArray.AppendItem(const Value: Single): Integer;
begin
  Result := FCount;
  if Result >= FCapacity then
    SetCount(Result + 1)
  else
    FCount := Result + 1;
  FData[Result] := Value;
end;

procedure TSingleArray.Delete(const Idx: Integer; const Count: Integer = 1);
var N : Integer;
begin
  N := Remove(FData, Idx, Count);
  Dec(FCapacity, N);
  Dec(FCount, N);
end;

procedure TSingleArray.Insert(const Idx: Integer; const Count: Integer = 1);
var I : Integer;
begin
  I := ArrayInsert(FData, Idx, Count);
  if I >= 0 then
    begin
      Inc(FCapacity, Count);
      Inc(FCount, Count);
    end;
end;

function TSingleArray.GetRange(const LoIdx, HiIdx: Integer): SingleArray;
var L, H : Integer;
begin
  L := MaxI(0, LoIdx);
  H := MinI(HiIdx, FCount);
  if H >= L then
    Result := Copy(FData, L, H - L + 1) else
    Result := nil;
end;

procedure TSingleArray.SetRange(const LoIdx, HiIdx: Integer; const V: SingleArray);
var L, H, C : Integer;
begin
  L := MaxI(0, LoIdx);
  H := MinI(HiIdx, FCount);
  C := MaxI(MinI(Length(V), H - L + 1), 0);
  if C > 0 then
    Move(V[0], FData[L], C * Sizeof(Single));
end;

constructor TSingleArray.Create(const V: SingleArray);
begin
  inherited Create;
  SetData(V);
end;

procedure TSingleArray.SetData(const Data: SingleArray);
begin
  FData := Data;
  FCount := Length(FData);
  FCapacity := FCount;
end;

function TSingleArray.DuplicateRange(const LoIdx, HiIdx: Integer): AArray;
var L, H, C : Integer;
begin
  L := MaxI(0, LoIdx);
  H := MinI(HiIdx, FCount);
  C := MaxI(0, H - L + 1);
  Result := CreateInstance as TSingleArray;
  TSingleArray(Result).FCount := C;
  if C > 0 then
    TSingleArray(Result).FData := Copy(FData, L, C);
end;

procedure TSingleArray.Assign(const V: SingleArray);
begin
  FData := Copy(V);
  FCount := Length(FData);
  FCapacity := FCount;
end;

procedure TSingleArray.Assign(const V: Array of Single);
begin
  FData := AsSingleArray(V);
  FCount := Length(FData);
  FCapacity := FCount;
end;

procedure TSingleArray.Assign(const Source: TObject);
begin
  if Source is TSingleArray then
    begin
      FCount := TSingleArray(Source).FCount;
      FData := Copy(TSingleArray(Source).FData, 0, FCount);
    end
  else
    inherited Assign(Source);
end;



{                                                                              }
{ TDoubleArray                                                                 }
{                                                                              }
function TDoubleArray.GetItem(const Idx: Integer): Double;
begin
  {$IFOPT R+}
  if (Idx < 0) or (Idx >= FCount) then
    RaiseIndexError(Idx);
  {$ENDIF}
  Result := FData[Idx];
end;

procedure TDoubleArray.SetItem(const Idx: Integer; const Value: Double);
begin
  {$IFOPT R+}
  if (Idx < 0) or (Idx >= FCount) then
    RaiseIndexError(Idx);
  {$ENDIF}
  FData[Idx] := Value;
end;

procedure TDoubleArray.ExchangeItems(const Idx1, Idx2: Integer);
var I : Double;
begin
  {$IFOPT R+}
  if (Idx1 < 0) or (Idx1 >= FCount) then
    RaiseIndexError(Idx1);
  if (Idx2 < 0) or (Idx2 >= FCount) then
    RaiseIndexError(Idx2);
  {$ENDIF}
  I := FData[Idx1];
  FData[Idx1] := FData[Idx2];
  FData[Idx2] := I;
end;

function TDoubleArray.GetCount: Integer;
begin
  Result := FCount;
end;

procedure TDoubleArray.SetCount(const NewCount: Integer);
var L, N : Integer;
begin
  N := NewCount;
  if FCount = N then
    exit;
  FCount := N;
  L := FCapacity;
  if L > 0 then
    if N < 16 then
      N := 16 else
    if N > L then
      N := N + N shr 3 else
    if N > L shr 1 then
      exit;
  if N <> L then
    begin
      SetLengthAndZero(FData, N);
      FCapacity := N;
    end;
end;

function TDoubleArray.AppendItem(const Value: Double): Integer;
begin
  Result := FCount;
  if Result >= FCapacity then
    SetCount(Result + 1)
  else
    FCount := Result + 1;
  FData[Result] := Value;
end;

procedure TDoubleArray.Delete(const Idx: Integer; const Count: Integer = 1);
var N : Integer;
begin
  N := Remove(FData, Idx, Count);
  Dec(FCapacity, N);
  Dec(FCount, N);
end;

procedure TDoubleArray.Insert(const Idx: Integer; const Count: Integer = 1);
var I : Integer;
begin
  I := ArrayInsert(FData, Idx, Count);
  if I >= 0 then
    begin
      Inc(FCapacity, Count);
      Inc(FCount, Count);
    end;
end;

function TDoubleArray.GetRange(const LoIdx, HiIdx: Integer): DoubleArray;
var L, H : Integer;
begin
  L := MaxI(0, LoIdx);
  H := MinI(HiIdx, FCount);
  if H >= L then
    Result := Copy(FData, L, H - L + 1) else
    Result := nil;
end;

procedure TDoubleArray.SetRange(const LoIdx, HiIdx: Integer; const V: DoubleArray);
var L, H, C : Integer;
begin
  L := MaxI(0, LoIdx);
  H := MinI(HiIdx, FCount);
  C := MaxI(MinI(Length(V), H - L + 1), 0);
  if C > 0 then
    Move(V[0], FData[L], C * Sizeof(Double));
end;

constructor TDoubleArray.Create(const V: DoubleArray);
begin
  inherited Create;
  SetData(V);
end;

procedure TDoubleArray.SetData(const Data: DoubleArray);
begin
  FData := Data;
  FCount := Length(FData);
  FCapacity := FCount;
end;

function TDoubleArray.DuplicateRange(const LoIdx, HiIdx: Integer): AArray;
var L, H, C : Integer;
begin
  L := MaxI(0, LoIdx);
  H := MinI(HiIdx, FCount);
  C := MaxI(0, H - L + 1);
  Result := CreateInstance as TDoubleArray;
  TDoubleArray(Result).FCount := C;
  if C > 0 then
    TDoubleArray(Result).FData := Copy(FData, L, C);
end;

procedure TDoubleArray.Assign(const V: DoubleArray);
begin
  FData := Copy(V);
  FCount := Length(FData);
  FCapacity := FCount;
end;

procedure TDoubleArray.Assign(const V: Array of Double);
begin
  FData := AsDoubleArray(V);
  FCount := Length(FData);
  FCapacity := FCount;
end;

procedure TDoubleArray.Assign(const Source: TObject);
begin
  if Source is TDoubleArray then
    begin
      FCount := TDoubleArray(Source).FCount;
      FData := Copy(TDoubleArray(Source).FData, 0, FCount);
    end
  else
    inherited Assign(Source);
end;



{                                                                              }
{ TExtendedArray                                                               }
{                                                                              }
function TExtendedArray.GetItem(const Idx: Integer): Extended;
begin
  {$IFOPT R+}
  if (Idx < 0) or (Idx >= FCount) then
    RaiseIndexError(Idx);
  {$ENDIF}
  Result := FData[Idx];
end;

procedure TExtendedArray.SetItem(const Idx: Integer; const Value: Extended);
begin
  {$IFOPT R+}
  if (Idx < 0) or (Idx >= FCount) then
    RaiseIndexError(Idx);
  {$ENDIF}
  FData[Idx] := Value;
end;

procedure TExtendedArray.ExchangeItems(const Idx1, Idx2: Integer);
var I : Extended;
begin
  {$IFOPT R+}
  if (Idx1 < 0) or (Idx1 >= FCount) then
    RaiseIndexError(Idx1);
  if (Idx2 < 0) or (Idx2 >= FCount) then
    RaiseIndexError(Idx2);
  {$ENDIF}
  I := FData[Idx1];
  FData[Idx1] := FData[Idx2];
  FData[Idx2] := I;
end;

function TExtendedArray.GetCount: Integer;
begin
  Result := FCount;
end;

procedure TExtendedArray.SetCount(const NewCount: Integer);
var L, N : Integer;
begin
  N := NewCount;
  if FCount = N then
    exit;
  FCount := N;
  L := FCapacity;
  if L > 0 then
    if N < 16 then
      N := 16 else
    if N > L then
      N := N + N shr 3 else
    if N > L shr 1 then
      exit;
  if N <> L then
    begin
      SetLengthAndZero(FData, N);
      FCapacity := N;
    end;
end;

function TExtendedArray.AppendItem(const Value: Extended): Integer;
begin
  Result := FCount;
  if Result >= FCapacity then
    SetCount(Result + 1)
  else
    FCount := Result + 1;
  FData[Result] := Value;
end;

procedure TExtendedArray.Delete(const Idx: Integer; const Count: Integer = 1);
var N : Integer;
begin
  N := Remove(FData, Idx, Count);
  Dec(FCapacity, N);
  Dec(FCount, N);
end;

procedure TExtendedArray.Insert(const Idx: Integer; const Count: Integer = 1);
var I : Integer;
begin
  I := ArrayInsert(FData, Idx, Count);
  if I >= 0 then
    begin
      Inc(FCapacity, Count);
      Inc(FCount, Count);
    end;
end;

function TExtendedArray.GetRange(const LoIdx, HiIdx: Integer): ExtendedArray;
var L, H : Integer;
begin
  L := MaxI(0, LoIdx);
  H := MinI(HiIdx, FCount);
  if H >= L then
    Result := Copy(FData, L, H - L + 1) else
    Result := nil;
end;

procedure TExtendedArray.SetRange(const LoIdx, HiIdx: Integer; const V: ExtendedArray);
var L, H, C : Integer;
begin
  L := MaxI(0, LoIdx);
  H := MinI(HiIdx, FCount);
  C := MaxI(MinI(Length(V), H - L + 1), 0);
  if C > 0 then
    Move(V[0], FData[L], C * Sizeof(Extended));
end;

constructor TExtendedArray.Create(const V: ExtendedArray);
begin
  inherited Create;
  SetData(V);
end;

procedure TExtendedArray.SetData(const Data: ExtendedArray);
begin
  FData := Data;
  FCount := Length(FData);
  FCapacity := FCount;
end;

function TExtendedArray.DuplicateRange(const LoIdx, HiIdx: Integer): AArray;
var L, H, C : Integer;
begin
  L := MaxI(0, LoIdx);
  H := MinI(HiIdx, FCount);
  C := MaxI(0, H - L + 1);
  Result := CreateInstance as TExtendedArray;
  TExtendedArray(Result).FCount := C;
  if C > 0 then
    TExtendedArray(Result).FData := Copy(FData, L, C);
end;

procedure TExtendedArray.Assign(const V: ExtendedArray);
begin
  FData := Copy(V);
  FCount := Length(FData);
  FCapacity := FCount;
end;

procedure TExtendedArray.Assign(const V: Array of Extended);
begin
  FData := AsExtendedArray(V);
  FCount := Length(FData);
  FCapacity := FCount;
end;

procedure TExtendedArray.Assign(const Source: TObject);
begin
  if Source is TExtendedArray then
    begin
      FCount := TExtendedArray(Source).FCount;
      FData := Copy(TExtendedArray(Source).FData, 0, FCount);
    end
  else
    inherited Assign(Source);
end;



{                                                                              }
{ TPointerArray                                                                }
{                                                                              }
function TPointerArray.GetItem(const Idx: Integer): Pointer;
begin
  {$IFOPT R+}
  if (Idx < 0) or (Idx >= FCount) then
    RaiseIndexError(Idx);
  {$ENDIF}
  Result := FData[Idx];
end;

procedure TPointerArray.SetItem(const Idx: Integer; const Value: Pointer);
begin
  {$IFOPT R+}
  if (Idx < 0) or (Idx >= FCount) then
    RaiseIndexError(Idx);
  {$ENDIF}
  FData[Idx] := Value;
end;

procedure TPointerArray.ExchangeItems(const Idx1, Idx2: Integer);
var I : Pointer;
begin
  {$IFOPT R+}
  if (Idx1 < 0) or (Idx1 >= FCount) then
    RaiseIndexError(Idx1);
  if (Idx2 < 0) or (Idx2 >= FCount) then
    RaiseIndexError(Idx2);
  {$ENDIF}
  I := FData[Idx1];
  FData[Idx1] := FData[Idx2];
  FData[Idx2] := I;
end;

function TPointerArray.GetCount: Integer;
begin
  Result := FCount;
end;

procedure TPointerArray.SetCount(const NewCount: Integer);
var L, N : Integer;
begin
  N := NewCount;
  if FCount = N then
    exit;
  FCount := N;
  L := FCapacity;
  if L > 0 then
    if N < 16 then
      N := 16 else
    if N > L then
      N := N + N shr 3 else
    if N > L shr 1 then
      exit;
  if N <> L then
    begin
      SetLengthAndZero(FData, N);
      FCapacity := N;
    end;
end;

function TPointerArray.AppendItem(const Value: Pointer): Integer;
begin
  Result := FCount;
  if Result >= FCapacity then
    SetCount(Result + 1)
  else
    FCount := Result + 1;
  FData[Result] := Value;
end;

procedure TPointerArray.Delete(const Idx: Integer; const Count: Integer = 1);
var N : Integer;
begin
  N := Remove(FData, Idx, Count);
  Dec(FCapacity, N);
  Dec(FCount, N);
end;

procedure TPointerArray.Insert(const Idx: Integer; const Count: Integer = 1);
var I : Integer;
begin
  I := ArrayInsert(FData, Idx, Count);
  if I >= 0 then
    begin
      Inc(FCapacity, Count);
      Inc(FCount, Count);
    end;
end;

function TPointerArray.GetRange(const LoIdx, HiIdx: Integer): PointerArray;
var L, H : Integer;
begin
  L := MaxI(0, LoIdx);
  H := MinI(HiIdx, FCount);
  if H >= L then
    Result := Copy(FData, L, H - L + 1) else
    Result := nil;
end;

procedure TPointerArray.SetRange(const LoIdx, HiIdx: Integer; const V: PointerArray);
var L, H, C : Integer;
begin
  L := MaxI(0, LoIdx);
  H := MinI(HiIdx, FCount);
  C := MaxI(MinI(Length(V), H - L + 1), 0);
  if C > 0 then
    Move(V[0], FData[L], C * Sizeof(Pointer));
end;

constructor TPointerArray.Create(const V: PointerArray);
begin
  inherited Create;
  SetData(V);
end;

procedure TPointerArray.SetData(const Data: PointerArray);
begin
  FData := Data;
  FCount := Length(FData);
  FCapacity := FCount;
end;

function TPointerArray.DuplicateRange(const LoIdx, HiIdx: Integer): AArray;
var L, H, C : Integer;
begin
  L := MaxI(0, LoIdx);
  H := MinI(HiIdx, FCount);
  C := MaxI(0, H - L + 1);
  Result := CreateInstance as TPointerArray;
  TPointerArray(Result).FCount := C;
  if C > 0 then
    TPointerArray(Result).FData := Copy(FData, L, C);
end;

procedure TPointerArray.Assign(const V: PointerArray);
begin
  FData := Copy(V);
  FCount := Length(FData);
  FCapacity := FCount;
end;

procedure TPointerArray.Assign(const V: Array of Pointer);
begin
  FData := AsPointerArray(V);
  FCount := Length(FData);
  FCapacity := FCount;
end;

procedure TPointerArray.Assign(const Source: TObject);
begin
  if Source is TPointerArray then
    begin
      FCount := TPointerArray(Source).FCount;
      FData := Copy(TPointerArray(Source).FData, 0, FCount);
    end
  else
    inherited Assign(Source);
end;



{                                                                              }
{ TAnsiStringArray                                                             }
{                                                                              }
function TAnsiStringArray.GetItem(const Idx: Integer): AnsiString;
begin
  {$IFOPT R+}
  if (Idx < 0) or (Idx >= FCount) then
    RaiseIndexError(Idx);
  {$ENDIF}
  Result := FData[Idx];
end;

procedure TAnsiStringArray.SetItem(const Idx: Integer; const Value: AnsiString);
begin
  {$IFOPT R+}
  if (Idx < 0) or (Idx >= FCount) then
    RaiseIndexError(Idx);
  {$ENDIF}
  FData[Idx] := Value;
end;

procedure TAnsiStringArray.ExchangeItems(const Idx1, Idx2: Integer);
var I : AnsiString;
begin
  {$IFOPT R+}
  if (Idx1 < 0) or (Idx1 >= FCount) then
    RaiseIndexError(Idx1);
  if (Idx2 < 0) or (Idx2 >= FCount) then
    RaiseIndexError(Idx2);
  {$ENDIF}
  I := FData[Idx1];
  FData[Idx1] := FData[Idx2];
  FData[Idx2] := I;
end;

function TAnsiStringArray.GetCount: Integer;
begin
  Result := FCount;
end;

procedure TAnsiStringArray.SetCount(const NewCount: Integer);
var L, N : Integer;
begin
  N := NewCount;
  if FCount = N then
    exit;
  FCount := N;
  L := FCapacity;
  if L > 0 then
    if N < 16 then
      N := 16 else
    if N > L then
      N := N + N shr 3 else
    if N > L shr 1 then
      exit;
  if N <> L then
    begin
      SetLength(FData, N);
      FCapacity := N;
    end;
end;

function TAnsiStringArray.AppendItem(const Value: AnsiString): Integer;
begin
  Result := FCount;
  if Result >= FCapacity then
    SetCount(Result + 1)
  else
    FCount := Result + 1;
  FData[Result] := Value;
end;

procedure TAnsiStringArray.Delete(const Idx: Integer; const Count: Integer = 1);
var N : Integer;
begin
  N := Remove(FData, Idx, Count);
  Dec(FCapacity, N);
  Dec(FCount, N);
end;

procedure TAnsiStringArray.Insert(const Idx: Integer; const Count: Integer = 1);
var I : Integer;
begin
  I := ArrayInsert(FData, Idx, Count);
  if I >= 0 then
    begin
      Inc(FCapacity, Count);
      Inc(FCount, Count);
    end;
end;

function TAnsiStringArray.GetRange(const LoIdx, HiIdx: Integer): AnsiStringArray;
var L, H : Integer;
begin
  L := MaxI(0, LoIdx);
  H := MinI(HiIdx, FCount);
  if H >= L then
    Result := Copy(FData, L, H - L + 1) else
    Result := nil;
end;

procedure TAnsiStringArray.SetRange(const LoIdx, HiIdx: Integer; const V: AnsiStringArray);
var L, H, C : Integer;
begin
  L := MaxI(0, LoIdx);
  H := MinI(HiIdx, FCount);
  C := MaxI(MinI(Length(V), H - L + 1), 0);
  if C > 0 then
    Move(V[0], FData[L], C * Sizeof(AnsiString));
end;

constructor TAnsiStringArray.Create(const V: AnsiStringArray);
begin
  inherited Create;
  SetData(V);
end;

procedure TAnsiStringArray.SetData(const Data: AnsiStringArray);
begin
  FData := Data;
  FCount := Length(FData);
  FCapacity := FCount;
end;

function TAnsiStringArray.DuplicateRange(const LoIdx, HiIdx: Integer): AArray;
var L, H, C : Integer;
begin
  L := MaxI(0, LoIdx);
  H := MinI(HiIdx, FCount);
  C := MaxI(0, H - L + 1);
  Result := CreateInstance as TAnsiStringArray;
  TAnsiStringArray(Result).FCount := C;
  if C > 0 then
    TAnsiStringArray(Result).FData := Copy(FData, L, C);
end;

procedure TAnsiStringArray.Assign(const V: AnsiStringArray);
begin
  FData := Copy(V);
  FCount := Length(FData);
  FCapacity := FCount;
end;

procedure TAnsiStringArray.Assign(const V: Array of AnsiString);
begin
  FData := AsAnsiStringArray(V);
  FCount := Length(FData);
  FCapacity := FCount;
end;

procedure TAnsiStringArray.Assign(const Source: TObject);
begin
  if Source is TAnsiStringArray then
    begin
      FCount := TAnsiStringArray(Source).FCount;
      FData := Copy(TAnsiStringArray(Source).FData, 0, FCount);
    end
  else
    inherited Assign(Source);
end;



{                                                                              }
{ TWideStringArray                                                             }
{                                                                              }
function TWideStringArray.GetItem(const Idx: Integer): WideString;
begin
  {$IFOPT R+}
  if (Idx < 0) or (Idx >= FCount) then
    RaiseIndexError(Idx);
  {$ENDIF}
  Result := FData[Idx];
end;

procedure TWideStringArray.SetItem(const Idx: Integer; const Value: WideString);
begin
  {$IFOPT R+}
  if (Idx < 0) or (Idx >= FCount) then
    RaiseIndexError(Idx);
  {$ENDIF}
  FData[Idx] := Value;
end;

procedure TWideStringArray.ExchangeItems(const Idx1, Idx2: Integer);
var I : WideString;
begin
  {$IFOPT R+}
  if (Idx1 < 0) or (Idx1 >= FCount) then
    RaiseIndexError(Idx1);
  if (Idx2 < 0) or (Idx2 >= FCount) then
    RaiseIndexError(Idx2);
  {$ENDIF}
  I := FData[Idx1];
  FData[Idx1] := FData[Idx2];
  FData[Idx2] := I;
end;

function TWideStringArray.GetCount: Integer;
begin
  Result := FCount;
end;

procedure TWideStringArray.SetCount(const NewCount: Integer);
var L, N : Integer;
begin
  N := NewCount;
  if FCount = N then
    exit;
  FCount := N;
  L := FCapacity;
  if L > 0 then
    if N < 16 then
      N := 16 else
    if N > L then
      N := N + N shr 3 else
    if N > L shr 1 then
      exit;
  if N <> L then
    begin
      SetLength(FData, N);
      FCapacity := N;
    end;
end;

function TWideStringArray.AppendItem(const Value: WideString): Integer;
begin
  Result := FCount;
  if Result >= FCapacity then
    SetCount(Result + 1)
  else
    FCount := Result + 1;
  FData[Result] := Value;
end;

procedure TWideStringArray.Delete(const Idx: Integer; const Count: Integer = 1);
var N : Integer;
begin
  N := Remove(FData, Idx, Count);
  Dec(FCapacity, N);
  Dec(FCount, N);
end;

procedure TWideStringArray.Insert(const Idx: Integer; const Count: Integer = 1);
var I : Integer;
begin
  I := ArrayInsert(FData, Idx, Count);
  if I >= 0 then
    begin
      Inc(FCapacity, Count);
      Inc(FCount, Count);
    end;
end;

function TWideStringArray.GetRange(const LoIdx, HiIdx: Integer): WideStringArray;
var L, H : Integer;
begin
  L := MaxI(0, LoIdx);
  H := MinI(HiIdx, FCount);
  if H >= L then
    Result := Copy(FData, L, H - L + 1) else
    Result := nil;
end;

procedure TWideStringArray.SetRange(const LoIdx, HiIdx: Integer; const V: WideStringArray);
var L, H, C : Integer;
begin
  L := MaxI(0, LoIdx);
  H := MinI(HiIdx, FCount);
  C := MaxI(MinI(Length(V), H - L + 1), 0);
  if C > 0 then
    Move(V[0], FData[L], C * Sizeof(WideString));
end;

constructor TWideStringArray.Create(const V: WideStringArray);
begin
  inherited Create;
  SetData(V);
end;

procedure TWideStringArray.SetData(const Data: WideStringArray);
begin
  FData := Data;
  FCount := Length(FData);
  FCapacity := FCount;
end;

function TWideStringArray.DuplicateRange(const LoIdx, HiIdx: Integer): AArray;
var L, H, C : Integer;
begin
  L := MaxI(0, LoIdx);
  H := MinI(HiIdx, FCount);
  C := MaxI(0, H - L + 1);
  Result := CreateInstance as TWideStringArray;
  TWideStringArray(Result).FCount := C;
  if C > 0 then
    TWideStringArray(Result).FData := Copy(FData, L, C);
end;

procedure TWideStringArray.Assign(const V: WideStringArray);
begin
  FData := Copy(V);
  FCount := Length(FData);
  FCapacity := FCount;
end;

procedure TWideStringArray.Assign(const V: Array of WideString);
begin
  FData := AsWideStringArray(V);
  FCount := Length(FData);
  FCapacity := FCount;
end;

procedure TWideStringArray.Assign(const Source: TObject);
begin
  if Source is TWideStringArray then
    begin
      FCount := TWideStringArray(Source).FCount;
      FData := Copy(TWideStringArray(Source).FData, 0, FCount);
    end
  else
    inherited Assign(Source);
end;



{                                                                              }
{ TObjectArray                                                                 }
{                                                                              }
constructor TObjectArray.Create(const V: ObjectArray; const IsItemOwner: Boolean);
begin
  inherited Create;
  FData := V;
  FIsItemOwner := IsItemOwner;
  FCount := Length(FData);
  FCapacity := FCount;
end;

destructor TObjectArray.Destroy;
begin
  if FIsItemOwner then
    FreeItems;
  inherited Destroy;
end;

procedure TObjectArray.Init;
begin
  inherited Init;
  FIsItemOwner := False;
end;

procedure TObjectArray.FreeItems;
begin
  FreeObjectArray(FData);
  FData := nil;
  FCapacity := 0;
  FCount := 0;
end;

procedure TObjectArray.ReleaseItems;
begin
  FData := nil;
  FCapacity := 0;
  FCount := 0;
end;

function TObjectArray.GetIsItemOwner: Boolean;
begin
  Result := FIsItemOwner;
end;

procedure TObjectArray.SetIsItemOwner(const IsItemOwner: Boolean);
begin
  FIsItemOwner := IsItemOwner;
end;

function TObjectArray.GetCount: Integer;
begin
  Result := FCount;
end;

procedure TObjectArray.SetCount(const NewCount: Integer);
var L, N : Integer;
begin
  N := NewCount;
  if N = FCount then
    exit;
  if (N < FCount) and FIsItemOwner then
    FreeObjectArray(FData, N, FCount - 1);
  FCount := N;
  L := FCapacity;
  if L > 0 then
    if N < 16 then
      N := 16 else
    if N > L then
      N := N + N shr 3 else
    if N > L shr 1 then
      exit;
  if N <> L then
    begin
      SetLengthAndZero(FData, N);
      FCapacity := N;
    end;
end;

function TObjectArray.GetItem(const Idx: Integer): TObject;
begin
  {$IFOPT R+}
  if (Idx < 0) or (Idx >= FCount) then
    RaiseIndexError(Idx);
  {$ENDIF}
  Result := FData[Idx];
end;

procedure TObjectArray.SetItem(const Idx: Integer; const Value: TObject);
var P : ^TObject;
    V : TObject;
begin
  {$IFOPT R+}
  if (Idx < 0) or (Idx >= FCount) then
    RaiseIndexError(Idx);
  {$ENDIF}
  P := Pointer(FData);
  Inc(P, Idx);
  if FIsItemOwner then
    begin
      V := P^;
      if V = Value then
        exit;
      V.Free;
    end;
  P^ := Value;
end;

function TObjectArray.AppendItem(const Value: TObject): Integer;
begin
  Result := FCount;
  if Result >= FCapacity then
    SetCount(Result + 1)
  else
    FCount := Result + 1;
  FData[Result] := Value;
end;

function TObjectArray.ReleaseItem(const Idx: Integer): TObject;
begin
  {$IFOPT R+}
  if (Idx < 0) or (Idx >= FCount) then
    RaiseIndexError(Idx);
  {$ENDIF}
  Result := FData[Idx];
  if Assigned(Result) and FIsItemOwner then
    FData[Idx] := nil;
end;

function TObjectArray.GetRange(const LoIdx, HiIdx: Integer): ObjectArray;
begin
  Result := Copy(FData, LoIdx, MinI(HiIdx, FCount - 1) - LoIdx + 1);
end;

procedure TObjectArray.SetData(const Data: ObjectArray);
begin
  if FIsItemOwner then
    FreeItems;
  FData := Data;
  FCount := Length(FData);
  FCapacity := FCount;
end;

function TObjectArray.DuplicateRange(const LoIdx, HiIdx: Integer): AArray;
var I : Integer;
    V : TObject;
begin
  Result := CreateInstance as TObjectArray;
  for I := LoIdx to MinI(HiIdx, FCount - 1) do
    begin
      V := FData[I];
      if V is AType then
        V := AType(V).Duplicate;
      TObjectArray(Result).AppendItem(V);
    end;
end;

procedure TObjectArray.Delete(const Idx: Integer; const Count: Integer = 1);
var N : Integer;
begin
  N := Remove(FData, Idx, Count, FIsItemOwner);
  Dec(FCapacity, N);
  Dec(FCount, N);
end;

procedure TObjectArray.Insert(const Idx: Integer; const Count: Integer = 1);
var I : Integer;
begin
  I := ArrayInsert(FData, Idx, Count);
  if I >= 0 then
    begin
      Inc(FCapacity, Count);
      Inc(FCount, Count);
    end;
end;



{                                                                              }
{ TInterfaceArray                                                              }
{                                                                              }
function TInterfaceArray.GetItem(const Idx: Integer): IInterface;
begin
  {$IFOPT R+}
  if (Idx < 0) or (Idx >= FCount) then
    RaiseIndexError(Idx);
  {$ENDIF}
  Result := FData[Idx];
end;

procedure TInterfaceArray.SetItem(const Idx: Integer; const Value: IInterface);
begin
  {$IFOPT R+}
  if (Idx < 0) or (Idx >= FCount) then
    RaiseIndexError(Idx);
  {$ENDIF}
  FData[Idx] := Value;
end;

procedure TInterfaceArray.ExchangeItems(const Idx1, Idx2: Integer);
var I : IInterface;
begin
  {$IFOPT R+}
  if (Idx1 < 0) or (Idx1 >= FCount) then
    RaiseIndexError(Idx1);
  if (Idx2 < 0) or (Idx2 >= FCount) then
    RaiseIndexError(Idx2);
  {$ENDIF}
  I := FData[Idx1];
  FData[Idx1] := FData[Idx2];
  FData[Idx2] := I;
end;

function TInterfaceArray.GetCount: Integer;
begin
  Result := FCount;
end;

procedure TInterfaceArray.SetCount(const NewCount: Integer);
var L, N : Integer;
begin
  N := NewCount;
  if FCount = N then
    exit;
  FCount := N;
  L := FCapacity;
  if L > 0 then
    if N < 16 then
      N := 16 else
    if N > L then
      N := N + N shr 3 else
    if N > L shr 1 then
      exit;
  if N <> L then
    begin
      SetLength(FData, N);
      FCapacity := N;
    end;
end;

function TInterfaceArray.AppendItem(const Value: IInterface): Integer;
begin
  Result := FCount;
  if Result >= FCapacity then
    SetCount(Result + 1)
  else
    FCount := Result + 1;
  FData[Result] := Value;
end;

procedure TInterfaceArray.Delete(const Idx: Integer; const Count: Integer = 1);
var N : Integer;
begin
  N := Remove(FData, Idx, Count);
  Dec(FCapacity, N);
  Dec(FCount, N);
end;

procedure TInterfaceArray.Insert(const Idx: Integer; const Count: Integer = 1);
var I : Integer;
begin
  I := ArrayInsert(FData, Idx, Count);
  if I >= 0 then
    begin
      Inc(FCapacity, Count);
      Inc(FCount, Count);
    end;
end;

function TInterfaceArray.GetRange(const LoIdx, HiIdx: Integer): InterfaceArray;
var L, H : Integer;
begin
  L := MaxI(0, LoIdx);
  H := MinI(HiIdx, FCount);
  if H >= L then
    Result := Copy(FData, L, H - L + 1) else
    Result := nil;
end;

procedure TInterfaceArray.SetRange(const LoIdx, HiIdx: Integer; const V: InterfaceArray);
var L, H, C : Integer;
begin
  L := MaxI(0, LoIdx);
  H := MinI(HiIdx, FCount);
  C := MaxI(MinI(Length(V), H - L + 1), 0);
  if C > 0 then
    Move(V[0], FData[L], C * Sizeof(IInterface));
end;

constructor TInterfaceArray.Create(const V: InterfaceArray);
begin
  inherited Create;
  SetData(V);
end;

procedure TInterfaceArray.SetData(const Data: InterfaceArray);
begin
  FData := Data;
  FCount := Length(FData);
  FCapacity := FCount;
end;

function TInterfaceArray.DuplicateRange(const LoIdx, HiIdx: Integer): AArray;
var L, H, C : Integer;
begin
  L := MaxI(0, LoIdx);
  H := MinI(HiIdx, FCount);
  C := MaxI(0, H - L + 1);
  Result := CreateInstance as TInterfaceArray;
  TInterfaceArray(Result).FCount := C;
  if C > 0 then
    TInterfaceArray(Result).FData := Copy(FData, L, C);
end;

procedure TInterfaceArray.Assign(const V: InterfaceArray);
begin
  FData := Copy(V);
  FCount := Length(FData);
  FCapacity := FCount;
end;

procedure TInterfaceArray.Assign(const V: Array of IInterface);
begin
  FData := AsInterfaceArray(V);
  FCount := Length(FData);
  FCapacity := FCount;
end;

procedure TInterfaceArray.Assign(const Source: TObject);
begin
  if Source is TInterfaceArray then
    begin
      FCount := TInterfaceArray(Source).FCount;
      FData := Copy(TInterfaceArray(Source).FData, 0, FCount);
    end
  else
    inherited Assign(Source);
end;



{                                                                              }
{ TBitArray                                                                    }
{                                                                              }
const
  TrueLongWord  : LongWord = $FFFFFFFF;
  FalseLongWord : LongWord = $00000000;

function TBitArray.GetBit(const Idx: Integer): Boolean;
begin
  {$IFOPT R+}
  if (Idx < 0) or (Idx >= FCount) then
    RaiseIndexError(Idx);
  {$ENDIF}
  Result := cUtils.IsBitSet(FData[Idx shr 5], Idx and 31);
end;

procedure TBitArray.SetBit(const Idx: Integer; const Value: Boolean);
var L : ^LongWord;
begin
  {$IFOPT R+}
  if (Idx < 0) or (Idx >= FCount) then
    RaiseIndexError(Idx);
  {$ENDIF}
  L := @FData[Idx shr 5];
  if Value then
    L^ := cUtils.SetBit(L^, Idx and 31)
  else
    L^ := cUtils.ClearBit(L^, Idx and 31);
end;

function TBitArray.GetCount: Integer;
begin
  Result := FCount;
end;

procedure TBitArray.SetCount(const NewCount: Integer);
begin
  if NewCount = FCount then
    exit;
  SetLengthAndZero(FData, (NewCount + BitsPerLongWord - 1) div BitsPerLongWord);
  FCount := NewCount;
end;

function TBitArray.GetRangeL(const Idx: Integer): LongWord;
var F : Byte;
  I : Integer;
begin
  {$IFOPT R+}
  if (Idx < 0) or (Idx >= FCount) then
    RaiseIndexError(Idx);
  {$ENDIF}
  F := Idx and 31;
  I := Idx shr 5;
  if F = 0 then
    Result := FData[I]
  else
    begin
      Result := FData[I] shr F;
      if I + 1 < Length(FData) then
        Result := Result or (FData[I + 1] shl (BitsPerLongWord - F));
    end;
end;

procedure TBitArray.SetRangeL(const Idx: Integer; const Value: LongWord);
var F : Byte;
    I : Integer;
begin
  {$IFOPT R+}
  if (Idx < 0) or (Idx >= FCount) then
    RaiseIndexError(Idx);
  {$ENDIF}
  F := Idx and 31;
  I := Idx shr 5;
  if F = 0 then
    FData[I] := Value
  else
    begin
      FData[I] := (FData[I] and LowBitMask(F))
               or (Value shl F);
      if I + 1 < Length(FData) then
        FData[I + 1] := (FData[I + 1] and HighBitMask(F))
                     or (Value shr (BitsPerLongWord - F));
    end;
end;

function TBitArray.IsRange(const LoIdx, HiIdx: Integer; const Value: Boolean): Boolean;
var B, I   : LongWord;
    IL, IH : Integer;
begin
  {$IFOPT R+}
  if (LoIdx < 0) or (LoIdx > HiIdx) or (HiIdx >= FCount) then
    RaiseIndexError(HiIdx);
  {$ENDIF}
  // Check bits in FData[IL]
  IL := LoIdx shr 5;
  IH := HiIdx shr 5;
  B := HighBitMask(LoIdx and 31);
  I := FData[IL];
  if Value then
    Result := I or B = I else
    Result := I and not B = I;
  if not Result or (IL = IH) then
    exit;
  // Check bits in FData[IH]
  B := LowBitMask(HiIdx and 31);
  I := FData[IH];
  if Value then
    Result := I or B = I else
    Result := I and not B = I;
  if not Result or (IH = IL + 1) then
    exit;
  // Check bits in FStore[IL + 1..IR - 1]
  for I := IL + 1 to IH - 1 do
    if (Value and (FData[I] <> TrueLongWord)) or
       (not Value and (FData[I] <> FalseLongWord)) then
      begin
        Result := False;
        exit;
      end;
  Result := True;
end;

procedure TBitArray.Fill(const LoIdx, HiIdx: Integer; const Value: Boolean);
var B, I   : LongWord;
    IL, IH : Integer;
begin
  {$IFOPT R+}
  if (LoIdx < 0) or (LoIdx > HiIdx) or (HiIdx >= FCount) then
    RaiseIndexError(HiIdx);
  {$ENDIF}
  IL := LoIdx shr 5;
  IH := HiIdx shr 5;
  // Set bits in FData[IL]
  if IH = IL then
    B := RangeBitMask(LoIdx and 31, HiIdx and 31) else
    B := HighBitMask(LoIdx and 31);
  I := FData[IL];
  if Value then
    FData[IL] := I or B else
    FData[IL] := I and not B;
  if IH = IL then
    exit;
  // Set bits in FData[IH]
  B := LowBitMask(HiIdx and 31);
  I := FData[IH];
  if Value then
    FData[IH] := I or B else
    FData[IH] := I and not B;
  if IH = IL + 1 then
    exit;
  // Set bits in FData[IL + 1..IR - 1]
  for I := IL + 1 to IH - 1 do
    if Value then
      FData[I] := TrueLongWord else
      FData[I] := FalseLongWord;
end;



{                                                                              }
{ Hashed Array helper function                                                 }
{                                                                              }
const
  ArrayAverageHashChainSize = 4;

function ArrayRehashSize(const Count: Integer): Integer;
var L : Integer;
begin
  L := Count div ArrayAverageHashChainSize; // Number of slots
  if L <= 16 then                           // Rehash in powers of 16
    Result := 16 else
  if L <= 256 then
    Result := 256 else
  if L <= 4096 then
    Result := 4096 else
  if L <= 65536 then
    Result := 65536 else
  if L <= 1048576 then
    Result := 1048576 else
  if L <= 16777216 then
    Result := 16777216 else
    Result := 268435456;
end;



{                                                                              }
{ THashedAnsiStringArray                                                       }
{                                                                              }
constructor THashedAnsiStringArray.Create(const CaseSensitive: Boolean);
begin
  inherited Create(nil);
  FCaseSensitive := CaseSensitive;
end;

procedure THashedAnsiStringArray.Init;
begin
  inherited Init;
  FCaseSensitive := True;
end;

procedure THashedAnsiStringArray.Assign(const Source: TObject);
begin
  if Source is THashedAnsiStringArray then
    begin
      // Assign array data
      inherited Assign(Source);
      // Assign hash lookup
      FLookup := Copy(THashedAnsiStringArray(Source).FLookup);
      FCaseSensitive := THashedAnsiStringArray(Source).FCaseSensitive;
    end
  else
    inherited Assign(Source);
end;

procedure THashedAnsiStringArray.Clear;
begin
  inherited Clear;
  Rehash;
end;

function THashedAnsiStringArray.LocateItemHashBuf(const ValueStrPtr: PAnsiChar;
    const ValueStrLen: Integer; var LookupList, LookupIdx: Integer): Boolean;
var I: Integer;
begin
  // Hash value
  if FCaseSensitive then
    LookupList := HashStrBuf(ValueStrPtr, ValueStrLen, Length(FLookup))
  else
    LookupList := HashStrBufNoCase(ValueStrPtr, ValueStrLen, Length(FLookup));
  // Locate value in hash lookup
  for I := 0 to Length(FLookup[LookupList]) - 1 do
    if StrPEqualStr(ValueStrPtr, ValueStrLen, FData[FLookup[LookupList][I]], FCaseSensitive) then
      begin
        LookupIdx := I;
        Result := True;
        exit;
      end;
  // Not found
  LookupIdx := -1;
  Result := False;
end;

function THashedAnsiStringArray.LocateItemHash(const Value: AnsiString;
         var LookupList, LookupIdx: Integer): Boolean;
begin
  Result := LocateItemHashBuf(Pointer(Value), Length(Value),
      LookupList, LookupIdx);
end;

procedure THashedAnsiStringArray.Rehash;
var I, C, L : Integer;
begin
  C := FCount;
  L := ArrayRehashSize(C);
  FLookup := nil;
  SetLength(FLookup, L);
  for I := 0 to C - 1 do
    Append(FLookup[HashStr(FData[I], L, FCaseSensitive)], I);
end;

procedure THashedAnsiStringArray.ExchangeItems(const Idx1, Idx2: Integer);
var L1, L2, I1, I2: Integer;
begin
  // Swap lookup
  if LocateItemHash(FData[Idx1], L1, I1) and
     LocateItemHash(FData[Idx2], L2, I2) then
    Swap(FLookup[L1][I1], FLookup[L2][I2]);
  // Swap array items
  inherited ExchangeItems(Idx1, Idx2);
end;

procedure THashedAnsiStringArray.Delete(const Idx: Integer; const Count: Integer);
var I, L, V : Integer;
    P : PInteger;
begin
  // Delete lookup
  for I := MaxI(0, Idx) to MinI(FCount, Idx + Count - 1) do
    if LocateItemHash(FData[I], L, V) then
      Remove(FLookup[L], V, 1);
  // Delete array
  inherited Delete(Idx, Count);
  // Reindex
  for I := 0 to Length(FLookup) - 1 do
    for V := 0 to Length(FLookup[I]) - 1 do
      begin
        P := @FLookup[I][V];
        if P^ >= Idx then
          Dec(P^);
      end;
end;

procedure THashedAnsiStringArray.Insert(const Idx: Integer; const Count: Integer);
begin
  // Insert array
  inherited Insert(Idx, Count);
  // Rebuild hash table
  Rehash;
end;

procedure THashedAnsiStringArray.SetData(const Data: AnsiStringArray);
begin
  inherited SetData(Data);
  Rehash;
end;

procedure THashedAnsiStringArray.SetItem(const Idx: Integer; const Value: AnsiString);
var S    : AnsiString;
    I, J : Integer;
begin
  {$IFOPT R+}
  if (Idx < 0) or (Idx >= FCount) then
    RaiseIndexError(Idx);
  {$ENDIF}
  // Remove old hash
  S := FData[Idx];
  if LocateItemHash(S, I, J) then
    Remove(FLookup[I], J, 1);
  // Set array value
  FData[Idx] := Value;
  // Add new hash
  Append(FLookup[HashStr(Value, Length(FLookup), FCaseSensitive)], Idx);
end;

function THashedAnsiStringArray.AppendItem(const Value: AnsiString): Integer;
var L : Integer;
begin
  // add to array
  Result := Count;
  Count := Result + 1;
  FData[Result] := Value;
  // add lookup
  L := Length(FLookup);
  Append(FLookup[HashStr(Value, L, FCaseSensitive)], Result);
  if (Result + 1) div ArrayAverageHashChainSize > L then
    Rehash;
end;

function THashedAnsiStringArray.PosNextBuf(const FindStrPtr: PAnsiChar;
    const FindStrLen: Integer; const PrevPos: Integer): Integer;
var I, J, F, L, P : Integer;
begin
  // locate first
  if not LocateItemHashBuf(FindStrPtr, FindStrLen, I, J) then
    begin
      Result := -1;
      exit;
    end;
  if PrevPos < 0 then
    begin
      Result := FLookup[I][J];
      exit;
    end;
  // locate previous
  L := Length(FLookup[I]);
  P := -1;
  for F := J to L - 1 do
    if FLookup[I][F] = PrevPos then
      begin
        P := F;
        break;
      end;
  if P = -1 then
    begin
      Result := 1;
      exit;
    end;
  // locate next
  for F := P + 1 to L - 1 do
    begin
      Result := FLookup[I][F];
      if StrPEqualStr(FindStrPtr, FindStrLen, FData[Result], FCaseSensitive) then
        // found
        exit;
    end;
  // not found
  Result := 1;
end;

function THashedAnsiStringArray.PosNext(const Find: AnsiString; const PrevPos: Integer): Integer;
begin
  Result := PosNextBuf(Pointer(Find), Length(Find), PrevPos);
end;



{                                                                              }
{ DICTIONARY BASE CLASSES                                                      }
{                                                                              }



{                                                                              }
{ ADictionary                                                                  }
{                                                                              }
procedure ADictionary.RaiseDictionaryError(const Msg: AnsiString;
    const ErrorClass: ExceptClass);
var E : ExceptClass;
begin
  if not Assigned(ErrorClass) then
    E := EDictionary
  else
    E := ErrorClass;
  RaiseTypeError(Msg, nil, E);
end;

procedure ADictionary.RaiseKeyNotFoundError(const Key: AnsiString;
    const ErrorClass: ExceptClass);
begin
  RaiseDictionaryError('Key not found: ' + Key, ErrorClass);
end;

procedure ADictionary.RaiseDuplicateKeyError(const Key: AnsiString;
    const ErrorClass: ExceptClass);
begin
  RaiseDictionaryError('Duplicate key: ' + Key, ErrorClass);
end;



{                                                                              }
{ ALongIntDictionary                                                           }
{                                                                              }
function ALongIntDictionary.GetItem(const Key: AnsiString): LongInt;
begin
  if LocateItem(Key, Result) < 0 then
    RaiseKeyNotFoundError(Key, ELongIntDictionary);
end;

procedure ALongIntDictionary.Assign(const Source: TObject);
var I : Integer;
begin
  if Source is ALongIntDictionary then
    begin
      Clear;
      for I := 0 to ALongIntDictionary(Source).Count - 1 do
        Add(ALongIntDictionary(Source).GetKeyByIndex(I),
             ALongIntDictionary(Source).GetItemByIndex(I));
    end else
    inherited Assign(Source);
end;

function ALongIntDictionary.GetAsString: AnsiString;
var I, L : Integer;
begin
  L := Count - 1;
  for I := 0 to L do
    begin
      Result := Result + GetKeyByIndex(I) + ':' + IntToStr(GetItemByIndex(I));
      if I < L then
        Result := Result + ',';
    end;
end;



{                                                                              }
{ ALongWordDictionary                                                          }
{                                                                              }
function ALongWordDictionary.GetItem(const Key: AnsiString): LongWord;
begin
  if LocateItem(Key, Result) < 0 then
    RaiseKeyNotFoundError(Key, ELongWordDictionary);
end;

procedure ALongWordDictionary.Assign(const Source: TObject);
var I : Integer;
begin
  if Source is ALongWordDictionary then
    begin
      Clear;
      for I := 0 to ALongWordDictionary(Source).Count - 1 do
        Add(ALongWordDictionary(Source).GetKeyByIndex(I),
             ALongWordDictionary(Source).GetItemByIndex(I));
    end else
    inherited Assign(Source);
end;

function ALongWordDictionary.GetAsString: AnsiString;
var I, L : Integer;
begin
  L := Count - 1;
  for I := 0 to L do
    begin
      Result := Result + GetKeyByIndex(I) + ':' + IntToStr(GetItemByIndex(I));
      if I < L then
        Result := Result + ',';
    end;
end;



{                                                                              }
{ AInt64Dictionary                                                             }
{                                                                              }
function AInt64Dictionary.GetItem(const Key: AnsiString): Int64;
begin
  if LocateItem(Key, Result) < 0 then
    RaiseKeyNotFoundError(Key, EInt64Dictionary);
end;

procedure AInt64Dictionary.Assign(const Source: TObject);
var I : Integer;
begin
  if Source is AInt64Dictionary then
    begin
      Clear;
      for I := 0 to AInt64Dictionary(Source).Count - 1 do
        Add(AInt64Dictionary(Source).GetKeyByIndex(I),
             AInt64Dictionary(Source).GetItemByIndex(I));
    end else
    inherited Assign(Source);
end;

function AInt64Dictionary.GetAsString: AnsiString;
var I, L : Integer;
begin
  L := Count - 1;
  for I := 0 to L do
    begin
      Result := Result + GetKeyByIndex(I) + ':' + IntToStr(GetItemByIndex(I));
      if I < L then
        Result := Result + ',';
    end;
end;



{                                                                              }
{ ASingleDictionary                                                            }
{                                                                              }
function ASingleDictionary.GetItem(const Key: AnsiString): Single;
begin
  if LocateItem(Key, Result) < 0 then
    RaiseKeyNotFoundError(Key, ESingleDictionary);
end;

procedure ASingleDictionary.Assign(const Source: TObject);
var I : Integer;
begin
  if Source is ASingleDictionary then
    begin
      Clear;
      for I := 0 to ASingleDictionary(Source).Count - 1 do
        Add(ASingleDictionary(Source).GetKeyByIndex(I),
             ASingleDictionary(Source).GetItemByIndex(I));
    end else
    inherited Assign(Source);
end;

function ASingleDictionary.GetAsString: AnsiString;
var I, L : Integer;
begin
  L := Count - 1;
  for I := 0 to L do
    begin
      Result := Result + GetKeyByIndex(I) + ':' + FloatToStr(GetItemByIndex(I));
      if I < L then
        Result := Result + ',';
    end;
end;



{                                                                              }
{ ADoubleDictionary                                                            }
{                                                                              }
function ADoubleDictionary.GetItem(const Key: AnsiString): Double;
begin
  if LocateItem(Key, Result) < 0 then
    RaiseKeyNotFoundError(Key, EDoubleDictionary);
end;

procedure ADoubleDictionary.Assign(const Source: TObject);
var I : Integer;
begin
  if Source is ADoubleDictionary then
    begin
      Clear;
      for I := 0 to ADoubleDictionary(Source).Count - 1 do
        Add(ADoubleDictionary(Source).GetKeyByIndex(I),
             ADoubleDictionary(Source).GetItemByIndex(I));
    end else
    inherited Assign(Source);
end;

function ADoubleDictionary.GetAsString: AnsiString;
var I, L : Integer;
begin
  L := Count - 1;
  for I := 0 to L do
    begin
      Result := Result + GetKeyByIndex(I) + ':' + FloatToStr(GetItemByIndex(I));
      if I < L then
        Result := Result + ',';
    end;
end;



{                                                                              }
{ AExtendedDictionary                                                          }
{                                                                              }
function AExtendedDictionary.GetItem(const Key: AnsiString): Extended;
begin
  if LocateItem(Key, Result) < 0 then
    RaiseKeyNotFoundError(Key, EExtendedDictionary);
end;

procedure AExtendedDictionary.Assign(const Source: TObject);
var I : Integer;
begin
  if Source is AExtendedDictionary then
    begin
      Clear;
      for I := 0 to AExtendedDictionary(Source).Count - 1 do
        Add(AExtendedDictionary(Source).GetKeyByIndex(I),
             AExtendedDictionary(Source).GetItemByIndex(I));
    end else
    inherited Assign(Source);
end;

function AExtendedDictionary.GetAsString: AnsiString;
var I, L : Integer;
begin
  L := Count - 1;
  for I := 0 to L do
    begin
      Result := Result + GetKeyByIndex(I) + ':' + FloatToStr(GetItemByIndex(I));
      if I < L then
        Result := Result + ',';
    end;
end;



{                                                                              }
{ AAnsiStringDictionary                                                        }
{                                                                              }
function AAnsiStringDictionary.GetItem(const Key: AnsiString): AnsiString;
begin
  if LocateItem(Key, Result) < 0 then
    RaiseKeyNotFoundError(Key, EAnsiStringDictionary);
end;

procedure AAnsiStringDictionary.Assign(const Source: TObject);
var I : Integer;
begin
  if Source is AAnsiStringDictionary then
    begin
      Clear;
      for I := 0 to AAnsiStringDictionary(Source).Count - 1 do
        Add(AAnsiStringDictionary(Source).GetKeyByIndex(I),
             AAnsiStringDictionary(Source).GetItemByIndex(I));
    end else
    inherited Assign(Source);
end;

function AAnsiStringDictionary.GetAsString: AnsiString;
var I, L : Integer;
begin
  L := Count - 1;
  for I := 0 to L do
    begin
      Result := Result + GetKeyByIndex(I) + ':' + StrQuoteA(GetItemByIndex(I));
      if I < L then
        Result := Result + ',';
    end;
end;

function AAnsiStringDictionary.GetItemLength(const Key: AnsiString): Integer;
begin
  Result := Length(GetItem(Key));
end;

function AAnsiStringDictionary.GetTotalLength: Int64;
var I : Integer;
begin
  Result := 0;
  for I := 0 to Count - 1 do
    Inc(Result, Length(GetItemByIndex(I)));
end;



{                                                                              }
{ AWideStringDictionary                                                        }
{                                                                              }
function AWideStringDictionary.GetItem(const Key: AnsiString): WideString;
begin
  if LocateItem(Key, Result) < 0 then
    RaiseKeyNotFoundError(Key, EWideStringDictionary);
end;

procedure AWideStringDictionary.Assign(const Source: TObject);
var I : Integer;
begin
  if Source is AWideStringDictionary then
    begin
      Clear;
      for I := 0 to AWideStringDictionary(Source).Count - 1 do
        Add(AWideStringDictionary(Source).GetKeyByIndex(I),
             AWideStringDictionary(Source).GetItemByIndex(I));
    end else
    inherited Assign(Source);
end;

function AWideStringDictionary.GetAsString: AnsiString;
var I, L : Integer;
begin
  L := Count - 1;
  for I := 0 to L do
    begin
      Result := Result + GetKeyByIndex(I) + ':' + StrQuoteA(GetItemByIndex(I));
      if I < L then
        Result := Result + ',';
    end;
end;

function AWideStringDictionary.GetItemLength(const Key: AnsiString): Integer;
begin
  Result := Length(GetItem(Key));
end;

function AWideStringDictionary.GetTotalLength: Int64;
var I : Integer;
begin
  Result := 0;
  for I := 0 to Count - 1 do
    Inc(Result, Length(GetItemByIndex(I)));
end;



{                                                                              }
{ APointerDictionary                                                           }
{                                                                              }
function APointerDictionary.GetItem(const Key: AnsiString): Pointer;
begin
  if LocateItem(Key, Result) < 0 then
    RaiseKeyNotFoundError(Key, EPointerDictionary);
end;

procedure APointerDictionary.Assign(const Source: TObject);
var I : Integer;
begin
  if Source is APointerDictionary then
    begin
      Clear;
      for I := 0 to APointerDictionary(Source).Count - 1 do
        Add(APointerDictionary(Source).GetKeyByIndex(I),
             APointerDictionary(Source).GetItemByIndex(I));
    end else
    inherited Assign(Source);
end;

function APointerDictionary.GetAsString: AnsiString;
var I, L : Integer;
begin
  L := Count - 1;
  for I := 0 to L do
    begin
      Result := Result + GetKeyByIndex(I) + ':' + PointerToStr(GetItemByIndex(I));
      if I < L then
        Result := Result + ',';
    end;
end;



{                                                                              }
{ AObjectDictionary                                                            }
{                                                                              }
function AObjectDictionary.GetItem(const Key: AnsiString): TObject;
begin
  if LocateItem(Key, Result) < 0 then
    RaiseKeyNotFoundError(Key, EObjectDictionary);
end;

function AObjectDictionary.GetAsString: AnsiString;
var I, L : Integer;
begin
  L := Count - 1;
  for I := 0 to L do
    begin
      Result := Result + GetKeyByIndex(I) + ':' + ObjectClassName(GetItemByIndex(I));
      if I < L then
        Result := Result + ',';
    end;
end;

procedure AObjectDictionary.Clear;
begin
  if IsItemOwner then
    FreeItems else
    ReleaseItems;
end;

procedure AObjectDictionary.Assign(const Source: TObject);
var I : Integer;
begin
  if Source is AObjectDictionary then
    begin
      Clear;
      for I := 0 to AObjectDictionary(Source).Count - 1 do
        Add(AObjectDictionary(Source).GetKeyByIndex(I),
             AObjectDictionary(Source).GetItemByIndex(I));
    end else
    inherited Assign(Source);
end;



{                                                                              }
{ AInterfaceDictionary                                                         }
{                                                                              }
function AInterfaceDictionary.GetItem(const Key: AnsiString): IInterface;
begin
  if LocateItem(Key, Result) < 0 then
    RaiseKeyNotFoundError(Key, EInterfaceDictionary);
end;

procedure AInterfaceDictionary.Assign(const Source: TObject);
var I : Integer;
begin
  if Source is AInterfaceDictionary then
    begin
      Clear;
      for I := 0 to AInterfaceDictionary(Source).Count - 1 do
        Add(AInterfaceDictionary(Source).GetKeyByIndex(I),
             AInterfaceDictionary(Source).GetItemByIndex(I));
    end else
    inherited Assign(Source);
end;

function AInterfaceDictionary.GetAsString: AnsiString;
var I, L : Integer;
begin
  L := Count - 1;
  for I := 0 to L do
    begin
      Result := Result + GetKeyByIndex(I);
      if I < L then
        Result := Result + ',';
    end;
end;



{                                                                              }
{ DICTIONARY IMPLEMENTATIONS                                                   }
{                                                                              }



{ Dictionary helper functions                                                  }
function DictionaryRehashSize(const Count: Integer): Integer;
var L : Integer;
begin
  L := Count div DictionaryAverageHashChainSize; // Number of "slots"
  if L <= $10 then                               // Rehash in powers of 16
    Result := $10 else
  if L <= $100 then
    Result := $100 else
  if L <= $1000 then
    Result := $1000 else
  if L <= $10000 then
    Result := $10000 else
  if L <= $100000 then
    Result := $100000 else
  if L <= $1000000 then
    Result := $1000000 else
    Result := $10000000;
end;

{                                                                              }
{ TGeneralLongIntDictionary                                                    }
{                                                                              }
constructor TGeneralLongIntDictionary.Create;
begin
  inherited Create;
  FCaseSensitive := True;
  FDuplicatesAction := ddAccept;
  FAddOnSet := True;
  FKeys := TAnsiStringArray.Create;
  FValues := TLongIntArray.Create;
end;

constructor TGeneralLongIntDictionary.CreateEx(const Keys: AAnsiStringArray;
    const Values: ALongIntArray; const KeysCaseSensitive: Boolean;
    const AddOnSet: Boolean;
    const DuplicatesAction: TDictionaryDuplicatesAction);
var L : Integer;
begin
  inherited Create;
  if Assigned(Keys) then
    begin
      FKeys := Keys;
      L := FKeys.Count;
    end
  else
    begin
      FKeys := TAnsiStringArray.Create;
      L := 0;
    end;
  if Assigned(Values) then
    FValues := Values
  else
    FValues := TLongIntArray.Create;
  FCaseSensitive := KeysCaseSensitive;
  FValues.Count := L;
  FAddOnSet := AddOnSet;
  FDuplicatesAction := DuplicatesAction;
  if L > 0 then
    Rehash;
end;

constructor TLongIntDictionary.CreateEx(const Keys: TAnsiStringArray;
    const Values: TLongIntArray; const KeysCaseSensitive: Boolean;
    const AddOnSet: Boolean;
    const DuplicatesAction: TDictionaryDuplicatesAction);
begin
  inherited CreateEx(Keys, Values, KeysCaseSensitive, AddOnSet,
      DuplicatesAction);
end;

destructor TGeneralLongIntDictionary.Destroy;
begin
  FreeAndNil(FValues);
  FreeAndNil(FKeys);
  inherited Destroy;
end;

function TGeneralLongIntDictionary.GetKeysCaseSensitive: Boolean;
begin
  Result := FCaseSensitive;
end;

function TGeneralLongIntDictionary.GetAddOnSet: Boolean;
begin
  Result := FAddOnSet;
end;

procedure TGeneralLongIntDictionary.SetAddOnSet(const AddOnSet: Boolean);
begin
  FAddOnSet := AddOnSet;
end;

function TGeneralLongIntDictionary.GetHashTableSize: Integer;
begin
  Result := Length(FLookup);
end;

procedure TGeneralLongIntDictionary.Rehash;
var I, C, L : Integer;
begin
  C := FKeys.Count;
  L := DictionaryRehashSize(C);
  FLookup := nil;
  SetLength(FLookup, L);
  FHashSize := L;
  Assert(L > 0);
  Dec(L);
  for I := 0 to C - 1 do
    Append(FLookup[HashStr(FKeys[I], 0, FCaseSensitive) and L], I);
end;

function TGeneralLongIntDictionary.LocateKey(const Key: AnsiString; var LookupIdx: Integer;
    const ErrorIfNotFound: Boolean): Integer;
var H, I, J, L, K : Integer;
begin
  L := FHashSize;
  if L > 0 then
    begin
      K := Length(Key);
      if FCaseSensitive then
        H := HashStrBuf(Pointer(Key), K, 0) and (L - 1)
      else
        H := HashStrBufNoCase(Pointer(Key), K, 0) and (L - 1);
      LookupIdx := H;
      for I := 0 to Length(FLookup[H]) - 1 do
        begin
          J := FLookup[H, I];
          if StrPEqualStr(Pointer(Key), K, FKeys[J], FCaseSensitive) then
            begin
              Result := J;
              exit;
            end;
        end;
    end;
  if ErrorIfNotFound then
    RaiseKeyNotFoundError(Key, ELongIntDictionary);
  Result := -1;
end;

procedure TGeneralLongIntDictionary.Add(const Key: AnsiString; const Value: LongInt);
var H, L, I : Integer;
begin
  if FDuplicatesAction in [ddIgnore, ddError] then
    if LocateKey(Key, H, False) >= 0 then
      if FDuplicatesAction = ddIgnore then
        exit
      else
        RaiseDuplicateKeyError(Key);
  L := FHashSize;
  if L = 0 then
    begin
      Rehash;
      L := FHashSize;
      Assert(L > 0);
    end;
  H := Integer(HashStr(Key, 0, FCaseSensitive) and (L - 1));
  I := FKeys.AppendItem(Key);
  Append(FLookup[H], I);
  FValues.AppendItem(Value);
  if (I + 1) div DictionaryAverageHashChainSize > L then
    Rehash;
end;

procedure TGeneralLongIntDictionary.DeleteByIndex(const Idx: Integer; const Hash: Integer);
var I, J, H : Integer;
begin
  if Hash = -1 then
    H := HashStr(FKeys[Idx], 0, FCaseSensitive) and (FHashSize - 1)
  else
    H := Hash;
  FKeys.Delete(Idx);
  FValues.Delete(Idx);
  J := PosNext(Idx, FLookup[H]);
  Assert(J >= 0, 'Invalid hash value/lookup table');
  Remove(FLookup[H], J, 1);

  for I := 0 to FHashSize - 1 do
    for J := 0 to Length(FLookup[I]) - 1 do
      if FLookup[I][J] > Idx then
        Dec(FLookup[I][J]);
end;

procedure TGeneralLongIntDictionary.Delete(const Key: AnsiString);
var I, H : Integer;
begin
  I := LocateKey(Key, H, True);
  DeleteByIndex(I, H);
end;

function TGeneralLongIntDictionary.HasKey(const Key: AnsiString): Boolean;
var H : Integer;
begin
  Result := LocateKey(Key, H, False) >= 0;
end;

procedure TGeneralLongIntDictionary.Rename(const Key, NewKey: AnsiString);
var I, J, H : Integer;
begin
  I := LocateKey(Key, H, True);
  FKeys[I] := NewKey;
  J := PosNext(I, FLookup[H]);
  Assert(J >= 0, 'Invalid hash value/lookup table');
  Remove(FLookup[H], J, 1);
  Append(FLookup[HashStr(NewKey, 0, FCaseSensitive) and (FHashSize - 1)], I);
end;

function TGeneralLongIntDictionary.GetDuplicatesAction: TDictionaryDuplicatesAction;
begin
  Result := FDuplicatesAction;
end;

procedure TGeneralLongIntDictionary.SetDuplicatesAction(const DuplicatesAction: TDictionaryDuplicatesAction);
begin
  FDuplicatesAction := DuplicatesAction;
end;

function TGeneralLongIntDictionary.LocateItem(const Key: AnsiString; var Value: LongInt): Integer;
var H : Integer;
begin
  Result := LocateKey(Key, H, False);
  if Result >= 0 then
    Value := FValues[Result]
  else
    Value := 0;
end;

function TGeneralLongIntDictionary.LocateNext(const Key: AnsiString; const Idx: Integer; var Value: LongInt): Integer;
var L, H, I, J, K : Integer;
begin
  Result := -1;
  L := FHashSize;
  if L = 0 then
    RaiseKeyNotFoundError(Key, ELongIntDictionary);
  H := HashStr(Key, 0, FCaseSensitive) and (L - 1);
  for I := 0 to Length(FLookup[H]) - 1 do
    begin
      J := FLookup[H, I];
      if J = Idx then
        begin
          if not StrEqualA(Key, FKeys[J], FCaseSensitive) then
            RaiseKeyNotFoundError(Key, ELongIntDictionary);
          for K := I + 1 to Length(FLookup[H]) - 1 do
            begin
              J := FLookup[H, K];
              if StrEqualA(Key, FKeys[J], FCaseSensitive) then
                begin
                  Value := FValues[J];
                  Result := J;
                  exit;
                end;
            end;
          Result := -1;
          exit;
        end;
    end;
  RaiseKeyNotFoundError(Key, ELongIntDictionary);
end;

procedure TGeneralLongIntDictionary.SetItem(const Key: AnsiString; const Value: LongInt);
var I, H : Integer;
begin
  I := LocateKey(Key, H, False);
  if I >= 0 then
    FValues[I] := Value else
    if AddOnSet then
      Add(Key, Value) else
      RaiseKeyNotFoundError(Key, ELongIntDictionary);
end;

procedure TGeneralLongIntDictionary.RaiseIndexError;
begin
  RaiseDictionaryError('Index out of range', ELongIntDictionary);
end;

function TGeneralLongIntDictionary.Count: Integer;
begin
  Result := FKeys.Count;
  Assert(FValues.Count = Result, 'Key/Value count mismatch');
end;

function TGeneralLongIntDictionary.GetKeyByIndex(const Idx: Integer): AnsiString;
begin
  {$IFOPT R+}
  if (Idx < 0) or (Idx >= FKeys.Count) then
    RaiseIndexError;
  {$ENDIF}
  Result := FKeys[Idx];
end;

procedure TGeneralLongIntDictionary.DeleteItemByIndex(const Idx: Integer);
begin
  {$IFOPT R+}
  if (Idx < 0) or (Idx >= FValues.Count) then
    RaiseIndexError;
  {$ENDIF}
  DeleteByIndex(Idx, -1);
end;

function TGeneralLongIntDictionary.GetItemByIndex(const Idx: Integer): LongInt;
begin
  {$IFOPT R+}
  if (Idx < 0) or (Idx >= FValues.Count) then
    RaiseIndexError;
  {$ENDIF}
  Result := FValues[Idx];
end;

procedure TGeneralLongIntDictionary.SetItemByIndex(const Idx: Integer; const Value: LongInt);
begin
  {$IFOPT R+}
  if (Idx < 0) or (Idx >= FValues.Count) then
    RaiseIndexError;
  {$ENDIF}
  FValues[Idx] := Value;
end;

procedure TGeneralLongIntDictionary.Clear;
begin
  FKeys.Clear;
  FValues.Clear;
  FHashSize := 0;
  FLookup := nil;
end;



{                                                                              }
{ TLongIntDictionary                                                           }
{                                                                              }
function TLongIntDictionary.LocateKey(const Key: AnsiString; var LookupIdx: Integer;
    const ErrorIfNotFound: Boolean): Integer;
var H, I, L, K : Integer;
begin
  L := FHashSize;
  if L > 0 then
    begin
      K := Length(Key);
      if FCaseSensitive then
        LongWord(H) := HashStrBuf(Pointer(Key), K, 0) and (L - 1)
      else
        LongWord(H) := HashStrBufNoCase(Pointer(Key), K, 0) and (L - 1);
      LookupIdx := H;
      for I := 0 to Length(FLookup[H]) - 1 do
        begin
          Result := FLookup[H][I];
          if StrPEqualStr(Pointer(Key), K, TAnsiStringArray(FKeys).Data[Result],
              FCaseSensitive) then
            exit;
        end;
    end;
  if ErrorIfNotFound then
    RaiseKeyNotFoundError(Key, ELongIntDictionary);
  Result := -1;
end;

function TLongIntDictionary.GetItem(const Key: AnsiString): LongInt;
var H, I : Integer;
begin
  I := LocateKey(Key, H, False);
  if I >= 0 then
    Result := TLongIntArray(FValues).Data[I]
  else
    Result := 0;
end;

function TLongIntDictionary.LocateItem(const Key: AnsiString; var Value: LongInt): Integer;
var H : Integer;
begin
  Result := LocateKey(Key, H, False);
  if Result >= 0 then
    Value := TLongIntArray(FValues).Data[Result]
  else
    Value := 0;
end;



{                                                                              }
{ TGeneralLongWordDictionary                                                   }
{                                                                              }
constructor TGeneralLongWordDictionary.Create;
begin
  inherited Create;
  FCaseSensitive := True;
  FDuplicatesAction := ddAccept;
  FAddOnSet := True;
  FKeys := TAnsiStringArray.Create;
  FValues := TLongWordArray.Create;
end;

constructor TGeneralLongWordDictionary.CreateEx(const Keys: AAnsiStringArray;
    const Values: ALongWordArray; const KeysCaseSensitive: Boolean;
    const AddOnSet: Boolean;
    const DuplicatesAction: TDictionaryDuplicatesAction);
var L : Integer;
begin
  inherited Create;
  if Assigned(Keys) then
    begin
      FKeys := Keys;
      L := FKeys.Count;
    end
  else
    begin
      FKeys := TAnsiStringArray.Create;
      L := 0;
    end;
  if Assigned(Values) then
    FValues := Values
  else
    FValues := TLongWordArray.Create;
  FCaseSensitive := KeysCaseSensitive;
  FValues.Count := L;
  FAddOnSet := AddOnSet;
  FDuplicatesAction := DuplicatesAction;
  if L > 0 then
    Rehash;
end;

constructor TLongWordDictionary.CreateEx(const Keys: TAnsiStringArray;
    const Values: TLongWordArray; const KeysCaseSensitive: Boolean;
    const AddOnSet: Boolean;
    const DuplicatesAction: TDictionaryDuplicatesAction);
begin
  inherited CreateEx(Keys, Values, KeysCaseSensitive, AddOnSet,
      DuplicatesAction);
end;

destructor TGeneralLongWordDictionary.Destroy;
begin
  FreeAndNil(FValues);
  FreeAndNil(FKeys);
  inherited Destroy;
end;

function TGeneralLongWordDictionary.GetKeysCaseSensitive: Boolean;
begin
  Result := FCaseSensitive;
end;

function TGeneralLongWordDictionary.GetAddOnSet: Boolean;
begin
  Result := FAddOnSet;
end;

procedure TGeneralLongWordDictionary.SetAddOnSet(const AddOnSet: Boolean);
begin
  FAddOnSet := AddOnSet;
end;

function TGeneralLongWordDictionary.GetHashTableSize: Integer;
begin
  Result := Length(FLookup);
end;

procedure TGeneralLongWordDictionary.Rehash;
var I, C, L : Integer;
begin
  C := FKeys.Count;
  L := DictionaryRehashSize(C);
  FLookup := nil;
  SetLength(FLookup, L);
  FHashSize := L;
  Assert(L > 0);
  Dec(L);
  for I := 0 to C - 1 do
    Append(FLookup[HashStr(FKeys[I], 0, FCaseSensitive) and L], I);
end;

function TGeneralLongWordDictionary.LocateKey(const Key: AnsiString; var LookupIdx: Integer;
    const ErrorIfNotFound: Boolean): Integer;
var H, I, J, L, K : Integer;
begin
  L := FHashSize;
  if L > 0 then
    begin
      K := Length(Key);
      if FCaseSensitive then
        H := HashStrBuf(Pointer(Key), K, 0) and (L - 1)
      else
        H := HashStrBufNoCase(Pointer(Key), K, 0) and (L - 1);
      LookupIdx := H;
      for I := 0 to Length(FLookup[H]) - 1 do
        begin
          J := FLookup[H, I];
          if StrPEqualStr(Pointer(Key), K, FKeys[J], FCaseSensitive) then
            begin
              Result := J;
              exit;
            end;
        end;
    end;
  if ErrorIfNotFound then
    RaiseKeyNotFoundError(Key, ELongWordDictionary);
  Result := -1;
end;

procedure TGeneralLongWordDictionary.Add(const Key: AnsiString; const Value: LongWord);
var H, L, I : Integer;
begin
  if FDuplicatesAction in [ddIgnore, ddError] then
    if LocateKey(Key, H, False) >= 0 then
      if FDuplicatesAction = ddIgnore then
        exit
      else
        RaiseDuplicateKeyError(Key);
  L := FHashSize;
  if L = 0 then
    begin
      Rehash;
      L := FHashSize;
      Assert(L > 0);
    end;
  H := Integer(HashStr(Key, 0, FCaseSensitive) and (L - 1));
  I := FKeys.AppendItem(Key);
  Append(FLookup[H], I);
  FValues.AppendItem(Value);
  if (I + 1) div DictionaryAverageHashChainSize > L then
    Rehash;
end;

procedure TGeneralLongWordDictionary.DeleteByIndex(const Idx: Integer; const Hash: Integer);
var I, J, H : Integer;
begin
  if Hash = -1 then
    H := HashStr(FKeys[Idx], 0, FCaseSensitive) and (FHashSize - 1)
  else
    H := Hash;
  FKeys.Delete(Idx);
  FValues.Delete(Idx);
  J := PosNext(Idx, FLookup[H]);
  Assert(J >= 0, 'Invalid hash value/lookup table');
  Remove(FLookup[H], J, 1);

  for I := 0 to FHashSize - 1 do
    for J := 0 to Length(FLookup[I]) - 1 do
      if FLookup[I][J] > Idx then
        Dec(FLookup[I][J]);
end;

procedure TGeneralLongWordDictionary.Delete(const Key: AnsiString);
var I, H : Integer;
begin
  I := LocateKey(Key, H, True);
  DeleteByIndex(I, H);
end;

function TGeneralLongWordDictionary.HasKey(const Key: AnsiString): Boolean;
var H : Integer;
begin
  Result := LocateKey(Key, H, False) >= 0;
end;

procedure TGeneralLongWordDictionary.Rename(const Key, NewKey: AnsiString);
var I, J, H : Integer;
begin
  I := LocateKey(Key, H, True);
  FKeys[I] := NewKey;
  J := PosNext(I, FLookup[H]);
  Assert(J >= 0, 'Invalid hash value/lookup table');
  Remove(FLookup[H], J, 1);
  Append(FLookup[HashStr(NewKey, 0, FCaseSensitive) and (FHashSize - 1)], I);
end;

function TGeneralLongWordDictionary.GetDuplicatesAction: TDictionaryDuplicatesAction;
begin
  Result := FDuplicatesAction;
end;

procedure TGeneralLongWordDictionary.SetDuplicatesAction(const DuplicatesAction: TDictionaryDuplicatesAction);
begin
  FDuplicatesAction := DuplicatesAction;
end;

function TGeneralLongWordDictionary.LocateItem(const Key: AnsiString; var Value: LongWord): Integer;
var H : Integer;
begin
  Result := LocateKey(Key, H, False);
  if Result >= 0 then
    Value := FValues[Result]
  else
    Value := 0;
end;

function TGeneralLongWordDictionary.LocateNext(const Key: AnsiString; const Idx: Integer; var Value: LongWord): Integer;
var L, H, I, J, K : Integer;
begin
  Result := -1;
  L := FHashSize;
  if L = 0 then
    RaiseKeyNotFoundError(Key, ELongWordDictionary);
  H := HashStr(Key, 0, FCaseSensitive) and (L - 1);
  for I := 0 to Length(FLookup[H]) - 1 do
    begin
      J := FLookup[H, I];
      if J = Idx then
        begin
          if not StrEqualA(Key, FKeys[J], FCaseSensitive) then
            RaiseKeyNotFoundError(Key, ELongWordDictionary);
          for K := I + 1 to Length(FLookup[H]) - 1 do
            begin
              J := FLookup[H, K];
              if StrEqualA(Key, FKeys[J], FCaseSensitive) then
                begin
                  Value := FValues[J];
                  Result := J;
                  exit;
                end;
            end;
          Result := -1;
          exit;
        end;
    end;
  RaiseKeyNotFoundError(Key, ELongWordDictionary);
end;

procedure TGeneralLongWordDictionary.SetItem(const Key: AnsiString; const Value: LongWord);
var I, H : Integer;
begin
  I := LocateKey(Key, H, False);
  if I >= 0 then
    FValues[I] := Value else
    if AddOnSet then
      Add(Key, Value) else
      RaiseKeyNotFoundError(Key, ELongWordDictionary);
end;

procedure TGeneralLongWordDictionary.RaiseIndexError;
begin
  RaiseDictionaryError('Index out of range', ELongWordDictionary);
end;

function TGeneralLongWordDictionary.Count: Integer;
begin
  Result := FKeys.Count;
  Assert(FValues.Count = Result, 'Key/Value count mismatch');
end;

function TGeneralLongWordDictionary.GetKeyByIndex(const Idx: Integer): AnsiString;
begin
  {$IFOPT R+}
  if (Idx < 0) or (Idx >= FKeys.Count) then
    RaiseIndexError;
  {$ENDIF}
  Result := FKeys[Idx];
end;

procedure TGeneralLongWordDictionary.DeleteItemByIndex(const Idx: Integer);
begin
  {$IFOPT R+}
  if (Idx < 0) or (Idx >= FValues.Count) then
    RaiseIndexError;
  {$ENDIF}
  DeleteByIndex(Idx, -1);
end;

function TGeneralLongWordDictionary.GetItemByIndex(const Idx: Integer): LongWord;
begin
  {$IFOPT R+}
  if (Idx < 0) or (Idx >= FValues.Count) then
    RaiseIndexError;
  {$ENDIF}
  Result := FValues[Idx];
end;

procedure TGeneralLongWordDictionary.SetItemByIndex(const Idx: Integer; const Value: LongWord);
begin
  {$IFOPT R+}
  if (Idx < 0) or (Idx >= FValues.Count) then
    RaiseIndexError;
  {$ENDIF}
  FValues[Idx] := Value;
end;

procedure TGeneralLongWordDictionary.Clear;
begin
  FKeys.Clear;
  FValues.Clear;
  FHashSize := 0;
  FLookup := nil;
end;



{                                                                              }
{ TLongWordDictionary                                                          }
{                                                                              }
function TLongWordDictionary.LocateKey(const Key: AnsiString; var LookupIdx: Integer;
    const ErrorIfNotFound: Boolean): Integer;
var H, I, L, K : Integer;
begin
  L := FHashSize;
  if L > 0 then
    begin
      K := Length(Key);
      if FCaseSensitive then
        LongWord(H) := HashStrBuf(Pointer(Key), K, 0) and (L - 1)
      else
        LongWord(H) := HashStrBufNoCase(Pointer(Key), K, 0) and (L - 1);
      LookupIdx := H;
      for I := 0 to Length(FLookup[H]) - 1 do
        begin
          Result := FLookup[H][I];
          if StrPEqualStr(Pointer(Key), K, TAnsiStringArray(FKeys).Data[Result],
              FCaseSensitive) then
            exit;
        end;
    end;
  if ErrorIfNotFound then
    RaiseKeyNotFoundError(Key, ELongWordDictionary);
  Result := -1;
end;

function TLongWordDictionary.GetItem(const Key: AnsiString): LongWord;
var H, I : Integer;
begin
  I := LocateKey(Key, H, False);
  if I >= 0 then
    Result := TLongWordArray(FValues).Data[I]
  else
    Result := 0;
end;

function TLongWordDictionary.LocateItem(const Key: AnsiString; var Value: LongWord): Integer;
var H : Integer;
begin
  Result := LocateKey(Key, H, False);
  if Result >= 0 then
    Value := TLongWordArray(FValues).Data[Result]
  else
    Value := 0;
end;



{                                                                              }
{ TGeneralInt64Dictionary                                                      }
{                                                                              }
constructor TGeneralInt64Dictionary.Create;
begin
  inherited Create;
  FCaseSensitive := True;
  FDuplicatesAction := ddAccept;
  FAddOnSet := True;
  FKeys := TAnsiStringArray.Create;
  FValues := TInt64Array.Create;
end;

constructor TGeneralInt64Dictionary.CreateEx(const Keys: AAnsiStringArray;
    const Values: AInt64Array; const KeysCaseSensitive: Boolean;
    const AddOnSet: Boolean;
    const DuplicatesAction: TDictionaryDuplicatesAction);
var L : Integer;
begin
  inherited Create;
  if Assigned(Keys) then
    begin
      FKeys := Keys;
      L := FKeys.Count;
    end
  else
    begin
      FKeys := TAnsiStringArray.Create;
      L := 0;
    end;
  if Assigned(Values) then
    FValues := Values
  else
    FValues := TInt64Array.Create;
  FCaseSensitive := KeysCaseSensitive;
  FValues.Count := L;
  FAddOnSet := AddOnSet;
  FDuplicatesAction := DuplicatesAction;
  if L > 0 then
    Rehash;
end;

constructor TInt64Dictionary.CreateEx(const Keys: TAnsiStringArray;
    const Values: TInt64Array; const KeysCaseSensitive: Boolean;
    const AddOnSet: Boolean;
    const DuplicatesAction: TDictionaryDuplicatesAction);
begin
  inherited CreateEx(Keys, Values, KeysCaseSensitive, AddOnSet,
      DuplicatesAction);
end;

destructor TGeneralInt64Dictionary.Destroy;
begin
  FreeAndNil(FValues);
  FreeAndNil(FKeys);
  inherited Destroy;
end;

function TGeneralInt64Dictionary.GetKeysCaseSensitive: Boolean;
begin
  Result := FCaseSensitive;
end;

function TGeneralInt64Dictionary.GetAddOnSet: Boolean;
begin
  Result := FAddOnSet;
end;

procedure TGeneralInt64Dictionary.SetAddOnSet(const AddOnSet: Boolean);
begin
  FAddOnSet := AddOnSet;
end;

function TGeneralInt64Dictionary.GetHashTableSize: Integer;
begin
  Result := Length(FLookup);
end;

procedure TGeneralInt64Dictionary.Rehash;
var I, C, L : Integer;
begin
  C := FKeys.Count;
  L := DictionaryRehashSize(C);
  FLookup := nil;
  SetLength(FLookup, L);
  FHashSize := L;
  Assert(L > 0);
  Dec(L);
  for I := 0 to C - 1 do
    Append(FLookup[HashStr(FKeys[I], 0, FCaseSensitive) and L], I);
end;

function TGeneralInt64Dictionary.LocateKey(const Key: AnsiString; var LookupIdx: Integer;
    const ErrorIfNotFound: Boolean): Integer;
var H, I, J, L, K : Integer;
begin
  L := FHashSize;
  if L > 0 then
    begin
      K := Length(Key);
      if FCaseSensitive then
        H := HashStrBuf(Pointer(Key), K, 0) and (L - 1)
      else
        H := HashStrBufNoCase(Pointer(Key), K, 0) and (L - 1);
      LookupIdx := H;
      for I := 0 to Length(FLookup[H]) - 1 do
        begin
          J := FLookup[H, I];
          if StrPEqualStr(Pointer(Key), K, FKeys[J], FCaseSensitive) then
            begin
              Result := J;
              exit;
            end;
        end;
    end;
  if ErrorIfNotFound then
    RaiseKeyNotFoundError(Key, EInt64Dictionary);
  Result := -1;
end;

procedure TGeneralInt64Dictionary.Add(const Key: AnsiString; const Value: Int64);
var H, L, I : Integer;
begin
  if FDuplicatesAction in [ddIgnore, ddError] then
    if LocateKey(Key, H, False) >= 0 then
      if FDuplicatesAction = ddIgnore then
        exit
      else
        RaiseDuplicateKeyError(Key);
  L := FHashSize;
  if L = 0 then
    begin
      Rehash;
      L := FHashSize;
      Assert(L > 0);
    end;
  H := Integer(HashStr(Key, 0, FCaseSensitive) and (L - 1));
  I := FKeys.AppendItem(Key);
  Append(FLookup[H], I);
  FValues.AppendItem(Value);
  if (I + 1) div DictionaryAverageHashChainSize > L then
    Rehash;
end;

procedure TGeneralInt64Dictionary.DeleteByIndex(const Idx: Integer; const Hash: Integer);
var I, J, H : Integer;
begin
  if Hash = -1 then
    H := HashStr(FKeys[Idx], 0, FCaseSensitive) and (FHashSize - 1)
  else
    H := Hash;
  FKeys.Delete(Idx);
  FValues.Delete(Idx);
  J := PosNext(Idx, FLookup[H]);
  Assert(J >= 0, 'Invalid hash value/lookup table');
  Remove(FLookup[H], J, 1);

  for I := 0 to FHashSize - 1 do
    for J := 0 to Length(FLookup[I]) - 1 do
      if FLookup[I][J] > Idx then
        Dec(FLookup[I][J]);
end;

procedure TGeneralInt64Dictionary.Delete(const Key: AnsiString);
var I, H : Integer;
begin
  I := LocateKey(Key, H, True);
  DeleteByIndex(I, H);
end;

function TGeneralInt64Dictionary.HasKey(const Key: AnsiString): Boolean;
var H : Integer;
begin
  Result := LocateKey(Key, H, False) >= 0;
end;

procedure TGeneralInt64Dictionary.Rename(const Key, NewKey: AnsiString);
var I, J, H : Integer;
begin
  I := LocateKey(Key, H, True);
  FKeys[I] := NewKey;
  J := PosNext(I, FLookup[H]);
  Assert(J >= 0, 'Invalid hash value/lookup table');
  Remove(FLookup[H], J, 1);
  Append(FLookup[HashStr(NewKey, 0, FCaseSensitive) and (FHashSize - 1)], I);
end;

function TGeneralInt64Dictionary.GetDuplicatesAction: TDictionaryDuplicatesAction;
begin
  Result := FDuplicatesAction;
end;

procedure TGeneralInt64Dictionary.SetDuplicatesAction(const DuplicatesAction: TDictionaryDuplicatesAction);
begin
  FDuplicatesAction := DuplicatesAction;
end;

function TGeneralInt64Dictionary.LocateItem(const Key: AnsiString; var Value: Int64): Integer;
var H : Integer;
begin
  Result := LocateKey(Key, H, False);
  if Result >= 0 then
    Value := FValues[Result]
  else
    Value := 0;
end;

function TGeneralInt64Dictionary.LocateNext(const Key: AnsiString; const Idx: Integer; var Value: Int64): Integer;
var L, H, I, J, K : Integer;
begin
  Result := -1;
  L := FHashSize;
  if L = 0 then
    RaiseKeyNotFoundError(Key, EInt64Dictionary);
  H := HashStr(Key, 0, FCaseSensitive) and (L - 1);
  for I := 0 to Length(FLookup[H]) - 1 do
    begin
      J := FLookup[H, I];
      if J = Idx then
        begin
          if not StrEqualA(Key, FKeys[J], FCaseSensitive) then
            RaiseKeyNotFoundError(Key, EInt64Dictionary);
          for K := I + 1 to Length(FLookup[H]) - 1 do
            begin
              J := FLookup[H, K];
              if StrEqualA(Key, FKeys[J], FCaseSensitive) then
                begin
                  Value := FValues[J];
                  Result := J;
                  exit;
                end;
            end;
          Result := -1;
          exit;
        end;
    end;
  RaiseKeyNotFoundError(Key, EInt64Dictionary);
end;

procedure TGeneralInt64Dictionary.SetItem(const Key: AnsiString; const Value: Int64);
var I, H : Integer;
begin
  I := LocateKey(Key, H, False);
  if I >= 0 then
    FValues[I] := Value else
    if AddOnSet then
      Add(Key, Value) else
      RaiseKeyNotFoundError(Key, EInt64Dictionary);
end;

procedure TGeneralInt64Dictionary.RaiseIndexError;
begin
  RaiseDictionaryError('Index out of range', EInt64Dictionary);
end;

function TGeneralInt64Dictionary.Count: Integer;
begin
  Result := FKeys.Count;
  Assert(FValues.Count = Result, 'Key/Value count mismatch');
end;

function TGeneralInt64Dictionary.GetKeyByIndex(const Idx: Integer): AnsiString;
begin
  {$IFOPT R+}
  if (Idx < 0) or (Idx >= FKeys.Count) then
    RaiseIndexError;
  {$ENDIF}
  Result := FKeys[Idx];
end;

procedure TGeneralInt64Dictionary.DeleteItemByIndex(const Idx: Integer);
begin
  {$IFOPT R+}
  if (Idx < 0) or (Idx >= FValues.Count) then
    RaiseIndexError;
  {$ENDIF}
  DeleteByIndex(Idx, -1);
end;

function TGeneralInt64Dictionary.GetItemByIndex(const Idx: Integer): Int64;
begin
  {$IFOPT R+}
  if (Idx < 0) or (Idx >= FValues.Count) then
    RaiseIndexError;
  {$ENDIF}
  Result := FValues[Idx];
end;

procedure TGeneralInt64Dictionary.SetItemByIndex(const Idx: Integer; const Value: Int64);
begin
  {$IFOPT R+}
  if (Idx < 0) or (Idx >= FValues.Count) then
    RaiseIndexError;
  {$ENDIF}
  FValues[Idx] := Value;
end;

procedure TGeneralInt64Dictionary.Clear;
begin
  FKeys.Clear;
  FValues.Clear;
  FHashSize := 0;
  FLookup := nil;
end;



{                                                                              }
{ TInt64Dictionary                                                             }
{                                                                              }
function TInt64Dictionary.LocateKey(const Key: AnsiString; var LookupIdx: Integer;
    const ErrorIfNotFound: Boolean): Integer;
var H, I, L, K : Integer;
begin
  L := FHashSize;
  if L > 0 then
    begin
      K := Length(Key);
      if FCaseSensitive then
        LongWord(H) := HashStrBuf(Pointer(Key), K, 0) and (L - 1)
      else
        LongWord(H) := HashStrBufNoCase(Pointer(Key), K, 0) and (L - 1);
      LookupIdx := H;
      for I := 0 to Length(FLookup[H]) - 1 do
        begin
          Result := FLookup[H][I];
          if StrPEqualStr(Pointer(Key), K, TAnsiStringArray(FKeys).Data[Result],
              FCaseSensitive) then
            exit;
        end;
    end;
  if ErrorIfNotFound then
    RaiseKeyNotFoundError(Key, EInt64Dictionary);
  Result := -1;
end;

function TInt64Dictionary.GetItem(const Key: AnsiString): Int64;
var H, I : Integer;
begin
  I := LocateKey(Key, H, False);
  if I >= 0 then
    Result := TInt64Array(FValues).Data[I]
  else
    Result := 0;
end;

function TInt64Dictionary.LocateItem(const Key: AnsiString; var Value: Int64): Integer;
var H : Integer;
begin
  Result := LocateKey(Key, H, False);
  if Result >= 0 then
    Value := TInt64Array(FValues).Data[Result]
  else
    Value := 0;
end;



{                                                                              }
{ TGeneralSingleDictionary                                                     }
{                                                                              }
constructor TGeneralSingleDictionary.Create;
begin
  inherited Create;
  FCaseSensitive := True;
  FDuplicatesAction := ddAccept;
  FAddOnSet := True;
  FKeys := TAnsiStringArray.Create;
  FValues := TSingleArray.Create;
end;

constructor TGeneralSingleDictionary.CreateEx(const Keys: AAnsiStringArray;
    const Values: ASingleArray; const KeysCaseSensitive: Boolean;
    const AddOnSet: Boolean;
    const DuplicatesAction: TDictionaryDuplicatesAction);
var L : Integer;
begin
  inherited Create;
  if Assigned(Keys) then
    begin
      FKeys := Keys;
      L := FKeys.Count;
    end
  else
    begin
      FKeys := TAnsiStringArray.Create;
      L := 0;
    end;
  if Assigned(Values) then
    FValues := Values
  else
    FValues := TSingleArray.Create;
  FCaseSensitive := KeysCaseSensitive;
  FValues.Count := L;
  FAddOnSet := AddOnSet;
  FDuplicatesAction := DuplicatesAction;
  if L > 0 then
    Rehash;
end;

constructor TSingleDictionary.CreateEx(const Keys: TAnsiStringArray;
    const Values: TSingleArray; const KeysCaseSensitive: Boolean;
    const AddOnSet: Boolean;
    const DuplicatesAction: TDictionaryDuplicatesAction);
begin
  inherited CreateEx(Keys, Values, KeysCaseSensitive, AddOnSet,
      DuplicatesAction);
end;

destructor TGeneralSingleDictionary.Destroy;
begin
  FreeAndNil(FValues);
  FreeAndNil(FKeys);
  inherited Destroy;
end;

function TGeneralSingleDictionary.GetKeysCaseSensitive: Boolean;
begin
  Result := FCaseSensitive;
end;

function TGeneralSingleDictionary.GetAddOnSet: Boolean;
begin
  Result := FAddOnSet;
end;

procedure TGeneralSingleDictionary.SetAddOnSet(const AddOnSet: Boolean);
begin
  FAddOnSet := AddOnSet;
end;

function TGeneralSingleDictionary.GetHashTableSize: Integer;
begin
  Result := Length(FLookup);
end;

procedure TGeneralSingleDictionary.Rehash;
var I, C, L : Integer;
begin
  C := FKeys.Count;
  L := DictionaryRehashSize(C);
  FLookup := nil;
  SetLength(FLookup, L);
  FHashSize := L;
  Assert(L > 0);
  Dec(L);
  for I := 0 to C - 1 do
    Append(FLookup[HashStr(FKeys[I], 0, FCaseSensitive) and L], I);
end;

function TGeneralSingleDictionary.LocateKey(const Key: AnsiString; var LookupIdx: Integer;
    const ErrorIfNotFound: Boolean): Integer;
var H, I, J, L, K : Integer;
begin
  L := FHashSize;
  if L > 0 then
    begin
      K := Length(Key);
      if FCaseSensitive then
        H := HashStrBuf(Pointer(Key), K, 0) and (L - 1)
      else
        H := HashStrBufNoCase(Pointer(Key), K, 0) and (L - 1);
      LookupIdx := H;
      for I := 0 to Length(FLookup[H]) - 1 do
        begin
          J := FLookup[H, I];
          if StrPEqualStr(Pointer(Key), K, FKeys[J], FCaseSensitive) then
            begin
              Result := J;
              exit;
            end;
        end;
    end;
  if ErrorIfNotFound then
    RaiseKeyNotFoundError(Key, ESingleDictionary);
  Result := -1;
end;

procedure TGeneralSingleDictionary.Add(const Key: AnsiString; const Value: Single);
var H, L, I : Integer;
begin
  if FDuplicatesAction in [ddIgnore, ddError] then
    if LocateKey(Key, H, False) >= 0 then
      if FDuplicatesAction = ddIgnore then
        exit
      else
        RaiseDuplicateKeyError(Key);
  L := FHashSize;
  if L = 0 then
    begin
      Rehash;
      L := FHashSize;
      Assert(L > 0);
    end;
  H := Integer(HashStr(Key, 0, FCaseSensitive) and (L - 1));
  I := FKeys.AppendItem(Key);
  Append(FLookup[H], I);
  FValues.AppendItem(Value);
  if (I + 1) div DictionaryAverageHashChainSize > L then
    Rehash;
end;

procedure TGeneralSingleDictionary.DeleteByIndex(const Idx: Integer; const Hash: Integer);
var I, J, H : Integer;
begin
  if Hash = -1 then
    H := HashStr(FKeys[Idx], 0, FCaseSensitive) and (FHashSize - 1)
  else
    H := Hash;
  FKeys.Delete(Idx);
  FValues.Delete(Idx);
  J := PosNext(Idx, FLookup[H]);
  Assert(J >= 0, 'Invalid hash value/lookup table');
  Remove(FLookup[H], J, 1);

  for I := 0 to FHashSize - 1 do
    for J := 0 to Length(FLookup[I]) - 1 do
      if FLookup[I][J] > Idx then
        Dec(FLookup[I][J]);
end;

procedure TGeneralSingleDictionary.Delete(const Key: AnsiString);
var I, H : Integer;
begin
  I := LocateKey(Key, H, True);
  DeleteByIndex(I, H);
end;

function TGeneralSingleDictionary.HasKey(const Key: AnsiString): Boolean;
var H : Integer;
begin
  Result := LocateKey(Key, H, False) >= 0;
end;

procedure TGeneralSingleDictionary.Rename(const Key, NewKey: AnsiString);
var I, J, H : Integer;
begin
  I := LocateKey(Key, H, True);
  FKeys[I] := NewKey;
  J := PosNext(I, FLookup[H]);
  Assert(J >= 0, 'Invalid hash value/lookup table');
  Remove(FLookup[H], J, 1);
  Append(FLookup[HashStr(NewKey, 0, FCaseSensitive) and (FHashSize - 1)], I);
end;

function TGeneralSingleDictionary.GetDuplicatesAction: TDictionaryDuplicatesAction;
begin
  Result := FDuplicatesAction;
end;

procedure TGeneralSingleDictionary.SetDuplicatesAction(const DuplicatesAction: TDictionaryDuplicatesAction);
begin
  FDuplicatesAction := DuplicatesAction;
end;

function TGeneralSingleDictionary.LocateItem(const Key: AnsiString; var Value: Single): Integer;
var H : Integer;
begin
  Result := LocateKey(Key, H, False);
  if Result >= 0 then
    Value := FValues[Result]
  else
    Value := 0.0;
end;

function TGeneralSingleDictionary.LocateNext(const Key: AnsiString; const Idx: Integer; var Value: Single): Integer;
var L, H, I, J, K : Integer;
begin
  Result := -1;
  L := FHashSize;
  if L = 0 then
    RaiseKeyNotFoundError(Key, ESingleDictionary);
  H := HashStr(Key, 0, FCaseSensitive) and (L - 1);
  for I := 0 to Length(FLookup[H]) - 1 do
    begin
      J := FLookup[H, I];
      if J = Idx then
        begin
          if not StrEqualA(Key, FKeys[J], FCaseSensitive) then
            RaiseKeyNotFoundError(Key, ESingleDictionary);
          for K := I + 1 to Length(FLookup[H]) - 1 do
            begin
              J := FLookup[H, K];
              if StrEqualA(Key, FKeys[J], FCaseSensitive) then
                begin
                  Value := FValues[J];
                  Result := J;
                  exit;
                end;
            end;
          Result := -1;
          exit;
        end;
    end;
  RaiseKeyNotFoundError(Key, ESingleDictionary);
end;

procedure TGeneralSingleDictionary.SetItem(const Key: AnsiString; const Value: Single);
var I, H : Integer;
begin
  I := LocateKey(Key, H, False);
  if I >= 0 then
    FValues[I] := Value else
    if AddOnSet then
      Add(Key, Value) else
      RaiseKeyNotFoundError(Key, ESingleDictionary);
end;

procedure TGeneralSingleDictionary.RaiseIndexError;
begin
  RaiseDictionaryError('Index out of range', ESingleDictionary);
end;

function TGeneralSingleDictionary.Count: Integer;
begin
  Result := FKeys.Count;
  Assert(FValues.Count = Result, 'Key/Value count mismatch');
end;

function TGeneralSingleDictionary.GetKeyByIndex(const Idx: Integer): AnsiString;
begin
  {$IFOPT R+}
  if (Idx < 0) or (Idx >= FKeys.Count) then
    RaiseIndexError;
  {$ENDIF}
  Result := FKeys[Idx];
end;

procedure TGeneralSingleDictionary.DeleteItemByIndex(const Idx: Integer);
begin
  {$IFOPT R+}
  if (Idx < 0) or (Idx >= FValues.Count) then
    RaiseIndexError;
  {$ENDIF}
  DeleteByIndex(Idx, -1);
end;

function TGeneralSingleDictionary.GetItemByIndex(const Idx: Integer): Single;
begin
  {$IFOPT R+}
  if (Idx < 0) or (Idx >= FValues.Count) then
    RaiseIndexError;
  {$ENDIF}
  Result := FValues[Idx];
end;

procedure TGeneralSingleDictionary.SetItemByIndex(const Idx: Integer; const Value: Single);
begin
  {$IFOPT R+}
  if (Idx < 0) or (Idx >= FValues.Count) then
    RaiseIndexError;
  {$ENDIF}
  FValues[Idx] := Value;
end;

procedure TGeneralSingleDictionary.Clear;
begin
  FKeys.Clear;
  FValues.Clear;
  FHashSize := 0;
  FLookup := nil;
end;



{                                                                              }
{ TSingleDictionary                                                            }
{                                                                              }
function TSingleDictionary.LocateKey(const Key: AnsiString; var LookupIdx: Integer;
    const ErrorIfNotFound: Boolean): Integer;
var H, I, L, K : Integer;
begin
  L := FHashSize;
  if L > 0 then
    begin
      K := Length(Key);
      if FCaseSensitive then
        LongWord(H) := HashStrBuf(Pointer(Key), K, 0) and (L - 1)
      else
        LongWord(H) := HashStrBufNoCase(Pointer(Key), K, 0) and (L - 1);
      LookupIdx := H;
      for I := 0 to Length(FLookup[H]) - 1 do
        begin
          Result := FLookup[H][I];
          if StrPEqualStr(Pointer(Key), K, TAnsiStringArray(FKeys).Data[Result],
              FCaseSensitive) then
            exit;
        end;
    end;
  if ErrorIfNotFound then
    RaiseKeyNotFoundError(Key, ESingleDictionary);
  Result := -1;
end;

function TSingleDictionary.GetItem(const Key: AnsiString): Single;
var H, I : Integer;
begin
  I := LocateKey(Key, H, False);
  if I >= 0 then
    Result := TSingleArray(FValues).Data[I]
  else
    Result := 0.0;
end;

function TSingleDictionary.LocateItem(const Key: AnsiString; var Value: Single): Integer;
var H : Integer;
begin
  Result := LocateKey(Key, H, False);
  if Result >= 0 then
    Value := TSingleArray(FValues).Data[Result]
  else
    Value := 0.0;
end;



{                                                                              }
{ TGeneralDoubleDictionary                                                     }
{                                                                              }
constructor TGeneralDoubleDictionary.Create;
begin
  inherited Create;
  FCaseSensitive := True;
  FDuplicatesAction := ddAccept;
  FAddOnSet := True;
  FKeys := TAnsiStringArray.Create;
  FValues := TDoubleArray.Create;
end;

constructor TGeneralDoubleDictionary.CreateEx(const Keys: AAnsiStringArray;
    const Values: ADoubleArray; const KeysCaseSensitive: Boolean;
    const AddOnSet: Boolean;
    const DuplicatesAction: TDictionaryDuplicatesAction);
var L : Integer;
begin
  inherited Create;
  if Assigned(Keys) then
    begin
      FKeys := Keys;
      L := FKeys.Count;
    end
  else
    begin
      FKeys := TAnsiStringArray.Create;
      L := 0;
    end;
  if Assigned(Values) then
    FValues := Values
  else
    FValues := TDoubleArray.Create;
  FCaseSensitive := KeysCaseSensitive;
  FValues.Count := L;
  FAddOnSet := AddOnSet;
  FDuplicatesAction := DuplicatesAction;
  if L > 0 then
    Rehash;
end;

constructor TDoubleDictionary.CreateEx(const Keys: TAnsiStringArray;
    const Values: TDoubleArray; const KeysCaseSensitive: Boolean;
    const AddOnSet: Boolean;
    const DuplicatesAction: TDictionaryDuplicatesAction);
begin
  inherited CreateEx(Keys, Values, KeysCaseSensitive, AddOnSet,
      DuplicatesAction);
end;

destructor TGeneralDoubleDictionary.Destroy;
begin
  FreeAndNil(FValues);
  FreeAndNil(FKeys);
  inherited Destroy;
end;

function TGeneralDoubleDictionary.GetKeysCaseSensitive: Boolean;
begin
  Result := FCaseSensitive;
end;

function TGeneralDoubleDictionary.GetAddOnSet: Boolean;
begin
  Result := FAddOnSet;
end;

procedure TGeneralDoubleDictionary.SetAddOnSet(const AddOnSet: Boolean);
begin
  FAddOnSet := AddOnSet;
end;

function TGeneralDoubleDictionary.GetHashTableSize: Integer;
begin
  Result := Length(FLookup);
end;

procedure TGeneralDoubleDictionary.Rehash;
var I, C, L : Integer;
begin
  C := FKeys.Count;
  L := DictionaryRehashSize(C);
  FLookup := nil;
  SetLength(FLookup, L);
  FHashSize := L;
  Assert(L > 0);
  Dec(L);
  for I := 0 to C - 1 do
    Append(FLookup[HashStr(FKeys[I], 0, FCaseSensitive) and L], I);
end;

function TGeneralDoubleDictionary.LocateKey(const Key: AnsiString; var LookupIdx: Integer;
    const ErrorIfNotFound: Boolean): Integer;
var H, I, J, L, K : Integer;
begin
  L := FHashSize;
  if L > 0 then
    begin
      K := Length(Key);
      if FCaseSensitive then
        H := HashStrBuf(Pointer(Key), K, 0) and (L - 1)
      else
        H := HashStrBufNoCase(Pointer(Key), K, 0) and (L - 1);
      LookupIdx := H;
      for I := 0 to Length(FLookup[H]) - 1 do
        begin
          J := FLookup[H, I];
          if StrPEqualStr(Pointer(Key), K, FKeys[J], FCaseSensitive) then
            begin
              Result := J;
              exit;
            end;
        end;
    end;
  if ErrorIfNotFound then
    RaiseKeyNotFoundError(Key, EDoubleDictionary);
  Result := -1;
end;

procedure TGeneralDoubleDictionary.Add(const Key: AnsiString; const Value: Double);
var H, L, I : Integer;
begin
  if FDuplicatesAction in [ddIgnore, ddError] then
    if LocateKey(Key, H, False) >= 0 then
      if FDuplicatesAction = ddIgnore then
        exit
      else
        RaiseDuplicateKeyError(Key);
  L := FHashSize;
  if L = 0 then
    begin
      Rehash;
      L := FHashSize;
      Assert(L > 0);
    end;
  H := Integer(HashStr(Key, 0, FCaseSensitive) and (L - 1));
  I := FKeys.AppendItem(Key);
  Append(FLookup[H], I);
  FValues.AppendItem(Value);
  if (I + 1) div DictionaryAverageHashChainSize > L then
    Rehash;
end;

procedure TGeneralDoubleDictionary.DeleteByIndex(const Idx: Integer; const Hash: Integer);
var I, J, H : Integer;
begin
  if Hash = -1 then
    H := HashStr(FKeys[Idx], 0, FCaseSensitive) and (FHashSize - 1)
  else
    H := Hash;
  FKeys.Delete(Idx);
  FValues.Delete(Idx);
  J := PosNext(Idx, FLookup[H]);
  Assert(J >= 0, 'Invalid hash value/lookup table');
  Remove(FLookup[H], J, 1);

  for I := 0 to FHashSize - 1 do
    for J := 0 to Length(FLookup[I]) - 1 do
      if FLookup[I][J] > Idx then
        Dec(FLookup[I][J]);
end;

procedure TGeneralDoubleDictionary.Delete(const Key: AnsiString);
var I, H : Integer;
begin
  I := LocateKey(Key, H, True);
  DeleteByIndex(I, H);
end;

function TGeneralDoubleDictionary.HasKey(const Key: AnsiString): Boolean;
var H : Integer;
begin
  Result := LocateKey(Key, H, False) >= 0;
end;

procedure TGeneralDoubleDictionary.Rename(const Key, NewKey: AnsiString);
var I, J, H : Integer;
begin
  I := LocateKey(Key, H, True);
  FKeys[I] := NewKey;
  J := PosNext(I, FLookup[H]);
  Assert(J >= 0, 'Invalid hash value/lookup table');
  Remove(FLookup[H], J, 1);
  Append(FLookup[HashStr(NewKey, 0, FCaseSensitive) and (FHashSize - 1)], I);
end;

function TGeneralDoubleDictionary.GetDuplicatesAction: TDictionaryDuplicatesAction;
begin
  Result := FDuplicatesAction;
end;

procedure TGeneralDoubleDictionary.SetDuplicatesAction(const DuplicatesAction: TDictionaryDuplicatesAction);
begin
  FDuplicatesAction := DuplicatesAction;
end;

function TGeneralDoubleDictionary.LocateItem(const Key: AnsiString; var Value: Double): Integer;
var H : Integer;
begin
  Result := LocateKey(Key, H, False);
  if Result >= 0 then
    Value := FValues[Result]
  else
    Value := 0.0;
end;

function TGeneralDoubleDictionary.LocateNext(const Key: AnsiString; const Idx: Integer; var Value: Double): Integer;
var L, H, I, J, K : Integer;
begin
  Result := -1;
  L := FHashSize;
  if L = 0 then
    RaiseKeyNotFoundError(Key, EDoubleDictionary);
  H := HashStr(Key, 0, FCaseSensitive) and (L - 1);
  for I := 0 to Length(FLookup[H]) - 1 do
    begin
      J := FLookup[H, I];
      if J = Idx then
        begin
          if not StrEqualA(Key, FKeys[J], FCaseSensitive) then
            RaiseKeyNotFoundError(Key, EDoubleDictionary);
          for K := I + 1 to Length(FLookup[H]) - 1 do
            begin
              J := FLookup[H, K];
              if StrEqualA(Key, FKeys[J], FCaseSensitive) then
                begin
                  Value := FValues[J];
                  Result := J;
                  exit;
                end;
            end;
          Result := -1;
          exit;
        end;
    end;
  RaiseKeyNotFoundError(Key, EDoubleDictionary);
end;

procedure TGeneralDoubleDictionary.SetItem(const Key: AnsiString; const Value: Double);
var I, H : Integer;
begin
  I := LocateKey(Key, H, False);
  if I >= 0 then
    FValues[I] := Value else
    if AddOnSet then
      Add(Key, Value) else
      RaiseKeyNotFoundError(Key, EDoubleDictionary);
end;

procedure TGeneralDoubleDictionary.RaiseIndexError;
begin
  RaiseDictionaryError('Index out of range', EDoubleDictionary);
end;

function TGeneralDoubleDictionary.Count: Integer;
begin
  Result := FKeys.Count;
  Assert(FValues.Count = Result, 'Key/Value count mismatch');
end;

function TGeneralDoubleDictionary.GetKeyByIndex(const Idx: Integer): AnsiString;
begin
  {$IFOPT R+}
  if (Idx < 0) or (Idx >= FKeys.Count) then
    RaiseIndexError;
  {$ENDIF}
  Result := FKeys[Idx];
end;

procedure TGeneralDoubleDictionary.DeleteItemByIndex(const Idx: Integer);
begin
  {$IFOPT R+}
  if (Idx < 0) or (Idx >= FValues.Count) then
    RaiseIndexError;
  {$ENDIF}
  DeleteByIndex(Idx, -1);
end;

function TGeneralDoubleDictionary.GetItemByIndex(const Idx: Integer): Double;
begin
  {$IFOPT R+}
  if (Idx < 0) or (Idx >= FValues.Count) then
    RaiseIndexError;
  {$ENDIF}
  Result := FValues[Idx];
end;

procedure TGeneralDoubleDictionary.SetItemByIndex(const Idx: Integer; const Value: Double);
begin
  {$IFOPT R+}
  if (Idx < 0) or (Idx >= FValues.Count) then
    RaiseIndexError;
  {$ENDIF}
  FValues[Idx] := Value;
end;

procedure TGeneralDoubleDictionary.Clear;
begin
  FKeys.Clear;
  FValues.Clear;
  FHashSize := 0;
  FLookup := nil;
end;



{                                                                              }
{ TDoubleDictionary                                                            }
{                                                                              }
function TDoubleDictionary.LocateKey(const Key: AnsiString; var LookupIdx: Integer;
    const ErrorIfNotFound: Boolean): Integer;
var H, I, L, K : Integer;
begin
  L := FHashSize;
  if L > 0 then
    begin
      K := Length(Key);
      if FCaseSensitive then
        LongWord(H) := HashStrBuf(Pointer(Key), K, 0) and (L - 1)
      else
        LongWord(H) := HashStrBufNoCase(Pointer(Key), K, 0) and (L - 1);
      LookupIdx := H;
      for I := 0 to Length(FLookup[H]) - 1 do
        begin
          Result := FLookup[H][I];
          if StrPEqualStr(Pointer(Key), K, TAnsiStringArray(FKeys).Data[Result],
              FCaseSensitive) then
            exit;
        end;
    end;
  if ErrorIfNotFound then
    RaiseKeyNotFoundError(Key, EDoubleDictionary);
  Result := -1;
end;

function TDoubleDictionary.GetItem(const Key: AnsiString): Double;
var H, I : Integer;
begin
  I := LocateKey(Key, H, False);
  if I >= 0 then
    Result := TDoubleArray(FValues).Data[I]
  else
    Result := 0.0;
end;

function TDoubleDictionary.LocateItem(const Key: AnsiString; var Value: Double): Integer;
var H : Integer;
begin
  Result := LocateKey(Key, H, False);
  if Result >= 0 then
    Value := TDoubleArray(FValues).Data[Result]
  else
    Value := 0.0;
end;



{                                                                              }
{ TGeneralExtendedDictionary                                                   }
{                                                                              }
constructor TGeneralExtendedDictionary.Create;
begin
  inherited Create;
  FCaseSensitive := True;
  FDuplicatesAction := ddAccept;
  FAddOnSet := True;
  FKeys := TAnsiStringArray.Create;
  FValues := TExtendedArray.Create;
end;

constructor TGeneralExtendedDictionary.CreateEx(const Keys: AAnsiStringArray;
    const Values: AExtendedArray; const KeysCaseSensitive: Boolean;
    const AddOnSet: Boolean;
    const DuplicatesAction: TDictionaryDuplicatesAction);
var L : Integer;
begin
  inherited Create;
  if Assigned(Keys) then
    begin
      FKeys := Keys;
      L := FKeys.Count;
    end
  else
    begin
      FKeys := TAnsiStringArray.Create;
      L := 0;
    end;
  if Assigned(Values) then
    FValues := Values
  else
    FValues := TExtendedArray.Create;
  FCaseSensitive := KeysCaseSensitive;
  FValues.Count := L;
  FAddOnSet := AddOnSet;
  FDuplicatesAction := DuplicatesAction;
  if L > 0 then
    Rehash;
end;

constructor TExtendedDictionary.CreateEx(const Keys: TAnsiStringArray;
    const Values: TExtendedArray; const KeysCaseSensitive: Boolean;
    const AddOnSet: Boolean;
    const DuplicatesAction: TDictionaryDuplicatesAction);
begin
  inherited CreateEx(Keys, Values, KeysCaseSensitive, AddOnSet,
      DuplicatesAction);
end;

destructor TGeneralExtendedDictionary.Destroy;
begin
  FreeAndNil(FValues);
  FreeAndNil(FKeys);
  inherited Destroy;
end;

function TGeneralExtendedDictionary.GetKeysCaseSensitive: Boolean;
begin
  Result := FCaseSensitive;
end;

function TGeneralExtendedDictionary.GetAddOnSet: Boolean;
begin
  Result := FAddOnSet;
end;

procedure TGeneralExtendedDictionary.SetAddOnSet(const AddOnSet: Boolean);
begin
  FAddOnSet := AddOnSet;
end;

function TGeneralExtendedDictionary.GetHashTableSize: Integer;
begin
  Result := Length(FLookup);
end;

procedure TGeneralExtendedDictionary.Rehash;
var I, C, L : Integer;
begin
  C := FKeys.Count;
  L := DictionaryRehashSize(C);
  FLookup := nil;
  SetLength(FLookup, L);
  FHashSize := L;
  Assert(L > 0);
  Dec(L);
  for I := 0 to C - 1 do
    Append(FLookup[HashStr(FKeys[I], 0, FCaseSensitive) and L], I);
end;

function TGeneralExtendedDictionary.LocateKey(const Key: AnsiString; var LookupIdx: Integer;
    const ErrorIfNotFound: Boolean): Integer;
var H, I, J, L, K : Integer;
begin
  L := FHashSize;
  if L > 0 then
    begin
      K := Length(Key);
      if FCaseSensitive then
        H := HashStrBuf(Pointer(Key), K, 0) and (L - 1)
      else
        H := HashStrBufNoCase(Pointer(Key), K, 0) and (L - 1);
      LookupIdx := H;
      for I := 0 to Length(FLookup[H]) - 1 do
        begin
          J := FLookup[H, I];
          if StrPEqualStr(Pointer(Key), K, FKeys[J], FCaseSensitive) then
            begin
              Result := J;
              exit;
            end;
        end;
    end;
  if ErrorIfNotFound then
    RaiseKeyNotFoundError(Key, EExtendedDictionary);
  Result := -1;
end;

procedure TGeneralExtendedDictionary.Add(const Key: AnsiString; const Value: Extended);
var H, L, I : Integer;
begin
  if FDuplicatesAction in [ddIgnore, ddError] then
    if LocateKey(Key, H, False) >= 0 then
      if FDuplicatesAction = ddIgnore then
        exit
      else
        RaiseDuplicateKeyError(Key);
  L := FHashSize;
  if L = 0 then
    begin
      Rehash;
      L := FHashSize;
      Assert(L > 0);
    end;
  H := Integer(HashStr(Key, 0, FCaseSensitive) and (L - 1));
  I := FKeys.AppendItem(Key);
  Append(FLookup[H], I);
  FValues.AppendItem(Value);
  if (I + 1) div DictionaryAverageHashChainSize > L then
    Rehash;
end;

procedure TGeneralExtendedDictionary.DeleteByIndex(const Idx: Integer; const Hash: Integer);
var I, J, H : Integer;
begin
  if Hash = -1 then
    H := HashStr(FKeys[Idx], 0, FCaseSensitive) and (FHashSize - 1)
  else
    H := Hash;
  FKeys.Delete(Idx);
  FValues.Delete(Idx);
  J := PosNext(Idx, FLookup[H]);
  Assert(J >= 0, 'Invalid hash value/lookup table');
  Remove(FLookup[H], J, 1);

  for I := 0 to FHashSize - 1 do
    for J := 0 to Length(FLookup[I]) - 1 do
      if FLookup[I][J] > Idx then
        Dec(FLookup[I][J]);
end;

procedure TGeneralExtendedDictionary.Delete(const Key: AnsiString);
var I, H : Integer;
begin
  I := LocateKey(Key, H, True);
  DeleteByIndex(I, H);
end;

function TGeneralExtendedDictionary.HasKey(const Key: AnsiString): Boolean;
var H : Integer;
begin
  Result := LocateKey(Key, H, False) >= 0;
end;

procedure TGeneralExtendedDictionary.Rename(const Key, NewKey: AnsiString);
var I, J, H : Integer;
begin
  I := LocateKey(Key, H, True);
  FKeys[I] := NewKey;
  J := PosNext(I, FLookup[H]);
  Assert(J >= 0, 'Invalid hash value/lookup table');
  Remove(FLookup[H], J, 1);
  Append(FLookup[HashStr(NewKey, 0, FCaseSensitive) and (FHashSize - 1)], I);
end;

function TGeneralExtendedDictionary.GetDuplicatesAction: TDictionaryDuplicatesAction;
begin
  Result := FDuplicatesAction;
end;

procedure TGeneralExtendedDictionary.SetDuplicatesAction(const DuplicatesAction: TDictionaryDuplicatesAction);
begin
  FDuplicatesAction := DuplicatesAction;
end;

function TGeneralExtendedDictionary.LocateItem(const Key: AnsiString; var Value: Extended): Integer;
var H : Integer;
begin
  Result := LocateKey(Key, H, False);
  if Result >= 0 then
    Value := FValues[Result]
  else
    Value := 0.0;
end;

function TGeneralExtendedDictionary.LocateNext(const Key: AnsiString; const Idx: Integer; var Value: Extended): Integer;
var L, H, I, J, K : Integer;
begin
  Result := -1;
  L := FHashSize;
  if L = 0 then
    RaiseKeyNotFoundError(Key, EExtendedDictionary);
  H := HashStr(Key, 0, FCaseSensitive) and (L - 1);
  for I := 0 to Length(FLookup[H]) - 1 do
    begin
      J := FLookup[H, I];
      if J = Idx then
        begin
          if not StrEqualA(Key, FKeys[J], FCaseSensitive) then
            RaiseKeyNotFoundError(Key, EExtendedDictionary);
          for K := I + 1 to Length(FLookup[H]) - 1 do
            begin
              J := FLookup[H, K];
              if StrEqualA(Key, FKeys[J], FCaseSensitive) then
                begin
                  Value := FValues[J];
                  Result := J;
                  exit;
                end;
            end;
          Result := -1;
          exit;
        end;
    end;
  RaiseKeyNotFoundError(Key, EExtendedDictionary);
end;

procedure TGeneralExtendedDictionary.SetItem(const Key: AnsiString; const Value: Extended);
var I, H : Integer;
begin
  I := LocateKey(Key, H, False);
  if I >= 0 then
    FValues[I] := Value else
    if AddOnSet then
      Add(Key, Value) else
      RaiseKeyNotFoundError(Key, EExtendedDictionary);
end;

procedure TGeneralExtendedDictionary.RaiseIndexError;
begin
  RaiseDictionaryError('Index out of range', EExtendedDictionary);
end;

function TGeneralExtendedDictionary.Count: Integer;
begin
  Result := FKeys.Count;
  Assert(FValues.Count = Result, 'Key/Value count mismatch');
end;

function TGeneralExtendedDictionary.GetKeyByIndex(const Idx: Integer): AnsiString;
begin
  {$IFOPT R+}
  if (Idx < 0) or (Idx >= FKeys.Count) then
    RaiseIndexError;
  {$ENDIF}
  Result := FKeys[Idx];
end;

procedure TGeneralExtendedDictionary.DeleteItemByIndex(const Idx: Integer);
begin
  {$IFOPT R+}
  if (Idx < 0) or (Idx >= FValues.Count) then
    RaiseIndexError;
  {$ENDIF}
  DeleteByIndex(Idx, -1);
end;

function TGeneralExtendedDictionary.GetItemByIndex(const Idx: Integer): Extended;
begin
  {$IFOPT R+}
  if (Idx < 0) or (Idx >= FValues.Count) then
    RaiseIndexError;
  {$ENDIF}
  Result := FValues[Idx];
end;

procedure TGeneralExtendedDictionary.SetItemByIndex(const Idx: Integer; const Value: Extended);
begin
  {$IFOPT R+}
  if (Idx < 0) or (Idx >= FValues.Count) then
    RaiseIndexError;
  {$ENDIF}
  FValues[Idx] := Value;
end;

procedure TGeneralExtendedDictionary.Clear;
begin
  FKeys.Clear;
  FValues.Clear;
  FHashSize := 0;
  FLookup := nil;
end;



{                                                                              }
{ TExtendedDictionary                                                          }
{                                                                              }
function TExtendedDictionary.LocateKey(const Key: AnsiString; var LookupIdx: Integer;
    const ErrorIfNotFound: Boolean): Integer;
var H, I, L, K : Integer;
begin
  L := FHashSize;
  if L > 0 then
    begin
      K := Length(Key);
      if FCaseSensitive then
        LongWord(H) := HashStrBuf(Pointer(Key), K, 0) and (L - 1)
      else
        LongWord(H) := HashStrBufNoCase(Pointer(Key), K, 0) and (L - 1);
      LookupIdx := H;
      for I := 0 to Length(FLookup[H]) - 1 do
        begin
          Result := FLookup[H][I];
          if StrPEqualStr(Pointer(Key), K, TAnsiStringArray(FKeys).Data[Result],
              FCaseSensitive) then
            exit;
        end;
    end;
  if ErrorIfNotFound then
    RaiseKeyNotFoundError(Key, EExtendedDictionary);
  Result := -1;
end;

function TExtendedDictionary.GetItem(const Key: AnsiString): Extended;
var H, I : Integer;
begin
  I := LocateKey(Key, H, False);
  if I >= 0 then
    Result := TExtendedArray(FValues).Data[I]
  else
    Result := 0.0;
end;

function TExtendedDictionary.LocateItem(const Key: AnsiString; var Value: Extended): Integer;
var H : Integer;
begin
  Result := LocateKey(Key, H, False);
  if Result >= 0 then
    Value := TExtendedArray(FValues).Data[Result]
  else
    Value := 0.0;
end;



{                                                                              }
{ TGeneralPointerDictionary                                                    }
{                                                                              }
constructor TGeneralPointerDictionary.Create;
begin
  inherited Create;
  FCaseSensitive := True;
  FDuplicatesAction := ddAccept;
  FAddOnSet := True;
  FKeys := TAnsiStringArray.Create;
  FValues := TPointerArray.Create;
end;

constructor TGeneralPointerDictionary.CreateEx(const Keys: AAnsiStringArray;
    const Values: APointerArray; const KeysCaseSensitive: Boolean;
    const AddOnSet: Boolean;
    const DuplicatesAction: TDictionaryDuplicatesAction);
var L : Integer;
begin
  inherited Create;
  if Assigned(Keys) then
    begin
      FKeys := Keys;
      L := FKeys.Count;
    end
  else
    begin
      FKeys := TAnsiStringArray.Create;
      L := 0;
    end;
  if Assigned(Values) then
    FValues := Values
  else
    FValues := TPointerArray.Create;
  FCaseSensitive := KeysCaseSensitive;
  FValues.Count := L;
  FAddOnSet := AddOnSet;
  FDuplicatesAction := DuplicatesAction;
  if L > 0 then
    Rehash;
end;

constructor TPointerDictionary.CreateEx(const Keys: TAnsiStringArray;
    const Values: TPointerArray; const KeysCaseSensitive: Boolean;
    const AddOnSet: Boolean;
    const DuplicatesAction: TDictionaryDuplicatesAction);
begin
  inherited CreateEx(Keys, Values, KeysCaseSensitive, AddOnSet,
      DuplicatesAction);
end;

destructor TGeneralPointerDictionary.Destroy;
begin
  FreeAndNil(FValues);
  FreeAndNil(FKeys);
  inherited Destroy;
end;

function TGeneralPointerDictionary.GetKeysCaseSensitive: Boolean;
begin
  Result := FCaseSensitive;
end;

function TGeneralPointerDictionary.GetAddOnSet: Boolean;
begin
  Result := FAddOnSet;
end;

procedure TGeneralPointerDictionary.SetAddOnSet(const AddOnSet: Boolean);
begin
  FAddOnSet := AddOnSet;
end;

function TGeneralPointerDictionary.GetHashTableSize: Integer;
begin
  Result := Length(FLookup);
end;

procedure TGeneralPointerDictionary.Rehash;
var I, C, L : Integer;
begin
  C := FKeys.Count;
  L := DictionaryRehashSize(C);
  FLookup := nil;
  SetLength(FLookup, L);
  FHashSize := L;
  Assert(L > 0);
  Dec(L);
  for I := 0 to C - 1 do
    Append(FLookup[HashStr(FKeys[I], 0, FCaseSensitive) and L], I);
end;

function TGeneralPointerDictionary.LocateKey(const Key: AnsiString; var LookupIdx: Integer;
    const ErrorIfNotFound: Boolean): Integer;
var H, I, J, L, K : Integer;
begin
  L := FHashSize;
  if L > 0 then
    begin
      K := Length(Key);
      if FCaseSensitive then
        H := HashStrBuf(Pointer(Key), K, 0) and (L - 1)
      else
        H := HashStrBufNoCase(Pointer(Key), K, 0) and (L - 1);
      LookupIdx := H;
      for I := 0 to Length(FLookup[H]) - 1 do
        begin
          J := FLookup[H, I];
          if StrPEqualStr(Pointer(Key), K, FKeys[J], FCaseSensitive) then
            begin
              Result := J;
              exit;
            end;
        end;
    end;
  if ErrorIfNotFound then
    RaiseKeyNotFoundError(Key, EPointerDictionary);
  Result := -1;
end;

procedure TGeneralPointerDictionary.Add(const Key: AnsiString; const Value: Pointer);
var H, L, I : Integer;
begin
  if FDuplicatesAction in [ddIgnore, ddError] then
    if LocateKey(Key, H, False) >= 0 then
      if FDuplicatesAction = ddIgnore then
        exit
      else
        RaiseDuplicateKeyError(Key);
  L := FHashSize;
  if L = 0 then
    begin
      Rehash;
      L := FHashSize;
      Assert(L > 0);
    end;
  H := Integer(HashStr(Key, 0, FCaseSensitive) and (L - 1));
  I := FKeys.AppendItem(Key);
  Append(FLookup[H], I);
  FValues.AppendItem(Value);
  if (I + 1) div DictionaryAverageHashChainSize > L then
    Rehash;
end;

procedure TGeneralPointerDictionary.DeleteByIndex(const Idx: Integer; const Hash: Integer);
var I, J, H : Integer;
begin
  if Hash = -1 then
    H := HashStr(FKeys[Idx], 0, FCaseSensitive) and (FHashSize - 1)
  else
    H := Hash;
  FKeys.Delete(Idx);
  FValues.Delete(Idx);
  J := PosNext(Idx, FLookup[H]);
  Assert(J >= 0, 'Invalid hash value/lookup table');
  Remove(FLookup[H], J, 1);

  for I := 0 to FHashSize - 1 do
    for J := 0 to Length(FLookup[I]) - 1 do
      if FLookup[I][J] > Idx then
        Dec(FLookup[I][J]);
end;

procedure TGeneralPointerDictionary.Delete(const Key: AnsiString);
var I, H : Integer;
begin
  I := LocateKey(Key, H, True);
  DeleteByIndex(I, H);
end;

function TGeneralPointerDictionary.HasKey(const Key: AnsiString): Boolean;
var H : Integer;
begin
  Result := LocateKey(Key, H, False) >= 0;
end;

procedure TGeneralPointerDictionary.Rename(const Key, NewKey: AnsiString);
var I, J, H : Integer;
begin
  I := LocateKey(Key, H, True);
  FKeys[I] := NewKey;
  J := PosNext(I, FLookup[H]);
  Assert(J >= 0, 'Invalid hash value/lookup table');
  Remove(FLookup[H], J, 1);
  Append(FLookup[HashStr(NewKey, 0, FCaseSensitive) and (FHashSize - 1)], I);
end;

function TGeneralPointerDictionary.GetDuplicatesAction: TDictionaryDuplicatesAction;
begin
  Result := FDuplicatesAction;
end;

procedure TGeneralPointerDictionary.SetDuplicatesAction(const DuplicatesAction: TDictionaryDuplicatesAction);
begin
  FDuplicatesAction := DuplicatesAction;
end;

function TGeneralPointerDictionary.LocateItem(const Key: AnsiString; var Value: Pointer): Integer;
var H : Integer;
begin
  Result := LocateKey(Key, H, False);
  if Result >= 0 then
    Value := FValues[Result]
  else
    Value := nil;
end;

function TGeneralPointerDictionary.LocateNext(const Key: AnsiString; const Idx: Integer; var Value: Pointer): Integer;
var L, H, I, J, K : Integer;
begin
  Result := -1;
  L := FHashSize;
  if L = 0 then
    RaiseKeyNotFoundError(Key, EPointerDictionary);
  H := HashStr(Key, 0, FCaseSensitive) and (L - 1);
  for I := 0 to Length(FLookup[H]) - 1 do
    begin
      J := FLookup[H, I];
      if J = Idx then
        begin
          if not StrEqualA(Key, FKeys[J], FCaseSensitive) then
            RaiseKeyNotFoundError(Key, EPointerDictionary);
          for K := I + 1 to Length(FLookup[H]) - 1 do
            begin
              J := FLookup[H, K];
              if StrEqualA(Key, FKeys[J], FCaseSensitive) then
                begin
                  Value := FValues[J];
                  Result := J;
                  exit;
                end;
            end;
          Result := -1;
          exit;
        end;
    end;
  RaiseKeyNotFoundError(Key, EPointerDictionary);
end;

procedure TGeneralPointerDictionary.SetItem(const Key: AnsiString; const Value: Pointer);
var I, H : Integer;
begin
  I := LocateKey(Key, H, False);
  if I >= 0 then
    FValues[I] := Value else
    if AddOnSet then
      Add(Key, Value) else
      RaiseKeyNotFoundError(Key, EPointerDictionary);
end;

procedure TGeneralPointerDictionary.RaiseIndexError;
begin
  RaiseDictionaryError('Index out of range', EPointerDictionary);
end;

function TGeneralPointerDictionary.Count: Integer;
begin
  Result := FKeys.Count;
  Assert(FValues.Count = Result, 'Key/Value count mismatch');
end;

function TGeneralPointerDictionary.GetKeyByIndex(const Idx: Integer): AnsiString;
begin
  {$IFOPT R+}
  if (Idx < 0) or (Idx >= FKeys.Count) then
    RaiseIndexError;
  {$ENDIF}
  Result := FKeys[Idx];
end;

procedure TGeneralPointerDictionary.DeleteItemByIndex(const Idx: Integer);
begin
  {$IFOPT R+}
  if (Idx < 0) or (Idx >= FValues.Count) then
    RaiseIndexError;
  {$ENDIF}
  DeleteByIndex(Idx, -1);
end;

function TGeneralPointerDictionary.GetItemByIndex(const Idx: Integer): Pointer;
begin
  {$IFOPT R+}
  if (Idx < 0) or (Idx >= FValues.Count) then
    RaiseIndexError;
  {$ENDIF}
  Result := FValues[Idx];
end;

procedure TGeneralPointerDictionary.SetItemByIndex(const Idx: Integer; const Value: Pointer);
begin
  {$IFOPT R+}
  if (Idx < 0) or (Idx >= FValues.Count) then
    RaiseIndexError;
  {$ENDIF}
  FValues[Idx] := Value;
end;

procedure TGeneralPointerDictionary.Clear;
begin
  FKeys.Clear;
  FValues.Clear;
  FHashSize := 0;
  FLookup := nil;
end;



{                                                                              }
{ TPointerDictionary                                                           }
{                                                                              }
function TPointerDictionary.LocateKey(const Key: AnsiString; var LookupIdx: Integer;
    const ErrorIfNotFound: Boolean): Integer;
var H, I, L, K : Integer;
begin
  L := FHashSize;
  if L > 0 then
    begin
      K := Length(Key);
      if FCaseSensitive then
        LongWord(H) := HashStrBuf(Pointer(Key), K, 0) and (L - 1)
      else
        LongWord(H) := HashStrBufNoCase(Pointer(Key), K, 0) and (L - 1);
      LookupIdx := H;
      for I := 0 to Length(FLookup[H]) - 1 do
        begin
          Result := FLookup[H][I];
          if StrPEqualStr(Pointer(Key), K, TAnsiStringArray(FKeys).Data[Result],
              FCaseSensitive) then
            exit;
        end;
    end;
  if ErrorIfNotFound then
    RaiseKeyNotFoundError(Key, EPointerDictionary);
  Result := -1;
end;

function TPointerDictionary.GetItem(const Key: AnsiString): Pointer;
var H, I : Integer;
begin
  I := LocateKey(Key, H, False);
  if I >= 0 then
    Result := TPointerArray(FValues).Data[I]
  else
    Result := nil;
end;

function TPointerDictionary.LocateItem(const Key: AnsiString; var Value: Pointer): Integer;
var H : Integer;
begin
  Result := LocateKey(Key, H, False);
  if Result >= 0 then
    Value := TPointerArray(FValues).Data[Result]
  else
    Value := nil;
end;



{                                                                              }
{ TGeneralAnsiStringDictionary                                                 }
{                                                                              }
constructor TGeneralAnsiStringDictionary.Create;
begin
  inherited Create;
  FCaseSensitive := True;
  FDuplicatesAction := ddAccept;
  FAddOnSet := True;
  FKeys := TAnsiStringArray.Create;
  FValues := TAnsiStringArray.Create;
end;

constructor TGeneralAnsiStringDictionary.CreateEx(const Keys: AAnsiStringArray;
    const Values: AAnsiStringArray; const KeysCaseSensitive: Boolean;
    const AddOnSet: Boolean;
    const DuplicatesAction: TDictionaryDuplicatesAction);
var L : Integer;
begin
  inherited Create;
  if Assigned(Keys) then
    begin
      FKeys := Keys;
      L := FKeys.Count;
    end
  else
    begin
      FKeys := TAnsiStringArray.Create;
      L := 0;
    end;
  if Assigned(Values) then
    FValues := Values
  else
    FValues := TAnsiStringArray.Create;
  FCaseSensitive := KeysCaseSensitive;
  FValues.Count := L;
  FAddOnSet := AddOnSet;
  FDuplicatesAction := DuplicatesAction;
  if L > 0 then
    Rehash;
end;

constructor TAnsiStringDictionary.CreateEx(const Keys: TAnsiStringArray;
    const Values: TAnsiStringArray; const KeysCaseSensitive: Boolean;
    const AddOnSet: Boolean;
    const DuplicatesAction: TDictionaryDuplicatesAction);
begin
  inherited CreateEx(Keys, Values, KeysCaseSensitive, AddOnSet,
      DuplicatesAction);
end;

destructor TGeneralAnsiStringDictionary.Destroy;
begin
  FreeAndNil(FValues);
  FreeAndNil(FKeys);
  inherited Destroy;
end;

function TGeneralAnsiStringDictionary.GetKeysCaseSensitive: Boolean;
begin
  Result := FCaseSensitive;
end;

function TGeneralAnsiStringDictionary.GetAddOnSet: Boolean;
begin
  Result := FAddOnSet;
end;

procedure TGeneralAnsiStringDictionary.SetAddOnSet(const AddOnSet: Boolean);
begin
  FAddOnSet := AddOnSet;
end;

function TGeneralAnsiStringDictionary.GetHashTableSize: Integer;
begin
  Result := Length(FLookup);
end;

procedure TGeneralAnsiStringDictionary.Rehash;
var I, C, L : Integer;
begin
  C := FKeys.Count;
  L := DictionaryRehashSize(C);
  FLookup := nil;
  SetLength(FLookup, L);
  FHashSize := L;
  Assert(L > 0);
  Dec(L);
  for I := 0 to C - 1 do
    Append(FLookup[HashStr(FKeys[I], 0, FCaseSensitive) and L], I);
end;

function TGeneralAnsiStringDictionary.LocateKey(const Key: AnsiString; var LookupIdx: Integer;
    const ErrorIfNotFound: Boolean): Integer;
var H, I, J, L, K : Integer;
begin
  L := FHashSize;
  if L > 0 then
    begin
      K := Length(Key);
      if FCaseSensitive then
        H := HashStrBuf(Pointer(Key), K, 0) and (L - 1)
      else
        H := HashStrBufNoCase(Pointer(Key), K, 0) and (L - 1);
      LookupIdx := H;
      for I := 0 to Length(FLookup[H]) - 1 do
        begin
          J := FLookup[H, I];
          if StrPEqualStr(Pointer(Key), K, FKeys[J], FCaseSensitive) then
            begin
              Result := J;
              exit;
            end;
        end;
    end;
  if ErrorIfNotFound then
    RaiseKeyNotFoundError(Key, EAnsiStringDictionary);
  Result := -1;
end;

procedure TGeneralAnsiStringDictionary.Add(const Key: AnsiString; const Value: AnsiString);
var H, L, I : Integer;
begin
  if FDuplicatesAction in [ddIgnore, ddError] then
    if LocateKey(Key, H, False) >= 0 then
      if FDuplicatesAction = ddIgnore then
        exit
      else
        RaiseDuplicateKeyError(Key);
  L := FHashSize;
  if L = 0 then
    begin
      Rehash;
      L := FHashSize;
      Assert(L > 0);
    end;
  H := Integer(HashStr(Key, 0, FCaseSensitive) and (L - 1));
  I := FKeys.AppendItem(Key);
  Append(FLookup[H], I);
  FValues.AppendItem(Value);
  if (I + 1) div DictionaryAverageHashChainSize > L then
    Rehash;
end;

procedure TGeneralAnsiStringDictionary.DeleteByIndex(const Idx: Integer; const Hash: Integer);
var I, J, H : Integer;
begin
  if Hash = -1 then
    H := HashStr(FKeys[Idx], 0, FCaseSensitive) and (FHashSize - 1)
  else
    H := Hash;
  FKeys.Delete(Idx);
  FValues.Delete(Idx);
  J := PosNext(Idx, FLookup[H]);
  Assert(J >= 0, 'Invalid hash value/lookup table');
  Remove(FLookup[H], J, 1);

  for I := 0 to FHashSize - 1 do
    for J := 0 to Length(FLookup[I]) - 1 do
      if FLookup[I][J] > Idx then
        Dec(FLookup[I][J]);
end;

procedure TGeneralAnsiStringDictionary.Delete(const Key: AnsiString);
var I, H : Integer;
begin
  I := LocateKey(Key, H, True);
  DeleteByIndex(I, H);
end;

function TGeneralAnsiStringDictionary.HasKey(const Key: AnsiString): Boolean;
var H : Integer;
begin
  Result := LocateKey(Key, H, False) >= 0;
end;

procedure TGeneralAnsiStringDictionary.Rename(const Key, NewKey: AnsiString);
var I, J, H : Integer;
begin
  I := LocateKey(Key, H, True);
  FKeys[I] := NewKey;
  J := PosNext(I, FLookup[H]);
  Assert(J >= 0, 'Invalid hash value/lookup table');
  Remove(FLookup[H], J, 1);
  Append(FLookup[HashStr(NewKey, 0, FCaseSensitive) and (FHashSize - 1)], I);
end;

function TGeneralAnsiStringDictionary.GetDuplicatesAction: TDictionaryDuplicatesAction;
begin
  Result := FDuplicatesAction;
end;

procedure TGeneralAnsiStringDictionary.SetDuplicatesAction(const DuplicatesAction: TDictionaryDuplicatesAction);
begin
  FDuplicatesAction := DuplicatesAction;
end;

function TGeneralAnsiStringDictionary.LocateItem(const Key: AnsiString; var Value: AnsiString): Integer;
var H : Integer;
begin
  Result := LocateKey(Key, H, False);
  if Result >= 0 then
    Value := FValues[Result]
  else
    Value := '';
end;

function TGeneralAnsiStringDictionary.LocateNext(const Key: AnsiString; const Idx: Integer; var Value: AnsiString): Integer;
var L, H, I, J, K : Integer;
begin
  Result := -1;
  L := FHashSize;
  if L = 0 then
    RaiseKeyNotFoundError(Key, EAnsiStringDictionary);
  H := HashStr(Key, 0, FCaseSensitive) and (L - 1);
  for I := 0 to Length(FLookup[H]) - 1 do
    begin
      J := FLookup[H, I];
      if J = Idx then
        begin
          if not StrEqualA(Key, FKeys[J], FCaseSensitive) then
            RaiseKeyNotFoundError(Key, EAnsiStringDictionary);
          for K := I + 1 to Length(FLookup[H]) - 1 do
            begin
              J := FLookup[H, K];
              if StrEqualA(Key, FKeys[J], FCaseSensitive) then
                begin
                  Value := FValues[J];
                  Result := J;
                  exit;
                end;
            end;
          Result := -1;
          exit;
        end;
    end;
  RaiseKeyNotFoundError(Key, EAnsiStringDictionary);
end;

procedure TGeneralAnsiStringDictionary.SetItem(const Key: AnsiString; const Value: AnsiString);
var I, H : Integer;
begin
  I := LocateKey(Key, H, False);
  if I >= 0 then
    FValues[I] := Value else
    if AddOnSet then
      Add(Key, Value) else
      RaiseKeyNotFoundError(Key, EAnsiStringDictionary);
end;

procedure TGeneralAnsiStringDictionary.RaiseIndexError;
begin
  RaiseDictionaryError('Index out of range', EAnsiStringDictionary);
end;

function TGeneralAnsiStringDictionary.Count: Integer;
begin
  Result := FKeys.Count;
  Assert(FValues.Count = Result, 'Key/Value count mismatch');
end;

function TGeneralAnsiStringDictionary.GetKeyByIndex(const Idx: Integer): AnsiString;
begin
  {$IFOPT R+}
  if (Idx < 0) or (Idx >= FKeys.Count) then
    RaiseIndexError;
  {$ENDIF}
  Result := FKeys[Idx];
end;

procedure TGeneralAnsiStringDictionary.DeleteItemByIndex(const Idx: Integer);
begin
  {$IFOPT R+}
  if (Idx < 0) or (Idx >= FValues.Count) then
    RaiseIndexError;
  {$ENDIF}
  DeleteByIndex(Idx, -1);
end;

function TGeneralAnsiStringDictionary.GetItemByIndex(const Idx: Integer): AnsiString;
begin
  {$IFOPT R+}
  if (Idx < 0) or (Idx >= FValues.Count) then
    RaiseIndexError;
  {$ENDIF}
  Result := FValues[Idx];
end;

procedure TGeneralAnsiStringDictionary.SetItemByIndex(const Idx: Integer; const Value: AnsiString);
begin
  {$IFOPT R+}
  if (Idx < 0) or (Idx >= FValues.Count) then
    RaiseIndexError;
  {$ENDIF}
  FValues[Idx] := Value;
end;

procedure TGeneralAnsiStringDictionary.Clear;
begin
  FKeys.Clear;
  FValues.Clear;
  FHashSize := 0;
  FLookup := nil;
end;



{                                                                              }
{ TAnsiStringDictionary                                                        }
{                                                                              }
function TAnsiStringDictionary.LocateKey(const Key: AnsiString; var LookupIdx: Integer;
    const ErrorIfNotFound: Boolean): Integer;
var H, I, L, K : Integer;
begin
  L := FHashSize;
  if L > 0 then
    begin
      K := Length(Key);
      if FCaseSensitive then
        LongWord(H) := HashStrBuf(Pointer(Key), K, 0) and (L - 1)
      else
        LongWord(H) := HashStrBufNoCase(Pointer(Key), K, 0) and (L - 1);
      LookupIdx := H;
      for I := 0 to Length(FLookup[H]) - 1 do
        begin
          Result := FLookup[H][I];
          if StrPEqualStr(Pointer(Key), K, TAnsiStringArray(FKeys).Data[Result],
              FCaseSensitive) then
            exit;
        end;
    end;
  if ErrorIfNotFound then
    RaiseKeyNotFoundError(Key, EAnsiStringDictionary);
  Result := -1;
end;

function TAnsiStringDictionary.GetItem(const Key: AnsiString): AnsiString;
var H, I : Integer;
begin
  I := LocateKey(Key, H, False);
  if I >= 0 then
    Result := TAnsiStringArray(FValues).Data[I]
  else
    Result := '';
end;

function TAnsiStringDictionary.LocateItem(const Key: AnsiString; var Value: AnsiString): Integer;
var H : Integer;
begin
  Result := LocateKey(Key, H, False);
  if Result >= 0 then
    Value := TAnsiStringArray(FValues).Data[Result]
  else
    Value := '';
end;



{                                                                              }
{ TGeneralWideStringDictionary                                                 }
{                                                                              }
constructor TGeneralWideStringDictionary.Create;
begin
  inherited Create;
  FCaseSensitive := True;
  FDuplicatesAction := ddAccept;
  FAddOnSet := True;
  FKeys := TAnsiStringArray.Create;
  FValues := TWideStringArray.Create;
end;

constructor TGeneralWideStringDictionary.CreateEx(const Keys: AAnsiStringArray;
    const Values: AWideStringArray; const KeysCaseSensitive: Boolean;
    const AddOnSet: Boolean;
    const DuplicatesAction: TDictionaryDuplicatesAction);
var L : Integer;
begin
  inherited Create;
  if Assigned(Keys) then
    begin
      FKeys := Keys;
      L := FKeys.Count;
    end
  else
    begin
      FKeys := TAnsiStringArray.Create;
      L := 0;
    end;
  if Assigned(Values) then
    FValues := Values
  else
    FValues := TWideStringArray.Create;
  FCaseSensitive := KeysCaseSensitive;
  FValues.Count := L;
  FAddOnSet := AddOnSet;
  FDuplicatesAction := DuplicatesAction;
  if L > 0 then
    Rehash;
end;

constructor TWideStringDictionary.CreateEx(const Keys: TAnsiStringArray;
    const Values: TWideStringArray; const KeysCaseSensitive: Boolean;
    const AddOnSet: Boolean;
    const DuplicatesAction: TDictionaryDuplicatesAction);
begin
  inherited CreateEx(Keys, Values, KeysCaseSensitive, AddOnSet,
      DuplicatesAction);
end;

destructor TGeneralWideStringDictionary.Destroy;
begin
  FreeAndNil(FValues);
  FreeAndNil(FKeys);
  inherited Destroy;
end;

function TGeneralWideStringDictionary.GetKeysCaseSensitive: Boolean;
begin
  Result := FCaseSensitive;
end;

function TGeneralWideStringDictionary.GetAddOnSet: Boolean;
begin
  Result := FAddOnSet;
end;

procedure TGeneralWideStringDictionary.SetAddOnSet(const AddOnSet: Boolean);
begin
  FAddOnSet := AddOnSet;
end;

function TGeneralWideStringDictionary.GetHashTableSize: Integer;
begin
  Result := Length(FLookup);
end;

procedure TGeneralWideStringDictionary.Rehash;
var I, C, L : Integer;
begin
  C := FKeys.Count;
  L := DictionaryRehashSize(C);
  FLookup := nil;
  SetLength(FLookup, L);
  FHashSize := L;
  Assert(L > 0);
  Dec(L);
  for I := 0 to C - 1 do
    Append(FLookup[HashStr(FKeys[I], 0, FCaseSensitive) and L], I);
end;

function TGeneralWideStringDictionary.LocateKey(const Key: AnsiString; var LookupIdx: Integer;
    const ErrorIfNotFound: Boolean): Integer;
var H, I, J, L, K : Integer;
begin
  L := FHashSize;
  if L > 0 then
    begin
      K := Length(Key);
      if FCaseSensitive then
        H := HashStrBuf(Pointer(Key), K, 0) and (L - 1)
      else
        H := HashStrBufNoCase(Pointer(Key), K, 0) and (L - 1);
      LookupIdx := H;
      for I := 0 to Length(FLookup[H]) - 1 do
        begin
          J := FLookup[H, I];
          if StrPEqualStr(Pointer(Key), K, FKeys[J], FCaseSensitive) then
            begin
              Result := J;
              exit;
            end;
        end;
    end;
  if ErrorIfNotFound then
    RaiseKeyNotFoundError(Key, EWideStringDictionary);
  Result := -1;
end;

procedure TGeneralWideStringDictionary.Add(const Key: AnsiString; const Value: WideString);
var H, L, I : Integer;
begin
  if FDuplicatesAction in [ddIgnore, ddError] then
    if LocateKey(Key, H, False) >= 0 then
      if FDuplicatesAction = ddIgnore then
        exit
      else
        RaiseDuplicateKeyError(Key);
  L := FHashSize;
  if L = 0 then
    begin
      Rehash;
      L := FHashSize;
      Assert(L > 0);
    end;
  H := Integer(HashStr(Key, 0, FCaseSensitive) and (L - 1));
  I := FKeys.AppendItem(Key);
  Append(FLookup[H], I);
  FValues.AppendItem(Value);
  if (I + 1) div DictionaryAverageHashChainSize > L then
    Rehash;
end;

procedure TGeneralWideStringDictionary.DeleteByIndex(const Idx: Integer; const Hash: Integer);
var I, J, H : Integer;
begin
  if Hash = -1 then
    H := HashStr(FKeys[Idx], 0, FCaseSensitive) and (FHashSize - 1)
  else
    H := Hash;
  FKeys.Delete(Idx);
  FValues.Delete(Idx);
  J := PosNext(Idx, FLookup[H]);
  Assert(J >= 0, 'Invalid hash value/lookup table');
  Remove(FLookup[H], J, 1);

  for I := 0 to FHashSize - 1 do
    for J := 0 to Length(FLookup[I]) - 1 do
      if FLookup[I][J] > Idx then
        Dec(FLookup[I][J]);
end;

procedure TGeneralWideStringDictionary.Delete(const Key: AnsiString);
var I, H : Integer;
begin
  I := LocateKey(Key, H, True);
  DeleteByIndex(I, H);
end;

function TGeneralWideStringDictionary.HasKey(const Key: AnsiString): Boolean;
var H : Integer;
begin
  Result := LocateKey(Key, H, False) >= 0;
end;

procedure TGeneralWideStringDictionary.Rename(const Key, NewKey: AnsiString);
var I, J, H : Integer;
begin
  I := LocateKey(Key, H, True);
  FKeys[I] := NewKey;
  J := PosNext(I, FLookup[H]);
  Assert(J >= 0, 'Invalid hash value/lookup table');
  Remove(FLookup[H], J, 1);
  Append(FLookup[HashStr(NewKey, 0, FCaseSensitive) and (FHashSize - 1)], I);
end;

function TGeneralWideStringDictionary.GetDuplicatesAction: TDictionaryDuplicatesAction;
begin
  Result := FDuplicatesAction;
end;

procedure TGeneralWideStringDictionary.SetDuplicatesAction(const DuplicatesAction: TDictionaryDuplicatesAction);
begin
  FDuplicatesAction := DuplicatesAction;
end;

function TGeneralWideStringDictionary.LocateItem(const Key: AnsiString; var Value: WideString): Integer;
var H : Integer;
begin
  Result := LocateKey(Key, H, False);
  if Result >= 0 then
    Value := FValues[Result]
  else
    Value := '';
end;

function TGeneralWideStringDictionary.LocateNext(const Key: AnsiString; const Idx: Integer; var Value: WideString): Integer;
var L, H, I, J, K : Integer;
begin
  Result := -1;
  L := FHashSize;
  if L = 0 then
    RaiseKeyNotFoundError(Key, EWideStringDictionary);
  H := HashStr(Key, 0, FCaseSensitive) and (L - 1);
  for I := 0 to Length(FLookup[H]) - 1 do
    begin
      J := FLookup[H, I];
      if J = Idx then
        begin
          if not StrEqualA(Key, FKeys[J], FCaseSensitive) then
            RaiseKeyNotFoundError(Key, EWideStringDictionary);
          for K := I + 1 to Length(FLookup[H]) - 1 do
            begin
              J := FLookup[H, K];
              if StrEqualA(Key, FKeys[J], FCaseSensitive) then
                begin
                  Value := FValues[J];
                  Result := J;
                  exit;
                end;
            end;
          Result := -1;
          exit;
        end;
    end;
  RaiseKeyNotFoundError(Key, EWideStringDictionary);
end;

procedure TGeneralWideStringDictionary.SetItem(const Key: AnsiString; const Value: WideString);
var I, H : Integer;
begin
  I := LocateKey(Key, H, False);
  if I >= 0 then
    FValues[I] := Value else
    if AddOnSet then
      Add(Key, Value) else
      RaiseKeyNotFoundError(Key, EWideStringDictionary);
end;

procedure TGeneralWideStringDictionary.RaiseIndexError;
begin
  RaiseDictionaryError('Index out of range', EWideStringDictionary);
end;

function TGeneralWideStringDictionary.Count: Integer;
begin
  Result := FKeys.Count;
  Assert(FValues.Count = Result, 'Key/Value count mismatch');
end;

function TGeneralWideStringDictionary.GetKeyByIndex(const Idx: Integer): AnsiString;
begin
  {$IFOPT R+}
  if (Idx < 0) or (Idx >= FKeys.Count) then
    RaiseIndexError;
  {$ENDIF}
  Result := FKeys[Idx];
end;

procedure TGeneralWideStringDictionary.DeleteItemByIndex(const Idx: Integer);
begin
  {$IFOPT R+}
  if (Idx < 0) or (Idx >= FValues.Count) then
    RaiseIndexError;
  {$ENDIF}
  DeleteByIndex(Idx, -1);
end;

function TGeneralWideStringDictionary.GetItemByIndex(const Idx: Integer): WideString;
begin
  {$IFOPT R+}
  if (Idx < 0) or (Idx >= FValues.Count) then
    RaiseIndexError;
  {$ENDIF}
  Result := FValues[Idx];
end;

procedure TGeneralWideStringDictionary.SetItemByIndex(const Idx: Integer; const Value: WideString);
begin
  {$IFOPT R+}
  if (Idx < 0) or (Idx >= FValues.Count) then
    RaiseIndexError;
  {$ENDIF}
  FValues[Idx] := Value;
end;

procedure TGeneralWideStringDictionary.Clear;
begin
  FKeys.Clear;
  FValues.Clear;
  FHashSize := 0;
  FLookup := nil;
end;



{                                                                              }
{ TWideStringDictionary                                                        }
{                                                                              }
function TWideStringDictionary.LocateKey(const Key: AnsiString; var LookupIdx: Integer;
    const ErrorIfNotFound: Boolean): Integer;
var H, I, L, K : Integer;
begin
  L := FHashSize;
  if L > 0 then
    begin
      K := Length(Key);
      if FCaseSensitive then
        LongWord(H) := HashStrBuf(Pointer(Key), K, 0) and (L - 1)
      else
        LongWord(H) := HashStrBufNoCase(Pointer(Key), K, 0) and (L - 1);
      LookupIdx := H;
      for I := 0 to Length(FLookup[H]) - 1 do
        begin
          Result := FLookup[H][I];
          if StrPEqualStr(Pointer(Key), K, TAnsiStringArray(FKeys).Data[Result],
              FCaseSensitive) then
            exit;
        end;
    end;
  if ErrorIfNotFound then
    RaiseKeyNotFoundError(Key, EWideStringDictionary);
  Result := -1;
end;

function TWideStringDictionary.GetItem(const Key: AnsiString): WideString;
var H, I : Integer;
begin
  I := LocateKey(Key, H, False);
  if I >= 0 then
    Result := TWideStringArray(FValues).Data[I]
  else
    Result := '';
end;

function TWideStringDictionary.LocateItem(const Key: AnsiString; var Value: WideString): Integer;
var H : Integer;
begin
  Result := LocateKey(Key, H, False);
  if Result >= 0 then
    Value := TWideStringArray(FValues).Data[Result]
  else
    Value := '';
end;



{                                                                              }
{ TGeneralObjectDictionary                                                     }
{                                                                              }
constructor TGeneralObjectDictionary.Create;
begin
  inherited Create;
  FCaseSensitive := True;
  FDuplicatesAction := ddAccept;
  FAddOnSet := True;
  FKeys := TAnsiStringArray.Create;
  FValues := TObjectArray.Create;
end;

constructor TGeneralObjectDictionary.CreateEx(const Keys: AAnsiStringArray;
    const Values: AObjectArray; const IsItemOwner: Boolean;
    const KeysCaseSensitive: Boolean; const AddOnSet: Boolean;
    const DuplicatesAction: TDictionaryDuplicatesAction);
var L : Integer;
begin
  inherited Create;
  if Assigned(Keys) then
    begin
      FKeys := Keys;
      L := FKeys.Count;
    end else
    begin
      FKeys := TAnsiStringArray.Create;
      L := 0;
    end;
  if Assigned(Values) then
    FValues := Values else
    FValues := TObjectArray.Create;
  FValues.Count := L;
  FAddOnSet := AddOnSet;
  FValues.IsItemOwner := IsItemOwner;
  FCaseSensitive := KeysCaseSensitive;
  FDuplicatesAction := DuplicatesAction;
  if L > 0 then
    Rehash;
end;

constructor TObjectDictionary.CreateEx(const Keys: TAnsiStringArray;
    const Values: TObjectArray; const IsItemOwner: Boolean;
    const KeysCaseSensitive: Boolean; const AddOnSet: Boolean;
    const DuplicatesAction: TDictionaryDuplicatesAction);
begin
  inherited CreateEx(Keys, Values, IsItemOwner, KeysCaseSensitive, AddOnSet,
      DuplicatesAction);
end;

destructor TGeneralObjectDictionary.Destroy;
begin
  FreeAndNil(FValues);
  FreeAndNil(FKeys);
  inherited Destroy;
end;

function TGeneralObjectDictionary.GetKeysCaseSensitive: Boolean;
begin
  Result := FCaseSensitive;
end;

function TGeneralObjectDictionary.GetAddOnSet: Boolean;
begin
  Result := FAddOnSet;
end;

procedure TGeneralObjectDictionary.SetAddOnSet(const AddOnSet: Boolean);
begin
  FAddOnSet := AddOnSet;
end;

function TGeneralObjectDictionary.GetHashTableSize: Integer;
begin
  Result := Length(FLookup);
end;

function TGeneralObjectDictionary.GetIsItemOwner: Boolean;
begin
  Result := FValues.IsItemOwner;
end;

procedure TGeneralObjectDictionary.SetIsItemOwner(const IsItemOwner: Boolean);
begin
  FValues.IsItemOwner := IsItemOwner;
end;

procedure TGeneralObjectDictionary.Rehash;
var I, C, L : Integer;
begin
  C := FKeys.Count;
  L := DictionaryRehashSize(C);
  FLookup := nil;
  SetLength(FLookup, L);
  FHashSize := L;
  Assert(L > 0);
  Dec(L);
  for I := 0 to C - 1 do
    Append(FLookup[HashStr(FKeys[I], 0, FCaseSensitive) and L], I);
end;

function TGeneralObjectDictionary.LocateKey(const Key: AnsiString; var LookupIdx: Integer;
    const ErrorIfNotFound: Boolean): Integer;
var H, I, J, L, K : Integer;
begin
  L := FHashSize;
  if L > 0 then
    begin
      K := Length(Key);
      if FCaseSensitive then
        H := HashStrBuf(Pointer(Key), K, 0) and (L - 1)
      else
        H := HashStrBufNoCase(Pointer(Key), K, 0) and (L - 1);
      LookupIdx := H;
      for I := 0 to Length(FLookup[H]) - 1 do
        begin
          J := FLookup[H, I];
          if StrPEqualStr(Pointer(Key), K, FKeys[J], FCaseSensitive) then
            begin
              Result := J;
              exit;
            end;
        end;
    end;
  if ErrorIfNotFound then
    RaiseKeyNotFoundError(Key, EObjectDictionary);
  Result := -1;
end;

procedure TGeneralObjectDictionary.Add(const Key: AnsiString; const Value: TObject);
var H, L, I : Integer;
begin
  if FDuplicatesAction in [ddIgnore, ddError] then
    if LocateKey(Key, H, False) >= 0 then
      if FDuplicatesAction = ddIgnore then
        exit
      else
        RaiseDuplicateKeyError(Key);
  L := FHashSize;
  if L = 0 then
    begin
      Rehash;
      L := FHashSize;
      Assert(L > 0);
    end;
  H := Integer(HashStr(Key, 0, FCaseSensitive) and (L - 1));
  I := FKeys.AppendItem(Key);
  Append(FLookup[H], I);
  FValues.AppendItem(Value);
  if (I + 1) div DictionaryAverageHashChainSize > L then
    Rehash;
end;

procedure TGeneralObjectDictionary.DeleteByIndex(const Idx: Integer; const Hash: Integer);
var I, J, H : Integer;
begin
  if Hash = -1 then
    H := HashStr(FKeys[Idx], 0, FCaseSensitive) and (FHashSize - 1)
  else
    H := Hash;
  FKeys.Delete(Idx);
  FValues.Delete(Idx);
  J := PosNext(Idx, FLookup[H]);
  Assert(J >= 0, 'Invalid hash value/lookup table');
  Remove(FLookup[H], J, 1);

  for I := 0 to FHashSize - 1 do
    for J := 0 to Length(FLookup[I]) - 1 do
      if FLookup[I][J] > Idx then
        Dec(FLookup[I][J]);
end;

procedure TGeneralObjectDictionary.Delete(const Key: AnsiString);
var I, H : Integer;
begin
  I := LocateKey(Key, H, True);
  DeleteByIndex(I, H);
end;

function TGeneralObjectDictionary.HasKey(const Key: AnsiString): Boolean;
var H : Integer;
begin
  Result := LocateKey(Key, H, False) >= 0;
end;

procedure TGeneralObjectDictionary.Rename(const Key, NewKey: AnsiString);
var I, J, H : Integer;
begin
  I := LocateKey(Key, H, True);
  FKeys[I] := NewKey;
  J := PosNext(I, FLookup[H]);
  Assert(J >= 0, 'Invalid hash value/lookup table');
  Remove(FLookup[H], J, 1);
  Append(FLookup[HashStr(NewKey, 0, FCaseSensitive) and (FHashSize - 1)], I);
end;

function TGeneralObjectDictionary.GetDuplicatesAction: TDictionaryDuplicatesAction;
begin
  Result := FDuplicatesAction;
end;

procedure TGeneralObjectDictionary.SetDuplicatesAction(const DuplicatesAction: TDictionaryDuplicatesAction);
begin
  FDuplicatesAction := DuplicatesAction;
end;

function TGeneralObjectDictionary.LocateItem(const Key: AnsiString; var Value: TObject): Integer;
var H : Integer;
begin
  Result := LocateKey(Key, H, False);
  if Result >= 0 then
    Value := FValues[Result]
  else
    Value := nil;
end;

function TGeneralObjectDictionary.LocateNext(const Key: AnsiString; const Idx: Integer; var Value: TObject): Integer;
var L, H, I, J, K : Integer;
begin
  Result := -1;
  L := FHashSize;
  if L = 0 then
    RaiseKeyNotFoundError(Key, EObjectDictionary);
  H := HashStr(Key, 0, FCaseSensitive) and (L - 1);
  for I := 0 to Length(FLookup[H]) - 1 do
    begin
      J := FLookup[H, I];
      if J = Idx then
        begin
          if not StrEqualA(Key, FKeys[J], FCaseSensitive) then
            RaiseKeyNotFoundError(Key, EObjectDictionary);
          for K := I + 1 to Length(FLookup[H]) - 1 do
            begin
              J := FLookup[H, K];
              if StrEqualA(Key, FKeys[J], FCaseSensitive) then
                begin
                  Value := FValues[J];
                  Result := J;
                  exit;
                end;
            end;
          Result := -1;
          exit;
        end;
    end;
  RaiseKeyNotFoundError(Key, EObjectDictionary);
end;

procedure TGeneralObjectDictionary.SetItem(const Key: AnsiString; const Value: TObject);
var I, H : Integer;
begin
  I := LocateKey(Key, H, False);
  if I >= 0 then
    FValues[I] := Value else
    if AddOnSet then
      Add(Key, Value) else
      RaiseKeyNotFoundError(Key, EObjectDictionary);
end;

procedure TGeneralObjectDictionary.RaiseIndexError;
begin
  RaiseDictionaryError('Index out of range', EObjectDictionary);
end;

function TGeneralObjectDictionary.Count: Integer;
begin
  Result := FKeys.Count;
  Assert(FValues.Count = Result, 'Key/Value count mismatch');
end;

function TGeneralObjectDictionary.GetKeyByIndex(const Idx: Integer): AnsiString;
begin
  {$IFOPT R+}
  if (Idx < 0) or (Idx >= FKeys.Count) then
    RaiseIndexError;
  {$ENDIF}
  Result := FKeys[Idx];
end;

procedure TGeneralObjectDictionary.DeleteItemByIndex(const Idx: Integer);
begin
  {$IFOPT R+}
  if (Idx < 0) or (Idx >= FValues.Count) then
    RaiseIndexError;
  {$ENDIF}
  DeleteByIndex(Idx, -1);
end;

function TGeneralObjectDictionary.GetItemByIndex(const Idx: Integer): TObject;
begin
  {$IFOPT R+}
  if (Idx < 0) or (Idx >= FValues.Count) then
    RaiseIndexError;
  {$ENDIF}
  Result := FValues[Idx];
end;

procedure TGeneralObjectDictionary.SetItemByIndex(const Idx: Integer; const Value: TObject);
begin
  {$IFOPT R+}
  if (Idx < 0) or (Idx >= FValues.Count) then
    RaiseIndexError;
  {$ENDIF}
  FValues[Idx] := Value;
end;

function TGeneralObjectDictionary.ReleaseItem(const Key: AnsiString): TObject;
var I, H : Integer;
begin
  I := LocateKey(Key, H, True);
  Result := FValues.ReleaseItem(I);
end;

procedure TGeneralObjectDictionary.ReleaseItems;
begin
  FKeys.Clear;
  FValues.ReleaseItems;
  FHashSize := 0;
  FLookup := nil;
end;

procedure TGeneralObjectDictionary.FreeItems;
begin
  FKeys.Clear;
  FValues.FreeItems;
  FHashSize := 0;
  FLookup := nil;
end;

procedure TGeneralObjectDictionary.Clear;
begin
  FKeys.Clear;
  FValues.Clear;
  FHashSize := 0;
  FLookup := nil;
end;



{                                                                              }
{ TObjectDictionary                                                            }
{                                                                              }
function TObjectDictionary.LocateKey(const Key: AnsiString; var LookupIdx: Integer;
    const ErrorIfNotFound: Boolean): Integer;
var H, I, L, K : Integer;
begin
  L := FHashSize;
  if L > 0 then
    begin
      K := Length(Key);
      if FCaseSensitive then
        LongWord(H) := HashStrBuf(Pointer(Key), K, 0) and (L - 1)
      else
        LongWord(H) := HashStrBufNoCase(Pointer(Key), K, 0) and (L - 1);
      LookupIdx := H;
      for I := 0 to Length(FLookup[H]) - 1 do
        begin
          Result := FLookup[H][I];
          if StrPEqualStr(Pointer(Key), K, TAnsiStringArray(FKeys).Data[Result],
              FCaseSensitive) then
            exit;
        end;
    end;
  if ErrorIfNotFound then
    RaiseKeyNotFoundError(Key, EObjectDictionary);
  Result := -1;
end;

function TObjectDictionary.GetItem(const Key: AnsiString): TObject;
var H, I : Integer;
begin
  I := LocateKey(Key, H, False);
  if I >= 0 then
    Result := TObjectArray(FValues).Data[I]
  else
    Result := nil;
end;

function TObjectDictionary.LocateItem(const Key: AnsiString; var Value: TObject): Integer;
var H : Integer;
begin
  Result := LocateKey(Key, H, False);
  if Result >= 0 then
    Value := TObjectArray(FValues).Data[Result]
  else
    Value := nil;
end;



{                                                                              }
{ TGeneralInterfaceDictionary                                                  }
{                                                                              }
constructor TGeneralInterfaceDictionary.Create;
begin
  inherited Create;
  FCaseSensitive := True;
  FDuplicatesAction := ddAccept;
  FAddOnSet := True;
  FKeys := TAnsiStringArray.Create;
  FValues := TInterfaceArray.Create;
end;

constructor TGeneralInterfaceDictionary.CreateEx(const Keys: AAnsiStringArray;
    const Values: AInterfaceArray; const KeysCaseSensitive: Boolean;
    const AddOnSet: Boolean;
    const DuplicatesAction: TDictionaryDuplicatesAction);
var L : Integer;
begin
  inherited Create;
  if Assigned(Keys) then
    begin
      FKeys := Keys;
      L := FKeys.Count;
    end
  else
    begin
      FKeys := TAnsiStringArray.Create;
      L := 0;
    end;
  if Assigned(Values) then
    FValues := Values
  else
    FValues := TInterfaceArray.Create;
  FCaseSensitive := KeysCaseSensitive;
  FValues.Count := L;
  FAddOnSet := AddOnSet;
  FDuplicatesAction := DuplicatesAction;
  if L > 0 then
    Rehash;
end;

constructor TInterfaceDictionary.CreateEx(const Keys: TAnsiStringArray;
    const Values: TInterfaceArray; const KeysCaseSensitive: Boolean;
    const AddOnSet: Boolean;
    const DuplicatesAction: TDictionaryDuplicatesAction);
begin
  inherited CreateEx(Keys, Values, KeysCaseSensitive, AddOnSet,
      DuplicatesAction);
end;

destructor TGeneralInterfaceDictionary.Destroy;
begin
  FreeAndNil(FValues);
  FreeAndNil(FKeys);
  inherited Destroy;
end;

function TGeneralInterfaceDictionary.GetKeysCaseSensitive: Boolean;
begin
  Result := FCaseSensitive;
end;

function TGeneralInterfaceDictionary.GetAddOnSet: Boolean;
begin
  Result := FAddOnSet;
end;

procedure TGeneralInterfaceDictionary.SetAddOnSet(const AddOnSet: Boolean);
begin
  FAddOnSet := AddOnSet;
end;

function TGeneralInterfaceDictionary.GetHashTableSize: Integer;
begin
  Result := Length(FLookup);
end;

procedure TGeneralInterfaceDictionary.Rehash;
var I, C, L : Integer;
begin
  C := FKeys.Count;
  L := DictionaryRehashSize(C);
  FLookup := nil;
  SetLength(FLookup, L);
  FHashSize := L;
  Assert(L > 0);
  Dec(L);
  for I := 0 to C - 1 do
    Append(FLookup[HashStr(FKeys[I], 0, FCaseSensitive) and L], I);
end;

function TGeneralInterfaceDictionary.LocateKey(const Key: AnsiString; var LookupIdx: Integer;
    const ErrorIfNotFound: Boolean): Integer;
var H, I, J, L, K : Integer;
begin
  L := FHashSize;
  if L > 0 then
    begin
      K := Length(Key);
      if FCaseSensitive then
        H := HashStrBuf(Pointer(Key), K, 0) and (L - 1)
      else
        H := HashStrBufNoCase(Pointer(Key), K, 0) and (L - 1);
      LookupIdx := H;
      for I := 0 to Length(FLookup[H]) - 1 do
        begin
          J := FLookup[H, I];
          if StrPEqualStr(Pointer(Key), K, FKeys[J], FCaseSensitive) then
            begin
              Result := J;
              exit;
            end;
        end;
    end;
  if ErrorIfNotFound then
    RaiseKeyNotFoundError(Key, EInterfaceDictionary);
  Result := -1;
end;

procedure TGeneralInterfaceDictionary.Add(const Key: AnsiString; const Value: IInterface);
var H, L, I : Integer;
begin
  if FDuplicatesAction in [ddIgnore, ddError] then
    if LocateKey(Key, H, False) >= 0 then
      if FDuplicatesAction = ddIgnore then
        exit
      else
        RaiseDuplicateKeyError(Key);
  L := FHashSize;
  if L = 0 then
    begin
      Rehash;
      L := FHashSize;
      Assert(L > 0);
    end;
  H := Integer(HashStr(Key, 0, FCaseSensitive) and (L - 1));
  I := FKeys.AppendItem(Key);
  Append(FLookup[H], I);
  FValues.AppendItem(Value);
  if (I + 1) div DictionaryAverageHashChainSize > L then
    Rehash;
end;

procedure TGeneralInterfaceDictionary.DeleteByIndex(const Idx: Integer; const Hash: Integer);
var I, J, H : Integer;
begin
  if Hash = -1 then
    H := HashStr(FKeys[Idx], 0, FCaseSensitive) and (FHashSize - 1)
  else
    H := Hash;
  FKeys.Delete(Idx);
  FValues.Delete(Idx);
  J := PosNext(Idx, FLookup[H]);
  Assert(J >= 0, 'Invalid hash value/lookup table');
  Remove(FLookup[H], J, 1);

  for I := 0 to FHashSize - 1 do
    for J := 0 to Length(FLookup[I]) - 1 do
      if FLookup[I][J] > Idx then
        Dec(FLookup[I][J]);
end;

procedure TGeneralInterfaceDictionary.Delete(const Key: AnsiString);
var I, H : Integer;
begin
  I := LocateKey(Key, H, True);
  DeleteByIndex(I, H);
end;

function TGeneralInterfaceDictionary.HasKey(const Key: AnsiString): Boolean;
var H : Integer;
begin
  Result := LocateKey(Key, H, False) >= 0;
end;

procedure TGeneralInterfaceDictionary.Rename(const Key, NewKey: AnsiString);
var I, J, H : Integer;
begin
  I := LocateKey(Key, H, True);
  FKeys[I] := NewKey;
  J := PosNext(I, FLookup[H]);
  Assert(J >= 0, 'Invalid hash value/lookup table');
  Remove(FLookup[H], J, 1);
  Append(FLookup[HashStr(NewKey, 0, FCaseSensitive) and (FHashSize - 1)], I);
end;

function TGeneralInterfaceDictionary.GetDuplicatesAction: TDictionaryDuplicatesAction;
begin
  Result := FDuplicatesAction;
end;

procedure TGeneralInterfaceDictionary.SetDuplicatesAction(const DuplicatesAction: TDictionaryDuplicatesAction);
begin
  FDuplicatesAction := DuplicatesAction;
end;

function TGeneralInterfaceDictionary.LocateItem(const Key: AnsiString; var Value: IInterface): Integer;
var H : Integer;
begin
  Result := LocateKey(Key, H, False);
  if Result >= 0 then
    Value := FValues[Result]
  else
    Value := nil;
end;

function TGeneralInterfaceDictionary.LocateNext(const Key: AnsiString; const Idx: Integer; var Value: IInterface): Integer;
var L, H, I, J, K : Integer;
begin
  Result := -1;
  L := FHashSize;
  if L = 0 then
    RaiseKeyNotFoundError(Key, EInterfaceDictionary);
  H := HashStr(Key, 0, FCaseSensitive) and (L - 1);
  for I := 0 to Length(FLookup[H]) - 1 do
    begin
      J := FLookup[H, I];
      if J = Idx then
        begin
          if not StrEqualA(Key, FKeys[J], FCaseSensitive) then
            RaiseKeyNotFoundError(Key, EInterfaceDictionary);
          for K := I + 1 to Length(FLookup[H]) - 1 do
            begin
              J := FLookup[H, K];
              if StrEqualA(Key, FKeys[J], FCaseSensitive) then
                begin
                  Value := FValues[J];
                  Result := J;
                  exit;
                end;
            end;
          Result := -1;
          exit;
        end;
    end;
  RaiseKeyNotFoundError(Key, EInterfaceDictionary);
end;

procedure TGeneralInterfaceDictionary.SetItem(const Key: AnsiString; const Value: IInterface);
var I, H : Integer;
begin
  I := LocateKey(Key, H, False);
  if I >= 0 then
    FValues[I] := Value else
    if AddOnSet then
      Add(Key, Value) else
      RaiseKeyNotFoundError(Key, EInterfaceDictionary);
end;

procedure TGeneralInterfaceDictionary.RaiseIndexError;
begin
  RaiseDictionaryError('Index out of range', EInterfaceDictionary);
end;

function TGeneralInterfaceDictionary.Count: Integer;
begin
  Result := FKeys.Count;
  Assert(FValues.Count = Result, 'Key/Value count mismatch');
end;

function TGeneralInterfaceDictionary.GetKeyByIndex(const Idx: Integer): AnsiString;
begin
  {$IFOPT R+}
  if (Idx < 0) or (Idx >= FKeys.Count) then
    RaiseIndexError;
  {$ENDIF}
  Result := FKeys[Idx];
end;

procedure TGeneralInterfaceDictionary.DeleteItemByIndex(const Idx: Integer);
begin
  {$IFOPT R+}
  if (Idx < 0) or (Idx >= FValues.Count) then
    RaiseIndexError;
  {$ENDIF}
  DeleteByIndex(Idx, -1);
end;

function TGeneralInterfaceDictionary.GetItemByIndex(const Idx: Integer): IInterface;
begin
  {$IFOPT R+}
  if (Idx < 0) or (Idx >= FValues.Count) then
    RaiseIndexError;
  {$ENDIF}
  Result := FValues[Idx];
end;

procedure TGeneralInterfaceDictionary.SetItemByIndex(const Idx: Integer; const Value: IInterface);
begin
  {$IFOPT R+}
  if (Idx < 0) or (Idx >= FValues.Count) then
    RaiseIndexError;
  {$ENDIF}
  FValues[Idx] := Value;
end;

procedure TGeneralInterfaceDictionary.Clear;
begin
  FKeys.Clear;
  FValues.Clear;
  FHashSize := 0;
  FLookup := nil;
end;



{                                                                              }
{ TInterfaceDictionary                                                         }
{                                                                              }
function TInterfaceDictionary.LocateKey(const Key: AnsiString; var LookupIdx: Integer;
    const ErrorIfNotFound: Boolean): Integer;
var H, I, L, K : Integer;
begin
  L := FHashSize;
  if L > 0 then
    begin
      K := Length(Key);
      if FCaseSensitive then
        LongWord(H) := HashStrBuf(Pointer(Key), K, 0) and (L - 1)
      else
        LongWord(H) := HashStrBufNoCase(Pointer(Key), K, 0) and (L - 1);
      LookupIdx := H;
      for I := 0 to Length(FLookup[H]) - 1 do
        begin
          Result := FLookup[H][I];
          if StrPEqualStr(Pointer(Key), K, TAnsiStringArray(FKeys).Data[Result],
              FCaseSensitive) then
            exit;
        end;
    end;
  if ErrorIfNotFound then
    RaiseKeyNotFoundError(Key, EInterfaceDictionary);
  Result := -1;
end;

function TInterfaceDictionary.GetItem(const Key: AnsiString): IInterface;
var H, I : Integer;
begin
  I := LocateKey(Key, H, False);
  if I >= 0 then
    Result := TInterfaceArray(FValues).Data[I]
  else
    Result := nil;
end;

function TInterfaceDictionary.LocateItem(const Key: AnsiString; var Value: IInterface): Integer;
var H : Integer;
begin
  Result := LocateKey(Key, H, False);
  if Result >= 0 then
    Value := TInterfaceArray(FValues).Data[Result]
  else
    Value := nil;
end;



{                                                                              }
{ Sparse array functions                                                       }
{                                                                              }
const
  SparseArrayAverageHashChainSize = 4;

function SparseArrayRehashSize(const Count: Integer): Integer;
var L : Integer;
begin
  L := Count div SparseArrayAverageHashChainSize; // Number of "slots"
  if L <= $10 then                                // Rehash in powers of 16
    Result := $10 else
  if L <= $100 then
    Result := $100 else
  if L <= $1000 then
    Result := $1000 else
  if L <= $10000 then
    Result := $10000 else
  if L <= $100000 then
    Result := $100000 else
  if L <= $1000000 then
    Result := $1000000
  else
    Result := $10000000;
end;



{                                                                              }
{ ASparseArray                                                                 }
{                                                                              }
procedure ASparseArray.IndexError(const ErrorClass: ExceptClass);
begin
  RaiseTypeError('Index not found', nil, ErrorClass);
end;

function ASparseArray.IsEmpty: Boolean;
begin
  Result := GetCount = 0;
end;



{                                                                              }
{ TSparseStringArray                                                           }
{                                                                              }
procedure TSparseStringArray.Assign(const Source: TObject);
var I, L : Integer;
begin
  if Source is TSparseStringArray then
    begin
      Clear;
      L := Length(TSparseStringArray(Source).FHashList);
      SetLength(FHashList, L);
      for I := 0 to L - 1 do
        FHashList[I] := Copy(TSparseStringArray(Source).FHashList[I]);
      FHashSize := TSparseStringArray(Source).FHashSize;
      FCount := TSparseStringArray(Source).FCount;
    end
  else
    inherited Assign(Source);
end;

procedure TSparseStringArray.Clear;
begin
  FHashList := nil;
  FHashSize := 0;
  FCount := 0;
end;

function TSparseStringArray.IsEqual(const V: TObject): Boolean;
var I, J : Integer;
    F, G : Integer;
    P, Q : PSparseStringRecord;
begin
  if V is TSparseStringArray then
    begin
      if FCount <> TSparseStringArray(V).FCount then
        begin
          Result := False;
          exit;
        end;
      for I := 0 to Length(FHashList) - 1 do
        for J := 0 to Length(FHashList[I]) - 1 do
          begin
            Q := @FHashList[I][J];
            P := TSparseStringArray(V).LocateItemRecord(Q^.Idx, F, G);
            if not Assigned(P) or (P^.Value <> Q^.Value) then
              begin
                Result := False;
                exit;
              end;
          end;
      Result := True;
    end
  else
    Result := inherited IsEqual(V);
end;

function TSparseStringArray.LocateItemRecord(const Idx: Integer;
    var LookupIdx, ChainIdx: Integer): PSparseStringRecord;
var H, I, J, L : Integer;
    P : TSparseStringRecordArray;
begin
  I := FHashSize;
  if (I = 0) or (FCount = 0) then
    begin
      LookupIdx := -1;
      ChainIdx := -1;
      Result := nil;
      exit;
    end;
  H := Integer(HashInteger(Idx) and (I - 1));
  LookupIdx := H;
  P := FHashList[H];
  L := Length(P);
  if L > 0 then
    begin
      Result := @P[0];
      J := Idx;
      for I := 0 to L - 1 do
        if Result^.Idx = J then
          begin
            ChainIdx := I;
            exit;
          end
        else
          Inc(Result);
    end;
  Result := nil;
  ChainIdx := -1;
end;

procedure TSparseStringArray.Rehash;
var I, J, R, F, H : Integer;
    N    : TSparseStringArrayHashList;
    P, Q : PSparseStringRecord;
begin
  R := SparseArrayRehashSize(FCount);
  SetLength(N, R);
  for I := 0 to Length(FHashList) - 1 do
    for J := 0 to Length(FHashList[I]) - 1 do
      begin
        P := @FHashList[I][J];
        H := Integer(HashInteger(P^.Idx) and (R - 1));
        F := Length(N[H]);
        SetLength(N[H], F + 1);
        Q := @N[H][F];
        Q^.Idx := P^.Idx;
        Q^.Value := P^.Value;
      end;
  FHashList := N;
  FHashSize := R;
end;

function TSparseStringArray.GetCount: Integer;
begin
  Result := FCount;
end;

function TSparseStringArray.GetItem(const Idx: Integer): AnsiString;
var P    : PSparseStringRecord;
    I, J : Integer;
begin
  P := LocateItemRecord(Idx, I, J);
  if not Assigned(P) then
    IndexError(ESparseStringArray);
  Result := P^.Value;
end;

function TSparseStringArray.LocateItem(const Idx: Integer; var Value: AnsiString): Boolean;
var P    : PSparseStringRecord;
    I, J : Integer;
begin
  P := LocateItemRecord(Idx, I, J);
  if Assigned(P) then
    begin
      Value := P^.Value;
      Result := True;
    end
  else
    begin
      Value := '';
      Result := False;
    end;
end;

procedure TSparseStringArray.SetItem(const Idx: Integer; const Value: AnsiString);
var P    : PSparseStringRecord;
    I, J : Integer;
    L    : Integer;
begin
  P := LocateItemRecord(Idx, I, J);
  if Assigned(P) then
    P^.Value := Value
  else
    begin
      L := FHashSize;
      if L = 0 then
        begin
          Rehash;
          L := FHashSize;
          Assert(L > 0);
        end;
      I := Integer(HashInteger(Idx) and (L - 1));
      J := Length(FHashList[I]);
      SetLength(FHashList[I], J + 1);
      P := @FHashList[I][J];
      P^.Idx := Idx;
      P^.Value := Value;
      Inc(FCount);
      if (FCount + 1) div SparseArrayAverageHashChainSize > L then
        Rehash;
    end;
end;

function TSparseStringArray.HasItem(const Idx: Integer): Boolean;
var I, J : Integer;
begin
  Result := Assigned(LocateItemRecord(Idx, I, J));
end;

function TSparseStringArray.IsEmpty: Boolean;
begin
  Result := FCount = 0;
end;

function TSparseStringArray.FindFirst(var Idx: Integer; var Value: AnsiString): Boolean;
var I : Integer;
    P : PSparseStringRecord;
begin
  for I := 0 to Length(FHashList) - 1 do
    if Length(FHashList[I]) > 0 then
      begin
        P := @FHashList[I][0];
        Idx := P^.Idx;
        Value := P^.Value;
        Result := True;
        exit;
      end;
  Idx := -1;
  Value := '';
  Result := False;
end;

function TSparseStringArray.FindNext(var Idx: Integer; var Value: AnsiString): Boolean;
var P : PSparseStringRecord;
    I, J, L : Integer;
begin
  P := LocateItemRecord(Idx, I, J);
  if not Assigned(P) then
    IndexError(ESparseStringArray);
  Inc(J);
  if J >= Length(FHashList[I]) then
    begin
      J := 0;
      L := Length(FHashList);
      Inc(I);
      while I < L do
        if Length(FHashList[I]) > 0 then
          break
        else
          Inc(I);
      if I >= L then
        begin
          Idx := -1;
          Value := '';
          Result := False;
          exit;
        end;
    end;
  P := @FHashList[I][J];
  Idx := P^.Idx;
  Value := P^.Value;
  Result := True;
end;

procedure TSparseStringArray.Delete(const Idx: Integer);
var P    : PSparseStringRecord;
    I, J : Integer;
    L    : Integer;
begin
  P := LocateItemRecord(Idx, I, J);
  if not Assigned(P) then
    IndexError(ESparseStringArray);
  P^.Value := '';
  L := Length(FHashList[I]);
  if J < L - 1 then
    begin
      Move(FHashList[I][J + 1], FHashList[I][J], (L - J - 1) * Sizeof(TSparseStringRecord));
      ZeroMem(FHashList[I][L - 1], Sizeof(TSparseStringRecord));
    end;
  SetLength(FHashList[I], L - 1);
  Dec(FCount);
end;



{                                                                              }
{ TSparseWideStringArray                                                       }
{                                                                              }
procedure TSparseWideStringArray.Assign(const Source: TObject);
var I, L : Integer;
begin
  if Source is TSparseWideStringArray then
    begin
      Clear;
      L := Length(TSparseWideStringArray(Source).FHashList);
      SetLength(FHashList, L);
      for I := 0 to L - 1 do
        FHashList[I] := Copy(TSparseWideStringArray(Source).FHashList[I]);
      FHashSize := TSparseWideStringArray(Source).FHashSize;
      FCount := TSparseWideStringArray(Source).FCount;
    end
  else
    inherited Assign(Source);
end;

procedure TSparseWideStringArray.Clear;
begin
  FHashList := nil;
  FHashSize := 0;
  FCount := 0;
end;

function TSparseWideStringArray.IsEqual(const V: TObject): Boolean;
var I, J : Integer;
    F, G : Integer;
    P, Q : PSparseWideStringRecord;
begin
  if V is TSparseWideStringArray then
    begin
      if FCount <> TSparseWideStringArray(V).FCount then
        begin
          Result := False;
          exit;
        end;
      for I := 0 to Length(FHashList) - 1 do
        for J := 0 to Length(FHashList[I]) - 1 do
          begin
            Q := @FHashList[I][J];
            P := TSparseWideStringArray(V).LocateItemRecord(Q^.Idx, F, G);
            if not Assigned(P) or (P^.Value <> Q^.Value) then
              begin
                Result := False;
                exit;
              end;
          end;
      Result := True;
    end
  else
    Result := inherited IsEqual(V);
end;

function TSparseWideStringArray.LocateItemRecord(const Idx: Integer;
    var LookupIdx, ChainIdx: Integer): PSparseWideStringRecord;
var H, I, J, L : Integer;
    P : TSparseWideStringRecordArray;
begin
  I := FHashSize;
  if (I = 0) or (FCount = 0) then
    begin
      LookupIdx := -1;
      ChainIdx := -1;
      Result := nil;
      exit;
    end;
  H := Integer(HashInteger(Idx) and (I - 1));
  LookupIdx := H;
  P := FHashList[H];
  L := Length(P);
  if L > 0 then
    begin
      Result := @P[0];
      J := Idx;
      for I := 0 to L - 1 do
        if Result^.Idx = J then
          begin
            ChainIdx := I;
            exit;
          end
        else
          Inc(Result);
    end;
  Result := nil;
  ChainIdx := -1;
end;

procedure TSparseWideStringArray.Rehash;
var I, J, R, F, H : Integer;
    N    : TSparseWideStringArrayHashList;
    P, Q : PSparseWideStringRecord;
begin
  R := SparseArrayRehashSize(FCount);
  SetLength(N, R);
  for I := 0 to Length(FHashList) - 1 do
    for J := 0 to Length(FHashList[I]) - 1 do
      begin
        P := @FHashList[I][J];
        H := Integer(HashInteger(P^.Idx) and (R - 1));
        F := Length(N[H]);
        SetLength(N[H], F + 1);
        Q := @N[H][F];
        Q^.Idx := P^.Idx;
        Q^.Value := P^.Value;
      end;
  FHashList := N;
  FHashSize := R;
end;

function TSparseWideStringArray.GetCount: Integer;
begin
  Result := FCount;
end;

function TSparseWideStringArray.GetItem(const Idx: Integer): WideString;
var P    : PSparseWideStringRecord;
    I, J : Integer;
begin
  P := LocateItemRecord(Idx, I, J);
  if not Assigned(P) then
    IndexError(ESparseWideStringArray);
  Result := P^.Value;
end;

function TSparseWideStringArray.LocateItem(const Idx: Integer; var Value: WideString): Boolean;
var P    : PSparseWideStringRecord;
    I, J : Integer;
begin
  P := LocateItemRecord(Idx, I, J);
  if Assigned(P) then
    begin
      Value := P^.Value;
      Result := True;
    end
  else
    begin
      Value := '';
      Result := False;
    end;
end;

procedure TSparseWideStringArray.SetItem(const Idx: Integer; const Value: WideString);
var P    : PSparseWideStringRecord;
    I, J : Integer;
    L    : Integer;
begin
  P := LocateItemRecord(Idx, I, J);
  if Assigned(P) then
    P^.Value := Value
  else
    begin
      L := FHashSize;
      if L = 0 then
        begin
          Rehash;
          L := FHashSize;
          Assert(L > 0);
        end;
      I := Integer(HashInteger(Idx) and (L - 1));
      J := Length(FHashList[I]);
      SetLength(FHashList[I], J + 1);
      P := @FHashList[I][J];
      P^.Idx := Idx;
      P^.Value := Value;
      Inc(FCount);
      if (FCount + 1) div SparseArrayAverageHashChainSize > L then
        Rehash;
    end;
end;

function TSparseWideStringArray.HasItem(const Idx: Integer): Boolean;
var I, J : Integer;
begin
  Result := Assigned(LocateItemRecord(Idx, I, J));
end;

function TSparseWideStringArray.IsEmpty: Boolean;
begin
  Result := FCount = 0;
end;

function TSparseWideStringArray.FindFirst(var Idx: Integer; var Value: WideString): Boolean;
var I : Integer;
    P : PSparseWideStringRecord;
begin
  for I := 0 to Length(FHashList) - 1 do
    if Length(FHashList[I]) > 0 then
      begin
        P := @FHashList[I][0];
        Idx := P^.Idx;
        Value := P^.Value;
        Result := True;
        exit;
      end;
  Idx := -1;
  Value := '';
  Result := False;
end;

function TSparseWideStringArray.FindNext(var Idx: Integer; var Value: WideString): Boolean;
var P : PSparseWideStringRecord;
    I, J, L : Integer;
begin
  P := LocateItemRecord(Idx, I, J);
  if not Assigned(P) then
    IndexError(ESparseWideStringArray);
  Inc(J);
  if J >= Length(FHashList[I]) then
    begin
      J := 0;
      L := Length(FHashList);
      Inc(I);
      while I < L do
        if Length(FHashList[I]) > 0 then
          break
        else
          Inc(I);
      if I >= L then
        begin
          Idx := -1;
          Value := '';
          Result := False;
          exit;
        end;
    end;
  P := @FHashList[I][J];
  Idx := P^.Idx;
  Value := P^.Value;
  Result := True;
end;

procedure TSparseWideStringArray.Delete(const Idx: Integer);
var P    : PSparseWideStringRecord;
    I, J : Integer;
    L    : Integer;
begin
  P := LocateItemRecord(Idx, I, J);
  if not Assigned(P) then
    IndexError(ESparseWideStringArray);
  P^.Value := '';
  L := Length(FHashList[I]);
  if J < L - 1 then
    begin
      Move(FHashList[I][J + 1], FHashList[I][J], (L - J - 1) * Sizeof(TSparseWideStringRecord));
      ZeroMem(FHashList[I][L - 1], Sizeof(TSparseWideStringRecord));
    end;
  SetLength(FHashList[I], L - 1);
  Dec(FCount);
end;



{                                                                              }
{ TSparseInt64Array                                                            }
{                                                                              }
procedure TSparseInt64Array.Assign(const Source: TObject);
var I, L : Integer;
begin
  if Source is TSparseInt64Array then
    begin
      Clear;
      L := Length(TSparseInt64Array(Source).FHashList);
      SetLength(FHashList, L);
      for I := 0 to L - 1 do
        FHashList[I] := Copy(TSparseInt64Array(Source).FHashList[I]);
      FHashSize := TSparseInt64Array(Source).FHashSize;
      FCount := TSparseInt64Array(Source).FCount;
    end
  else
    inherited Assign(Source);
end;

procedure TSparseInt64Array.Clear;
begin
  FHashList := nil;
  FHashSize := 0;
  FCount := 0;
end;

function TSparseInt64Array.IsEqual(const V: TObject): Boolean;
var I, J : Integer;
    F, G : Integer;
    P, Q : PSparseInt64Record;
begin
  if V is TSparseInt64Array then
    begin
      if FCount <> TSparseInt64Array(V).FCount then
        begin
          Result := False;
          exit;
        end;
      for I := 0 to Length(FHashList) - 1 do
        for J := 0 to Length(FHashList[I]) - 1 do
          begin
            Q := @FHashList[I][J];
            P := TSparseInt64Array(V).LocateItemRecord(Q^.Idx, F, G);
            if not Assigned(P) or (P^.Value <> Q^.Value) then
              begin
                Result := False;
                exit;
              end;
          end;
      Result := True;
    end
  else
    Result := inherited IsEqual(V);
end;

function TSparseInt64Array.LocateItemRecord(const Idx: Integer;
    var LookupIdx, ChainIdx: Integer): PSparseInt64Record;
var H, I, J, L : Integer;
    P : TSparseInt64RecordArray;
begin
  I := FHashSize;
  if (I = 0) or (FCount = 0) then
    begin
      LookupIdx := -1;
      ChainIdx := -1;
      Result := nil;
      exit;
    end;
  H := Integer(HashInteger(Idx) and (I - 1));
  LookupIdx := H;
  P := FHashList[H];
  L := Length(P);
  if L > 0 then
    begin
      Result := @P[0];
      J := Idx;
      for I := 0 to L - 1 do
        if Result^.Idx = J then
          begin
            ChainIdx := I;
            exit;
          end
        else
          Inc(Result);
    end;
  Result := nil;
  ChainIdx := -1;
end;

procedure TSparseInt64Array.Rehash;
var I, J, R, F, H : Integer;
    N    : TSparseInt64ArrayHashList;
    P, Q : PSparseInt64Record;
begin
  R := SparseArrayRehashSize(FCount);
  SetLength(N, R);
  for I := 0 to Length(FHashList) - 1 do
    for J := 0 to Length(FHashList[I]) - 1 do
      begin
        P := @FHashList[I][J];
        H := Integer(HashInteger(P^.Idx) and (R - 1));
        F := Length(N[H]);
        SetLength(N[H], F + 1);
        Q := @N[H][F];
        Q^.Idx := P^.Idx;
        Q^.Value := P^.Value;
      end;
  FHashList := N;
  FHashSize := R;
end;

function TSparseInt64Array.GetCount: Integer;
begin
  Result := FCount;
end;

function TSparseInt64Array.GetItem(const Idx: Integer): Int64;
var P    : PSparseInt64Record;
    I, J : Integer;
begin
  P := LocateItemRecord(Idx, I, J);
  if not Assigned(P) then
    IndexError(ESparseInt64Array);
  Result := P^.Value;
end;

function TSparseInt64Array.LocateItem(const Idx: Integer; var Value: Int64): Boolean;
var P    : PSparseInt64Record;
    I, J : Integer;
begin
  P := LocateItemRecord(Idx, I, J);
  if Assigned(P) then
    begin
      Value := P^.Value;
      Result := True;
    end
  else
    begin
      Value := 0;
      Result := False;
    end;
end;

procedure TSparseInt64Array.SetItem(const Idx: Integer; const Value: Int64);
var P    : PSparseInt64Record;
    I, J : Integer;
    L    : Integer;
begin
  P := LocateItemRecord(Idx, I, J);
  if Assigned(P) then
    P^.Value := Value
  else
    begin
      L := FHashSize;
      if L = 0 then
        begin
          Rehash;
          L := FHashSize;
          Assert(L > 0);
        end;
      I := Integer(HashInteger(Idx) and (L - 1));
      J := Length(FHashList[I]);
      SetLength(FHashList[I], J + 1);
      P := @FHashList[I][J];
      P^.Idx := Idx;
      P^.Value := Value;
      Inc(FCount);
      if (FCount + 1) div SparseArrayAverageHashChainSize > L then
        Rehash;
    end;
end;

function TSparseInt64Array.HasItem(const Idx: Integer): Boolean;
var I, J : Integer;
begin
  Result := Assigned(LocateItemRecord(Idx, I, J));
end;

function TSparseInt64Array.IsEmpty: Boolean;
begin
  Result := FCount = 0;
end;

function TSparseInt64Array.FindFirst(var Idx: Integer; var Value: Int64): Boolean;
var I : Integer;
    P : PSparseInt64Record;
begin
  for I := 0 to Length(FHashList) - 1 do
    if Length(FHashList[I]) > 0 then
      begin
        P := @FHashList[I][0];
        Idx := P^.Idx;
        Value := P^.Value;
        Result := True;
        exit;
      end;
  Idx := -1;
  Value := 0;
  Result := False;
end;

function TSparseInt64Array.FindNext(var Idx: Integer; var Value: Int64): Boolean;
var P : PSparseInt64Record;
    I, J, L : Integer;
begin
  P := LocateItemRecord(Idx, I, J);
  if not Assigned(P) then
    IndexError(ESparseInt64Array);
  Inc(J);
  if J >= Length(FHashList[I]) then
    begin
      J := 0;
      L := Length(FHashList);
      Inc(I);
      while I < L do
        if Length(FHashList[I]) > 0 then
          break
        else
          Inc(I);
      if I >= L then
        begin
          Idx := -1;
          Value := 0;
          Result := False;
          exit;
        end;
    end;
  P := @FHashList[I][J];
  Idx := P^.Idx;
  Value := P^.Value;
  Result := True;
end;

procedure TSparseInt64Array.Delete(const Idx: Integer);
var P    : PSparseInt64Record;
    I, J : Integer;
    L    : Integer;
begin
  P := LocateItemRecord(Idx, I, J);
  if not Assigned(P) then
    IndexError(ESparseInt64Array);
  L := Length(FHashList[I]);
  if J < L - 1 then
    Move(FHashList[I][J + 1], FHashList[I][J], (L - J - 1) * Sizeof(TSparseInt64Record));
  SetLength(FHashList[I], L - 1);
  Dec(FCount);
end;



{                                                                              }
{ TSparseExtendedArray                                                         }
{                                                                              }
procedure TSparseExtendedArray.Assign(const Source: TObject);
var I, L : Integer;
begin
  if Source is TSparseExtendedArray then
    begin
      Clear;
      L := Length(TSparseExtendedArray(Source).FHashList);
      SetLength(FHashList, L);
      for I := 0 to L - 1 do
        FHashList[I] := Copy(TSparseExtendedArray(Source).FHashList[I]);
      FHashSize := TSparseExtendedArray(Source).FHashSize;
      FCount := TSparseExtendedArray(Source).FCount;
    end
  else
    inherited Assign(Source);
end;

procedure TSparseExtendedArray.Clear;
begin
  FHashList := nil;
  FHashSize := 0;
  FCount := 0;
end;

function TSparseExtendedArray.IsEqual(const V: TObject): Boolean;
var I, J : Integer;
    F, G : Integer;
    P, Q : PSparseExtendedRecord;
begin
  if V is TSparseExtendedArray then
    begin
      if FCount <> TSparseExtendedArray(V).FCount then
        begin
          Result := False;
          exit;
        end;
      for I := 0 to Length(FHashList) - 1 do
        for J := 0 to Length(FHashList[I]) - 1 do
          begin
            Q := @FHashList[I][J];
            P := TSparseExtendedArray(V).LocateItemRecord(Q^.Idx, F, G);
            if not Assigned(P) or (P^.Value <> Q^.Value) then
              begin
                Result := False;
                exit;
              end;
          end;
      Result := True;
    end
  else
    Result := inherited IsEqual(V);
end;

function TSparseExtendedArray.LocateItemRecord(const Idx: Integer;
    var LookupIdx, ChainIdx: Integer): PSparseExtendedRecord;
var H, I, J, L : Integer;
    P : TSparseExtendedRecordArray;
begin
  I := FHashSize;
  if (I = 0) or (FCount = 0) then
    begin
      LookupIdx := -1;
      ChainIdx := -1;
      Result := nil;
      exit;
    end;
  H := Integer(HashInteger(Idx) and (I - 1));
  LookupIdx := H;
  P := FHashList[H];
  L := Length(P);
  if L > 0 then
    begin
      Result := @P[0];
      J := Idx;
      for I := 0 to L - 1 do
        if Result^.Idx = J then
          begin
            ChainIdx := I;
            exit;
          end
        else
          Inc(Result);
    end;
  Result := nil;
  ChainIdx := -1;
end;

procedure TSparseExtendedArray.Rehash;
var I, J, R, F, H : Integer;
    N    : TSparseExtendedArrayHashList;
    P, Q : PSparseExtendedRecord;
begin
  R := SparseArrayRehashSize(FCount);
  SetLength(N, R);
  for I := 0 to Length(FHashList) - 1 do
    for J := 0 to Length(FHashList[I]) - 1 do
      begin
        P := @FHashList[I][J];
        H := Integer(HashInteger(P^.Idx) and (R - 1));
        F := Length(N[H]);
        SetLength(N[H], F + 1);
        Q := @N[H][F];
        Q^.Idx := P^.Idx;
        Q^.Value := P^.Value;
      end;
  FHashList := N;
  FHashSize := R;
end;

function TSparseExtendedArray.GetCount: Integer;
begin
  Result := FCount;
end;

function TSparseExtendedArray.GetItem(const Idx: Integer): Extended;
var P    : PSparseExtendedRecord;
    I, J : Integer;
begin
  P := LocateItemRecord(Idx, I, J);
  if not Assigned(P) then
    IndexError(ESparseExtendedArray);
  Result := P^.Value;
end;

function TSparseExtendedArray.LocateItem(const Idx: Integer; var Value: Extended): Boolean;
var P    : PSparseExtendedRecord;
    I, J : Integer;
begin
  P := LocateItemRecord(Idx, I, J);
  if Assigned(P) then
    begin
      Value := P^.Value;
      Result := True;
    end
  else
    begin
      Value := 0.0;
      Result := False;
    end;
end;

procedure TSparseExtendedArray.SetItem(const Idx: Integer; const Value: Extended);
var P    : PSparseExtendedRecord;
    I, J : Integer;
    L    : Integer;
begin
  P := LocateItemRecord(Idx, I, J);
  if Assigned(P) then
    P^.Value := Value
  else
    begin
      L := FHashSize;
      if L = 0 then
        begin
          Rehash;
          L := FHashSize;
          Assert(L > 0);
        end;
      I := Integer(HashInteger(Idx) and (L - 1));
      J := Length(FHashList[I]);
      SetLength(FHashList[I], J + 1);
      P := @FHashList[I][J];
      P^.Idx := Idx;
      P^.Value := Value;
      Inc(FCount);
      if (FCount + 1) div SparseArrayAverageHashChainSize > L then
        Rehash;
    end;
end;

function TSparseExtendedArray.HasItem(const Idx: Integer): Boolean;
var I, J : Integer;
begin
  Result := Assigned(LocateItemRecord(Idx, I, J));
end;

function TSparseExtendedArray.IsEmpty: Boolean;
begin
  Result := FCount = 0;
end;

function TSparseExtendedArray.FindFirst(var Idx: Integer; var Value: Extended): Boolean;
var I : Integer;
    P : PSparseExtendedRecord;
begin
  for I := 0 to Length(FHashList) - 1 do
    if Length(FHashList[I]) > 0 then
      begin
        P := @FHashList[I][0];
        Idx := P^.Idx;
        Value := P^.Value;
        Result := True;
        exit;
      end;
  Idx := -1;
  Value := 0.0;
  Result := False;
end;

function TSparseExtendedArray.FindNext(var Idx: Integer; var Value: Extended): Boolean;
var P : PSparseExtendedRecord;
    I, J, L : Integer;
begin
  P := LocateItemRecord(Idx, I, J);
  if not Assigned(P) then
    IndexError(ESparseExtendedArray);
  Inc(J);
  if J >= Length(FHashList[I]) then
    begin
      J := 0;
      L := Length(FHashList);
      Inc(I);
      while I < L do
        if Length(FHashList[I]) > 0 then
          break
        else
          Inc(I);
      if I >= L then
        begin
          Idx := -1;
          Value := 0.0;
          Result := False;
          exit;
        end;
    end;
  P := @FHashList[I][J];
  Idx := P^.Idx;
  Value := P^.Value;
  Result := True;
end;

procedure TSparseExtendedArray.Delete(const Idx: Integer);
var P    : PSparseExtendedRecord;
    I, J : Integer;
    L    : Integer;
begin
  P := LocateItemRecord(Idx, I, J);
  if not Assigned(P) then
    IndexError(ESparseExtendedArray);
  L := Length(FHashList[I]);
  if J < L - 1 then
    Move(FHashList[I][J + 1], FHashList[I][J], (L - J - 1) * Sizeof(TSparseExtendedRecord));
  SetLength(FHashList[I], L - 1);
  Dec(FCount);
end;



{                                                                              }
{ TSparseObjectArray                                                           }
{                                                                              }
constructor TSparseObjectArray.Create(const IsItemOwner: Boolean);
begin
  inherited Create;
  FIsItemOwner := IsItemOwner;
end;

destructor TSparseObjectArray.Destroy;
begin
  Clear;
  inherited Destroy;
end;

procedure TSparseObjectArray.Init;
begin
  inherited Init;
  FIsItemOwner := False;
end;

procedure TSparseObjectArray.Assign(const Source: TObject);
var I, L : Integer;
begin
  if Source is TSparseObjectArray then
    begin
      Clear;
      L := Length(TSparseObjectArray(Source).FHashList);
      SetLength(FHashList, L);
      for I := 0 to L - 1 do
        FHashList[I] := Copy(TSparseObjectArray(Source).FHashList[I]);
      FHashSize := TSparseObjectArray(Source).FHashSize;
      FCount := TSparseObjectArray(Source).FCount;
      FIsItemOwner := False;
    end
  else
    inherited Assign(Source);
end;

procedure TSparseObjectArray.Clear;
var I, J : Integer;
begin
  if FIsItemOwner then
    for I := 0 to Length(FHashList) - 1 do
      for J := 0 to Length(FHashList[I]) - 1 do
        FreeAndNil(FHashList[I][J].Value);
  FHashList := nil;
  FHashSize := 0;
  FCount := 0;
end;

function TSparseObjectArray.IsEqual(const V: TObject): Boolean;
var I, J : Integer;
    F, G : Integer;
    P, Q : PSparseObjectRecord;
begin
  if V is TSparseObjectArray then
    begin
      if FCount <> TSparseObjectArray(V).FCount then
        begin
          Result := False;
          exit;
        end;
      for I := 0 to Length(FHashList) - 1 do
        for J := 0 to Length(FHashList[I]) - 1 do
          begin
            Q := @FHashList[I][J];
            P := TSparseObjectArray(V).LocateItemRecord(Q^.Idx, F, G);
            if not Assigned(P) or (P^.Value <> Q^.Value) then
              begin
                Result := False;
                exit;
              end;
          end;
      Result := True;
    end
  else
    Result := inherited IsEqual(V);
end;

function TSparseObjectArray.LocateItemRecord(const Idx: Integer;
    var LookupIdx, ChainIdx: Integer): PSparseObjectRecord;
var H, I, J, L : Integer;
    P : TSparseObjectRecordArray;
begin
  I := FHashSize;
  if (I = 0) or (FCount = 0) then
    begin
      LookupIdx := -1;
      ChainIdx := -1;
      Result := nil;
      exit;
    end;
  H := Integer(HashInteger(Idx) and (I - 1));
  LookupIdx := H;
  P := FHashList[H];
  L := Length(P);
  if L > 0 then
    begin
      Result := @P[0];
      J := Idx;
      for I := 0 to L - 1 do
        if Result^.Idx = J then
          begin
            ChainIdx := I;
            exit;
          end
        else
          Inc(Result);
    end;
  Result := nil;
  ChainIdx := -1;
end;

procedure TSparseObjectArray.Rehash;
var I, J, R, F, H : Integer;
    N    : TSparseObjectArrayHashList;
    P, Q : PSparseObjectRecord;
begin
  R := SparseArrayRehashSize(FCount);
  SetLength(N, R);
  for I := 0 to Length(FHashList) - 1 do
    for J := 0 to Length(FHashList[I]) - 1 do
      begin
        P := @FHashList[I][J];
        H := Integer(HashInteger(P^.Idx) and (R - 1));
        F := Length(N[H]);
        SetLength(N[H], F + 1);
        Q := @N[H][F];
        Q^.Idx := P^.Idx;
        Q^.Value := P^.Value;
      end;
  FHashList := N;
  FHashSize := R;
end;

function TSparseObjectArray.GetCount: Integer;
begin
  Result := FCount;
end;

function TSparseObjectArray.GetItem(const Idx: Integer): TObject;
var P    : PSparseObjectRecord;
    I, J : Integer;
begin
  P := LocateItemRecord(Idx, I, J);
  if not Assigned(P) then
    IndexError(ESparseObjectArray);
  Result := P^.Value;
end;

function TSparseObjectArray.LocateItem(const Idx: Integer; var Value: TObject): Boolean;
var P    : PSparseObjectRecord;
    I, J : Integer;
begin
  P := LocateItemRecord(Idx, I, J);
  if Assigned(P) then
    begin
      Value := P^.Value;
      Result := True;
    end
  else
    begin
      Value := nil;
      Result := False;
    end;
end;

procedure TSparseObjectArray.SetItem(const Idx: Integer; const Value: TObject);
var P    : PSparseObjectRecord;
    I, J : Integer;
    L    : Integer;
begin
  P := LocateItemRecord(Idx, I, J);
  if Assigned(P) then
    P^.Value := Value
  else
    begin
      L := FHashSize;
      if L = 0 then
        begin
          Rehash;
          L := FHashSize;
          Assert(L > 0);
        end;
      I := Integer(HashInteger(Idx) and (L - 1));
      J := Length(FHashList[I]);
      SetLength(FHashList[I], J + 1);
      P := @FHashList[I][J];
      P^.Idx := Idx;
      P^.Value := Value;
      Inc(FCount);
      if (FCount + 1) div SparseArrayAverageHashChainSize > L then
        Rehash;
    end;
end;

function TSparseObjectArray.HasItem(const Idx: Integer): Boolean;
var I, J : Integer;
begin
  Result := Assigned(LocateItemRecord(Idx, I, J));
end;

function TSparseObjectArray.IsEmpty: Boolean;
begin
  Result := FCount = 0;
end;

function TSparseObjectArray.FindFirst(var Idx: Integer; var Value: TObject): Boolean;
var I : Integer;
    P : PSparseObjectRecord;
begin
  for I := 0 to Length(FHashList) - 1 do
    if Length(FHashList[I]) > 0 then
      begin
        P := @FHashList[I][0];
        Idx := P^.Idx;
        Value := P^.Value;
        Result := True;
        exit;
      end;
  Idx := -1;
  Value := nil;
  Result := False;
end;

function TSparseObjectArray.FindNext(var Idx: Integer; var Value: TObject): Boolean;
var P : PSparseObjectRecord;
    I, J, L : Integer;
begin
  P := LocateItemRecord(Idx, I, J);
  if not Assigned(P) then
    IndexError(ESparseObjectArray);
  Inc(J);
  if J >= Length(FHashList[I]) then
    begin
      J := 0;
      L := Length(FHashList);
      Inc(I);
      while I < L do
        if Length(FHashList[I]) > 0 then
          break
        else
          Inc(I);
      if I >= L then
        begin
          Idx := -1;
          Value := nil;
          Result := False;
          exit;
        end;
    end;
  P := @FHashList[I][J];
  Idx := P^.Idx;
  Value := P^.Value;
  Result := True;
end;

procedure TSparseObjectArray.Delete(const Idx: Integer);
var P    : PSparseObjectRecord;
    I, J : Integer;
    L    : Integer;
begin
  P := LocateItemRecord(Idx, I, J);
  if not Assigned(P) then
    IndexError(ESparseObjectArray);
  if FIsItemOwner then
    FreeAndNil(P^.Value);
  L := Length(FHashList[I]);
  if J < L - 1 then
    Move(FHashList[I][J + 1], FHashList[I][J], (L - J - 1) * Sizeof(TSparseObjectRecord));
  SetLength(FHashList[I], L - 1);
  Dec(FCount);
end;

function TSparseObjectArray.ReleaseItem(const Idx: Integer): TObject;
var P    : PSparseObjectRecord;
    I, J : Integer;
begin
  P := LocateItemRecord(Idx, I, J);
  if not Assigned(P) then
    IndexError(ESparseObjectArray);
  Result := P^.Value;
  P^.Value := nil;
end;



{                                                                              }
{ TDoublyLinkedItem                                                            }
{                                                                              }
function TDoublyLinkedItem.HasNext: Boolean;
begin
  Result := Assigned(Next);
end;

function TDoublyLinkedItem.Last: TDoublyLinkedItem;
var P : TDoublyLinkedItem;
begin
  P := self;
  repeat
    Result := P;
    P := P.Next;
  until not Assigned(P);
end;

function TDoublyLinkedItem.Count: Integer;
var N : TDoublyLinkedItem;
begin
  Result := 1;
  N := FNext;
  while Assigned(N) do
    begin
      Inc(Result);
      N := N.Next;
    end;
end;

function TDoublyLinkedItem.HasPrev: Boolean;
begin
  Result := Assigned(FPrev);
end;

function TDoublyLinkedItem.First: TDoublyLinkedItem;
var P : TDoublyLinkedItem;
begin
  P := self;
  repeat
    Result := P;
    P := P.Prev;
  until not Assigned(P);
end;

procedure TDoublyLinkedItem.Delete;
begin
  Remove;
  Free;
end;

procedure TDoublyLinkedItem.Remove;
begin
  if Assigned(Next) then
    Next.Prev := FPrev;
  if Assigned(Prev) then
    Prev.Next := FNext;
end;

function TDoublyLinkedItem.RemoveNext: TDoublyLinkedItem;
begin
  Result := FNext;
  if Assigned(Result) then
    begin
      FNext := Result.Next;
      if Assigned(FNext) then
        FNext.Prev := self;
    end;
end;

procedure TDoublyLinkedItem.DeleteNext;
begin
  RemoveNext.Free;
end;

function TDoublyLinkedItem.RemovePrev: TDoublyLinkedItem;
begin
  Result := FPrev;
  if Assigned(Result) then
    begin
      FPrev := Result.Prev;
      if Assigned(FPrev) then
        FPrev.Next := self;
    end;
end;

procedure TDoublyLinkedItem.DeletePrev;
begin
  RemovePrev.Free;
end;

procedure TDoublyLinkedItem.InsertAfter(const Item: TDoublyLinkedItem);
begin
  Assert(Assigned(Item));
  Item.Next := FNext;
  Item.Prev := self;
  if Assigned(FNext) then
    FNext.Prev := Item;
  FNext := Item;
end;

procedure TDoublyLinkedItem.InsertBefore(const Item: TDoublyLinkedItem);
begin
  Assert(Assigned(Item));
  Item.Next := self;
  Item.Prev := FPrev;
  if Assigned(FPrev) then
    FPrev.Next := Item;
  FPrev := Item;
end;

destructor TDoublyLinkedItem.DestroyList;
var N : TDoublyLinkedItem;
begin
  while Assigned(FNext) do
    begin
      N := FNext;
      FNext := N.Next;
      N.Free;
    end;
  inherited Destroy;
end;



{                                                                              }
{ TDoublyLinkedInteger                                                         }
{                                                                              }
constructor TDoublyLinkedInteger.Create(const V: Integer);
begin
  inherited Create;
  Value := V;
end;

procedure TDoublyLinkedInteger.InsertAfter(const V: Integer);
begin
  inherited InsertAfter(TDoublyLinkedInteger.Create(V));
end;

procedure TDoublyLinkedInteger.InsertBefore(const V: Integer);
begin
  inherited InsertBefore(TDoublyLinkedInteger.Create(V));
end;

procedure TDoublyLinkedInteger.InsertFirst(const V: Integer);
begin
  TDoublyLinkedInteger(First).InsertBefore(V);
end;

procedure TDoublyLinkedInteger.Append(const V: Integer);
begin
  TDoublyLinkedInteger(Last).InsertAfter(V);
end;

function TDoublyLinkedInteger.FindNext(const Find: Integer): TDoublyLinkedInteger;
begin
  Result := self;
  repeat
    if Result.Value = Find then
      exit;
    Result := TDoublyLinkedInteger(Result.Next);
  until not Assigned(Result);
end;

function TDoublyLinkedInteger.FindPrev(const Find: Integer): TDoublyLinkedInteger;
begin
  Result := self;
  repeat
    if Result.Value = Find then
      exit;
    Result := TDoublyLinkedInteger(Result.Prev);
  until not Assigned(Result);
end;



{                                                                              }
{ TDoublyLinkedExtended                                                        }
{                                                                              }
constructor TDoublyLinkedExtended.Create(const V: Extended);
begin
  inherited Create;
  Value := V;
end;

procedure TDoublyLinkedExtended.InsertAfter(const V: Extended);
begin
  inherited InsertAfter(TDoublyLinkedExtended.Create(V));
end;

procedure TDoublyLinkedExtended.InsertBefore(const V: Extended);
begin
  inherited InsertBefore(TDoublyLinkedExtended.Create(V));
end;

procedure TDoublyLinkedExtended.InsertFirst(const V: Extended);
begin
  TDoublyLinkedExtended(First).InsertBefore(V);
end;

procedure TDoublyLinkedExtended.Append(const V: Extended);
begin
  TDoublyLinkedExtended(Last).InsertAfter(V);
end;

function TDoublyLinkedExtended.FindNext(const Find: Extended): TDoublyLinkedExtended;
begin
  Result := self;
  repeat
    if Result.Value = Find then
      exit;
    Result := TDoublyLinkedExtended(Result.Next);
  until not Assigned(Result);
end;

function TDoublyLinkedExtended.FindPrev(const Find: Extended): TDoublyLinkedExtended;
begin
  Result := self;
  repeat
    if Result.Value = Find then
      exit;
    Result := TDoublyLinkedExtended(Result.Prev);
  until not Assigned(Result);
end;



{                                                                              }
{ TDoublyLinkedString                                                          }
{                                                                              }
constructor TDoublyLinkedString.Create(const V: AnsiString);
begin
  inherited Create;
  Value := V;
end;

procedure TDoublyLinkedString.InsertAfter(const V: AnsiString);
begin
  inherited InsertAfter(TDoublyLinkedString.Create(V));
end;

procedure TDoublyLinkedString.InsertBefore(const V: AnsiString);
begin
  inherited InsertBefore(TDoublyLinkedString.Create(V));
end;

procedure TDoublyLinkedString.InsertFirst(const V: AnsiString);
begin
  TDoublyLinkedString(First).InsertBefore(V);
end;

procedure TDoublyLinkedString.Append(const V: AnsiString);
begin
  TDoublyLinkedString(Last).InsertAfter(V);
end;

function TDoublyLinkedString.FindNext(const Find: AnsiString): TDoublyLinkedString;
begin
  Result := self;
  repeat
    if Result.Value = Find then
      exit;
    Result := TDoublyLinkedString(Result.Next);
  until not Assigned(Result);
end;

function TDoublyLinkedString.FindPrev(const Find: AnsiString): TDoublyLinkedString;
begin
  Result := self;
  repeat
    if Result.Value = Find then
      exit;
    Result := TDoublyLinkedString(Result.Prev);
  until not Assigned(Result);
end;



{                                                                              }
{ TDoublyLinkedObject                                                          }
{                                                                              }
constructor TDoublyLinkedObject.Create(const V: TObject);
begin
  inherited Create;
  Value := V;
end;

procedure TDoublyLinkedObject.InsertAfter(const V: TObject);
begin
  inherited InsertAfter(TDoublyLinkedObject.Create(V));
end;

procedure TDoublyLinkedObject.InsertBefore(const V: TObject);
begin
  inherited InsertBefore(TDoublyLinkedObject.Create(V));
end;

procedure TDoublyLinkedObject.InsertFirst(const V: TObject);
begin
  TDoublyLinkedObject(First).InsertBefore(V);
end;

procedure TDoublyLinkedObject.Append(const V: TObject);
begin
  TDoublyLinkedObject(Last).InsertAfter(V);
end;

function TDoublyLinkedObject.FindNext(const Find: TObject): TDoublyLinkedObject;
begin
  Result := self;
  repeat
    if Result.Value = Find then
      exit;
    Result := TDoublyLinkedObject(Result.Next);
  until not Assigned(Result);
end;

function TDoublyLinkedObject.FindPrev(const Find: TObject): TDoublyLinkedObject;
begin
  Result := self;
  repeat
    if Result.Value = Find then
      exit;
    Result := TDoublyLinkedObject(Result.Prev);
  until not Assigned(Result);
end;



{                                                                              }
{ Open array to Linked list                                                    }
{                                                                              }
function AsDoublyLinkedIntegerList(const V: Array of Integer): TDoublyLinkedInteger;
var I, L : TDoublyLinkedInteger;
    F   : Integer;
begin
  Result := nil;
  L := nil;
  for F := 0 to High(V) do
    begin
      I := TDoublyLinkedInteger.Create(V [F]);
      if not Assigned(L) then
        begin
          L := I;
          Result := I;
        end else
        begin
          L.InsertAfter(I);
          L := I;
        end;
    end;
end;

function AsDoublyLinkedExtendedList(const V: Array of Extended): TDoublyLinkedExtended;
var I, L : TDoublyLinkedExtended;
    F   : Integer;
begin
  Result := nil;
  L := nil;
  for F := 0 to High(V) do
    begin
      I := TDoublyLinkedExtended.Create(V [F]);
      if not Assigned(L) then
        begin
          L := I;
          Result := I;
        end else
        begin
          L.InsertAfter(I);
          L := I;
        end;
    end;
end;

function AsDoublyLinkedStringList(const V: Array of AnsiString): TDoublyLinkedString;
var I, L : TDoublyLinkedString;
    F   : Integer;
begin
  Result := nil;
  L := nil;
  for F := 0 to High(V) do
    begin
      I := TDoublyLinkedString.Create(V [F]);
      if not Assigned(L) then
        begin
          L := I;
          Result := I;
        end else
        begin
          L.InsertAfter(I);
          L := I;
        end;
    end;
end;



{                                                                              }
{ TDoublyLinkedList                                                            }
{                                                                              }
Destructor TDoublyLinkedList.Destroy;
begin
  DeleteList;
  inherited Destroy;
end;

function TDoublyLinkedList.IsEmpty: Boolean;
begin
  Result := not Assigned(FFirst);
end;

procedure TDoublyLinkedList.Append(const Item: TDoublyLinkedItem);
begin
  if not Assigned(Item) then
    exit;
  if not Assigned(FLast) then
    begin
      FFirst := Item;
      FLast := Item;
      Item.Prev := nil;
      Item.Next := nil;
    end else
    begin
      FLast.InsertAfter(Item);
      FLast := Item;
    end;
  Inc(FCount);
end;

procedure TDoublyLinkedList.InsertFront(const Item: TDoublyLinkedItem);
begin
  if not Assigned(Item) then
    exit;
  if not Assigned(FFirst) then
    begin
      FFirst := Item;
      FLast := Item;
      Item.Prev := nil;
      Item.Next := nil;
    end else
    begin
      FFirst.InsertBefore(Item);
      FFirst := Item;
    end;
  Inc(FCount);
end;

procedure TDoublyLinkedList.Remove(const Item: TDoublyLinkedItem);
begin
  if not Assigned(Item) then
    exit;
  if FFirst = Item then
    FFirst := Item.Next;
  if FLast = Item then
    FLast := Item.Prev;
  Item.Remove;
  Dec(FCount);
end;

function TDoublyLinkedList.RemoveFirst: TDoublyLinkedItem;
var N : TDoublyLinkedItem;
begin
  Result := FFirst;
  if not Assigned(Result) then
    exit;
  if Result = FLast then
    begin
      FFirst := nil;
      FLast := nil;
    end else
    begin
      N := Result.Next;
      Result.Remove;
      FFirst := N;
    end;
  Dec(FCount);
end;

function TDoublyLinkedList.RemoveLast: TDoublyLinkedItem;
var P : TDoublyLinkedItem;
begin
  Result := FLast;
  if not Assigned(Result) then
    exit;
  if Result = FFirst then
    begin
      FFirst := nil;
      FLast := nil;
    end
  else
    begin
      P := Result.Prev;
      Result.Remove;
      FLast := P;
    end;
  Dec(FCount);
end;

procedure TDoublyLinkedList.Delete(const Item: TDoublyLinkedItem);
begin
  Remove(Item);
  Item.Free;
end;

procedure TDoublyLinkedList.DeleteFirst;
begin
  RemoveFirst.Free;
end;

procedure TDoublyLinkedList.DeleteLast;
begin
  RemoveLast.Free;
end;

procedure TDoublyLinkedList.DeleteList;
var F : TDoublyLinkedItem;
begin
  F := FFirst;
  FFirst := nil;
  FLast := nil;
  if Assigned(F) then
    F.DestroyList;
  FCount := 0;
end;



{                                                                              }
{ Self testing code                                                            }
{                                                                              }
{$ASSERTIONS ON}
procedure SelfTest_Array;
var I : Integer;
    F : TIntegerArray;
begin
  // TIntegerArray
  F := TIntegerArray.Create;
  for I := 0 to 16384 do
    Assert(F.AppendItem(I) = I, 'Array.AppendItem');
  Assert(F.Count = 16385, 'Array.Count');
  for I := 0 to 16384 do
    Assert(F[I] = I,      'Array.GetItem');
  for I := 0 to 16384 do
    F[I] := I + 1;
  for I := 0 to 16384 do
    Assert(F[I] = I + 1,  'Array.SetItem');
  F.Delete(0, 1);
  Assert(F.Count = 16384, 'Array.Delete');
  for I := 0 to 16383 do
    Assert(F[I] = I + 2,  'Array.Delete');
  F.Insert(0, 2);
  F[0] := 0;
  F[1] := 1;
  for I := 0 to 16384 do
    Assert(F[I] = I,      'Array.Insert');

  F.Count := 4;
  Assert(F.Count = 4,     'Array.SetCount');
  F[0] := 9;
  F[1] := -2;
  F[2] := 3;
  F[3] := 4;
  F.Sort;
  Assert(F[0] = -2,       'Array.Sort');
  Assert(F[1] = 3,        'Array.Sort');
  Assert(F[2] = 4,        'Array.Sort');
  Assert(F[3] = 9,        'Array.Sort');

  F.Count := 7;
  F[0] := 3;
  F[1] := 5;
  F[2] := 5;
  F[3] := 2;
  F[4] := 5;
  F[5] := 5;
  F[6] := 1;
  F.Sort;
  Assert(F[0] = 1,        'Array.Sort');
  Assert(F[1] = 2,        'Array.Sort');
  Assert(F[2] = 3,        'Array.Sort');
  Assert(F[3] = 5,        'Array.Sort');
  Assert(F[4] = 5,        'Array.Sort');
  Assert(F[5] = 5,        'Array.Sort');
  Assert(F[6] = 5,        'Array.Sort');

  F.Count := 7;
  F[0] := 1;
  F[1] := 5;
  F[2] := 5;
  F[3] := 1;
  F[4] := 5;
  F[5] := 2;
  F[6] := 1;
  F.RemoveDuplicates(False);
  Assert(F.Count = 3,     'Array.RemoveDuplicates');
  Assert(F[0] = 1,        'Array.RemoveDuplicates');
  Assert(F[1] = 5,        'Array.RemoveDuplicates');
  Assert(F[2] = 2,        'Array.RemoveDuplicates');

  F.Count := 7;
  F[0] := 1;
  F[1] := 1;
  F[2] := 1;
  F[3] := 2;
  F[4] := 5;
  F[5] := 5;
  F[6] := 5;
  F.RemoveDuplicates(True);
  Assert(F.Count = 3,     'Array.RemoveDuplicates');
  Assert(F[0] = 1,        'Array.RemoveDuplicates');
  Assert(F[1] = 2,        'Array.RemoveDuplicates');
  Assert(F[2] = 5,        'Array.RemoveDuplicates');

  F.Clear;
  Assert(F.Count = 0,     'Array.Clear');
  F.Free;
end;

procedure SelfTest_Dictionary;
var F : TIntegerDictionary;
    G : TStringDictionary;
    I : Integer;
begin
  F := TIntegerDictionary.Create;
  for I := 0 to 16384 do
    F.Add(IntToStr(I), I);
  Assert(F.Count = 16385, 'Dictionary.Count');
  for I := 0 to 16384 do
    Assert(F.GetKeyByIndex(I) = IntToStr(I), 'Dictionary.GetKeyByIndex');
  for I := 0 to 16384 do
    Assert(F[IntToStr(I)] = I, 'Dictionary.GetItem');
  Assert(F['0'] = 0, 'Dictionary.GetItem');
  Assert(F['4001'] = 4001, 'Dictionary.GetItem');
  Assert(F['16384'] = 16384, 'Dictionary.GetItem');
  for I := 0 to 16384 do
    Assert(F.GetItemByIndex(I) = I, 'Dictionary.GetItemByIndex');
  Assert(F.HasKey('5'), 'Dictionary.HasKey');
  Assert(not F.HasKey('X'), 'Dictionary.HasKey');
  F.Rename('5', 'X');
  Assert(not F.HasKey('5'), 'Dictionary.Rename');
  Assert(F.HasKey('X'), 'Dictionary.Rename');
  Assert(F['X'] = 5, 'Dictionary.Rename');
  F.Delete('X');
  Assert(not F.HasKey('X'), 'Dictionary.Delete');
  Assert(F.Count = 16384, 'Dictionary.Delete');
  F.Delete('0');
  Assert(not F.HasKey('0'), 'Dictionary.Delete');
  Assert(F.Count = 16383, 'Dictionary.Delete');
  F.DeleteItemByIndex(0);
  Assert(not F.HasKey('1'), 'Dictionary.DeleteItemByIndex');
  Assert(F.Count = 16382, 'Dictionary.DeleteItemByIndex');
  F.Free;

  G := TStringDictionary.Create;
  for I := 0 to 16384 do
    G.Add(IntToStr(I), IntToStr(I));
  Assert(G.Count = 16385, 'Dictionary.Count');
  for I := 0 to 16384 do
    Assert(G.GetKeyByIndex(I) = IntToStr(I), 'Dictionary.GetKeyByIndex');
  Assert(G['0'] = '0', 'Dictionary.GetItem');
  Assert(G['5'] = '5', 'Dictionary.GetItem');
  Assert(G['16384'] = '16384', 'Dictionary.GetItem');
  for I := 0 to 16384 do
    Assert(G.GetItemByIndex(I) = IntToStr(I), 'Dictionary.GetItemByIndex');
  Assert(G.HasKey('5'), 'Dictionary.HasKey');
  Assert(not G.HasKey('X'), 'Dictionary.HasKey');
  G.Rename('5', 'X');
  Assert(not G.HasKey('5'), 'Dictionary.Rename');
  Assert(G.HasKey('X'), 'Dictionary.Rename');
  Assert(G['X'] = '5', 'Dictionary.Rename');
  G.Delete('X');
  Assert(not G.HasKey('X'), 'Dictionary.Delete');
  Assert(G.Count = 16384, 'Dictionary.Delete');
  G.Delete('0');
  Assert(not G.HasKey('0'), 'Dictionary.Delete');
  Assert(G.Count = 16383, 'Dictionary.Delete');
  G.DeleteItemByIndex(0);
  Assert(not G.HasKey('1'), 'Dictionary.DeleteItemByIndex');
  Assert(G.Count = 16382, 'Dictionary.DeleteItemByIndex');
  G.Free;
end;

procedure SelfTest_SparseArray;
var A, D : TSparseObjectArray;
    B : Array[0..2] of TObject;
    I, J : Integer;
    V : TObject;
    S, T : TSparseStringArray;
begin
  B[0] := TObject.Create;
  B[1] := TObject.Create;
  B[2] := TObject.Create;
  A := TSparseObjectArray.Create;
  try
    Assert(A.Count = 0);
    Assert(A.IsEmpty);
    Assert(not A.FindFirst(I, V));
    Assert(A.IsEqual(A));
    Assert(not A.LocateItem(0, V));
    Assert(not Assigned(V));
    A[100] := B[0];
    Assert(A.Count = 1);
    Assert(not A.IsEmpty);
    Assert(A[100] = B[0]);
    Assert(not A.LocateItem(0, V));
    Assert(A.LocateItem(100, V));
    Assert(V = B[0]);
    Assert(not A.HasItem(1000));
    A[1000] := B[1];
    Assert(A.HasItem(1000));
    Assert(A.Count = 2);
    Assert(A[1000] = B[1]);
    A[-50000] := B[2];
    Assert(A.Count = 3);
    Assert(A[100] = B[0]);
    Assert(A[1000] = B[1]);
    Assert(A[-50000] = B[2]);
    Assert(A.IsEqual(A));
    A[100] := B[1];
    Assert(A[100] = B[1]);
    A.Delete(1000);
    Assert(A.Count = 2);
    Assert(not A.HasItem(1000));
    Assert(A.FindFirst(I, V));
    Assert((I = 100) or (I = -50000));
    J := I;
    Assert(A.FindNext(I, V));
    Assert(((I = 100) or (I = -50000)) and (I <> J));
    Assert(not A.FindNext(I, V));
    A.Clear;
    Assert(A.Count = 0);
    Assert(A.IsEmpty);
    Assert(not A.FindFirst(I, V));

    A[0] := B[0];
    A[-10] := B[1];
    A[20] := B[2];
    Assert(A.Count = 3);
    Assert((A[0] = B[0]) and (A[-10] = B[1]) and (A[20] = B[2]));
    D := A.Duplicate as TSparseObjectArray;
    Assert(D.Count = 3);
    Assert((D[0] = B[0]) and (D[-10] = B[1]) and (D[20] = B[2]));
    Assert(A.IsEqual(D));
    Assert(D.IsEqual(A));
    D[0] := B[1];
    Assert(not A.IsEqual(D));
    Assert(not D.IsEqual(A));
    D[1] := B[1];
    Assert(not A.IsEqual(D));
    Assert(D.Count = 4);
    Assert((D[0] = B[1]) and (D[1] = B[1]));
    Assert(A.Count = 3);
    Assert((A[0] = B[0]) and (A[-10] = B[1]) and (A[20] = B[2]));
    Assert(not A.HasItem(1));
    D.Delete(1);
    Assert(D.Count = 3);
    Assert(not D.HasItem(1));
    D[0] := B[0];
    Assert(D.IsEqual(A));
    D.Free;
    Assert((A[0] = B[0]) and (A[-10] = B[1]) and (A[20] = B[2]));
  finally
    A.Free;
    B[2].Free;
    B[1].Free;
    B[0].Free;
  end;

  S := TSparseStringArray.Create;
  T := TSparseStringArray.Create;
  try
    Assert(S.IsEmpty);
    Assert(S.Count = 0);
    Assert(S.IsEqual(T));
    for I := 1 to 1000 do
      begin
        S[I * 3] := IntToStr(I);
        T[I] := IntToStr(I);
        Assert(S.HasItem(I * 3));
        Assert(not S.HasItem(I * 3 + 1));
      end;
    Assert(S.Count = 1000);
    Assert(T.Count = 1000);
    for I := 1 to 1000 do
      begin
        Assert(S[I * 3] = IntToStr(I));
        Assert(T[I] = IntToStr(I));
      end;
    for I := 1 to 1000 do
      begin
        S[I * 3] := IntToStr(I + 1);
        S[I * 3 - 1] := IntToStr(I);
        T[1000 + I * 2] := IntToStr(I);
      end;
    Assert(S.Count = 2000);
    Assert(T.Count = 2000);
    for I := 1 to 1000 do
      begin
        Assert(S[I * 3] = IntToStr(I + 1));
        Assert(S[I * 3 - 1] = IntToStr(I));
        Assert(T[I] = IntToStr(I));
        Assert(T[1000 + I * 2] = IntToStr(I));
      end;
    Assert(not S.IsEqual(T));
    S.Clear;
    Assert(S.Count = 0);
  finally
    FreeAndNil(T);
    FreeAndNil(S);
  end;
end;

procedure SelfTest_HashedStringArray;
var A : THashedAnsiStringArray;
begin
  A := THashedAnsiStringArray.Create(True);
  try
    A.AppendItem('abc');
    Assert(A.Count = 1);
    A.Clear;
    Assert(A.Count = 0);
    A.AppendItem('def');
    Assert(A.Count = 1);
  finally
    A.Free;
  end;
  //
  A := THashedAnsiStringArray.Create(False);
  try
    A.AppendItem('123');
    A.AppendItem('267');
    A.AppendItem('328');
    A.AppendItem('423');
    A.AppendItem('523a');
    Assert(A.PosNext('123') = 0);
    Assert(A.PosNext('423') = 3);
    A.Delete(0);
    Assert(A.PosNext('123') = -1);
    Assert(A.PosNext('423') = 2);
  finally
    A.Free;
  end;
end;

procedure SelfTest;
begin
  SelfTest_Array;
  SelfTest_Dictionary;
  SelfTest_SparseArray;
  SelfTest_HashedStringArray;
end;



end.

