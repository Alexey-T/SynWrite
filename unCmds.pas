unit unCmds;

interface

uses
  ATSyntMemo;

function IsCmdEditing(Cmd: integer): boolean;

const
  sm_CaretsRemoveLeaveFirst  = ATSyntMemo.smCaretsRemoveLeaveFirst;
  sm_CaretsRemoveLeaveLast   = ATSyntMemo.smCaretsRemoveLeaveLast;
  sm_CaretsFromSelLeft       = ATSyntMemo.smCaretsFromSelLeft;
  sm_CaretsFromSelRight      = ATSyntMemo.smCaretsFromSelRight;
  sm_CaretsFromSelClear      = ATSyntMemo.smCaretsFromSelClear;
  sm_CaretsFromMarksLeft     = ATSyntMemo.smCaretsFromMarksLeft;
  sm_CaretsFromMarksRight    = ATSyntMemo.smCaretsFromMarksRight;
  sm_CaretsFromMarksClear    = ATSyntMemo.smCaretsFromMarksClear;
  sm_CaretsExtendUpLine      = ATSyntMemo.smCaretsUpLine;
  sm_CaretsExtendDownLine    = ATSyntMemo.smCaretsDownLine;
  sm_CaretsExtendUpPage      = ATSyntMemo.smCaretsUpPage;
  sm_CaretsExtendDownPage    = ATSyntMemo.smCaretsDownPage;
  sm_CaretsExtendUpEnd       = ATSyntMemo.smCaretsUpToEnd;
  sm_CaretsExtendDownEnd     = ATSyntMemo.smCaretsDownToEnd;

