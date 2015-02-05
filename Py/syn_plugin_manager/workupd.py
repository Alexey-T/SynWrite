import os
from sw import *
from .worklocal import get_installed_list, get_py_title
from .workremote import msg, get_url, get_item_url, get_avail_list

class Info:
    def __init__(self, path, name, v_local, v_remote, base_url):
        self.path = path
        self.name = name
        self.v_local = v_local
        self.v_remote = v_remote
        self.base_url = base_url

def get_oneline(fn):
    if not os.path.isfile(fn):
        return '?'
    with open(fn, 'r') as f:
        s = f.readline().strip('\n\r ')
    return s
    
def get_update_info():
    dirs = get_installed_list(True)
    names = {dir: get_py_title(dir) for dir in dirs}
    #dirs = [dir for dir in dirs if names.get(dir)!='?']
    avails = get_avail_list()
    
    def get_py_v_remote(dir):
        name = names.get(dir)
        if name:
            for i in avails:
                if i[0].upper() == name.upper():
                    return i[3]
        return '?'  

    def get_py_url(dir):
        name = names.get(dir)
        if name:
            for i in avails:
                if i[0].upper() == name.upper():
                    return i[2]
        return ''  
    
    return [Info(
        dir, 
        names.get(dir), 
        get_oneline(os.path.join(dir, 'v.inf')), 
        get_py_v_remote(dir), 
        get_py_url(dir),
        ) for dir in dirs]
