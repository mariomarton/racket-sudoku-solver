; This is where unsolved puzzles for solving can be stored.

; Zero represents an empty cell

; ***
; *** ↓↓↓

; INSERT YOUR PUZZLES HERE

; you can use this empty 9x9 template:
(define userPuzzle '(
0 0 0  0 0 0  0 0 0
0 0 0  0 0 0  0 0 0
0 0 0  0 0 0  0 0 0

0 0 0  0 0 0  0 0 0
0 0 0  0 0 0  0 0 0
0 0 0  0 0 0  0 0 0

0 0 0  0 0 0  0 0 0
0 0 0  0 0 0  0 0 0
0 0 0  0 0 0  0 0 0
))

; *** ↑↑↑




; ***
; EXAMPLE PUZZLES

; Example for N=1
    ; N=1 is a bonus custom case with 4 cells and 4 boxes (sections)
(define exampleTiny '(
0 0
0 1  
))

; Example for N=2
(define exampleSmall '(
1 0  2 0
0 0  0 0

3 0  4 0
0 0  0 3
))

; Six examples for N=3
; A basic sudoku (it has multiple solutions)
(define exampleNormal '(
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

; "Typical sudoku" from en.wikipedia.org/wiki/Sudoku
(define exampleTypical '(
5 3 0  0 7 0  0 0 0
6 0 0  1 9 5  0 0 0
0 9 8  0 0 0  0 6 0

8 0 0  0 6 0  0 0 3
4 0 0  8 0 3  0 0 1
7 0 0  0 2 0  0 0 6

0 6 0  0 0 0  2 8 0
0 0 0  4 1 9  0 0 5
0 0 0  0 8 0  0 7 9
))

; Medium difficulty sudoku from Daily Telegraph newspaper archives
(define exampleMedium '(
0 2 0  6 0 8  0 0 0
5 8 0  0 0 9  7 0 0
0 0 0  0 4 0  0 0 0

3 7 0  0 0 0  5 0 0
6 0 0  0 0 0  0 0 4
0 0 8  0 0 0  0 1 3

0 0 0  0 2 0  0 0 0
0 0 9  8 0 0  0 3 6
0 0 0  3 0 6  0 9 0
))

; Hard - "Challenge 2" from sandiway.arizona.edu/sudoku/examples.html
(define exampleHard '(
2 0 0  3 0 0  0 0 0
8 0 4  0 6 2  0 0 3
0 1 3  8 0 0  2 0 0

0 0 0  0 2 0  3 9 0
5 0 7  0 0 0  6 2 1
0 3 2  0 0 6  0 0 0

0 2 0  0 0 9  1 4 0
6 0 1  2 5 0  8 0 9
0 0 0  0 0 1  0 0 2
))

; Very hard - "Challenge 1" from sandiway.arizona.edu/sudoku/examples.html
; (may take around 30 seconds)
(define exampleVeryHard '(
0 2 0  0 0 0  0 0 0
0 0 0  6 0 0  0 0 3
0 7 4  0 8 0  0 0 0

0 0 0  0 0 3  0 0 2
0 8 0  0 4 0  0 1 0
6 0 0  5 0 0  0 0 0

0 0 0  0 1 0  7 8 0
5 0 0  0 0 9  0 0 0
0 0 0  0 0 0  0 4 0
))

; "World's hardest sudoku" by Arto Inkala
(define exampleArto '(
0 0 5  3 0 0  0 0 0
8 0 0  0 0 0  0 2 0
0 7 0  0 1 0  5 0 0

4 0 0  0 0 5  3 0 0
0 1 0  0 7 0  0 0 6
0 0 3  2 0 0  0 8 0

0 6 0  5 0 0  0 0 9
0 0 4  0 0 0  0 3 0
0 0 0  0 0 9  7 0 0
))

; Example for N=4
(define exampleHexadoku '(
 1  0  0  0     0  0 12 11     4  0  7  9    0  6  3 10  
 6  7 12  2    10 13 14  4    16  0  1 15    5  0  0  0  
 0  0  0  0     0  0 16 15     0  0 10 11    0  7  2  4  
11 14  4 10     0  0  0  0     0  0 13  2   12 16 15  1  

14  0  0  4     0  16 9  0     0 13  8  3    0 15  6  2  
13  3  2  0     4  0  8 12     9 10 14  6    0 11  1  7  
10  6 15  9     7  0  3 13     2  1 11 16    0 12  8  5  
 0  1  0  0     2  0 11  6     0  5 12  4    0 13  9 14  

 0  0  0  7     0  0   5 9     0 15  0  0    1  4  10 8  
16 15 14 12     0  0  10 8     0  9  5 13    6  0  7 11  
 4  8 10 11    16  6  15 1    12  2  3  7    9  0 14 13  
 9  5  1  6    14  7  13 2    10 11  4  8   15  0 16 12  

 0  0  0  0     0  0  6  0     0  0  0  0    0  0 13 15  
 0  0 16  8    13 11  1 14     3  7 15  5    0  0  4  6  
 2 13  6  1    15  3  4  7    14  8  9 12   11 10  5 16  
15 11  5 14     9  8  2 16     0  4  6 10    7  1 12  3  
))