const
  sm_CopyAsHTML = 309;
  sm_CopyAsRTF = 310;

  sm_ReplaceInFiles = 617;
  sm_ListerFind = 620;
  sm_ListerFNext = 621;
  sm_ListerFPrev = 622;
  sm_PrinterSetup = 634;

  sm_FNew = 700;
  sm_FOpen = 701;
  sm_FSave = 702;
  sm_FExpRtf = 704;
  sm_FExpHtml = 705;
  sm_FSaveAs = 706;
  sm_FReopen = 707;
  sm_FProps = 708;

  sm_OSetup = 709;
  sm_OLexer = 710;
  sm_OLexerLib = 711;
  sm_ORO = 712;
  sm_OOut = 713;
  sm_OFullScr = 714;
  sm_OTree = 715;
  sm_ZoomOut = 716;
  sm_ZoomIn = 717;
  sm_Zoom0 = 718;
  sm_OClip = 719;

  sm_CopyAppend = 720;
  sm_CutAppend = 721;
  sm_FSaveSessionAs = 722;
  sm_FOpenSession = 723;
  sm_FAddSession = 724;
  sm_CopyLine = 725;
  sm_CutLine = 726;
  sm_FSaveSession = 727;
  sm_FCloseSession = 728;

  sm_ORuler = 729;
  sm_OWrap = 730;
  sm_OLines = 731;
  sm_OFold = 732;
  sm_ONPrint = 733;
  sm_ToggleFocusTree = 734;
  sm_ToggleFocusClip = 735;
  sm_ZenExpand = 736;
  sm_ZenWrap = 737;
  sm_ToggleLineComment = 738;
  sm_ToggleFocusOutput = 739;

  sm_FNewWin = 740;
  sm_FClose = 741;
  sm_FCloseAll = 742;
  sm_FCloseOth = 743;
  sm_FSaveAll = 744;
  sm_FExit = 745;
  sm_FCloseDel = 746;
  sm_FMoveTab = 747;
  sm_FileRename = 748;
  sm_ColumnMarkers = 749;

  sm_MakeBak = 750;
  sm_ToggleStreamComment = 751;
  sm_CopyFN = 752;
  sm_CopyFullPath = 753;
  sm_CopyDirPath = 754;
  sm_ToggleFocusFindRes = 755;
  sm_ToggleFocusView = 756;
  sm_ToggleFocusValidate = 757;
  sm_ToggleFocusMap = 758;
  sm_ToggleFocusProj = 759;
  sm_ToggleFocusTabs = 760;

  sm_CaretIncX = 761;
  sm_CaretDecX = 762;
  sm_CaretIncY = 763;
  sm_CaretDecY = 764;
  sm_TreeParent = 765;
  sm_TreeNextBrother = 766;
  sm_TreePrevBrother = 767;
  sm_ToggleSlaveView = 768;
  sm_ToggleFocusMasterSlave = 769;
  sm_SplitViewsVertHorz = 770;
  sm_SplitSlaveVertHorz = 771;
  sm_GotoBookmkDialog = 772;
  sm_FavAddFile = 773;
  sm_FavOrganize = 774;
  sm_FavAddProj = 775;
  sm_ToggleFocusClips = 776;
  sm_ToggleSmartHl = 777;
  sm_DropPortableBk = 778;
  sm_GotoPortableBk = 779;
  sm_IndentLike1st = 780;
  sm_JumpColumnMarkerLeft = 781;
  sm_JumpColumnMarkerRight = 782;
  sm_PasteNoCursorChange = 783;
  sm_JumpMixedCaseLeft = 784;
  sm_JumpMixedCaseRight = 785;
  sm_CancelSelection = 786;
  sm_CenterLines = 787;
  sm_ExtendSelByLine = 788;
  sm_SelectBrackets = 789;
  sm_CollapseParent = 790;
  sm_CollapseWithNested = 791;
  sm_FindCommand = 792;
  sm_PasteToColumn1 = 793;
  sm_CommandsList = 794;
  sm_ScrollToSel = 795;
  sm_ProjectList = 796;
  //free

  sm_EncAnsi = 800;
  sm_EncOem = 801;
  sm_EncUtf = 802;
  sm_EncUni = 803;
  sm_EncUniBE = 804;
  sm_EncUtf2 = 805;
  sm_EncKoi = 806;
  sm_EncMac = 807;
  sm_MenuEnc = 810;
  sm_MenuLex = 811;
  sm_MenuLE = 812;
  sm_ClrHist = 813;
  sm_QS = 814;
  sm_DateTime = 815;
  sm_ExStr = 816;
  sm_GotoNextFindResult = 817;
  sm_GotoPrevFindResult = 818;
  sm_SyncEdit = 819;
  sm_FullScr = 820;
  sm_SyncH = 821;
  sm_SyncV = 822;
  sm_OnTop = 823;
  sm_FillBlock = 824;
  sm_InsText = 825;
  sm_SpellLive = 826;
  sm_SpellCheck = 827;
  sm_JoinLines = 828;
  sm_SplitLines = 829;

  sm_OpenFirefox = 830;
  sm_OpenMSIE = 831;
  sm_OpenChrome = 832;
  sm_OpenSafari = 833;
  sm_OpenCurrentFolder = 834;
  sm_OpenPhp = 835;
  sm_OpenGoogle = 836;
  sm_OpenWiki = 837;
  sm_OpenMsdn = 838;
  sm_MacroDlg = 839;
  sm_OpenPreview = 840;

  sm_BkClear = 841;
  sm_BkToggle = 842;
  sm_BkNext = 843;
  sm_BkPrev = 844;
  sm_BkCopy = 845;
  sm_BkCut = 846;
  sm_BkDelete = 847;
  sm_BkDeleteUnmk = 848;
  sm_BkPaste = 849;
  sm_BkInverse = 850;

  sm_RemoveDupsAll = 851;
  sm_SpToTabLead = 852;
  sm_TidyValidate = 853;
  sm_TidyConfig = 854;
  sm_RemoveDupsAdjacent = 855;
  sm_RemoveBlanks = 856;
  sm_TrimLead = 857;
  sm_TrimTrail = 858;
  sm_TrimAll = 859;
  sm_RemoveDupSp = 860;
  sm_TabToSp = 861;
  sm_SpToTab = 862;
  sm_FindClipNext = 863;
  sm_FindClipPrev = 864;
  sm_RepeatCmd = 865;
  sm_MarkersClear = 866;
  sm_TreeNext = 867;
  sm_TreePrev = 868;
  sm_ReduceBlanks = 869;
  sm_GotoNextBlank = 870;
  sm_GotoPrevBlank = 871;
  sm_SelectParagraph = 872;

  sm_SelectToWordEnd = 873;
  sm_JumpToWordEnd = 874;
  sm_FindNextExtSel = 875;
  sm_FindPrevExtSel = 876;
  sm_JumpToLastMarker = 877;
  sm_OpenCurrentFile = 878;
  sm_SelectToken = 879;
  sm_InsertColor = 880;
  sm_GotoSelEdge = 881;
  sm_ReplaceFromClip = 882; //not used
  sm_ReplaceFromClipAll = 883;
  sm_RereadOutPanel = 884;
  sm_InsertImage = 885;
  sm_OpenHTML4Help = 886;
  sm_OpenHTML5Help = 887;
  sm_LoremIpsum = 888;
  sm_NumericConverter = 889;
  sm_EncodeHtmlChars = 890;
  sm_SortDialog = 891;
  sm_ToggleLineCommentAlt = 892;
  //free

  sm_MacroRepeat = 900;
  sm_Macro1 = 901;
  sm_Macro2 = 902;
  sm_Macro3 = 903;
  sm_Macro4 = 904;
  sm_Macro5 = 905;
  sm_Macro6 = 906;
  sm_Macro7 = 907;
  sm_Macro8 = 908;
  sm_Macro9 = 909;
  //sm_Macro10..30: below

  sm_Tab0 = 910;
  sm_Tab1 = 911;
  sm_Tab2 = 912;
  sm_Tab3 = 913;
  sm_Tab4 = 914;
  sm_Tab5 = 915;
  sm_Tab6 = 916;
  sm_Tab7 = 917;
  sm_Tab8 = 918;
  sm_Tab9 = 919;

  sm_Split2080 = 920;
  sm_Split3070 = 921;
  sm_Split4060 = 922;
  sm_Split5050 = 923;
  sm_Split6040 = 924;
  sm_Split7030 = 925;
  sm_Split8020 = 926;
  sm_SplitLeft = 927;
  sm_SplitRight = 928;

  sm_TabRt0 = 930;
  sm_TabRt1 = 931;
  sm_TabRt2 = 932;
  sm_TabRt3 = 933;
  sm_TabRt4 = 934;
  sm_TabRt5 = 935;
  sm_TabRt6 = 936;
  sm_TabRt7 = 937;
  sm_TabRt8 = 938;
  sm_TabRt9 = 939;

  sm_Macro10 = 940;
  sm_Macro11 = 941;
  sm_Macro12 = 942;
  sm_Macro13 = 943;
  sm_Macro14 = 944;
  sm_Macro15 = 945;
  sm_Macro16 = 946;
  sm_Macro17 = 947;
  sm_Macro18 = 948;
  sm_Macro19 = 949;
  sm_Macro20 = 950;
  sm_Macro21 = 951;
  sm_Macro22 = 952;
  sm_Macro23 = 953;
  sm_Macro24 = 954;
  sm_Macro25 = 955;
  sm_Macro26 = 956;
  sm_Macro27 = 957;
  sm_Macro28 = 958;
  sm_Macro29 = 959;
  sm_Macro30 = 960;
  {
  sm_Macro31 = 961;
  sm_Macro32 = 962;
  sm_Macro33 = 963;
  sm_Macro34 = 964;
  sm_Macro35 = 965;
  sm_Macro36 = 966;
  sm_Macro37 = 967;
  sm_Macro38 = 968;
  sm_Macro39 = 969;
  sm_Macro40 = 970;
  }

