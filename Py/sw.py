import sw_api

MB_OK               = 0x00000000
MB_OKCANCEL         = 0x00000001
MB_ABORTRETRYIGNORE = 0x00000002
MB_YESNOCANCEL      = 0x00000003
MB_YESNO            = 0x00000004
MB_RETRYCANCEL      = 0x00000005
MB_ICONERROR        = 0x00000010
MB_ICONQUESTION     = 0x00000020
MB_ICONWARNING      = 0x00000030
MB_ICONINFO         = 0x00000040

ID_OK     = 1
ID_CANCEL = 2
ID_ABORT  = 3
ID_RETRY  = 4
ID_IGNORE = 5
ID_YES    = 6
ID_NO     = 7

MSG_INFO      = 0
MSG_WARN      = 1
MSG_ERROR     = 2
MSG_CONFIRM   = -1
MSG_CONFIRM_Q = -2

BEEP_INFO  = 3
BEEP_WARN  = 4
BEEP_ERROR = 5

COLOR_NONE = 0x1FFFFFFF

SEL_NORMAL = 0
SEL_COLUMN = 1
SEL_LINES  = 2

EDENC_ANSI       = 0
EDENC_OEM        = 1
EDENC_MAC        = 2
EDENC_UTF8_BOM   = -1
EDENC_UTF8_NOBOM = -2
EDENC_UTF16_LE   = -3
EDENC_UTF16_BE   = -4

GROUPING_ONE     = 1
GROUPING_2VERT   = 2
GROUPING_2HORZ   = 3
GROUPING_3VERT   = 4
GROUPING_3HORZ   = 5
GROUPING_1P2VERT = 6
GROUPING_1P2HORZ = 7
GROUPING_4VERT   = 8
GROUPING_4HORZ   = 9
GROUPING_4GRID   = 10
GROUPING_6GRID   = 11

MENU_SIMPLE = 0
MENU_DOUBLE = 1
MENU_STD    = 2

ATTRIB_CLEAR_ALL       = -1
ATTRIB_CLEAR_SELECTION = -2
ATTRIB_COLOR_FONT      = 0
ATTRIB_COLOR_BG        = 1
ATTRIB_SET_BOLD        = 2
ATTRIB_SET_ITALIC      = 3
ATTRIB_SET_UNDERLINE   = 4
ATTRIB_SET_STRIKEOUT   = 5

MARKS_GET           = 1
MARKS_ADD           = 2
MARKS_DELETE        = 3
MARKS_DELETE_ALL    = 4
MARKS_DELETE_BY_TAG = 5

LOG_CLEAR         = 0
LOG_ADD           = 1
LOG_SET_PANEL     = 2
LOG_SET_REGEX     = 3
LOG_SET_LINE_ID   = 4
LOG_SET_COL_ID    = 5
LOG_SET_NAME_ID   = 6
LOG_SET_FILENAME  = 7
LOG_SET_ZEROBASE  = 8
LOG_CONSOLE_CLEAR = 20
LOG_CONSOLE_ADD   = 21
LOG_CONSOLE_GET   = 22

LOG_PANEL_OUTPUT   = "0"
LOG_PANEL_VALIDATE = "1"

BK_GET_UNNUM = -1
BK_GET_NUM   = -2
BK_GET_ALL   = -3
BK_SET_UNNUM = -1
BK_CLEAR     = -2

BM_GET        = 1
BM_ADD        = 2
BM_DELETE     = 3
BM_DELETE_ALL = 4

GUTTER_ICON_INFO   = 14
GUTTER_ICON_STOP   = 15
GUTTER_ICON_WARN   = 16
GUTTER_ICON_ERROR  = 17
GUTTER_ICON_ERROR2 = 18
GUTTER_ICON_CHECK  = 19
GUTTER_ICON_ARROW  = 20

