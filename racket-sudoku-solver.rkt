; This is the main file including all the solver functions.

(define (N_SQUARED N)
  (cond [(= N 1) 2] ; special case because for N=1, there are 2 cells in a row
        [else (* N N)]))

(define (cellsAmount N) (* (N_SQUARED N) (N_SQUARED N)))

(define (fullSet N) (range 1 (+ 1 (N_SQUARED N))))
(define (fullSetIdx N) (range 0 (N_SQUARED N)))

(define (firstColIndexes N)
  (map (lambda (elem)
         (* (N_SQUARED N) elem))
       (fullSetIdx N))
)

; printSudoku and its helper functions
(define (printSudoku sudoku N)
  (cond [(eq? N 1) (printTiny sudoku)]
        [else (printSudokuAux sudoku -1 #t N)]))

(define (appendIndexes row)
          (for/list ([i row]) (list i (index-of row i))))

(define (rowPrint row N)
  (for-each (lambda (elem)(if(eq? (remainder (car(cdr elem)) N) (- N 1))
                              (printf "~a  " (car elem))
                              (printf "~a " (car elem))
              )) row)
  (printf "\n")
  
)

(define (printSudokuAux sudoku row f N)
 (cond
  [(= (+ 1 row) (N_SQUARED N)) (display "")]
  [else (printSudokuAux sudoku (+ 1 row)
              (printSudokuRow (getValues (getRowIndexes (+ 1 row) N) sudoku ) 1 (+ 1 row) N) N)]
))

(define (printSudokuRow row f rowIdx N)
  (if (and (eq? (remainder rowIdx N) 0) (> rowIdx 0)) 
      (printSudokuRow row (displayln "") (+ 1 N) N)
      (rowPrint (appendIndexes row) N)
))

(define (printTiny s)
  (printf "~a ~a\n~a ~a\n" (getElem 0 s) (getElem 1 s) (getElem 2 s) (getElem 3 s)))
; end of printSudoku section

(define (removeZeroes s) (remove* (list 0) s) )

; checks whether box/row/col is OK
(define (setCorrect s)
  (if(eq?(check-duplicates (removeZeroes s)) #f)
     #t
     #f
))     

(define (getElem idx sudoku)
  (list-ref sudoku idx)
)

; get idxs of row n
(define (getRowIndexes row N)
  (map (lambda (elem)
         (+ (* row (N_SQUARED N)) elem))
       (fullSetIdx N))
)

; get idxs of col n
(define (getColIndexes col N)
  (map (lambda (elem)
         (+ col elem))
       (firstColIndexes N))
)

; get idxs of box n
(define (boxRow box N) (quotient box N))
(define (boxCol box N) (- box (* N (boxRow box N))))

(define (startRow box N) (* (boxRow box N) N))
(define (startCol box N) (* (boxCol box N) N))

(define (endRow box N) (+ (startRow box N) (- N 1)))
(define (endCol box N) (+ (startCol box N) (- N 1)))

(define (getRows curIdx maxIdx acc N) ; get all indexes of cells that are in rows that the box is in
(cond                               ; for ex. : N=3 and box=0 -> return idxs of all cells in rows 0,1,2
  [(> curIdx maxIdx) acc]
  [else (getRows (+ 1 curIdx) maxIdx (append acc (getRowIndexes curIdx N)) N)]))

(define (getCols curIdx maxIdx acc N) ; same as getRows, but for columns
  (cond
    [(> curIdx maxIdx) acc]
    [else (getCols (+ 1 curIdx) maxIdx (append acc (getColIndexes curIdx N)) N)]))

(define (getBoxIndexes box N)        ; get idxs of box n by intersecting getRows and getCols
  (set-intersect (getRows (startRow box N) (endRow box N) '() N)
                 (getCols (startCol box N) (endCol box N) '() N)))
; end of getting idxs of box n


(define (getValues indexes arr)
 (reverse(getValuesAux indexes arr '()))
)

(define (getValuesAux indexes arr acc)
 (if (empty? indexes)                     
      acc  
 (getValuesAux (cdr indexes) arr (cons (getElem (car indexes) arr) acc))
))

; is Box/Col/Row n okay?
(define (boxOK b sudoku N)
 (setCorrect (getValues (getBoxIndexes b N) sudoku))
)

(define (rowOK r sudoku N)
 (setCorrect (getValues (getRowIndexes r N) sudoku))
)

(define (colOK c sudoku N)
 (setCorrect (getValues (getColIndexes c N) sudoku))
)

; get index of Box/Col/Row in which element at IDX is
(define (getRowNum idx N)
  (quotient idx (N_SQUARED N))
)

(define (getColNum idx N)
    (remainder idx (N_SQUARED N))
  )

(define (getBoxRow idx N)
  (quotient (getRowNum idx) N)
  )

(define (getBoxCol idx N)
  (quotient (getColNum idx) N)
  )

(define (getBoxNum idx N)
    ( + (* (getBoxRow idx) N) (getBoxCol idx))
)

; is Box/Col/Row, where element with IDX is, OK?
(define (newRowOK sudoku idx N) (rowOK (getRowNum idx N) sudoku N))

(define (newColOK sudoku idx N) (colOK (getColNum idx N) sudoku N))

(define (newBoxOK sudoku idx N) (boxOK (getColNum idx N) sudoku N))

(define (placementOK sudoku idx N)
  (if(not (newRowOK sudoku idx N)) #f
     (if(not (newColOK sudoku idx N)) #f
         (if(not (newBoxOK sudoku idx N)) #f
             #t ))))

; gets the last 0 value from arr before idx
(define (getLastSetIdx arr idx)
  (cond
    [ (<= idx 0) -1]
    [ (eq? (getElem (- idx 1) arr) 0) (- idx 1)]
    [ else (getLastSetIdx arr (- idx 1)) ]
    ))

; section for checking if the whole puzzle is ok
; this is only done once to check if input is legal
(define (allBoxesOK sudoku N)
  (if (empty? (set-intersect (allBoxesOKaux sudoku '() 0 N) '(#f))) #t #f)
)

(define (allBoxesOKaux sudoku acc idx N)
  (if(= idx (N_SQUARED N)) acc 
  (allBoxesOKaux sudoku (cons (boxOK idx sudoku N) acc) (+ 1 idx) N)
))

(define (allRowsOK sudoku N)
  (if (empty? (set-intersect (allRowsOKaux sudoku '() 0 N) '(#f))) #t #f)
)

(define (allRowsOKaux sudoku acc idx N)
  (if(= idx (N_SQUARED N)) acc 
  (allRowsOKaux sudoku (cons (rowOK idx sudoku N) acc) (+ 1 idx) N)
))

(define (allColsOK sudoku N)
  (if (empty? (set-intersect (allColsOKaux sudoku '() 0 N) '(#f))) #t #f)
)

(define (allColsOKaux sudoku acc idx N)
  (if(= idx (N_SQUARED N)) acc 
  (allColsOKaux sudoku (cons (colOK idx sudoku N) acc) (+ 1 idx) N)
))

(define (sudokuOK sudoku N)
(if(not (allRowsOK sudoku N)) #f  (if (not (allColsOK sudoku N)) #f (if (not (allBoxesOK sudoku N)) #f #t ))))

(define (sudokuSizeOK N)
  (cond
    ;returns #f if N isn't natural;
    [(< N 1) #f]
    [(not(integer? N)) #f]
    [else #t]))


; Now, two main functions for the solving itself, primaryLoop & tryNumber

(define (tryNumber curNum maxNum sudoku idx ogSudoku N)
  ; tries to replace the number in the cell with number + 1 (curNum is number + 1)
  ; maxNum is the highest possible cell value (9 in classic sudoku)
  ; ogSudoku is the original unsolved sudoku matrix, unedited
  
  ; if backtracking:
  (if (> curNum maxNum)
      (let ([lastSetIdx (getLastSetIdx ogSudoku idx)])
          (tryNumber (+ 1 (getElem lastSetIdx sudoku)) maxNum (list-set sudoku idx 0) lastSetIdx ogSudoku N)
        )
  ; if not backtracking:   
   (if (placementOK (list-set sudoku idx curNum) idx N)
       (primaryLoop (list-set sudoku idx curNum) (+ 1 idx) ogSudoku N)
       (tryNumber (+ 1 curNum) maxNum sudoku idx ogSudoku N)
)))

(define (primaryLoop sudoku idx ogSudoku N)
   ;if done & sudoku is solved, print it
  (if(>= idx (cellsAmount N))
          (printSudoku sudoku N)
          ;else continue solving
          (if(= (getElem idx sudoku) 0)
             (tryNumber 1 (N_SQUARED N) sudoku idx ogSudoku N)
             (primaryLoop sudoku (+ 1 idx) ogSudoku N)
             ))
)

(define (solve sudoku)

  (let ([N (getN sudoku)])
    
  (cond
  [(not(sudokuSizeOK N)) (printf "Oops, this sudoku isn't of size N^2 * N^2.\nTo solve this puzzle, try redefining N.")]
  [(not(sudokuOK sudoku N)) (displayln "Oops, illegal input.")]
  [else (primaryLoop sudoku 0 sudoku N)]
)))

;returns N based on sudoku on input
(define (getN sudoku)
  (cond
  [(eq? 4 (length sudoku)) 1]
  [else (sqrt (sqrt (length sudoku)))]
))

