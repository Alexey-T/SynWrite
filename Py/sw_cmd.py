#-----------------------------------
# Caret movement commands
cmd_Left            = 1    # Move cursor left one char
cmd_Right           = 2    # Move cursor right one char
cmd_Up              = 3    # Move cursor up one line
cmd_Down            = 4    # Move cursor down one line
cmd_WordLeft        = 5    # Move cursor left one word
cmd_WordRight       = 6    # Move cursor right one word
cmd_LineStart       = 7    # Move cursor to beginning of line
cmd_LineEnd         = 8    # Move cursor to end of line
cmd_PageUp          = 9    # Move cursor up one page
cmd_PageDown        = 10   # Move cursor down one page
cmd_PageLeft        = 11   # Move cursor right one page
cmd_PageRight       = 12   # Move cursor left one page
cmd_PageTop         = 13   # Move cursor to top of page
cmd_PageBottom      = 14   # Move cursor to bottom of page
cmd_EditorTop       = 15   # Move cursor to absolute beginning
cmd_EditorBottom    = 16   # Move cursor to absolute end
cmd_GotoXY          = 17   # Move cursor to specific coordinates, Data = PPoint
cmd_FirstLetter     = 18   # Move cursor to first non space char of line
cmd_LastLetter      = 19   # Move cursor to last non space char of line
cmd_LeftUp          = 20   # Move cursor left and up at line start

# Caret movement with selection
cmd_Selection       = 100  # Base offset for caret moving with selection
cmd_SelLeft         = cmd_Left      + cmd_Selection
cmd_SelRight        = cmd_Right     + cmd_Selection
cmd_SelUp           = cmd_Up        + cmd_Selection
cmd_SelDown         = cmd_Down      + cmd_Selection
cmd_SelWordLeft     = cmd_WordLeft  + cmd_Selection
cmd_SelWordRight    = cmd_WordRight + cmd_Selection
cmd_SelLineStart    = cmd_LineStart + cmd_Selection
cmd_SelLineEnd      = cmd_LineEnd   + cmd_Selection
cmd_SelPageUp       = cmd_PageUp    + cmd_Selection
cmd_SelPageDown     = cmd_PageDown  + cmd_Selection
cmd_SelPageLeft     = cmd_PageLeft  + cmd_Selection
cmd_SelPageRight    = cmd_PageRight + cmd_Selection
cmd_SelPageTop      = cmd_PageTop   + cmd_Selection
cmd_SelPageBottom   = cmd_PageBottom+ cmd_Selection
cmd_SelEditorTop    = cmd_EditorTop + cmd_Selection
cmd_SelEditorBottom = cmd_EditorBottom + cmd_Selection
cmd_SelGotoXY       = cmd_GotoXY    + cmd_Selection
cmd_SelFirstLetter  = cmd_FirstLetter  + cmd_Selection
cmd_SelLastLetter   = cmd_LastLetter + cmd_Selection
cmd_SelLeftUp       = cmd_LeftUp    + cmd_Selection

# Caret movement with column selection
cmd_ColSelection  = 200  # Base offset for caret moving with column selection
cmd_ColSelLeft         = cmd_Left      + cmd_ColSelection
cmd_ColSelRight        = cmd_Right     + cmd_ColSelection
cmd_ColSelUp           = cmd_Up        + cmd_ColSelection
cmd_ColSelDown         = cmd_Down      + cmd_ColSelection
cmd_ColSelWordLeft     = cmd_WordLeft  + cmd_ColSelection
cmd_ColSelWordRight    = cmd_WordRight + cmd_ColSelection
cmd_ColSelLineStart    = cmd_LineStart + cmd_ColSelection
cmd_ColSelLineEnd      = cmd_LineEnd   + cmd_ColSelection
cmd_ColSelPageUp       = cmd_PageUp    + cmd_ColSelection
cmd_ColSelPageDown     = cmd_PageDown  + cmd_ColSelection
cmd_ColSelPageLeft     = cmd_PageLeft  + cmd_ColSelection
cmd_ColSelPageRight    = cmd_PageRight + cmd_ColSelection
cmd_ColSelPageTop      = cmd_PageTop   + cmd_ColSelection
cmd_ColSelPageBottom   = cmd_PageBottom+ cmd_ColSelection
cmd_ColSelEditorTop    = cmd_EditorTop + cmd_ColSelection
cmd_ColSelEditorBottom = cmd_EditorBottom + cmd_ColSelection
cmd_ColSelGotoXY       = cmd_GotoXY    + cmd_ColSelection  # Data = PPoint
cmd_ColFirstLetter     = cmd_FirstLetter  + cmd_ColSelection
cmd_ColLastLetter      = cmd_LastLetter + cmd_ColSelection
cmd_ColLeftUp          = cmd_LeftUp    + cmd_ColSelection