LEXER_GET_LIST            = 0
LEXER_GET_ENABLED         = 1
LEXER_GET_EXT             = 2
LEXER_GET_MOD             = 3
LEXER_GET_LINKS           = 4
LEXER_GET_STYLES          = 5
LEXER_GET_COMMENT         = 6
LEXER_GET_COMMENT_STREAM  = 7
LEXER_GET_COMMENT_LINED   = 8
LEXER_SET_NAME            = 10
LEXER_SET_ENABLED         = 11
LEXER_SET_EXT             = 12
LEXER_SET_LINKS           = 13
LEXER_GET_STYLES_COMMENTS = 16
LEXER_GET_STYLES_STRINGS  = 17
LEXER_DETECT              = 20
LEXER_DELETE              = 21
LEXER_IMPORT              = 22
LEXER_EXPORT              = 23
LEXER_CONFIG              = 24

FILENAME_CURRENT         = -1
FILENAME_OPPOSITE        = -2
FILENAME_SESSION         = -3
FILENAME_PROJECT         = -10
FILENAME_PROJECT_MAIN    = -11
FILENAME_PROJECT_WORKDIR = -12
FILENAME_PROJECT_SESSION = -13
FILENAME_PROJECT_FILES   = -14
FILENAME_PATHS           = -21

PROC_GET_CLIP            = 1
PROC_SET_CLIP            = 2
PROC_LOCK_STATUS         = 3
PROC_UNLOCK_STATUS       = 4
PROC_SOUND               = 5
PROC_ADD_RECENT_COLOR    = 7
PROC_ADD_GUTTER_ICON     = 9
PROC_GET_ESCAPE          = 10
PROC_SET_ESCAPE          = 11
PROC_GET_COMMAND         = 15
PROC_GET_KEYSTATE        = 20
PROC_HOTKEY_INT_TO_STR   = 21
PROC_HOTKEY_STR_TO_INT   = 22
PROC_KEYMAP              = 23

PROP_NUMS           = 1
PROP_EOL            = 2
PROP_WRAP           = 3
PROP_RO             = 4
PROP_MARGIN         = 5
PROP_FOLDING        = 6
PROP_TAB_SPACES     = 8
PROP_TAB_SIZE       = 9
PROP_COL_MARKERS    = 10
PROP_TEXT_EXTENT    = 11
PROP_ZOOM           = 12
PROP_INSERT         = 13
PROP_MODIFIED       = 14
PROP_VIS_LINES      = 15
PROP_VIS_COLS       = 16
PROP_LEFT           = 17
PROP_TOP            = 18
PROP_BOTTOM         = 19
PROP_COLUMN_LEFT    = PROP_LEFT
PROP_LINE_TOP       = PROP_TOP
PROP_LINE_BOTTOM    = PROP_BOTTOM
PROP_RULER          = 20
PROP_TOKEN_TYPE     = 21
PROP_LEXER_FILE     = 22
PROP_LEXER_CARET    = 23
PROP_LEXER_POS      = 24
PROP_COLOR          = 25
PROP_NON_PRINTED         = 26
PROP_NON_PRINTED_SPACES  = 27
PROP_NON_PRINTED_ENDS    = 28
PROP_NON_PRINTED_ENDS_EX = 29
PROP_TAG                 = 30
PROP_LINE_STATE          = 31
PROP_KEEP_TRAIL_BLANKS   = 32
PROP_KEEP_CARET_IN_TEXT  = 33
PROP_AUTO_INDENT         = 34
PROP_LAST_LINE_SHOW      = 35
PROP_TAB_FILL            = 36
PROP_WRAP_AT_MARGIN      = 37
PROP_ENC                 = 38
PROP_INDEX_GROUP         = 40
PROP_INDEX_TAB           = 41
PROP_TAB_TITLE           = 42
PROP_TAB_COLOR           = 43
PROP_TAB_ID              = 44

