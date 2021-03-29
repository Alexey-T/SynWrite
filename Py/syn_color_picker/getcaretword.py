#Author: Alexey T
#License: MIT

from sw import *

def do_get_word_caret(chars):
    """Returns tuple (nstart, nlen, text)"""
    pos = ed.get_caret_pos() 
    return do_get_word_at(pos, chars)

def do_get_word_at(pos, chars):
    x0, y0 = ed.pos_xy(pos)
    text = ed.get_text_line(y0)
    if not text:
        return (pos, 0, '') 
    
    x1 = x0
    while x1>0 and text[x1-1] in chars: x1-=1
    x2 = x0
    while x2<len(text) and text[x2] in chars: x2+=1

    nstart = ed.xy_pos(x1, y0)
    nlen = x2-x1
    text = text[x1:x2]
    
    ##print('sel:', nlen, text)
    return (nstart, nlen, text)
