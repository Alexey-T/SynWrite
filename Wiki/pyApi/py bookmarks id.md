Possible values of `ed.bookmarks(id, pos, tag)` id:

Tag=0 means usual bookmark, 1..10 means numbered bookmark.

id | Meaning
-- | -----------
`BM_GET` | Get bookmarks, list of 2-tuple `(pos, tag)`, or None. 
`BM_ADD` | Add bookmark at given position, with given tag.
`BM_DELETE` | Delete bookmark with given index (index in the total list).
`BM_DELETE_ALL` | Delete all bookmarks.