PROP_COORD_WINDOW  = 100
PROP_COORD_TREE    = 101
PROP_COORD_CLIP    = 102
PROP_COORD_OUT     = 103
PROP_COORD_PRE     = 104
PROP_DOCK_TREE     = 105
PROP_DOCK_CLIP     = 106
PROP_DOCK_OUT      = 107
PROP_DOCK_PRE      = 108
PROP_COORD_DESKTOP  = 120
PROP_COORD_MONITOR  = 121
PROP_COORD_MONITOR0 = 122
PROP_COORD_MONITOR1 = 123
PROP_COORD_MONITOR2 = 124
PROP_COORD_MONITOR3 = 125
PROP_SPLIT_MAIN_POS = 129
PROP_GROUP_MODE     = 130
PROP_FILENAME_SESSION = 132
PROP_FILENAME_PROJECT = 133
PROP_RECENT_FILES    = 135
PROP_RECENT_SESSIONS = 136
PROP_RECENT_PROJECTS = 137
PROP_RECENT_COLORS   = 139
PROP_EVENTS          = 140

LINESTATE_NORMAL   = 0
LINESTATE_MODIFIED = 1
LINESTATE_NEW      = 2
LINESTATE_SAVED    = 3

DOCK_NONE    = ''
DOCK_LEFT    = 'l'
DOCK_LEFT1   = 'L'
DOCK_RIGHT   = 'r'
DOCK_RIGHT1  = 'R'
DOCK_BOTTOM  = 'b'
DOCK_BOTTOM1 = 'B'
DOCK_TOP     = 't'

EDITOR_CURR     = 0
EDITOR_CURR_BRO = 1
EDITOR_OPP      = 2
EDITOR_OPP_BRO  = 3

TIMER_START     = 0
TIMER_START_ONE = 1
TIMER_STOP      = 2
TIMER_DELETE    = 3

FIND_ACTION_FIND_NEXT    = 0
FIND_ACTION_FIND_ALL     = 1
FIND_ACTION_COUNT        = 3
FIND_ACTION_REPLACE_NEXT = 5
FIND_ACTION_REPLACE_ALL  = 6

FIND_OP_CASE     = 1 << 0
FIND_OP_WORDS    = 1 << 1
FIND_OP_BACK     = 1 << 2
FIND_OP_SELONLY  = 1 << 3
FIND_OP_ENTIRE   = 1 << 4
FIND_OP_REGEX    = 1 << 5
FIND_OP_REGEX_S  = 1 << 6
FIND_OP_PROMPT   = 1 << 8
FIND_OP_WRAP     = 1 << 9
FIND_OP_SKIPCOL  = 1 << 10
FIND_OP_BOOKMARK = 1 << 14
FIND_OP_EXTSEL   = 1 << 15

TOKENS_ALL        = 0
TOKENS_CMT        = 1
TOKENS_STR        = 2
TOKENS_CMT_STR    = 3
TOKENS_NO_CMT_STR = 4

