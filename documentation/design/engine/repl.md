# REPL Class

Implements Read-Eval-Print-Loop for testing the programming language.

Followed by a list of bullet points describing behavior and constraints.

A third level heading called *User Interface*.  Followed by a series of bullet points describing
how the class interacts with the player.

A third level heading called *Drawing*.  Followed by a series of bullet points describing how
it draws to the screen.

## REPL

* Reads input one line at a time.
* Runs through the parser.
* Executes the parsed tree, if valid.
* Not designed to be used by end user.

### User Interface

* Directly interacts with stdin/stdout.

### Drawing

* Does not draw to the screen, minus usage of stdout.
