import os
from sw import *

def syn_py():
    return os.path.join(app_exe_dir(), 'Py')

def syn_plugins_dir():
    return os.path.join(app_exe_dir(), 'Plugins')

def syn_plugins_ini():
    return os.path.join(app_ini_dir(), 'SynPlugins.ini')

def get_installed_list(binary_too=False):
    dir = syn_py()
    l = os.listdir(dir)
    l = [os.path.join(dir, fn) for fn in l if not fn.startswith('__')]
    l = [fn for fn in l if os.path.isdir(fn)]

    l2 = []
    if binary_too:    
        dir = syn_plugins_dir()
        l2 = os.listdir(dir)
        l2 = [os.path.join(dir, fn) for fn in l2 if not fn in ('Explorer', 'SynFTP')]
        l2 = [fn for fn in l2 if os.path.isdir(fn)]
    
    return sorted(l+l2)

def get_py_desc_list(dir):
    desc = []
    substr = '=py:' + os.path.basename(dir) + ';'
    with open(syn_plugins_ini(), 'r') as f:
        for line in f:
            if (substr in line) and not line.startswith(';'):
                n = line.find('=')
                if n >= 0:
                    desc.append(line[:n])
    for item in desc:
        n = item.find('\\')
        if n >= 0:
            desc = [item[:n]]
            break
    return desc

def get_py_title(dir):
    fn = os.path.join(dir, 'install.inf')
    if not os.path.isfile(fn):
        return '(no install.inf)'
    return ini_read(fn, 'info', 'title', '')
  