PROP_COLOR_TEXT                  = 'text'
PROP_COLOR_TEXT_BG               = 'text_bg'
PROP_COLOR_SELECTION_TEXT        = 'sel_text'
PROP_COLOR_SELECTION_BG          = 'sel_bg'
PROP_COLOR_CURRENT_LINE_TEXT     = 'curline_text'
PROP_COLOR_CURRENT_LINE_BG       = 'curline_bg'
PROP_COLOR_LINE_NUMBERS_TEXT     = 'numbers_text'
PROP_COLOR_LINE_NUMBERS_BG       = 'numbers_bg'
PROP_COLOR_COLLAPSE_LINE         = 'collapse_line'
PROP_COLOR_COLLAPSE_MARK_TEXT    = 'collapse_mark_text'
PROP_COLOR_COLLAPSE_MARK_BG      = 'collapse_mark_bg'
PROP_COLOR_FOLDING_LINES         = 'folding_lines'
PROP_COLOR_FOLDING_BAR_BG        = 'folding_bar_bg'
PROP_COLOR_MARGIN                = 'margin'
PROP_COLOR_HINTS_TEXT            = 'hints_text'
PROP_COLOR_HINTS_BG              = 'hints_bg'
PROP_COLOR_NONPRINTABLE_TEXT     = 'nonprint_text'
PROP_COLOR_NONPRINTABLE_BG       = 'nonprint_bg'
PROP_COLOR_INDENT_STAPLES        = 'indent_staples'
PROP_COLOR_RULER_TEXT            = 'ruler_text'
PROP_COLOR_RULER_BG              = 'ruler_bg'
PROP_COLOR_MARKS_TEXT            = 'marks_text'
PROP_COLOR_MARKS_BG              = 'marks_bg'
PROP_COLOR_LINE_STATE_MODIFIED   = 'state_mod'
PROP_COLOR_LINE_STATE_NEW        = 'state_new'
PROP_COLOR_LINE_STATE_SAVED      = 'state_saved'
PROP_COLOR_LINE_STATE_UNCHANGED  = 'state_unchanged'
PROP_COLOR_LINE_STATE_DEFAULT    = 'state_def'
PROP_COLOR_SYNCEDIT_BG           = 'syncedit_bg'


def ed_handles():
    r0, r1 = sw_api.ed_handles()
    return range(r0, r1+1)

def ed_group(n):
    h = sw_api.ed_group(n)
    if h:
        return Editor(h)

def msg_box(n1, n2):
    if type(n1) is int:
        return sw_api.msg_box(n1, n2)
    else:
        return sw_api.msg_box_new(n1, n2)

def msg_status(text):
    return sw_api.msg_status(text)

def dlg_input(text, deftext, ini_fn='', ini_section=''):
    return sw_api.dlg_input(text, deftext, ini_fn, ini_section)

def dlg_input_memo(caption, label, deftext):
    return sw_api.dlg_input_memo(caption, label, deftext)

def dlg_input_ex(number, caption,
                 label1   , text1='', label2='', text2='', label3='', text3='',
                 label4='', text4='', label5='', text5='', label6='', text6='',
                 label7='', text7='', label8='', text8='', label9='', text9='',
                 label10='', text10=''):
    result = sw_api.dlg_input_ex(number, caption,
                                 label1, text1, label2, text2, label3, text3,
                                 label4, text4, label5, text5, label6, text6,
                                 label7, text7, label8, text8, label9, text9,
                                 label10, text10)
    if result is None:
        return None
    else:
        return result.splitlines()

def dlg_menu(id, caption, text, focused=0):
    return sw_api.dlg_menu(id, caption, text, focused)
def dlg_file(is_open, filename, folder, filters):
    return sw_api.dlg_file(is_open, filename, folder, filters)
def dlg_folder(caption, folder):
    return sw_api.dlg_folder(caption, folder)
dlg_dir = dlg_folder

def dlg_snippet(name, alias, lexers, text):
    return sw_api.dlg_snippet(name, alias, lexers, text)
def dlg_color(color):
    return sw_api.dlg_color(color)
def dlg_hotkey(title=""):
    return sw_api.dlg_hotkey(title)

def _dlg_custom_dict(res, count):
    """Parse dlg_custom result to dict"""
    clicked, vals = res
    vals = vals.splitlines()
    res = {}
    #res[i]
    for i in range(count):
        res[i] = vals[i]
    #res['clicked']
    res['clicked'] = clicked
    #res['focused']
    for i in range(count, len(vals)):
        s = vals[i].split('=', 1)
        s_key = s[0]
        s_val = s[1]
        if s_val.isdigit():
            s_val = int(s_val)
        res[s_key] = s_val
    return res