cmd_Copy            = 301  # Copy selection to clipboard
cmd_Cut             = 302  # Cut selection to clipboard
cmd_Paste           = 303  # Paste clipboard to current position
cmd_Undo            = 304  # Perform undo if available
cmd_Redo            = 305  # Perform redo if available
cmd_SelectAll       = 306  # Select entire contents of editor, cursor to end
cmd_ClearSelection  = 307  # Clear current selection
cmd_CopyAsRTF       = 308  # Copy to clipboard in RTF format

cmd_ScrollUp        = 311  # Scroll up one line leaving cursor position unchanged.
cmd_ScrollDown      = 312  # Scroll down one line leaving cursor position unchanged.
cmd_ScrollLeft      = 313  # Scroll left one char leaving cursor position unchanged.
cmd_ScrollRight     = 314  # Scroll right one char leaving cursor position unchanged.
cmd_ScrollPageUp    = 315  # Scroll up one page leaving cursor position unchanged.
cmd_ScrollPageDown  = 316  # Scroll down one page leaving cursor position unchanged.
cmd_ScrollPageLeft  = 317  # Scroll left one screen leaving cursor position unchanged.
cmd_ScrollPageRight = 318  # Scroll right one screen leaving cursor position unchanged.
cmd_ScrollAbsUp     = 319  # Scroll to absolute beginning leaving cursor position unchanged.
cmd_ScrollAbsDown   = 320  # Scroll to absolute end leaving cursor position unchanged.
cmd_ScrollAbsLeft   = 321  # Scroll to absolute left leaving cursor position unchanged.
cmd_ScrollAbsRight  = 322  # Scroll to absolute right leaving cursor position unchanged.

cmd_DeleteLastChar  = 331  # Delete last char (i.e. backspace key)
cmd_DeleteChar      = 332  # Delete char at cursor (i.e. delete key)
cmd_DeleteWord      = 333  # Delete from cursor to end of word
cmd_DeleteLastWord  = 334  # Delete from cursor to start of word
cmd_DeleteBOL       = 335  # Delete from cursor to beginning of line
cmd_DeleteEOL       = 336  # Delete from cursor to end of line
cmd_DeleteLine      = 337  # Delete current line
cmd_ClearAll        = 338  # Delete everything

cmd_LineBreak       = 339  # Break line at current position, move caret to new line
cmd_InsertLine      = 340  # Break line at current position, leave caret
cmd_Char            = 341  # Insert a character at current position (Data = PChar)
cmd_String          = 342  # Insert a whole string (Data = PChar)
cmd_LineBreakSoft   = 343  # Break line at current position, move caret to new line (only #$A)
cmd_BlockIndent     = 350  # Indent selection
cmd_BlockUnindent   = 351  # Unindent selection
cmd_Tab             = 352  # Tab key
cmd_TabChar         = 353  # Insert Tab char

