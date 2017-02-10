from sw import *
import os
import urllib.parse

from .worklocal import syn_py, syn_plugins_ini, get_py_title, get_installed_list
from .workremote import msg, get_url, get_item_url, get_avail_list, get_plugin_zip
from .workupd import Info, get_update_info
from .ver_str import *
from . import opt

UPDATER_X = 526
UPDATER_Y = 510
ini_fn = os.path.join(app_ini_dir(), 'SynAddonsManager.ini')

class Command:

    def __init__(self):
        opt.proxy = ini_read(ini_fn, 'op', 'proxy', opt.proxy)
        opt.save_dir = ini_read(ini_fn, 'op', 'save_dir', opt.save_dir)

    def config(self):
        res = dlg_input_ex(2, 'Addons Manager options',
          'Proxy, e.g. http://proxy.site.com:2010', opt.proxy,
          'Folder for "Download all"', opt.save_dir)
        if not res: return
        opt.proxy = res[0]
        opt.save_dir = res[1]
        ini_write(ini_fn, 'op', 'proxy', opt.proxy)
        ini_write(ini_fn, 'op', 'save_dir', opt.save_dir)

    def update(self):
        infos = get_update_info()

        info_selected = lambda info: '1' if is_version_newer(info.v_local, info.v_remote) else '0'

        text_col = [
          info.name + '\r' +
          os.path.basename(info.path) + '\r' +
          info.v_local + '\r' +
          info.v_remote
          for info in infos]
        text_col_head = '%s=170\r%s=130\r%s=90\r%s=90' % (msg('ColName'), msg('ColFolder'), msg('ColVLocal'), msg('ColVRemote'))
        text_items = '\t'.join([text_col_head]+text_col)
        text_val = '0;'+','.join([info_selected(info) for info in infos])
          
        id_ok = 0
        id_listview = 2
        c1 = chr(1)                   
        text = '\n'.join([ 
          c1.join(['type=button', 'pos=314,480,414,0', 'cap=OK']),
          c1.join(['type=button', 'pos=420,480,520,0', 'cap=Cancel']),
          c1.join(['type=checklistview', 'pos=6,6,520,470', 'items='+text_items, 'val='+text_val, 'props=1']),
          ])
        
        res = dlg_custom(msg('MenuUpdate'), UPDATER_X, UPDATER_Y, text)
        if res is None: return
        
        res, text = res
        if res != id_ok: return

        text = text.splitlines()[id_listview]
        text = text.split(';')[1].split(',')
        
        items = [info for (n, info) in enumerate(infos) if text[n]=='1' and info.base_url]
        if not items: return

        for info in items:
            url = get_item_url(info.base_url)
            if not url: continue
            fn = get_plugin_zip(url)
            if not fn: continue
            file_open(fn, params='/s /v'+info.v_remote)

        text = msg('Updated') + '\n\n' + '\n'.join([i.name for i in items]) + '\n\n' + msg('Restart')
        msg_box(MSG_INFO, text)

    def download_all(self):
        dir = dlg_input(msg('SaveToFolder'), opt.save_dir, '', '')
        if not dir:
            return
        if not os.path.isdir(dir):
            try:
                os.mkdir(dir)
            except:
                msg_box(MSG_ERROR, msg('CantWriteToDir')+'\n'+dir)
                return

        msg_status(msg('WaitList'))
        items = get_avail_list()
        msg_status('')

        if type(items) == str:
            msg_box(MSG_ERROR, msg(items))
            return
        if not items:
            msg_box(MSG_ERROR, msg('NoPlugins'))
            return

        app_proc(PROC_SET_ESCAPE, '0')

        bads = []
        for (i, item) in enumerate(items):

            if app_proc(PROC_GET_ESCAPE, ''):
                app_proc(PROC_SET_ESCAPE, '0')
                if msg_box(MSG_CONFIRM, 'Stop downloading?'):
                    msg_status('Downloading stopped')
                    return

            name = item[0]
            desc = item[1]
            url1 = item[2]
            #also other indexes exist
            
            if name=='SynCodeIntel' or \
               name=='SynSharp':
                print('Skipped downloading: '+name)
                continue

            if not name:
                bads += [url1]
                print('Invalid item: '+name+': '+url1)
                continue

            url = get_item_url(url1)
            while not url:
                if not msg_box(MSG_CONFIRM, 'Cannot resolve URL for "%s".\nRetry?' % name):
                    break
                url = get_item_url(url1)

            if not url:
                bads += [url1]
                print('Invalid url: '+name+': '+url1)
                continue

            dirbase = url1[:url1.find('/')]
            dirbase = os.path.join(dir, dirbase)
            if not os.path.isdir(dirbase):
                os.mkdir(dirbase)
            fn = os.path.join(dirbase, os.path.basename(url))
            fn = urllib.parse.unquote(fn)

            msg_status(msg('WaitFile')+' ['+str(i+1)+'/'+str(len(items))+'] '+os.path.basename(url))
            get_url(url, fn)
            if not os.path.isfile(fn):
                bads += [url]
                print('Cannot download: '+name+': '+url)
                continue

        s = msg('SavedAll')+'\n'
        s += dir+'\n'
        s += msg('SaveFails')+' '+str(len(bads))
        msg_box(MSG_INFO, s)


    def menu_install(self):
        msg_status(msg('WaitList'))
        items = get_avail_list()
        msg_status('')

        if type(items) == str:
            msg_box(MSG_ERROR, msg(items))
            return
        if not items:
            msg_box(MSG_ERROR, msg('NoPlugins'))
            return

        text = '\n'.join([l[0] + '\t' + l[1] for l in items])
        num = dlg_menu(MENU_DOUBLE, msg('MenuInstall'), text)
        if num is None: return

        name = items[num][0]
        url = get_item_url(items[num][2])
        version = items[num][3]
        fn = get_plugin_zip(url)
        if fn:
            file_open(fn, params='/v'+version)

    def do_menu(self, items, caption):
        names = [get_py_title(dir) + '\t' + os.path.basename(dir) for dir in items]
        return dlg_menu(MENU_SIMPLE, caption, '\n'.join(names))

    def do_unregister(self, pyname):
        fn_ini = syn_plugins_ini()
        fn_ini2 = syn_plugins_ini() + '.tmp'

        if os.path.isfile(fn_ini2):
            os.remove(fn_ini2)
        if os.path.isfile(fn_ini2):
            return False

        f = open(fn_ini, 'r')
        f2 = open(fn_ini2, 'w')
        substr = '=py:' + pyname + ';'
        for line in f:
            if not substr in line:
                f2.write(line)
        f2.close()
        f.close()

        if not os.path.isfile(fn_ini2):
            return False
        os.remove(fn_ini)
        os.rename(fn_ini2, fn_ini)
        if not os.path.isfile(fn_ini):
            return False
        return True

    def do_remove(self, pyname):
        dir_inst = os.path.join(syn_py(), pyname)
        dir_trash = os.path.join(syn_py(), '__trash')
        dir_dest = os.path.join(dir_trash, os.path.basename(dir_inst))
        while os.path.isdir(dir_dest):
            dir_dest += '_'

        if not os.path.isdir(dir_trash):
            os.mkdir(dir_trash)
        if not os.path.isdir(dir_trash):
            msg_box(MSG_ERROR, msg('CantCreTrash'))
            return False

        try:
            os.rename(dir_inst, dir_dest)
        except OSError:
            msg_box(MSG_ERROR, msg('CantMoveToTr'))
            return False
        return True


    def menu_edit(self):
        items = get_installed_list()
        num = self.do_menu(items, msg('MenuEdit'))
        if num is not None:
            fn = os.path.join(items[num], '__init__.py')
            if os.path.isfile(fn):
                file_open(fn)
            else:
                msg_box(MSG_ERROR, msg('CantFindFile') + '\n' + fn)

    def menu_remove(self):
        items = get_installed_list()
        num = self.do_menu(items, msg('MenuRemove'))
        if num is not None:
            pyname = os.path.basename(items[num])
            if msg_box(MSG_CONFIRM, msg('CfmRemove') + '\n' + pyname):
                if self.do_unregister(pyname) and self.do_remove(pyname):
                    msg_box(MSG_INFO, msg('Removed')+'\n'+msg('Restart'))
                else:
                    msg_box(MSG_ERROR, msg('CantRemove'))