def dlg_custom(caption, size_x, size_y, text, focused=-1, get_dict=False):
    res = sw_api.dlg_custom(caption, size_x, size_y, text, focused)
    if res is None:
        return
    if not get_dict:
        return res
    else:
        return _dlg_custom_dict(res, count=len(text.splitlines()) )

def app_version():
    return sw_api.app_version()
def app_api_version():
    return sw_api.app_api_version()
def app_exe_dir():
    return sw_api.app_exe_dir()
def app_ini_dir():
    return sw_api.app_ini_dir()
def app_log(id, text):
    return sw_api.app_log(id, text)
def app_lock(id):
    return sw_api.app_lock(id)

def get_app_prop(id, value=''):
    return sw_api.get_app_prop(id, value)
def set_app_prop(id, value):
    return sw_api.set_app_prop(id, value)

def lexer_proc(id, text):
    return sw_api.lexer_proc(id, text)
def app_proc(id, text=''):
    return sw_api.app_proc(id, text)
def timer_proc(id, callback, interval):
    return sw_api.timer_proc(id, callback, interval)

def ini_read(filename, section, key, value):
    return sw_api.ini_read(filename, section, key, value)
def ini_write(filename, section, key, value):
    return sw_api.ini_write(filename, section, key, value)

def file_open(filename, group=-1, params=''):
    return sw_api.file_open(filename, group, params)
def file_save():
    return sw_api.file_save()
def file_get_name(id):
    return sw_api.file_get_name(id)
def text_local(id, filename):
    return sw_api.text_local(id, filename)
def text_convert(text, filename, back=False):
    return sw_api.text_convert(text, filename, back)
def regex_parse(regex, data):
    return sw_api.regex_parse(regex, data)


def to_str(v):
    if isinstance(v, list) or isinstance(v, tuple):
        return ','.join(map(to_str, v))

    if isinstance(v, bool):
        if v:
            return '1'
        else:
            return '0'

    return str(v)

