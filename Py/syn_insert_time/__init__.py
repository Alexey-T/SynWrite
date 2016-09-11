from sw import *
from datetime import datetime

#read this: http://strftime.org/
time_fmt = '%H:%M %d.%m.%Y'

class Command:
    def run(self):
        t = datetime.now()
        s = t.strftime(time_fmt)
        ed.insert(s)
        msg_status('Date/time inserted')
