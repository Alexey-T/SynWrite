Possible values of `ed.marks(id, npos, nlen, ntag)` id:

* MARKS_GET: Get all search-marks, list of 3-tuples (npos, nlen, ntag), or None.
* MARKS_ADD: Add search-mark, at given (npos, nlen), ntag is int value, set to nonzero to find later marks from your plugin.
* MARKS_DELETE: Delete search-mark with index (0-based) given by npos.
* MARKS_DELETE_ALL: Delete all search-marks.
* MARKS_DELETE_BY_TAG: Delete search-marks, which have tag given by ntag.
