import os
import subprocess
import string
from sw import *
from .colorcodes import *
from .getcaretword import *

fn_tool = os.path.join(os.path.dirname(__file__), 'ColorPicker.exe')
color_chars = string.ascii_letters + string.digits + '#'

def get_exec(fn, code):
    try:
        subprocess.check_call([fn, str(code)])
        return 0
    except subprocess.CalledProcessError as e:
        return e.returncode
    
        
class Command:
    def run(self):
        nstart, nlen, text = do_get_word_caret(color_chars)
        try:
            code = HTMLColorToPILColor(text)
        except:
            code = 0
            nstart = ed.get_caret_pos()
            nlen = 0
        
        code = get_exec(fn_tool, code)
        if code>=0 and code!=0xFFFFFFFF:
            text = PILColorToHTMLColor(code)
            ed.set_caret_pos(nstart)
            ed.replace(nstart, nlen, text)
            ed.focus()
            
            msg_status('Inserted color code: '+text)
            app_proc(PROC_ADD_RECENT_COLOR, str(code))
