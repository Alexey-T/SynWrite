`bookmarks(id, pos, tag, icon=-1, color=-1, hint='')`

* Param pos: offset of bookmark (not line index).
* Param tag: 0 means usual bookmark, 1..10 means numbered bookmark.
* Param icon: one of GUTTER_ICON_nnn values, or -1 for none.
* Param color: RGB color, or COLOR_NONE value.
* Param hint: string for bookmark icon's tooltip. If begins with "!", bookmark won't save to history on exit. 

Param id values:

* BM_GET: Get bookmarks, list of 2-tuple `(pos, tag)`, or None. 
* BM_ADD: Add bookmark at given position, with given tag.
* BM_DELETE: Delete bookmark with given index (index in the total list).
* BM_DELETE_ALL: Delete all bookmarks.
