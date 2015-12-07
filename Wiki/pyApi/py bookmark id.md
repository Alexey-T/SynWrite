Possible values of bookmark id:

get_bk id | Meaning
-- | -----------
`0..9` | returns list of single item - position of given numbered bookmark.
`BK_GET_UNNUM` | returns list of positions of all unnumbered bookmarks.
`BK_GET_NUM` | returns list of positions of all numbered bookmarks.
`BK_GET_ALL` | returns list of positions of all bookmarks.

set_bk id | Meaning
-- | -----------
`0..9` | sets given numbered bookmark to given position; pass `pos=-1` to clear bookmark.
`BK_SET_UNNUM` | adds unnumbered bookmark for given position.
`BK_CLEAR` | clears all bookmarks; `pos` is ignored.
