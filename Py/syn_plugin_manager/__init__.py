from sw import *
import os
import urllib.parse

from .worklocal import syn_py, syn_plugins_ini, get_py_desc, get_py_title, get_installed_list
from .workremote import msg, get_url, get_item_url, get_avail_list, get_plugin_zip
from .workupd import Info, get_update_info

SAVE_DIR = r'c:\SynWrite_saved_plugins'
UPDATER_X = 520
UPDATER_Y = 500
INI_FN = 'SynAddonsManager.ini'
ini_fn = os.path.join(app_ini_dir(), INI_FN)
ini_section = 'op'
ini_key_proxy = 'proxy_http'
ini_key_savedir = 'save_dir'

class Command:

    def apply_proxy(self):
        proxy = ini_read(ini_fn, ini_section, ini_key_proxy, '')
        os.environ['http_proxy'] = proxy
        os.environ['https_proxy'] = proxy
        ###msg_box(MSG_INFO, 'Proxy used: '+os.environ['http_proxy'])
    
    def config(self):
        proxy = ini_read(ini_fn, ini_section, ini_key_proxy, '')
        dir = ini_read(ini_fn, ini_section, ini_key_savedir, SAVE_DIR)
        s = dlg_input_ex(2, 'Addons Manager', 
          'Proxy, e.g. myserver.com:2000', proxy,
          'Folder for "Download all"', dir)
        if not s: return
        proxy = s[0]
        dir = s[1]
        ini_write(ini_fn, ini_section, ini_key_proxy, proxy)
        ini_write(ini_fn, ini_section, ini_key_savedir, dir)

    def update(self):
        self.apply_proxy()
        
        if app_api_version() < '1.0.143':
            msg_box(MSG_ERROR, 'Needed app update')
            return
    
        infos = get_update_info()        
        text = '\n'.join([
          info.name + '\t' + 
          os.path.basename(info.path) + '\t' + 
          info.v_local + '\t' + 
          info.v_remote + '\t' 
          for info in infos])
           
        columns = '%s\n%s\t150\n%s\t70\n%s\t70' % (msg('ColName'), msg('ColFolder'), msg('ColVLocal'), msg('ColVRemote'))
        checked = dlg_checklist(msg('MenuUpdate'), columns, text, UPDATER_X, UPDATER_Y)
        if not checked: return
        items = [info for (n, info) in enumerate(infos) if checked[n] and info.base_url]
        if not items: return
        
        for info in items:
            url = get_item_url(info.base_url)
            if not url: continue
            fn = get_plugin_zip(url)
            if not fn: continue
            file_open(fn, '/s /v'+info.v_remote)
            
        text = msg('Updated') + '\n\n' + '\n'.join([i.name for i in items]) + '\n\n' + msg('Restart')
        msg_box(MSG_INFO, text)

    def download_all(self):
        self.apply_proxy()

        dir = ini_read(ini_fn, ini_section, ini_key_savedir, SAVE_DIR)
        dir = dlg_input(msg('SaveToFolder'), dir, '', '')
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

        bads = []            
        for (i, item) in enumerate(items):
            name = item[0]
            desc = item[1]
            url1 = item[2]
            #also other indexes exist

            if not name:
                bads += [url1]
                print('Invalid item: '+name+': '+url1)
                msg_box(BEEP_ERROR)
                continue
                
            url = get_item_url(url1)
            if not url:
                bads += [url1]
                print('Invalid url: '+name+': '+url1)
                msg_box(BEEP_ERROR)
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
                msg_box(BEEP_ERROR)
                continue
                             
        s = msg('SavedAll')+'\n'
        s += dir+'\n'
        s += msg('SaveFails')+' '+str(len(bads))
        msg_box(MSG_INFO, s)
            

    def menu_install(self):
        self.apply_proxy()

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
            file_open(fn, '/v'+version)

    def do_menu(self, items, caption):
        names = [get_py_desc(dir) for dir in items]
        num = dlg_menu(MENU_DOUBLE, caption, '\n'.join(names))
        return num

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
