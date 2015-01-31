#Author: AlexeyT

def _version_list(s):
    res = []
    for item in s.split('.'):
        try:
            n = int(item)
            res += [n]
        except:
            res += [0]
    return res

def is_version_newer(str_old, str_new):
    return _version_list(str_new) > _version_list(str_old)
