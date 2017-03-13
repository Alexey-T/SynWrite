unit unPyApiConst;

interface

const
  PROP_NUMS        = 1;
  PROP_EOL         = 2;
  PROP_WRAP        = 3;
  PROP_RO          = 4;
  PROP_MARGIN      = 5;
  PROP_FOLDING     = 6;
  PROP_TAB_SPACES  = 8;
  PROP_TAB_SIZE    = 9;
  PROP_COL_MARKERS = 10;
  PROP_TEXT_EXTENT = 11;
  PROP_ZOOM        = 12;
  PROP_INSERT      = 13;
  PROP_MODIFIED    = 14;
  PROP_VIS_LINES   = 15;
  PROP_VIS_COLS    = 16;
  PROP_LEFT        = 17;
  PROP_TOP         = 18;
  PROP_BOTTOM      = 19;
  PROP_RULER       = 20;
  PROP_TOKEN_TYPE  = 21;
  PROP_LEXER_FILE  = 22;
  PROP_LEXER_CARET = 23;
  PROP_LEXER_POS   = 24;
  PROP_COLOR       = 25;
  PROP_NON_PRINTED         = 26;
  PROP_NON_PRINTED_SPACES  = 27;
  PROP_NON_PRINTED_ENDS    = 28;
  PROP_NON_PRINTED_ENDS_EX = 29;
  PROP_TAG                 = 30;
  PROP_LINE_STATE          = 31;
  PROP_KEEP_TRAIL_BLANKS   = 32;
  PROP_KEEP_CARET_IN_TEXT  = 33;
  PROP_AUTO_INDENT         = 34;
  PROP_LAST_LINE_SHOW      = 35;
  PROP_TAB_FILL            = 36;
  PROP_WRAP_AT_MARGIN      = 37;
  PROP_ENC                 = 38;
  PROP_INDEX_GROUP         = 40;
  PROP_INDEX_TAB           = 41;
  PROP_TAB_TITLE           = 42;
  PROP_TAB_COLOR           = 43;
  PROP_TAB_ID              = 44;

const
  PROP_COORD_WINDOW  = 100;
  PROP_COORD_TREE    = 101;
  PROP_COORD_CLIP    = 102;
  PROP_COORD_OUT     = 103;
  PROP_COORD_PRE     = 104;

  PROP_DOCK_TREE     = 105;
  PROP_DOCK_CLIP     = 106;
  PROP_DOCK_OUT      = 107;
  PROP_DOCK_PRE      = 108;

  PROP_COORD_DESKTOP  = 120;
  PROP_COORD_MONITOR  = 121;
  PROP_COORD_MONITOR0 = 122;
  PROP_COORD_MONITOR1 = 123;
  PROP_COORD_MONITOR2 = 124;
  PROP_COORD_MONITOR3 = 125;

  PROP_SPLIT_MAIN_POS = 129;
  PROP_GROUP_MODE     = 130;

  PROP_FILENAME_SESSION = 132;
  PROP_FILENAME_PROJECT = 133;

  PROP_RECENT_FILES    = 135;
  PROP_RECENT_SESSIONS = 136;
  PROP_RECENT_PROJECTS = 137;
  PROP_RECENT_COLORS   = 139;

  PROP_EVENTS          = 140;

const
  PROC_GET_CLIP         = 1;
  PROC_SET_CLIP         = 2;
  PROC_LOCK_STATUS      = 3;
  PROC_UNLOCK_STATUS    = 4;
  PROC_SOUND            = 5;
  PROC_COLOR_PICKER     = 6;
  PROC_ADD_RECENT_COLOR = 7;
  PROC_GET_COMMAND      = 8;
  PROC_ADD_GUTTER_ICON  = 9;
  PROC_GET_ESCAPE       = 10;
  PROC_SET_ESCAPE       = 11;
  PROC_GET_KEYSTATE     = 20;
  PROC_HOTKEY_INT_TO_STR = 21;
  PROC_HOTKEY_STR_TO_INT = 22;


const
  SEL_NORMAL = 0;
  SEL_COLUMN = 1;
  SEL_LINES  = 2;

