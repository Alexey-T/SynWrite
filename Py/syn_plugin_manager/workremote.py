import os
import re
import time
import urllib.request
import tempfile
from sw import *
from . import opt

#Github repo Alexey-T/SynWrite-registry
URL_REG_LIST = 'https://raw.githubusercontent.com/Alexey-T/SynWrite-registry/master/registry-addons.txt'
URL_REG_VER = 'https://raw.githubusercontent.com/Alexey-T/SynWrite-registry/master/registry-versions.txt'


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


def get_item_url(item):
    try:
        url = 'http://sourceforge.net/projects/synwrite-addons/files/' + item + '/download'
        res = urllib.request.urlopen(url)
        return res.geturl()
    except:
        return


def get_avail_list():
    msg_status(msg('WaitList'))
    fn_list = os.path.join(tempfile.gettempdir(), 'synwrite_registry_list.txt')
    fn_ver = os.path.join(tempfile.gettempdir(), 'synwrite_registry_ver.txt')

    print('Reading channel:', URL_REG_LIST)
    get_url(URL_REG_LIST, fn_list)
    if not os.path.isfile(fn_list):
        print('Cannot download registry list')
        return

    print('Reading channel:', URL_REG_VER)
    get_url(URL_REG_VER, fn_ver)
    if not os.path.isfile(fn_ver):
        print('Cannot download registry versions')
        return

    msg_status('')

    text = open(fn_list, mode='r').read()
    if not text:
        print('Cannot download+read registry list')
        return
    items = text.splitlines()

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
    text = open(fn_ver, mode='r').read()
    if not text:
        print('Cannot download+read registry versions')
        return

    items = text.splitlines()
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
