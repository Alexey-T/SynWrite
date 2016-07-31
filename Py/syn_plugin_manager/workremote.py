import os
import re
import time
import urllib.request
from sw import *
from . import opt

V_REG = 'Registry'
V_REG_VER = 'RegistryVersions'

def msg(id):
    return text_local(id, __file__)

def get_url(url, fn):
    if os.path.isfile(fn):
        os.remove(fn)
        
    if opt.proxy:
        proxy = urllib.request.ProxyHandler({'http': opt.proxy, 'https': opt.proxy})
        opener = urllib.request.build_opener(proxy)
        urllib.request.install_opener(opener)

    try:
        urllib.request.urlretrieve(url, fn)
    except Exception as e:
        print(e)
        
def file_aged(fn):
    if os.path.isfile(fn):
        age = int(time.time() - os.stat(fn).st_mtime)
        return age > opt.cache_minutes * 60
    else:
        return True

def get_wiki_text(name):
    REGEX = "text=\w?('.*?'\s)"
    url = 'https://sourceforge.net/p/synwrite/wiki/%s/raw' % name
    fn = os.path.join(os.getenv('temp'), 'SynWrite_%s.txt' % name)
    if file_aged(fn):
        get_url(url, fn)
    if not os.path.isfile(fn): 
        return ''
    s = open(fn, 'r').read()
    r = re.compile(REGEX, re.S)
    if not r: return ValueError
    rr = r.search(s)
    if not rr: raise ValueError 
    s = rr.group(1)
    s = s.replace('\n', '')
    s = s.replace('  ', ' ')
    s = eval(s)
    return s

def get_item_url(item):
    try:
        url = 'http://sourceforge.net/projects/synwrite-addons/files/' + item + '/download'
        res = urllib.request.urlopen(url)
        return res.geturl()
    except:
        return

def get_avail_list():
    msg_status(msg('WaitList'))
    text = get_wiki_text(V_REG)
    msg_status('')
    if not text:
        return "CantGetList"
    
    items = text.split('\r\n')
    
    #remove leading wiki text
    last = False
    for i in range(len(items)):
        if items[0].startswith('--'):
            last = True
        del items[0]
        if last: break

    #make list of lists, item[3] is empty
    items = sorted(items, key=str.lower) #case-insensitive
    res = []
    for s in items:
        if '|' in s:
            props = s.split('|')
            props = [l.strip() for l in props]
            props = [props[0], props[1], props[2], '']
            res += [props]

    #write version to item[3] for each item
    msg_status(msg('WaitVer')) 
    text = get_wiki_text(V_REG_VER)
    msg_status('')
    if text:
        items = text.split('\r\n')
        for item in items:
            verinfo = item.split('=')
            if len(verinfo)==2:
                for r in res:
                    if r[0] == verinfo[0]:
                        r[3] = verinfo[1]
                        break

    return res

def get_plugin_zip(url):
    if not url:
        msg_box(MSG_ERROR, msg('NoUrl'))
        return
    
    if '.zip' in url:
        ext = '.zip'
    elif '.rar' in url:
        ext = '.rar'
    else:
        msg_box(MSG_ERROR, msg('BadExt'))
        return
    fn = os.path.join(os.getenv('temp'), 'SynWrite_plugin'+ext)
    
    msg_status(msg('WaitFile')+' '+url)
    get_url(url, fn)
    msg_status('')
    
    if not os.path.isfile(fn):
        msg_box(MSG_ERROR, msg('CantGetFile')+'\n'+url)
        return
    return fn
    

if __name__ == '__main__':
    url = 'PyPlugins/plugin.kvichans.BackupFile.zip'
#    print('Url:')
#    print(get_item_url(url))
    
    items = get_avail_list()
    if type(items)==str:
        print(items)
    else:
        print('List:')
        for l in items:
            print(l)
