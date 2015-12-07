{******************************************************************************}
{                                                                              }
{   Library:          Fundamentals 4.00                                        }
{   File name:        cTimers.pas                                              }
{   File version:     4.08                                                     }
{   Description:      Timer functions                                          }
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
{   1999/11/10  0.01  Initial version.                                         }
{   2005/08/19  4.02  Compilable with FreePascal 2.0.1                         }
{   2005/08/26  4.03  Improvements to timer functions.                         }
{   2005/08/27  4.04  Revised for Fundamentals 4.                              }
{   2007/06/08  4.05  Compilable with FreePascal 2.04 Win32 i386               }
{   2009/10/09  4.06  Compilable with Delphi 2009 Win32/.NET.                  }
{   2010/06/27  4.07  Compilable with FreePascal 2.4.0 OSX x86-64              }
{   2011/05/04  4.08  Split from cDateTime unit.                               }
{                                                                              }
{ Supported compilers:                                                         }
{                                                                              }
{   Delphi 5/6/7/2005/2006/2007 Win32 i386                                     }
{   Delphi 2009 .NET                                                           }
{   FreePascal 2.0.1 Win32 i386                                                }
{   FreePascal 2.0.1 Linux i386                                                }
{   FreePascal 2.4.0 OSX x86-64                                                }
{                                                                              }
{******************************************************************************}

{$INCLUDE cDefines.inc}

unit cTimers;

interface

uses
  { System }
  SysUtils;



{                                                                              }
{ Errors                                                                       }
{                                                                              }
type
  ETimers = class(Exception);



{                                                                              }
{ Tick timer                                                                   }
{                                                                              }
{   The tick timer returns millisecond units.                                  }
{   On some systems the tick is only accurate to 10-20ms.                      }
{                                                                              }
const
  TickFrequency = 1000;

function  GetTick: LongWord;
function  TickDelta(const D1, D2: LongWord): Integer;
function  TickDeltaW(const D1, D2: LongWord): LongWord;



{                                                                              }
{ High-precision timer                                                         }
{                                                                              }
{   StartTimer returns an encoded time (running timer).                        }
{   StopTimer returns an encoded elapsed time (stopped timer).                 }
{   ResumeTimer returns an encoded time (running timer), given an encoded      }
{     elapsed time (stopped timer).                                            }
{   StoppedTimer returns an encoded elapsed time of zero, ie a stopped timer   }
{     with no time elapsed.                                                    }
{   MillisecondsElapsed returns elapsed time for a timer in milliseconds.      }
{   MicrosecondsElapsed returns elapsed time for a timer in microseconds.      }
{   DelayMicroSeconds goes into a tight loop for the specified duration. It    }
{     should be used where short and accurate delays are required.             }
{   GetHighPrecisionFrequency returns the resolution of the high-precision     }
{     timer in units per second.                                               }
{   GetHighPrecisionTimerOverhead calculates the overhead associated with      }
{     calling both StartTimer and StopTimer. Use this value as Overhead when   }
{     calling AdjustTimerForOverhead.                                          }
{                                                                              }
type
  THPTimer = Int64;

procedure StartTimer(var Timer: THPTimer);
procedure StopTimer(var Timer: THPTimer);
procedure ResumeTimer(var StoppedTimer: THPTimer);

procedure InitStoppedTimer(var Timer: THPTimer);
procedure InitElapsedTimer(var Timer: THPTimer; const Milliseconds: Integer);

function  MillisecondsElapsed(const Timer: THPTimer;
          const TimerRunning: Boolean = True): Integer;
function  MicrosecondsElapsed(const Timer: THPTimer;
          const TimerRunning: Boolean = True): Int64;

procedure WaitMicroseconds(const MicroSeconds: Integer);

function  GetHighPrecisionFrequency: Int64;
function  GetHighPrecisionTimerOverhead: Int64;
procedure AdjustTimerForOverhead(var StoppedTimer: THPTimer;
          const Overhead: Int64 = 0);



