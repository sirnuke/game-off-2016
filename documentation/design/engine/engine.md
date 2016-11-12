# Engine Class

Implements parsing, validation, and execution of a file of code.  Intended to be created
dynamically on the fly.

## Engine

* Upon creation, parses a string into a syntax tree.
* Does not execute or perform validation on construction.
* Supports restarting the given code from a clean scratch.
* Registers slots and signals defined in the code.

### User Interface

* Does not interact with the user.

### Drawing

* Does not draw to the screen.
