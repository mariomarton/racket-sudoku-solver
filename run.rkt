; This is the file where the user can solve their puzzles.
; Puzzles can be stored in "puzzles.rkt"

#lang racket
(require racket/include)
(include "racket-sudoku-solver.rkt")
(include "puzzles.rkt")

; ***
; DEMO

(printf "Solution to exampleTiny: \n") (solve exampleTiny)

(printf "\nSolution to exampleSmall: \n") (solve exampleSmall)

(printf "\nSolution to exampleNormal: \n") (solve exampleNormal)
(printf "\nSolution to exampleTypical: \n") (solve exampleTypical)
(printf "\nSolution to exampleMedium: \n") (solve exampleMedium)
(printf "\nSolution to exampleHard: \n") (solve exampleHard)
(printf "\nSolution to exampleArto: \n") (solve exampleArto) ; takes a few seconds

(printf "\nSolution to exampleHexadoku \n") (solve exampleHexadoku)

#|

; uncomment the following line to see a solution to a harder puzzle that takes some time, maybe 30 seconds:
(printf "\nSolution to exampleVeryHard: \n") (solve exampleVeryHard)

|#

; END OF DEMO

; ***
; ↓↓↓ INSERT YOUR COMMANDS HERE ↓↓↓

; (printf "Solution to userPuzzle: \n") (solve userPuzzle)