cmd_UpperCase       = 360 # Upper case to current or previous word
cmd_LowerCase       = 361 # Lower case to current or previous word
cmd_ToggleCase      = 362 # Toggle case to current or previous word
cmd_TitleCase       = 363 # Title case to current or previous word
cmd_UpperCaseBlock  = 365 # Upper case to current selection or current char
cmd_LowerCaseBlock  = 366 # Lower case to current selection or current char
cmd_ToggleCaseBlock = 367 # Toggle case to current selection or current char
cmd_TitleCaseBlock  = 368 # Title case to current selection or current char

cmd_InsertMode      = 371  # Set insert mode
cmd_OverwriteMode   = 372  # Set overwrite mode
cmd_ToggleMode      = 373  # Toggle ins/ovr mode
cmd_NormalSelect    = 374  # Normal selection mode
cmd_ColumnSelect    = 375  # Column selection mode
cmd_LineSelect      = 376  # Line selection mode
cmd_MarkSelStart    = 377  # Marks the beginning of a block
cmd_MarkSelEnd      = 378  # Marks the end of a block
cmd_ResetSelection  = 379  # Reset selection

cmd_GotoBookmark0   = 401  # Goto Bookmark 0
cmd_GotoBookmark1   = 402  # Goto Bookmark 1
cmd_GotoBookmark2   = 403  # Goto Bookmark 2
cmd_GotoBookmark3   = 404  # Goto Bookmark 3
cmd_GotoBookmark4   = 405  # Goto Bookmark 4
cmd_GotoBookmark5   = 406  # Goto Bookmark 5
cmd_GotoBookmark6   = 407  # Goto Bookmark 6
cmd_GotoBookmark7   = 408  # Goto Bookmark 7
cmd_GotoBookmark8   = 409  # Goto Bookmark 8
cmd_GotoBookmark9   = 410  # Goto Bookmark 9
cmd_SetBookmark0    = 411  # Toggle Bookmark 0
cmd_SetBookmark1    = 412  # Toggle Bookmark 1
cmd_SetBookmark2    = 413  # Toggle Bookmark 2
cmd_SetBookmark3    = 414  # Toggle Bookmark 3
cmd_SetBookmark4    = 415  # Toggle Bookmark 4
cmd_SetBookmark5    = 416  # Toggle Bookmark 5
cmd_SetBookmark6    = 417  # Toggle Bookmark 6
cmd_SetBookmark7    = 418  # Toggle Bookmark 7
cmd_SetBookmark8    = 419  # Toggle Bookmark 8
cmd_SetBookmark9    = 420  # Toggle Bookmark 9

cmd_DropMarker       = 430  # Drops marker to the current position (Data = PPoint)
cmd_CollectMarker    = 431  # Collect marker (jump back)
cmd_SwapMarker       = 432  # Swap marker (keep position, jump back)

cmd_ChangeRangeSide  = 433  # Jump caret from one side of the range to other

cmd_ToggleCollapse  = 520   # Collapse/expand block at current line
cmd_Collapse        = 521
cmd_Expand          = 522
cmd_FullCollapse    = 523
cmd_FullExpand      = 524
cmd_CollapseSelection = 525 # Collapse selected block
cmd_ToggleCollapseNearest = 526 # Collapse/expand nearest block
cmd_InSelCollapse   = 527   # Collapse ranges in selection
cmd_InSelExpand     = 528   # Expand ranges in selection

cmd_ToggleNonPrinted = 530
cmd_ToggleWordWrap   = 531
cmd_ToggleFolding    = 532
cmd_ToggleLineNumbersVisible = 533

cmd_GotoLine        = 564  # Go to line number
cmd_MoveLinesUp     = 566  # Moves selected lines one line up
cmd_MoveLinesDown   = 567  # Moves selected lines one line down
cmd_DuplicateLine   = 568  # Duplicates current line

cmd_MacroRecStart   = 570  # Start macro recording
cmd_MacroRecStop    = 571  # Stop macro recording
cmd_MacroRecCancel  = 572  # Cancel macro recording
cmd_MacroPlay       = 573  # Play macro (Data = string | nil)

