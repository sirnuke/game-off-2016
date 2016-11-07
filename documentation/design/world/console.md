# Console Class

Tracks the current input plus the outputted history, as a convenience for the Execute scene.

## Console

Console I/O state tracking class.

* History lines longer than the max shall be split up.
* Once the max number of history lines are recorded, old ones shall be deleted.
* Does not implement actually executing code.
* Does not track textual 'chrome' for lines, such as prompt symbols.

### User Interface

* Add, remove, and reset input helper functions, but does not directly interact with the user.

### Drawing

* Does not handle drawing.
