from sw import *

class Command:
    def run(self):
        s = "Lines count: " + str(ed.get_line_count())
        msg_box(MSG_INFO, s)