const
  LEXER_GET_LIST            = 0;
  LEXER_GET_ENABLED         = 1;
  LEXER_GET_EXT             = 2;
  LEXER_GET_MOD             = 3;
  LEXER_GET_LINKS           = 4;
  LEXER_GET_STYLES          = 5;
  LEXER_GET_COMMENT         = 6;
  LEXER_GET_COMMENT_STREAM  = 7;
  LEXER_GET_COMMENT_LINED   = 8;
  LEXER_SET_NAME            = 10;
  LEXER_SET_ENABLED         = 11;
  LEXER_SET_EXT             = 12;
  LEXER_SET_LINKS           = 13;
  LEXER_GET_STYLES_COMMENTS = 16;
  LEXER_GET_STYLES_STRINGS  = 17;
  LEXER_DETECT              = 20;
  LEXER_DELETE              = 21;
  LEXER_IMPORT              = 22;
  LEXER_EXPORT              = 23;
  LEXER_CONFIG              = 24;

const
  FILENAME_CURRENT         = -1;
  FILENAME_OPPOSITE        = -2;
  FILENAME_SESSION         = -3;
  FILENAME_PROJECT         = -10;
  FILENAME_PROJECT_MAIN    = -11;
  FILENAME_PROJECT_WORKDIR = -12;
  FILENAME_PROJECT_SESSION = -13;
  FILENAME_PROJECT_FILES   = -14;
  FILENAME_PATHS           = -21;
  
const
  LOG_CLEAR         = 0;
  LOG_ADD           = 1;
  LOG_SET_PANEL     = 2;
  LOG_SET_REGEX     = 3;
  LOG_SET_LINE_ID   = 4;
  LOG_SET_COL_ID    = 5;
  LOG_SET_NAME_ID   = 6;
  LOG_SET_FILENAME  = 7;
  LOG_SET_ZEROBASE  = 8;
  LOG_CONSOLE_CLEAR = 20;
  LOG_CONSOLE_ADD   = 21;
  LOG_CONSOLE_GET   = 22;

const
  MENU_SIMPLE = 0;
  MENU_DOUBLE = 1;
  MENU_STD    = 2;

const
  BM_GET        = 1;
  BM_ADD        = 2;
  BM_DELETE     = 3;
  BM_DELETE_ALL = 4;

const
  MARKS_GET = 1;
  MARKS_ADD = 2;
  MARKS_DELETE = 3;
  MARKS_DELETE_ALL = 4;
  MARKS_DELETE_BY_TAG = 5;
  
const
  ATTRIB_CLEAR_ALL       = -1;
  ATTRIB_CLEAR_SELECTION = -2;
  ATTRIB_COLOR_FONT      = 0;
  ATTRIB_COLOR_BG        = 1;
  ATTRIB_SET_BOLD        = 2;
  ATTRIB_SET_ITALIC      = 3;
  ATTRIB_SET_UNDERLINE   = 4;
  ATTRIB_SET_STRIKEOUT   = 5;

const
  DOCK_NONE = '';
  DOCK_LEFT = 'l';
  DOCK_LEFT1 = 'L';
  DOCK_RIGHT = 'r';
  DOCK_RIGHT1 = 'R';
  DOCK_BOTTOM = 'b';
  DOCK_BOTTOM1 = 'B';
  DOCK_TOP = 't';

const
  Find_op_Case     = 1;
  Find_op_Words    = 1 shl 1;
  Find_op_Back     = 1 shl 2;
  Find_op_Sel      = 1 shl 3;
  Find_op_Entire   = 1 shl 4;
  Find_op_Regex    = 1 shl 5;
  Find_op_Regex_S  = 1 shl 6;
  Find_op_Prompt   = 1 shl 8;
  Find_op_Wrap     = 1 shl 9;
  Find_op_SkipCol  = 1 shl 10;
  Find_op_Bkmk     = 1 shl 14;
  Find_op_ExtSel   = 1 shl 15;

  TIMER_START     = 0;
  TIMER_START_ONE = 1;
  TIMER_STOP      = 2;
  TIMER_DELETE    = 3;

implementation

end.
