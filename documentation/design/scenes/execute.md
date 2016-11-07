Design
======

Open with first level heading labeling the scope.  Followed by a paragraph
describing the scope in human terms.

Followed by a list of bullet points describing what sort of classes fit
into the scope.

A second level heading of the class name.  Generally should match the
file name.  Doesn't necessary have to be a class.  Paragraph afterward
should describe it in human terms.

Followed by a list of bullet points describing behavior and constraints.

A third level heading called *User Interface*.  Followed by a series of
bullet points describing how the class interacts with users.

A third level heading called *Drawing*.  Followed by a series of bullet
points describing how it draws to the screen.

# Execute Scene

Scene representing running the scene.  All components are loaded, either from their default
contents or from the hard drive, integrity checks are run, and execution is started from the
latest 'checkpoint' the user has reached.

## Execute

Extends the Scene class.

* Performs integrity checks on components.
* Starts system execution at latest player checkpoint.
* As the user progresses, mark new components as available for editing.

### User Interface

* Responds to basic DOS-like console keyboard input.

### Drawing

* Draws chrome representing the fake PC.
* Draws right hand side scroll bar.
* Draws console input, output, and history.