#Editor
class Editor:
    h = 0
    def __init__(self, handle):
        self.h = handle

    def get_caret_xy(self):
        return sw_api.ed_get_caret_xy(self.h)
    def get_caret_pos(self):
        return sw_api.ed_get_caret_pos(self.h)
    def set_caret_xy(self, x, y):
        return sw_api.ed_set_caret_xy(self.h, x, y)
    def set_caret_pos(self, pos):
        return sw_api.ed_set_caret_pos(self.h, pos)
    def add_caret_xy(self, x, y, len=0):
        return sw_api.ed_add_caret_xy(self.h, x, y, len)
    def get_carets(self):
        return sw_api.ed_get_carets(self.h)
    def xy_pos(self, x, y):
        return sw_api.ed_xy_pos(self.h, x, y)
    def pos_xy(self, pos):
        return sw_api.ed_pos_xy(self.h, pos)
    def xy_log(self, x, y):
        return sw_api.ed_xy_log(self.h, x, y)
    def log_xy(self, x, y):
        return sw_api.ed_log_xy(self.h, x, y)
    def get_sel_mode(self):
        return sw_api.ed_get_sel_mode(self.h)
    def get_sel_lines(self):
        return sw_api.ed_get_sel_lines(self.h)
    def get_sel(self):
        return sw_api.ed_get_sel(self.h)
    def get_sel_rect(self):
        return sw_api.ed_get_sel_rect(self.h)
    def set_sel(self, start, len, nomove=False):
        return sw_api.ed_set_sel(self.h, start, len, nomove)
    def set_sel_rect(self, x1, y1, x2, y2):
        return sw_api.ed_set_sel_rect(self.h, x1, y1, x2, y2)
    def get_text_all(self):
        return sw_api.ed_get_text_all(self.h)
    def get_text_sel(self):
        return sw_api.ed_get_text_sel(self.h)
    def get_text_line(self, num):
        return sw_api.ed_get_text_line(self.h, num)
    def get_text_len(self):
        return sw_api.ed_get_text_len(self.h)
    def get_text_substr(self, start, len):
        return sw_api.ed_get_text_substr(self.h, start, len)
    def get_line_count(self):
        return sw_api.ed_get_line_count(self.h)
    def get_line_prop(self, num):
        return sw_api.ed_get_line_prop(self.h, num)
    def get_word(self, x, y):
        return sw_api.ed_get_word(self.h, x, y)
    def get_prop(self, id, value=''):
        return sw_api.ed_get_prop(self.h, id, to_str(value))
    def set_prop(self, id, value):
        return sw_api.ed_set_prop(self.h, id, to_str(value))
    def get_filename(self):
        return sw_api.ed_get_filename(self.h)
    def get_alerts(self):
        return sw_api.ed_get_alerts(self.h)
    def set_alerts(self, value):
        return sw_api.ed_set_alerts(self.h, value)
    def get_tabcolor(self):
        return sw_api.ed_get_tabcolor(self.h)
    def set_tabcolor(self, value):
        return sw_api.ed_set_tabcolor(self.h, value)
    def get_indexes(self):
        return sw_api.ed_get_indexes(self.h)

    def get_top(self):
        return sw_api.ed_get_prop(self.h, PROP_TOP, '')
    def get_left(self):
        return sw_api.ed_get_prop(self.h, PROP_LEFT, '')
    def set_top(self, num):
        return sw_api.ed_set_prop(self.h, PROP_TOP, str(num))
    def set_left(self, num):
        return sw_api.ed_set_prop(self.h, PROP_LEFT, str(num))

    def replace(self, start, len, text):
        return sw_api.ed_replace(self.h, start, len, text)
    def insert(self, text):
        return sw_api.ed_insert(self.h, text)
    def insert_snippet(self, text, sel='', fname=''):
        return sw_api.ed_insert_snippet(self.h, text, sel, fname)
    def set_text_all(self, text):
        return sw_api.ed_set_text_all(self.h, text)
    def set_text_line(self, num, text):
        return sw_api.ed_set_text_line(self.h, num, text)
    def cmd(self, id, text=''):
        return sw_api.ed_cmd(self.h, id, text)
    def lock(self):
        return sw_api.ed_lock(self.h)
    def unlock(self):
        return sw_api.ed_unlock(self.h)
    def focus(self):
        return sw_api.ed_focus(self.h)
    def marks(self, id, npos, nlen, ntag):
        return sw_api.ed_marks(self.h, id, npos, nlen, ntag)
    def complete(self, text, len, show_menu=True):
        return sw_api.ed_complete(self.h, text, len, show_menu)
    def get_split(self):
        return sw_api.ed_get_split(self.h)
    def set_split(self, horz, value):
        return sw_api.ed_set_split(self.h, horz, value)
    def get_sync_ranges(self):
        return sw_api.ed_get_sync_ranges(self.h)
    def add_sync_range(self, start, len):
        return sw_api.ed_add_sync_range(self.h, start, len)
    def bookmarks(self, id, pos, tag, icon=-1, color=-1, hint=''):
        return sw_api.ed_bookmarks(self.h, id, pos, tag, icon, color, hint)
    def get_staple(self, posx, posy):
        return sw_api.ed_get_staple(self.h, posx, posy)
    def set_attr(self, id, color):
        return sw_api.ed_set_attr(self.h, id, color)
    def get_attr(self):
        return sw_api.ed_get_attr(self.h)
    def find(self, action, opt, tokens, sfind, sreplace):
        return sw_api.ed_find(self.h, action, opt, tokens, sfind, sreplace)
    def save(self, filename=''):
        return sw_api.ed_save(self.h, filename)

#----------------------------------------

# objects
ed        = Editor(EDITOR_CURR)
ed_bro    = Editor(EDITOR_CURR_BRO)
ed_op     = Editor(EDITOR_OPP)
ed_op_bro = Editor(EDITOR_OPP_BRO)