cmd_FindDialog      = 600
cmd_FindNext        = 601
cmd_FindPrev        = 602
cmd_FindAll         = 603
cmd_FindFirst       = 604
cmd_FindLast        = 605
cmd_SearchAgain     = 606
cmd_FindCurrentWordNext  = 607
cmd_FindCurrentWordPrior = 608

cmd_ReplaceDialog   = 610
cmd_ReplaceNext     = 611
cmd_ReplacePrev     = 612
cmd_ReplaceAll      = 613
cmd_ReplaceFirst    = 614
cmd_ReplaceLast     = 615
cmd_ReplaceAgain    = 616

cmd_CopyPasteFileEnd    = 620 # Block Copy & Paste end of file
cmd_CopyPasteFileStart  = 621 # Block Copy & Paste start of file
cmd_CutPasteFileEnd     = 622 # Block Cut & Paste end of file
cmd_CutPasteFileStart   = 623 # Block Cut & Paste start of file
cmd_CopyPasteAbove      = 624 # Block Copy & Paste above selected block
cmd_CopyPasteBelow      = 625 # Block Copy & Paste below top of file

cmd_Print           = 630 # Print all text
cmd_PrintSelection  = 631 # Print selected text
cmd_PrintPreview    = 632 # Print preview
cmd_PageSetup       = 633 # Page Setup dialog

cmd_SearchMarkReset = 640 # Reset search marks
cmd_SearchMarkNext  = 641 # Go to next search mark
cmd_SearchMarkPrev  = 642 # Go to previous search mark

#-----------------------------------
# Constants from "unCmds.pas"

cmd_CaretsRemoveLeaveFirst    = 2000
cmd_CaretsRemoveLeaveLast     = 2001
cmd_CaretsFromSelLeft         = 2002
cmd_CaretsFromSelRight        = 2003
cmd_CaretsFromSelClear        = 2004
cmd_CaretsFromMarksLeft       = 2005
cmd_CaretsFromMarksRight      = 2006
cmd_CaretsFromMarksClear      = 2007
cmd_CaretsUpLine              = 2008
cmd_CaretsDownLine            = 2009
cmd_CaretsUpPage              = 2010
cmd_CaretsDownPage            = 2011
cmd_CaretsUpToEnd             = 2012
cmd_CaretsDownToEnd           = 2013

#-----------------------------------
cmd_CopyAsHtml = 309
cmd_CopyAsRtf = 310

cmd_ReplaceInFiles = 617
cmd_ReplaceInProject = 618
cmd_ListerFindDialog = 620
cmd_ListerFindNext = 621
cmd_ListerFindPrev = 622
cmd_PrinterSetup = 634
cmd_AutoComplete = 670

cmd_FileNew = 700
cmd_FileOpen = 701
cmd_FileSave = 702
cmd_FileExportRtf = 704
cmd_FileExportHtml = 705
cmd_FileSaveAs = 706
cmd_FileReopen = 707

cmd_OptSetup = 709
cmd_OptSetupLexer = 710
cmd_OptSetupLexerLib = 711
cmd_OptReadOnly = 712
cmd_OptShowOutputPanel = 713
cmd_OptShowLeftPanel = 715
cmd_ZoomOut = 716
cmd_ZoomIn = 717
cmd_ZoomOriginal = 718
cmd_OptShowRightPanel = 719

cmd_CopyAppend = 720
cmd_CutAppend = 721
cmd_FileSaveSessionAs = 722
cmd_FileOpenSession = 723
cmd_FileAddSession = 724
cmd_CopyLine = 725
cmd_CutLine = 726
cmd_FileSaveSession = 727
cmd_FileCloseSession = 728

cmd_OptRuler = 729
cmd_OptWrap = 730
cmd_OptLineNums = 731
cmd_OptFolding = 732
cmd_OptNonPrint = 733
cmd_ToggleFocusTree = 734
cmd_ToggleFocusClip = 735
cmd_ToggleFocusOutput = 739

