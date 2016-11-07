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

# System Scene

Implements a tree view of all known components, allowing users to select for modification.

## System

Extends the Scene class.

* Displays list of all known components.
* Selecting a component shows metadata, and offers actions to revert to default or open in editor.

### User Interface

* Tree like view, implements basic arrow keys and enter input.

### Drawing

* Draws right hand scroll bar.
* Draws list of known components, organized by folder.