{                                                                              }
{ Test cases                                                                   }
{                                                                              }
{$IFDEF DEBUG}{$IFDEF SELFTEST}
procedure SelfTest;
{$ENDIF}{$ENDIF}



implementation

{$IFDEF WindowsPlatform}
uses
  Windows;
{$ENDIF}
{$IFDEF OS_UNIX}
  {$IFDEF FREEPASCAL}
uses
  BaseUnix,
  Unix;
  {$ENDIF}
{$ENDIF}



{                                                                              }
{ Tick timer                                                                   }
{                                                                              }
{$IFDEF WindowsPlatform}
function GetTick: LongWord;
begin
  Result := GetTickCount;
end;
{$ELSE}
{$IFDEF UNIX}
function GetTick: LongWord;
begin
  Result := LongWord(DateTimeToTimeStamp(Now).Time);
end;
{$ENDIF}{$ENDIF}

{$IFOPT Q+}{$DEFINE QOn}{$ELSE}{$UNDEF QOn}{$ENDIF}{$Q-}
function TickDelta(const D1, D2: LongWord): Integer;
begin
  Result := Integer(D2 - D1);
end;

function TickDeltaW(const D1, D2: LongWord): LongWord;
begin
  Result := LongWord(D2 - D1);
end;
{$IFDEF QOn}{$Q+}{$ENDIF}



{                                                                              }
{ High-precision timing                                                        }
{                                                                              }
const
  SHighResTimerNotAvailable = 'High resolution timer not available';
  
{$IFDEF WindowsPlatform}
{$DEFINE Defined_GetHighPrecisionCounter}
var
  HighPrecisionTimerInit         : Boolean = False;
  HighPrecisionMillisecondFactor : Int64;
  HighPrecisionMicrosecondFactor : Int64;

function CPUClockFrequency: Int64;
begin
  if not QueryPerformanceFrequency(Result) then
    raise ETimers.Create(SHighResTimerNotAvailable);
end;

procedure InitHighPrecisionTimer;
var F : Int64;
begin
  F := CPUClockFrequency;
  HighPrecisionMillisecondFactor := F div 1000;
  HighPrecisionMicrosecondFactor := F div 1000000;
  HighPrecisionTimerInit := True;
end;

function GetHighPrecisionCounter: Int64;
begin
  if not HighPrecisionTimerInit then
    InitHighPrecisionTimer;
  QueryPerformanceCounter(Result);
end;
{$ENDIF}

{$IFDEF UNIX}
{$DEFINE Defined_GetHighPrecisionCounter}
{$IFDEF FREEPASCAL}
const
  HighPrecisionMillisecondFactor = 1000;
  HighPrecisionMicrosecondFactor = 1;

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

{$IFNDEF Defined_GetHighPrecisionCounter}
{$IFDEF CPU_386}
{$DEFINE Defined_GetHighPrecisionCounter}
function GetHighPrecisionCounter: Int64;
asm
  rdtsc
end;
{$ENDIF}
{$ENDIF}

{$IFNDEF Defined_GetHighPrecisionCounter}
function GetHighPrecisionCounter: Int64;
begin
  raise ETimers.Create(SHighResTimerNotAvailable);
end;
{$ENDIF}

procedure StartTimer(var Timer: THPTimer);
begin
  Timer := GetHighPrecisionCounter;
end;

{$IFOPT Q+}{$DEFINE QOn}{$ELSE}{$UNDEF QOn}{$ENDIF}{$Q-}
procedure StopTimer(var Timer: THPTimer);
begin
  Timer := Int64(GetHighPrecisionCounter - Timer);
end;
{$IFDEF QOn}{$Q+}{$ENDIF}

{$IFOPT Q+}{$DEFINE QOn}{$ELSE}{$UNDEF QOn}{$ENDIF}{$Q-}
procedure ResumeTimer(var StoppedTimer: THPTimer);
var T : THPTimer;
begin
  StartTimer(T);
  {$IFDEF DELPHI5}
  StoppedTimer := T - StoppedTimer;
  {$ELSE}
  StoppedTimer := Int64(T - StoppedTimer);
  {$ENDIF}
