import sw_api

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

GROUPING_ONE    = 1
GROUPING_2HORZ  = 2
GROUPING_2VERT  = 3
GROUPING_3HORZ  = 4
GROUPING_3VERT  = 5
GROUPING_3AS1P2 = 6
GROUPING_4HORZ  = 7
GROUPING_4VERT  = 8
GROUPING_4GRID  = 9
GROUPING_6GRID  = 10

MENU_SIMPLE = 0
MENU_DOUBLE = 1
MENU_STD    = 2

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

GUTTER_ICON_INFO   = 14
GUTTER_ICON_STOP   = 15
GUTTER_ICON_WARN   = 16
GUTTER_ICON_ERROR  = 17
GUTTER_ICON_ERROR2 = 18
GUTTER_ICON_PLUS   = 19
GUTTER_ICON_MINUS  = 20
GUTTER_ICON_CHECK  = 21
GUTTER_ICON_ARROW  = 22

LEXER_GET_LIST    = 0
LEXER_GET_ENABLED = 1
LEXER_GET_EXT     = 2
LEXER_GET_MOD     = 3
LEXER_GET_LINKS   = 4
LEXER_GET_STYLES  = 5
LEXER_SET_NAME    = 10
LEXER_SET_ENABLED = 11
LEXER_SET_EXT     = 12
LEXER_SET_LINKS   = 13
LEXER_SAVE_LIB    = 20
LEXER_DELETE      = 21
LEXER_IMPORT      = 22
LEXER_EXPORT      = 23
LEXER_CONFIG      = 24
LEXER_CONFIG_ALT  = 25
LEXER_ACTIVATE    = 26

FILENAME_CURRENT         = -1
FILENAME_OPPOSITE        = -2
FILENAME_SESSION         = -3
FILENAME_PROJECT         = -10
FILENAME_PROJECT_MAIN    = -11
FILENAME_PROJECT_WORKDIR = -12
FILENAME_PROJECT_SESSION = -13
FILENAME_PROJECT_FILES   = -14
FILENAME_LEXLIB          = -20
FILENAME_PATHS           = -21
FILENAME_FAVS            = -22

PROC_GET_CLIP         = 1
PROC_SET_CLIP         = 2
PROC_LOCK_STATUS      = 3
PROC_UNLOCK_STATUS    = 4
PROC_SOUND            = 5
PROC_COLOR_PICKER     = 6
PROC_COLOR_PICKER_EX  = 7
PROC_REPORT_KEYS      = 8 

PROP_NUMS           = 1
PROP_EOL            = 2
PROP_WRAP           = 3
PROP_RO             = 4
PROP_MARGIN         = 5
PROP_FOLDING        = 6
#free               = 7
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
PROP_TAG           = 30
PROP_LINE_STATE    = 31

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
PROP_GROUP_INDEX    = 131
PROP_FILENAME_SESSION = 132
PROP_FILENAME_PROJECT = 133
PROP_RECENT_FILES    = 135
PROP_RECENT_SESSIONS = 136
PROP_RECENT_PROJECTS = 137
PROP_RECENT_NEWDOC   = 138
PROP_RECENT_COLORS   = 139
PROP_EVENTS          = 140
PROP_EDITOR_BY_INDEX = 141
PROP_GROUPS          = 142

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

ACT_FIND_NEXT    = 0
ACT_FIND_ALL     = 1
ACT_COUNT        = 3
ACT_REPLACE_NEXT = 5
ACT_REPLACE_ALL  = 6

FIND_CASE     = 1 << 0
FIND_WORDS    = 1 << 1
FIND_BACK     = 1 << 2
FIND_SELONLY  = 1 << 3
FIND_ENTIRE   = 1 << 4
FIND_REGEX    = 1 << 5
FIND_REGEX_S  = 1 << 6
#FIND_REGEX_M  = 1 << 7
FIND_PROMPT   = 1 << 8
FIND_WRAP     = 1 << 9
FIND_SKIPCOL  = 1 << 10
FIND_BOOKMARK = 1 << 14
FIND_EXTSEL   = 1 << 15

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

def msg_box(id, text=''):
    return sw_api.msg_box(id, text)
def msg_status(text):
    return sw_api.msg_status(text)

def dlg_input(text, deftext, ini_fn, ini_section):
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

def dlg_menu(id, caption, text):
    return sw_api.dlg_menu(id, caption, text)
def dlg_snippet(name, alias, lexers, text):
    return sw_api.dlg_snippet(name, alias, lexers, text)
def dlg_checklist(caption, columns, items):
    return sw_api.dlg_checklist(caption, columns, items)

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

def ini_read(filename, section, key, value):
    return sw_api.ini_read(filename, section, key, value)
def ini_write(filename, section, key, value):
    return sw_api.ini_write(filename, section, key, value)

def file_open(filename):
    return sw_api.file_open(filename)
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

#----------------------------------
# Editor class

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
    def add_mark(self, start, len):
        return sw_api.ed_add_mark(self.h, start, len)
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
        return sw_api.ed_get_prop(self.h, id, value)
    def set_prop(self, id, value):
        return sw_api.ed_set_prop(self.h, id, value)
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
    def get_indent(self, x, y):
        return sw_api.ed_get_indent(self.h, x, y)
    def cmd(self, id, text=''):
        return sw_api.ed_cmd(self.h, id, text)
    def lock(self):
        return sw_api.ed_lock(self.h)
    def unlock(self):
        return sw_api.ed_unlock(self.h)
    def focus(self):
        return sw_api.ed_focus(self.h)
    def get_marks(self):
        return sw_api.ed_get_marks(self.h)
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
    def get_bk(self, id):
        return sw_api.ed_get_bk(self.h, id)
    def set_bk(self, id, pos, icon=-1, color=-1, hint=''):
        return sw_api.ed_set_bk(self.h, id, pos, icon, color, hint)
    def get_staple(self, posx, posy):
        return sw_api.ed_get_staple(self.h, posx, posy)
    def find(self, action, opt, tokens, sfind, sreplace):
        return sw_api.ed_find(self.h, action, opt, tokens, sfind, sreplace)

#----------------------------------------

# objects
ed        = Editor(EDITOR_CURR)
ed_bro    = Editor(EDITOR_CURR_BRO)
ed_op     = Editor(EDITOR_OPP)
ed_op_bro = Editor(EDITOR_OPP_BRO)