cmd_FileNewWindow = 740
cmd_FileClose = 741
cmd_FileCloseAll = 742
cmd_FileCloseOthers = 743
cmd_FileSaveAll = 744
cmd_FileExit = 745
cmd_FileCloseAndDelete = 746
cmd_FileMoveToOtherView = 747

cmd_CopyFilename = 752
cmd_CopyFullPath = 753
cmd_CopyDirPath = 754
cmd_ToggleFocusFindRes = 755
cmd_ToggleFocusGroups = 756
cmd_ToggleFocusValidate = 757
cmd_ToggleFocusMap = 758
cmd_ToggleFocusProj = 759
cmd_ToggleFocusTabs = 760

cmd_TreeParent = 765
cmd_TreeNextBrother = 766
cmd_TreePrevBrother = 767
cmd_ToggleSlaveView = 768
cmd_ToggleFocusMasterSlave = 769
cmd_SplitViewsVertHorz = 770
cmd_SplitSlaveVertHorz = 771
cmd_GotoBookmarkDialog = 772
cmd_ToggleFocusClips = 776
cmd_IndentLike1st = 780
cmd_PasteNoCursorChange = 783
cmd_CancelSelection = 786
cmd_ExtendSelByLine = 788
cmd_CollapseParent = 790
cmd_CollapseWithNested = 791
cmd_FindCommand = 792
cmd_PasteToColumn1 = 793
cmd_CommandsList = 794
cmd_ScrollToSel = 795
cmd_ProjectList = 796
cmd_ToggleShowGroup2 = 798
cmd_PasteAsColumnBlock = 799
cmd_ToggleShowMicromap = 800

cmd_Menu_EncodingsConvert = 809
cmd_Menu_EncodingsChange = 810
cmd_Menu_Lexers = 811
cmd_Menu_LineEnds = 812

cmd_ClearFilesHistory = 813
cmd_QuickSearch = 814
cmd_GotoNextFindResult = 817
cmd_GotoPrevFindResult = 818
cmd_ToggleSyncEditing = 819
cmd_ShowFullScreen = 820
cmd_SyncScrollHorz = 821
cmd_SyncScrollVert = 822
cmd_ShowOnTop = 823
cmd_FillBlockDialog = 824
cmd_JoinLines = 828
cmd_SplitLines = 829

cmd_OpenBrowserFirefox = 830
cmd_OpenBrowserIE = 831
cmd_OpenBrowserChrome = 832
cmd_OpenBrowserSafari = 833
cmd_OpenCurrentFolder = 834
cmd_MacrosDialog = 839

cmd_BookmarksClear = 841
cmd_BookmarksToggle = 842
cmd_BookmarksNext = 843
cmd_BookmarksPrev = 844
cmd_BookmarksCopy = 845
cmd_BookmarksCut = 846
cmd_BookmarksDelete = 847
cmd_BookmarksDeleteUnmarked = 848
cmd_BookmarksPaste = 849
cmd_BookmarksInverse = 850

cmd_ConvertSpacesToTabsLeading = 852
cmd_TrimLeading = 857
cmd_TrimTrailing = 858
cmd_TrimAll = 859
cmd_RemoveDupSpaces = 860
cmd_ConvertTabsToSpaces = 861
cmd_ConvertSpacesToTabsAll = 862
cmd_FindClipboardNext = 863
cmd_FindClipboardPrev = 864
cmd_RepeatLastCommand = 865
cmd_MarkersClear = 866
cmd_TreeNextNode = 867
cmd_TreePrevNode = 868
cmd_GotoNextBlank = 870
cmd_GotoPrevBlank = 871
cmd_SelectParagraph = 872

cmd_SelectToWordEnd = 873
cmd_JumpToWordEnd = 874
cmd_FindNextAndExtendSel = 875
cmd_FindPrevAndExtendSel = 876
cmd_JumpToLastMarker = 877
cmd_OpenCurrentFile = 878
cmd_SelectToken = 879
cmd_GotoSelectionStartEnd = 881
cmd_ReplaceFromClip = 882 #not used
cmd_ReplaceFromClipAll = 883
cmd_RereadOutputPanel = 884
cmd_NumericConverterDialog = 889
cmd_SelectionExtend = 893
cmd_SelectionShrink = 894
cmd_DeleteToFileBegin = 896
cmd_DeleteToFileEnd = 897

