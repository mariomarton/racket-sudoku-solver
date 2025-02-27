





# racket-sudoku-solver

This Racket program solves any legal sudoku puzzle with any number of pre-filled cells. It supports boards of any size that follow the formula:

$$ n^2 \times n^2 \mid n \geq 1 $$

For example, a standard 9x9 sudoku board corresponds to $n = 3$.

The program does not use constraint solvers or Racket mutations such as the `set!` form. It also verifies that the input puzzle adheres to sudoku rules.

## Manual

### Configuration

Ensure the three `*.rkt` files are in the same directory:

-   **`run.rkt`** – Main file for executing commands.
-   **`puzzles.rkt`** – Stores example and user-defined puzzles.
-   **`racket-sudoku-solver.rkt`** – Contains all functions for solving puzzles.

### Running the Demo

This solver comes with a built-in demo that solves the 9 provided example puzzles. To run the demo, simply execute the **`run.rkt`** file.

### Solving Your Own Puzzle

#### 1. Provide a Puzzle

-   Open **`puzzles.rkt`**.
-   Use `0` to represent empty cells.
-   All cell values must be in _decimal format_, even for larger puzzles like Hexadoku.
-   Insert your sudoku puzzle in the following format:

```racket
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

```

#### 2. Run the Solver

-   While running **`run.rkt`**, use the `solve` function to solve your puzzle:
    
    ```racket
    (solve userSudoku)
    
    ```
    
-   If a solution exists, it will be printed to the standard output.

Now you're ready to solve sudoku puzzles of any size using Racket!