implementation

uses
  Windows, ecCmdConst;

function IsCmdEditing(Cmd: integer): boolean;
begin
  case Cmd of
    smCopy,
    smCut,
    smPaste,
    smClearSelection,

    smDeleteLastChar,
    smDeleteChar,
    smDeleteWord,
    smDeleteLastWord,
    smDeleteBOL,
    smDeleteEOL,
    smDeleteLine,
    smClearAll,

    smLineBreak,
    smInsertLine,
    smChar,
    smString,
    smLineBreakSoft,
    smBlockIndent,
    smBlockUnindent,
    smTab,
    smTabChar,

    smUpperCase,
    smLowerCase,
    smToggleCase,
    smTitleCase,
    smUpperCaseBlock,
    smLowerCaseBlock,
    smToggleCaseBlock,
    smTitleCaseBlock,
    smSentCaseBlock,

    smInsertMode,
    smOverwriteMode,
    smToggleMode,
    smMarkSelStart,
    smMarkSelEnd,
    //smResetSelection, //need??

    smChangeRangeSide,

    smCommentLines,
    smUncommentLines,
    smSortAscending,
    smSortDescending,
    smAlignTokens,
    smMoveLinesUp,
    smMoveLinesDown,
    smDuplicateLine,

    smCopyPasteFileEnd,
    smCopyPasteFileStart,
    smCutPasteFileEnd,
    smCutPasteFileStart,
    smCopyPasteAbove,
    smCopyPasteBelow,

    sm_GotoNextBlank,
    sm_GotoPrevBlank,
    sm_SelectParagraph,
    sm_SelectToWordEnd,
    sm_JumpToWordEnd
    
      : Result:= true;
    else
      Result:= false;
  end;
end;

end.
