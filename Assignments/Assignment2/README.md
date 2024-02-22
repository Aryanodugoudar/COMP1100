# COMP1100 Assignment 2 - 2023 s2

In this assignment, you will explore another way of thinking about
graphics, inspired by the [robotic
"turtles"](https://en.wikipedia.org/wiki/Turtle_graphics) of the [LOGO programming
language](https://en.wikipedia.org/wiki/Logo_%28programming_language%29). You
can think of the turtle as a machine with a pen, that sits on a sheet
of paper. As it moves around the page, it drags the pen along the
paper to draw pictures. You will be writing Haskell to generate
instructions for a virtual turtle, and writing more Haskell to
interpret these instructions into a CodeWorld `Picture`.

{:.info-box}
This assignment is worth 12% of your final grade.

{:.warn-box}
**Deadline**: Sunday October 1st, 2023, at 11:00pm Canberra time *sharp*
Note: Late submissions **will not be marked** unless you have an
**approved extension**.

{:.info-box}
We **highly** recommend committing your work as you go, and pushing regularly.
Do _not_ wait until you are finished to commit and push for the first time, as
you run the risk of missing the deadline and having nothing submitted. An
unfinished assignment is worth more than no assignment.

### Required Knowledge 

Students who have worked up to the
[Week 6 lab](https://comp.anu.edu.au/courses/comp1100/labs/06/) should
have the programming knowledge required for this assignment. In particular you
will need to work with recursion and parametric polymorphism.

The [Week 7 lab](https://comp.anu.edu.au/courses/comp1100/labs/07/)
will help you improve your unit test and style marks.

**This assignment is designed to test your ability to use recursion in
programming.**

## Overview of Tasks

This assignment is marked out of 100:

| **Task**                             |              |
|--------------------------------------|--------------|
| Task 1: Drawing Shapes               | 10 Marks     |
| Task 2: Interpreting Turtle Commands | 30 Marks     |
| Task 3: Boundary of T-Square Fractal | 20 Marks     |
| Unit Tests                           | 10 Marks     |
| Style                                | 10 Marks     |
| Technical Report                     | 20 Marks     |

{:.warn-box}
From this assignment onward, code that does not compile will be penalised
heavily. This means that **both** the commands `cabal v2-run turtle` and 
`cabal v2-test` must run without errors. If **either** of those commands
fail with an error, a very heavy mark deduction will be applied. 
The deduction will be the same regardless of which of these commands fails.

{:.info-box}
To help you ensure your submitted code is compiling, we've added a
[Continuous Integration](https://en.wikipedia.org/wiki/Continuous_integration) 
(CI) script to this assignment. This will check that your code compiles, and 
mark any commit that fails with a red x on the commit, as shown below. You need
to ensure that your latest commit on submission displays a green tick.

<centre><a href="pictures/build-error.png"><img src="pictures/build-error.png" alt="Failing CI Job" width=700/></a></centre>


If you have a partial solution to part of the assignment that you cannot get
working, you should comment that part out so that the cabal commands succeed,
and write a comment directing your tutor's attention to it.

## Getting Started

1. Fork the assignment repository and create a project for it in 
  VS Code/Codium, following the same steps as in 
  [Lab 2](https://cs.anu.edu.au/courses/comp1100/labs/02/#forking-a-project).
  The assignment repository is at
  <https://gitlab.cecs.anu.edu.au/comp1100/2023s2/studentfiles/asst2-1100_s2_2023>.

2. Add **our** version of the repository as a *remote* called
   `upstream`. This allows us to provide additional fixes in the unlikely
   case that they are required. You do this by doing the following:

   - Go to the command palette in VSCode (or VSCodium) by pressing
    `Ctrl + Shift + p`.

   - Type `git remote`.

   - Click **Git: Add Remote**.
   
   - Enter `upstream` into the box for the remote name.
   
   - Put the following URL as the remote url:
    `https://gitlab.cecs.anu.edu.au/comp1100/2023s2/studentfiles/asst2-1100_s2_2023.git`.

## Overview of the Repository

Most of your code will be written in `src/Turtle.hs`. You will also
need to write tests in `test/TurtleTest.hs`, which contains some
example tests for you to study.

### Other Files

* `test/Testing.hs` is the testing library we used in Assignment 1,
  extended with some useful functions for this assignment. You should
  read this file as well as `test/TurtleTest.hs`, and make sure you
  understand how to write tests.

* `src/TestPatterns.hs` contains some sample patterns which you can use to
   test your code against. There are some images of the expected outputs of
   these test patterns in the `pictures` folder.

* `app/Main.hs` is a small test program that uses your turtle code. We
  discuss its features in 
  ["Overview of the Test Program"](#overview-of-the-test-program).

* `comp1100-assignment2.cabal` tells the cabal build tool how to build
  your assignment. You are not required to understand this file, and
  we will discuss how to use cabal below.

* `Setup.hs` tells cabal that this is a normal package with no unusual
  build steps. Some complex packages (that we won't see in this
  course) need to put more complex code here. You are not required to
  understand it.

* `.gitignore` and `.gitlab-ci` are files relating to Git.
  You are not required to understand these files.

## Overview of Cabal

As before, we are using the `cabal` tool to build the assignment
code. The commands provided are very similar to last time:

* `cabal v2-build`: Compile your assignment.

* `cabal v2-run turtle`: Build your assignment (if necessary), and run
  the test program.

* `cabal v2-repl comp1100-assignment2`: Run the GHCi interpreter over
  your project.

* `cabal v2-test`: Build and run the tests. This assignment is set up to
   run a unit test suite like in Assignment 1, but this time you will
   be writing the tests. The unit tests will abort on the first
   failure, or the first call to a function that is `undefined`.

{:.info-box}
You should execute these cabal commands in the **top-level directory** of your
project: `~/comp1100/assignments/asst2-1100_s2_2023` (i.e., the directory you are
in when you launch the VSCodium Terminal tool for your project).

## Overview of the Test Program

The test program in `app/Main.hs` uses CodeWorld, just like Assignment
1, and responds to the following keys:

| Key     | Effect                                                                     |
|---------|----------------------------------------------------------------------------|
| `S`     | Display the simple sample test image                                       |
| `C`     | Display the COMP1100 sample test image                                     |
| `T`     | Display a triangle (from Task 1)                                           |
| `P`     | Display a polygon (from Task 1)                                            |
| `-`/`=` | Decrease/increase the number of sides (polygon mode only, from Task 1)     |
| `[`/`]` | Decrease/increase the length of the perimeter by 0.1 (polygon and triangle mode only, from Task 1) |
| `F`     | Display a t-square fractal (from Task 3)                                   |
| `-`/`=` | Decrease/increase the depth of the t-square fractal                        |
| `[`/`]` | Decrease/increase the size of the t-square fractal by 0.1                  |
| `Z`     | Toggle between zoomed and actual size of t-square fractal                  |



{:.warn-box}
If you try to use the test program without completing Task 2, or you
try to draw something you haven't implemented yet, the test program
will call a function that is set to equal `undefined` 
and so it will crash with the following error:
```
"Exception in blank-canvas application:"
Prelude.undefined
```
In the latter case, if this happens, 
refresh the browser to continue using the test program.

## Turtles and the `TurtleCommand` Type

We are going to imagine a _turtle_ as a point-sized robot that sits on
a canvas. This robot has:

* a pen;

* a _position_ on the canvas; and

* a direction (_facing_), and magnitude (_step size_) of its movement.

There are five classes of commands that we can send to the turtle, and
we represent those commands with the constructors of the
`TurtleCommand` type:

    type Radians = Double

    data TurtleCommand
      = Forward
      | PenUp
      | PenDown
      | Turn Radians
      | ChangeSize Double
      deriving Show


The commands have the following meaning:

| Command        | Meaning                                                                                                                                                                                                                                                                                                  |
|----------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `Forward`      | Drive forward one unit from the current _position_, along the current _facing_, where a unit is determined by the current _step size_. If the pen is down, draw a line between the old and new _positions_.                                                                                                                                      |
| `PenUp`        | Lift the _pen_. The turtle will not draw on `Forward` commands until it reaches a `PenDown` command.                                                                                                                                                                                                   |
| `PenDown`      | Lower the _pen_. The turtle will draw on `Forward` commands until it reaches a `PenUp` command.                                                                                                                                                                                                       |
| `Turn t`       | Turn `t` _radians_ (360 degrees = `2 * pi` radians) from the current _facing_. This changes the direction that the turtle will drive in response to future `Forward` commands. Anticlockwise turns are represented by positive values of `t`; clockwise turns are represented by negative values of `t`. |
| `ChangeSize s` | Change the step size by adding $`s`$ (which might be negative). This changes the current step size so that if the turtle was travelling with a step size of $`x`$, it will now travel with a step size of $`x+s`$.                                                                                                                                                    |

**A Note on 'direction'**

The direction a turtle is facing is expressed as an angle in radians
with reference to an arbitrary `0` radian direction.
For example, in the image below, the reference direction was chosen as straight
up, or 'North', as indicated by the blue line.
The turtle is facing `-pi/4` radians (negative 45&deg;), as marked by the red arrow:

<a href="pictures/turtle.png"><img src="pictures/turtle.png" alt="Drawing of a Turtle at (0,0) facing -pi/4 radians from North " width=300 height=300 /></a>

A full rotation of the turtle is `2 * pi` radians (360&deg;), such that three turtles facing
`0`, -`2 * pi`, and `2 * pi` radians would all be facing the same direction, as would, for example,
three turtles facing `pi/3`, `-5*pi/3`, and `7*pi/3`. You may choose how you
wish to deal with this, and where to put your reference direction.

## Task 1: Drawing Shapes (10 marks)

To draw a (CodeWorld) `Picture` with turtle graphics, we need two
things: the commands to draw, and a way of interpreting those
commands. In this task, you will define some functions that generate
lists of turtle commands. When you have built the interpreter in Task
2, these functions will be a source of test data that you can use to
check your interpreter. You may assume that the turtle is initialised with the pen up and a step
size of 1.

### Your Task

Define the following two functions in `src/Turtle.hs`:

* `triangle :: Double -> [TurtleCommand]`

  - Return a list of commands that will draw an equilateral triangle
    with perimeter equal to the argument. You should put the pen
    down before you do anything else. The turtle should finish with
    the same _position_ and _facing_ as when it started.

  - If the argument is negative, raise an error. (If `triangle` is ever given
    a negative argument, we know there is something wrong with the test program. 
    So, we want to raise an error to stop the test program so we know
    to fix it).

* `polygon :: Int -> Double -> [TurtleCommand]`

  - `polygon n p` should return a list of commands that will draw a
    regular `n`-sided polygon, with perimeter equal to `p`. You
    should put the pen down before you do anything else. The turtle
    should finish with the same _position_ and _facing_ as when it
    started. 
    
  - If `n < 3`, raise an error.

  - If `p` is negative, raise an error.

### Hints

* The function `fromIntegral` can convert an `Int` into a `Double`.

* You won't yet have a of visualising your generated
  `[TurtleCommand]` results to test them. You can read ahead to the section on 
  [unit tests](#unit-tests-10-marks) and write tests for these functions,
  or try working through a list of commands with a ruler and graph paper.

* Try drawing a regular triangle, square or regular hexagon on a sheet
  of graph paper. Then place your pen on one corner and pretend that
  it is the turtle. What commands do you have to tell your turtle to
  make it trace the figure you drew on the graph paper?.

* The two points above are very similar, but work in opposite
  directions: the first one is asking you to check the result of your
  code by interpreting the results. The second point is
  looking at a correct result and asking yourself "what needed to
  happen to produce this?". Being able to think in both directions is
  very useful.

* The identity that the angles of a triangle (in radians) 
  add up to `pi` (180&deg;) may come in handy.

A simple test pattern has been provided, to produce a cross shape.
It may help you to look at the code provided in `test/TestPatterns.hs` 
for the function `simple`, which has been heavily commented, and compare those 
commands to the following images:

<a href="pictures/simple-test-image.png"><img src="pictures/simple-test-image.png" alt="Simple Test Pattern" width=300 height=300 /></a>
<a href="pictures/simple-test-image-annotated.png"><img src="pictures/simple-test-image-annotated.png" alt="Simple Test Pattern" width=300 height=300 /></a>

## Task 2: Interpreting Turtle Commands (30 marks)

Lists of `TurtleCommand` values are just data, but are useful because
we can _interpret_ them into a (CodeWorld) `Picture`. This is morally
the same as the programming you are doing right now - a `.hs` file is
just textual data, but becomes more useful because we can interpret it
as a Haskell program. The difference is only in degree, not kind.

### Your Task

Define a function `runTurtle :: [TurtleCommand] -> Picture` in
`src/Turtle.hs`, which interprets the `[TurtleCommand]` according to
the rules laid out in the 
["Turtles and the `TurtleCommand` Type"](#turtles-and-the-turtlecommand-type) 
section above. Assume that the turtle starts with its _pen_ up, 
at `(0,0)`, facing north (straight up), with a step size of 1 unit per
`Forward` command. So a `Forward` command would take the initial turtle
from `(0,0)` to `(0,1)` without drawing.

If you have completed this task correctly, the simple test pattern you get on
running and by pressing `S` in the test program will appear as above, and the
for complicated COMP1100 test pattern you get by
pressing `C` in the test program will look like this (click for larger
version):

<a href="pictures/comp1100-test-pattern.png"><img src="pictures/comp1100-test-pattern.png" alt="Test Pattern" width=300 height=300 /></a>

### Hints

* You cannot consider a turtle command on its own; you need to know
  what the turtle has already done. For example, you need to know the
  _facing_ to determine the new position after evaluating
  `Forward`. We recommend defining:

  - a data type `TurtleState`, which tracks the turtle's _pen_, _position_,
    _facing_ and _step size_.
  
  - a value `initialState :: TurtleState`, for the turtle's initial
    position, facing, etc.

* Work through a simple `[TurtleCommand]` on paper, to see what your
  program needs to do. 

  - Consider how each `TurtleCommand` interacts with both the display, 
    and the state of the turtle.

  - The `simple` test pattern may help here.

* Break your solution apart into several functions, and test each in
  isolation. If you find that function is not behaving as you
  expect, you will have smaller units of code to debug, which is
  easier to get your head around. You may find using `drawingOf` from `cabal v2-repl` a useful method of testing components of your code.

* You may want to use *type synonyms* for some of the fields in 
  your new data type for clarity, similar to how they were used in [lab 2](https://comp.anu.edu.au/courses/comp1100/labs/02/#angle-conversion-with-haskell).

## Task 3: Boundary of the T-Square fractal (20 Marks)
The [T-square](https://en.wikipedia.org/wiki/T-square_(fractal)) is a 
two-dimensional _fractal_ (self-similar structure), which has the interesting 
property of an infinite boundary over a finite area. Having infinite length
makes the boundary impossible to draw, but we can generate 
approximations to the boundary of the T-Square with our turtle, using the 
following rules:

* The approximation is parametrised by two arguments, _depth_ (`n`) and
  side length (`s`).

* An approximation of the boundary at _depth ($`0`$)_ is a single square with sides
  of length `s`. It is helpful to think of this as built out of 4 right-angled
  (`pi/2)` corners joining sides of length `s/2`.

* An approximation to a corner at _depth ($`n`$)_ is built by replacing each corner
  defined at _depth ($`n-1`$)_ with 3 approximations of
  the corners at _depth ($`n-1`$)_, each with half the _side length_.
  These are arranged to replace the corner at _depth ($`n-1`$)_, starting 
  half way along that corner's length:

  <a href="pictures/depth0-example.png"><img src="pictures/depth0-example.png" alt="T-Square depth 0 example, showing a square of side length 's' with the top right corner outlined in red." width=300 height=300 /></a>
  <a href="pictures/depth1-example.png"><img src="pictures/depth1-example.png" alt="T-Square depth 1 example, showing and enlarged view of the top right corner of a t-square boundary of depth 1 and side length 's'. The corner of a t-square of depth 0, side length 's' is drawn in red over the top, and is labeled indicating it is composed of two line segments of length 's/2' perpendicular to one another. The corner of the t-square at depth 1 is outlined in blue, and labeled indicating that it's top right corner is composed of two perpendicular line segments of length 's/4'." width=300 height=300 /></a>

We can draw approximations to the boundary of the T-Square using our turtle
system.
The first 10 approximations can be seen below (click for larger versions):


<a href="pictures/tsquare-depth0.png"><img src="pictures/tsquare-depth0.png" alt="T-Square depth 0" width=300 height=300 /></a>
<a href="pictures/tsquare-depth1.png"><img src="pictures/tsquare-depth1.png" alt="T-Square depth 1" width=300 height=300 /></a>

<a href="pictures/tsquare-depth2.png"><img src="pictures/tsquare-depth2.png" alt="T-Square depth 2" width=300 height=300 /></a>
<a href="pictures/tsquare-depth3.png"><img src="pictures/tsquare-depth3.png" alt="T-Square depth 3" width=300 height=300 /></a>

<a href="pictures/tsquare-depth4.png"><img src="pictures/tsquare-depth4.png" alt="T-Square depth 4" width=300 height=300 /></a>
<a href="pictures/tsquare-depth5.png"><img src="pictures/tsquare-depth5.png" alt="T-Square depth 5" width=300 height=300 /></a>

<a href="pictures/tsquare-depth6.png"><img src="pictures/tsquare-depth6.png" alt="T-Square depth 6" width=300 height=300 /></a>
<a href="pictures/tsquare-depth7.png"><img src="pictures/tsquare-depth7.png" alt="T-Square depth 7" width=300 height=300 /></a>

<a href="pictures/tsquare-depth8.png"><img src="pictures/tsquare-depth8.png" alt="T-Square depth 8" width=300 height=300 /></a>
<a href="pictures/tsquare-depth9.png"><img src="pictures/tsquare-depth9.png" alt="T-Square depth 9" width=300 height=300 /></a>

Understanding the generation of the T-Square itself (rather than just its
boundary) may help with conceptualising the generation of the boundary - an
explanation can be found in the
[linked Wikipedia page](https://en.wikipedia.org/wiki/T-square_(fractal)) 

{:.info-box}
The last couple of images illustrate that the boundary becomes quite complex
quite quickly. Don't worry if your code takes a little while to generate this
(e.g. the last one took a little over a minute when tested, but this
will vary with implementation, and you may find yourself running out of memory
with larger depths; this will not cost you marks).

### Your Task

Define a function `tSquare :: Int -> Double -> [TurtleCommand]` in
`src/Turtle.hs`, which generates the necessary commands to draw an
approximation to the boundary of the T-Square. 
The first argument specifies the _depth_, and the second specifies the _side 
length_ at _depth $0$_.
The turtle should finish with the same _position_
and _facing_ as when it started.

If either the _depth_ or _side length_ is negative, raise an error.

#### Hints

* It would help to have a clear understanding about what happens at each depth.
  You can trace out a path for the turtle on graph paper, using the diagrammed
  behaviour as a guide. Some examples for depths 0, 1, and 2 are shown 
  [below](#annotated-images).

     - Note that for instances with depth is greater than 1,
       you should not need to explicitly list many `TurtleCommand`'s; this
       should be
       done recursively. Think more about how you might position or set up
       the turtle for further recursive calls.

* If you get stuck, try writing out commands for drawing a _depth 1_ 
  approximation without recursion (but following the diagrams closely),
  then look for sub-sequences that look like the instructions to draw a
  _depth 0_ approximation 
  (or similarly with a _depth 2_ and _depth 1_ approximation).

* You will likely need to have a helper function that does all the required
  movements, called by a function that does the setup (moves into an
  appropriate turtle state
  to start the commands) and then after the correct movements, 
  returns the turtle to its initial state.  

* Make sure that as the turtle leaves each section
  it has the correct _facing_ and _step size_.

  - Consider limiting which functions change the _step size_ so that you easily
    keep track of it, and return it to its original value.

**Style Note:** You can split complex expressions over multiple
    lines, for readability, e.g.

    ```haskell
    -- This calculation is pointless but long.
    -- Instead of writing it out like this:
    fiveFactorials = [1, 1 * 2, 1 * 2 * 3, 1 * 2 * 3 * 4, 1 * 2 * 3 * 3 * 5]

    -- Why not write it out like this?
    fiveFactorials =
      [ 1
      , 1 * 2
      , 1 * 2 * 3
      , 1 * 2 * 3 * 4
      , 1 * 2 * 3 * 3 * 5
      ]
    
    -- P.S.: Did you notice the bug?
    -- It's easier to see in the second example, isn't it?
    ```

##### Annotated images

The approximations of depths 0, 1 and 2 have been annotated below, to help
illustrate a path the turtle might travel. The red and blue arrows are there to
help indicate the path of the turtle, whereas the pink line indicates the actual
line drawn. 

<a href="pictures/tsquare-depth0-annotated.png"><img src="pictures/tsquare-depth0-annotated.png" alt="T-Square depth 0" width=300 height=300 /></a>
<a href="pictures/tsquare-depth1-annotated.png"><img src="pictures/tsquare-depth1-annotated.png" alt="T-Square depth 1" width=300 height=300 /></a>
<a href="pictures/tsquare-depth2-annotated.png"><img src="pictures/tsquare-depth2-annotated.png" alt="T-Square depth 2" width=300 height=300 /></a>

_**Note: The path your turtle follows does not need to be the same as that shown
in the images**_

## Unit Tests (10 marks)

How do you know that the program you've written is correct? GHC's type
checker rejects a lot of invalid programs, but you've written enough
Haskell by now to see that a program that compiles is not necessarily
correct. Testing picks up where the type system leaves off, and gives
you confidence that changing one part of a program doesn't break
others. You have written simple doctests in your labs, but larger
programs need more tests, so the tests you will write for this
assignment will be labelled and organised in a separate file from the
code.

Open `test/TurtleTest.hs`. This file contains a number of example test
cases, written using a test framework defined in
`test/Testing.hs`. These files are heavily commented for your
convenience.

You can run the tests by executing `cabal v2-test`. If it succeeds it
won't print out every test that ran, but if it fails you will see the
output of the test run. If you want to see the tests each time, use
`cabal v2-test --test-show-details=streaming` instead.

### Your Task

Replace the example tests with tests of your own. The tests that you
write should show that the Haskell code you've written in Tasks 1-3
is working correctly. In order to comprehensively test a program, _all testable
functions_ should be tested.

#### Hints

##### General Hints

* Try writing tests before you write code. Then work on your code
  until the tests pass. Then define some more tests and repeat. This
  technique is called _test-driven development_.

* The expected values in your test cases should be easy to check by
  hand. If the tested code comes up with a different answer, then it's
  clear that the problem is with the tested code and not the test
  case.

* Sometimes it is difficult to check an entire structure that's
  returned from one of your functions. Maybe you can compute some
  feature about your result that's easier to test? You could try
  computing the total distance your turtle travels, its final point
  after interpreting all the commands, or some other properties that
  are easier to reason about.

* If you find yourself checking something in GHCi (i.e., `cabal v2-repl
  comp1100-assignment2`), ask yourself "should I make this into a unit
  test?". The answer is often "yes".

* If you are finding it difficult to come up with sensible tests, it
  is possible that your functions are doing too many things at
  once. Try breaking them apart into smaller functions and writing
  tests for each.

##### Technical Hints

* It might be useful to define an assertion function that compares two
  `TurtleState`s against each other.

* The `assertEqual` and `assertNotEqual` functions will not work on
  the CodeWorld `Picture` type (it has no `Eq` instance).
  If you want to write a test
  regarding the lines you draw on the canvas, you might have to come
  up with an intermediate representation for those lines.

* If you want to write tests about new types you have defined, add
  `deriving (Eq, Show)` to the end of the type definition, like this:

  ```haskell
  data MyType = A | B | C  
    deriving (Eq, Show)
  ```

* It is not possible to test cases of functions that result in an error using the tools
  provided in this course.



## Style (10 marks)

> "[...] programs must be written for people to read, and only
> incidentally for machines to execute."

From the foreword to the first edition of [Structure and
Interpretation of Computer 
Programs](https://mitpress.mit.edu/sites/default/files/sicp/full-text/book/book-Z-H-7.html).

Programming is a brain-stretching activity, and you want to make it as
easy on yourself as possible. Part of that is making sure your code is
easy to read, because that frees up more of your brain to focus on the
harder parts.

Guidance on good Haskell style can be found in 
[Lab 7](https://cs.anu.edu.au/courses/comp1100/labs/07/), 
and in [lecture notes](https://comp.anu.edu.au/courses/comp1100/lectures/w6a-code-quality.pdf),
as well as [this course's Style Guide](https://comp.anu.edu.au/courses/comp1100/resources/03-style/),
and the [COMP1100 Peer-assisted-learning repository](https://comp1100-pal.github.io/worksheets/2020/04/20/testing-and-style.html).


### Your Task

Ensure that your code is written in good Haskell style.

## Technical Report (COMP1100: 20 marks)

| **Description**                     | **COMP1100** |
|-------------------------------------|--------------|
| Documentation (what you did)        | 6            |
| Reflection (why you did it)         | 6            |
| Testing (how you tested)            | 5            |
| Style (the report presentation)     | 3            |
|  __TOTAL__                          | __20__       |

You should write a concise [technical
report](https://comp.anu.edu.au/courses/comp1100/resources/07-reports/ )
explaining your design choices in
implementing your program. The **maximum word count is 1250**.
This is a *limit*, not a *quota*; concise presentation
is a virtue.

{:.warn-box}
Once again: This is not a required word count. They are the **maximum
number of words** that your marker will read. If you can do it in
fewer words without compromising the presentation, please do so.

Your report must be in PDF format, located at the root of your
assignment repository on GitLab and named `Report.pdf`. Otherwise, it
may not be marked, or will be marked but with a penalty. You should
double-check **on GitLab** that this is typed correctly.

The report must have a **title page** with the following items:

* Your name;

* Your laboratory time and tutor; and

* Your university ID.

### Content and Structure

Your audience is the tutors and lecturers, who are proficient at programming
and understand most concepts. Therefore you should not, for example, waste
words describing the syntax of Haskell or how recursion works. After reading
your technical report, the reader should thoroughly understand:
1. What problem
your program is trying to solve;
2. The reasons behind major design choices in it; as well as
3. How it was tested. 

Your report should give a broad overview of your
program, but focus on the specifics of what *you* did and why.

Remember that the tutors have access to the above assignment
specification, and if your report *only* contains details from it then
you will only receive minimal marks. Below is a potential outline for
the structure of your report and some things you might discuss in it.

#### Introduction

If you wish to do so you can write an introduction. In it, give:

* A brief overview of your program:

  - how it works; and

  - what it is designed to do.

* If you have changed the way the controls work,
  or added something that may make your program behave unexpectedly,
  then it would be worth making a note of it here.

This section is particularly relevant to more complicated programs.

#### Analysis of your Program

The purpose of this section is to describe your program to the reader, 
both in detail and at a high level.

Talk about what features your program actually has. We know what we asked
for (the features in this document!), but what does your program actually
let a user do? How does your program work as a whole?

How does it achieve this? Let us know how each individual function works
and how they work together to solve particular design goals.

As an example, you might have used a number of helper functions to 
achieve a particular design goal of turning a series of turtle commands into
a CodeWorld `Picture`. 
If so, tell us what these functions are, what they do, and how they compose
or otherwise work together to achieve this goal.

A successful report will demonstrate conceptional understanding of all relevant
functions, and depicts a holistic view of program structure through
discussion of what it is and hour it works.

#### Rationale and Reflection

The purpose of this section is to describe the design decisions you made
while writing the program, to the reader. 

Tell us the reasoning behind the choices you detailed above.
Tell us the assumptions you made about user behaviour.
Why did you solve the problems the way you did?
Why did you write the functions you wrote?
Did you make any other assumptions?

For example: 

_"I implemented the `checkFirst` helper function after 
reading this blog post (citing the post as a reference), 
claiming that users of quadrant based drawing programs virtually always draw 
their first shape in the top-right quadrant. Deciding to use this as my base
assumption for user-behaviour, I decided to save on 
quadrant-dependent calculation of trigonometric ratios by always assuming the 
first shape is drawn in this quadrant. This in turn meant I needed a function 
to check if a shape was the first one drawn."_

This is a _critical reflection_ not a personal one. You're explaining
the justification and reasoning behind the choices you made.

A successful report will give a thorough explanation of the process followed
to reach a final design, including relevant reasoning and assumptions / 
influences.

In this section, you might also reflect on any conceptual or technical issues
you encountered, particularly if you were unable to complete your program. 
Try to include details such as:

- theories as to what caused the problem;    
- suggestions of things that might have fixed it; and
- discussion about what you did try, and the results of these attempts.

#### Testing

The purpose of this section is to give the reader confidence that your
program has been thoroughly tested.

Tell us how you tested the program as a whole to ensure correctness.

Tell us in detail how you tested individual functions to ensure correctness.

For example:

_"I created a test pattern which drew a triangle in each of the four
quadrants of the coordinate plane, to ensure that the turtle was able to turn,
move and draw up, down, left, and right."_

Or:

_"I wrote a unit testing helper function 
  `validateTriangles :: Double -> [TurtleCommand] -> Bool` which
  returned `True` if, and only if the sum of the angles of each `Turn x` command
  sum up to
  2*pi radians, 
  for a triangle of any positive side length."_

A successful report will demonstrate evidence of a _process_ that checked most, 
if not all, of the relevant parts of the program through testing. Such a report
would combine this with some discussion of _why_ these testing results prove
or justify program correctness.

#### Style
A successful report should have excellent structure, writing style, and 
formatting. Write professionally, use diagrams where appropriate but not
otherwise, ensure your report has correct grammar and spelling.

{:.info-box}
This is a list of **suggestions**, not requirements. You should only
discuss items from this list if you have something interesting to
write.

### Things to avoid in a technical report


* Line by line explanations of large portions of code. (If you want to
  include a specific line of code, be sure to format as described in
  the "Format" section below).

* Pictures of code, VSCodium or your IDE.

* Content that is not your own, unless cited.

* Grammatical errors or misspellings. Proof-read it before submission.

* Informal language - a technical report is a professional document, and as
  such should avoid things such as:

  - Unnecessary abbreviations (atm, btw, ps, and so on), emojis, and
    emoticons; and

  - Stories / recounts of events not relevant to the development of the program.

* Irrelevant diagrams, graphs, and charts. Unnecessary elements will
  distract from the important content. Keep it succinct and focused.

If you need additional help with report writing, the
[academic skills writing centre](http://www.anu.edu.au/students/academic-skills/appointments/academic-skills-writing-centre)
has a peer writing service and writing coaches.


### Format

You are not required to follow any specific style guide (such as APA
or Harvard). However, here are some tips which will make your report
more pleasant to read, and make more sense to someone with a computer
science background.


* Colours should be kept minimal. If you need to use colour, make sure it is
  absolutely necessary.

* If you are using graphics, make sure they are *vector* graphics (that stay
  sharp even as the reader zooms in on them).

* Any code, including type/function/module names or file names, that
  appears in your document should have a monospaced font (such as
  Consolas, Courier New, Lucida Console, or Monaco).

* Other text should be set in serif fonts (popular choices are Times,
  Palatino, Sabon, Minion, or Caslon).

* When available, automatic *ligatures* should be activated.

* Do not use underscore to highlight your text.

* Text should be at least 1.5 spaced.


## Communication

**Do not** post your code publicly, either on Ed or via other
forums. Posts on Ed trigger emails to all students, so if by
mistake you post your code publicly, others will have access to your
code and you may be held responsible for plagiarism.

Once again, and we cannot stress this enough: **do not post your code
publicly** . If you need help with your code, post it *privately* to the
instructors.

When brainstorming with your friends, **do not share code**. There
might be pressure from your friends, but this is for both your and
their benefit. Anything that smells of plagiarism will be investigated
and there may be serious consequences.

Sharing ideas and sketches is perfectly fine, but sharing should stop
before you risk handing in suspiciously similar solutions.


Course staff will not look at assignment code unless it is posted
**privately** on Ed, or shared in a drop-in consultation.

Course staff will typically give assistance by asking questions,
directing you to relevant exercises from the labs, or definitions and
examples from the lectures.

{:.info-box}
Before the assignment is due, course staff will not give individual
tips on writing functions for the assignment or how your code can be
improved. We will help you get unstuck by asking questions and
pointing you to relevant lecture and lab material. You will receive
feedback on your work when marks are released.


## Submission Advice

Start early, and aim to finish the assignment several days before the
due date. At least 24 hours before the deadline, you should:

* Re-read the specification one final time, and make sure you've
  covered everything.

  - You have fully read and understand the entire assignment specification. 
    See the "Overview of Tasks" section to check that you have completed all
    tasks.

* Confirm that the latest version of your code has been pushed to
  GitLab.

  - You can confirm that the latest version
    of your code has been pushed to GitLab by using your browser to visit
    https://gitlab.cecs.anu.edu.au/uXXXXXXX/asst2-1100_s2_2023, where XXXXXXX
    is your student number.

* Ensure your program compiles and runs, including the `cabal v2-test`
  test suite. Make sure you have a green CI tick on your latest commit in Gitlab

* Ensure your submission works on the lab machines. If it does not, it
  may fail tests used by the instructors.

* Proof-read and spell-check your report.

* Verify that your report is in PDF format, located at the root of your project.

* Verify that your report is in PDF format, located at the root of your project
  directory (not in `src`), and named `Report.pdf`. That capital `R`
  is important - Linux uses a case-sensitive file system. 
  Otherwise, it may not be marked. 

* Check that all work including your report is submitted by viewing your assignment repo **on Gitlab**.

We recommend that you *do not wait* until you are finished to commit and 
push your work. Commit and push as you work, to reduce the risk of
submission errors at the last minute.
