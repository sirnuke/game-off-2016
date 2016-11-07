# Editor Scene

In-game and in-universe editor, allowing the player to modify components.  More advanced players
will probably modify the text files outside of the game, using their fancy-pants anachronistic
modern editors.

## Editor

Extends the Scene class.

* The component to be modified must be set before entering the scene.
* Implements basic notepad level functionality
* Implements undo-redo trees
* Implements saving/loading raw text
* Implements basic syntax highlighting
* Does not create components.
* Does not format the text.

A third level heading called *User Interface*.  Followed by a series of
bullet points describing how the class interacts with users.

A third level heading called *Drawing*.  Followed by a series of bullet
points describing how it draws to the screen.

### User Interface

* Implements basic keyboard interface.
* Implements basic 'hotkeys' for saving, undo/redo, and similar.

### Drawing

* Draws a top and bottom texts.
* Draws right hand side scroll bar.
* Draws component contents in center of screen.