end;
{$IFDEF QOn}{$Q+}{$ENDIF}

procedure InitStoppedTimer(var Timer: THPTimer);
begin
  Timer := 0;
end;

{$IFOPT Q+}{$DEFINE QOn}{$ELSE}{$UNDEF QOn}{$ENDIF}{$Q-}
procedure InitElapsedTimer(var Timer: THPTimer; const Milliseconds: Integer);
begin
  {$IFDEF DELPHI5}
  Timer := GetHighPrecisionCounter - (Milliseconds * HighPrecisionMillisecondFactor);
  {$ELSE}
  Timer := Int64(GetHighPrecisionCounter - (Milliseconds * HighPrecisionMillisecondFactor));
  {$ENDIF}
end;
{$IFDEF QOn}{$Q+}{$ENDIF}

{$IFOPT Q+}{$DEFINE QOn}{$ELSE}{$UNDEF QOn}{$ENDIF}{$Q-}
function MillisecondsElapsed(const Timer: THPTimer; const TimerRunning: Boolean = True): Integer;
begin
  if not TimerRunning then
    Result := Timer div HighPrecisionMillisecondFactor
  else
    {$IFDEF DELPHI5}
    Result := Integer((GetHighPrecisionCounter - Timer) div HighPrecisionMillisecondFactor);
    {$ELSE}
    Result := Integer(Int64(GetHighPrecisionCounter - Timer) div HighPrecisionMillisecondFactor);
    {$ENDIF}
end;
{$IFDEF QOn}{$Q+}{$ENDIF}

{$IFDEF WindowsPlatform}
{$IFOPT Q+}{$DEFINE QOn}{$ELSE}{$UNDEF QOn}{$ENDIF}{$Q-}
function MicrosecondsElapsed(const Timer: THPTimer; const TimerRunning: Boolean = True): Int64;
begin
  if not TimerRunning then
    Result := Timer div HighPrecisionMicrosecondFactor
  else
    {$IFDEF DELPHI5}
    Result := Int64((GetHighPrecisionCounter - Timer) div HighPrecisionMicrosecondFactor);
    {$ELSE}
    Result := Int64(Int64(GetHighPrecisionCounter - Timer) div HighPrecisionMicrosecondFactor);
    {$ENDIF}
end;
{$IFDEF QOn}{$Q+}{$ENDIF}
{$ELSE}
{$IFDEF UNIX}
{$IFOPT Q+}{$DEFINE QOn}{$ELSE}{$UNDEF QOn}{$ENDIF}{$Q-}
function MicrosecondsElapsed(const Timer: THPTimer; const TimerRunning: Boolean = True): Int64;
begin
  if not TimerRunning then
    Result := Timer
  else
    Result := Int64(GetHighPrecisionCounter - Timer);
end;
{$IFDEF QOn}{$Q+}{$ENDIF}
{$ENDIF}{$ENDIF}

{$IFOPT Q+}{$DEFINE QOn}{$ELSE}{$UNDEF QOn}{$ENDIF}{$Q-}
{$IFDEF DELPHI5}{$IFOPT O+}{$DEFINE OOn}{$ELSE}{$UNDEF OOn}{$ENDIF}{$OPTIMIZATION OFF}{$ENDIF}
procedure WaitMicroseconds(const Microseconds: Integer);
var I, J, F : Int64;
begin
  // start high precision timer as early as possible in procedure for minimal
  // overhead
  I := GetHighPrecisionCounter;
  if Microseconds <= 0 then
    exit;
  // sleep milliseconds
  if Microseconds >= 1000 then
    Sleep(Microseconds div 1000);
  // loop remaining microseconds
  {$IFDEF DELPHI5}
  F := Microseconds * HighPrecisionMicrosecondFactor;
  {$ELSE}
  F := Int64(Microseconds * HighPrecisionMicrosecondFactor);
  {$ENDIF}
  repeat
    J := GetHighPrecisionCounter;
  {$IFDEF DELPHI5}
  until J - I >= F;
  {$ELSE}
  until Int64(J - I) >= F;
  {$ENDIF}