cmd_MacroRepeat = 900
cmd_Macro1 = 901
cmd_Macro2 = 902
cmd_Macro3 = 903
cmd_Macro4 = 904
cmd_Macro5 = 905
cmd_Macro6 = 906
cmd_Macro7 = 907
cmd_Macro8 = 908
cmd_Macro9 = 909

cmd_Tab0 = 910
cmd_Tab1 = 911
cmd_Tab2 = 912
cmd_Tab3 = 913
cmd_Tab4 = 914
cmd_Tab5 = 915
cmd_Tab6 = 916
cmd_Tab7 = 917
cmd_Tab8 = 918
cmd_Tab9 = 919

cmd_Split2080 = 920
cmd_Split3070 = 921
cmd_Split4060 = 922
cmd_Split5050 = 923
cmd_Split6040 = 924
cmd_Split7030 = 925
cmd_Split8020 = 926
cmd_SplitLeft = 927
cmd_SplitRight = 928

cmd_TabRt0 = 930
cmd_TabRt1 = 931
cmd_TabRt2 = 932
cmd_TabRt3 = 933
cmd_TabRt4 = 934
cmd_TabRt5 = 935
cmd_TabRt6 = 936
cmd_TabRt7 = 937
cmd_TabRt8 = 938
cmd_TabRt9 = 939

cmd_Macro10 = 940
cmd_Macro11 = 941
cmd_Macro12 = 942
cmd_Macro13 = 943
cmd_Macro14 = 944
cmd_Macro15 = 945
cmd_Macro16 = 946
cmd_Macro17 = 947
cmd_Macro18 = 948
cmd_Macro19 = 949
cmd_Macro20 = 950
cmd_Macro21 = 951
cmd_Macro22 = 952
cmd_Macro23 = 953
cmd_Macro24 = 954
cmd_Macro25 = 955
cmd_Macro26 = 956
cmd_Macro27 = 957
cmd_Macro28 = 958
cmd_Macro29 = 959
cmd_Macro30 = 960

cmd_FoldLevel2 = 982
cmd_FoldLevel3 = 983
cmd_FoldLevel4 = 984
cmd_FoldLevel5 = 985
cmd_FoldLevel6 = 986
cmd_FoldLevel7 = 987
cmd_FoldLevel8 = 988
cmd_FoldLevel9 = 989

cmd_OptNonPrintOff = 1002
cmd_OptNonPrintSpaces = 1003
cmd_OptNonPrintEol = 1004
cmd_OptNonPrintBoth = 1005
cmd_OptNonPrintEolDetails = 1006

cmd_HideMenuItemsDialog = 1007
cmd_RestoreStylesDialog = 1008
cmd_ExternalToolsDialog = 1009
cmd_EditSynPluginsIni = 1011
cmd_EditSynIni = 1012
cmd_OpenBySelection = 1013

