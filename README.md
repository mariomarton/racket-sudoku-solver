



# racket-sudoku-solver

- This Racket program solves any legal sudoku puzzle with any number of pre-filled cells
- The size of the board is not limited, it supports any size such that ( {n^2 * n^2 | n >= 1} )
- The standard 9x9 board is therefore represented by n = 3
- Program does not use constraint solvers or Racket mutations such as the set operator
- 9 example puzzles are included
- The code also checks whether the puzzle on the input doesn't break sudoku rules

# MANUAL

#####  Configuration
Just have the three *.rkt* files in one directory.
The three files are:
- **run.rkt** for the user to input commands in 
- **puzzles.rkt** stores example puzzles and user puzzles
- **sudoku-marton.rkt** includes all the functions for solving puzzles

#####  Running the demo
This solver comes with a provided "demo."
Running the demo will solve the 9 provided example puzzles.
To run the demo, just execute **run**.rkt file

#####  Solving your own puzzle:
#####  1. Provide a puzzle
- open **puzzles**.rkt
- zeroes represent empty cells
- cell values must be *decimal*, even if your puzzle is a hexadoku
- insert your own sudoku (of any board size N), for example like so:

(define userSudoku '(
0 2 0  0 0 8  0 6 5
0 0 1  3 4 0  0 0 0
0 9 8  2 0 5  0 0 0

0 0 0  0 0 0  8 0 0
0 0 0  9 5 0  0 0 2
2 7 0  8 1 3  5 0 6

0 4 0  6 0 0  9 0 8
1 8 7  0 0 9  6 2 0
9 6 0  4 0 2  0 0 0
))

#####  2. Run the solver.
- while running **run**.rkt, use **solve** to solve your puzzle like so: **(solve userSudoku)**
- if a solution exists, it will be printed to standard output