end;
{$IFDEF QOn}{$Q+}{$ENDIF}
{$IFDEF DELPHI5}{$IFDEF OOn}{$OPTIMIZATION ON}{$ENDIF}{$ENDIF}

{$IFDEF WindowsPlatform}
function GetHighPrecisionFrequency: Int64;
begin
  Result := CPUClockFrequency;
end;
{$ELSE}
{$IFDEF UNIX}
function GetHighPrecisionFrequency: Int64;
begin
  Result := 1000000;
end;
{$ENDIF}{$ENDIF}

function GetHighPrecisionTimerOverhead: Int64;
var T : THPTimer;
    I : Integer;
    H : Int64;
begin
  // start and stop timer a thousand times and find smallest overhead
  StartTimer(T);
  StopTimer(T);
  H := T;
  for I := 1 to 1000 do
    begin
      StartTimer(T);
      StopTimer(T);
      if T < H then
        H := T;
    end;
  Result := H;
end;

{$IFOPT Q+}{$DEFINE QOn}{$ELSE}{$UNDEF QOn}{$ENDIF}{$Q-}
{$IFDEF DELPHI5}{$IFOPT O+}{$DEFINE OOn}{$ELSE}{$UNDEF OOn}{$ENDIF}{$OPTIMIZATION OFF}{$ENDIF}
procedure AdjustTimerForOverhead(var StoppedTimer: THPTimer;
    const Overhead: Int64);
begin
  if Overhead <= 0 then
    {$IFDEF DELPHI5}
    StoppedTimer := StoppedTimer - GetHighPrecisionTimerOverhead
    {$ELSE}
    StoppedTimer := Int64(StoppedTimer - GetHighPrecisionTimerOverhead)
    {$ENDIF}
  else
    {$IFDEF DELPHI5}
    StoppedTimer := StoppedTimer - Overhead;
    {$ELSE}
    StoppedTimer := Int64(StoppedTimer - Overhead);
    {$ENDIF}
  if StoppedTimer < 0 then
    StoppedTimer :=0;
end;
{$IFDEF QOn}{$Q+}{$ENDIF}
{$IFDEF DELPHI5}{$IFDEF OOn}{$OPTIMIZATION ON}{$ENDIF}{$ENDIF}



{                                                                              }
{ Test cases                                                                   }
{                                                                              }
{$IFDEF DEBUG}{$IFDEF SELFTEST}
{$ASSERTIONS ON}{$WARNINGS OFF}
procedure SelfTest;
var A, B : LongWord;
    T : THPTimer;
begin
  Assert(TickDelta(0, 10) = 10);
  Assert(TickDelta($FFFFFFFF, 10) = 11);
  Assert(TickDelta(10, 0) = -10);
  Assert(TickDelta($FFFFFFF6, 0) = 10);
  Assert(TickDeltaW(0, 10) = 10);
  Assert(TickDeltaW($FFFFFFFF, 10) = 11);
  Assert(TickDeltaW(10, 0) = $FFFFFFF6);
  Assert(TickDeltaW($FFFFFFF6, 0) = 10);
  {$IFDEF WindowsPlatform}
  Assert(CPUClockFrequency > 0);
  {$ENDIF}
  // test timers using wait
  StartTimer(T);
  A := GetTick;
  WaitMicroseconds(30000); // 30ms
  B := GetTick;
  StopTimer(T);
  Assert(TickDelta(A, B) > 0); // sometimes fails for less than 20ms wait above under Windows
  Assert(TickDeltaW(A, B) > 0);
  Assert(TickDelta(A, B) = TickDeltaW(A, B));
  Assert(MillisecondsElapsed(T, False) >= 10);
end;
{$ENDIF}{$ENDIF}



end.