cmd_CopySearchMarks = 1020
cmd_OpenProject = 1021
cmd_AddFileToProject = 1022
cmd_NewProject = 1024
cmd_PasteAndSelect = 1025
cmd_InsertBlankLineAbove = 1026
cmd_InsertBlankLineBelow = 1027
cmd_OpenCmdPrompt = 1028
cmd_CopyCurrentURL = 1029
cmd_OpenCurrentURL = 1030
cmd_FindId = 1031
cmd_AddRecentColorCode = 1032
cmd_SaveFolding = 1033
cmd_LoadFolding = 1034
cmd_OpenLastClosedFile = 1035
cmd_SelectTokenNoQuotes = 1038
cmd_AddFilesToProject = 1039
cmd_ScrollCurrentLineToTop = 1040
cmd_ScrollCurrentLineToBottom = 1041
cmd_ScrollCurrentLineToMiddle = 1042
cmd_SaveProject = 1043
cmd_ToggleFocusConsole = 1044
cmd_NewSnippetDialog = 1046
cmd_SnippetsDialog = 1047
cmd_HelpFileContents = 1048
cmd_ResetPythonPlugins = 1049
cmd_GotoNextTab = 1050
cmd_GotoPrevTab = 1051
cmd_GotoNextOutputResult = 1052
cmd_GotoPrevOutputResult = 1053
cmd_GotoNextSearchOrOutputResult = 1054
cmd_GotoPrevSearchOrOutputResult = 1055
cmd_ToggleShowFoldersOnTabs = 1056
cmd_InsertUnicodeHexDialog = 1057
cmd_UpdateProject = 1058
cmd_FileCloseOthersAllGroups = 1059
cmd_MoveCurrentTabToNextGroup = 1060
cmd_MoveCurrentTabToPrevGroup = 1061
cmd_ToggleFocusBookmarks = 1062
cmd_PrintNowAll = 1063
cmd_PrintNowSelection = 1064

cmd_GotoNextModifiedLine = 1065
cmd_GotoPrevModifiedLine = 1066
cmd_GotoNextModifiedOrSavedLine = 1067
cmd_GotoPrevModifiedOrSavedLine = 1068

cmd_OpenEntireFolder = 1069
cmd_SentenceCaseBlock = 1070
cmd_RandomCaseBlock = 1071
cmd_RestartProgram = 1072

cmd_TreeCollapseAll = 1090
cmd_TreeExpandAll = 1091
cmd_TreeLevel2 = 1092
cmd_TreeLevel3 = 1093
cmd_TreeLevel4 = 1094
cmd_TreeLevel5 = 1095
cmd_TreeLevel6 = 1096
cmd_TreeLevel7 = 1097
cmd_TreeLevel8 = 1098
cmd_TreeLevel9 = 1099

cmd_TabColorDefault = 1100
cmd_TabColorCustom = 1111

cmd_OptionsTab_ProgramOpt = 1115
cmd_OptionsTab_Colors = 1116
cmd_OptionsTab_Fonts = 1117
cmd_OptionsTab_Tabs = 1118
cmd_OptionsTab_EditorView = 1119
cmd_OptionsTab_EditorSelect = 1120
cmd_OptionsTab_EditorCarets = 1121
cmd_OptionsTab_EditorOverrides = 1122
cmd_OptionsTab_Keys = 1123
cmd_OptionsTab_FormatsReload = 1124
cmd_OptionsTab_Search = 1125
cmd_OptionsTab_TreeMap = 1126
cmd_OptionsTab_History = 1127
cmd_OptionsTab_SessionsProject = 1128
cmd_OptionsTab_AutoComplete = 1129
cmd_OptionsTab_AutoSave = 1130
cmd_OptionsTab_Paths = 1132
cmd_OptionsTab_EditorUndo = 1135
cmd_OptionsTab_EditorInsertFmt = 1136
cmd_OptionsTab_NewOpen = 1137

cmd_AddonsManager_Install = 1150
cmd_AddonsManager_Remove = 1151
cmd_AddonsManager_Edit = 1152
cmd_AddonsManager_Update = 1153
cmd_AddonsManager_SaveAll = 1154

cmd_EncodingChange_Ansi = 1200
cmd_EncodingChange_Oem = 1201
cmd_EncodingChange_Utf8Bom = 1202
cmd_EncodingChange_Utf8NoBom = 1203
cmd_EncodingChange_Utf16LE = 1204
cmd_EncodingChange_Utf16BE = 1205

cmd_EncodingConvert_Ansi = 1210
cmd_EncodingConvert_Oem = 1211
cmd_EncodingConvert_Utf8Bom = 1212
cmd_EncodingConvert_Utf8NoBom = 1213
cmd_EncodingConvert_Utf16LE = 1214
cmd_EncodingConvert_Utf16BE = 1215
