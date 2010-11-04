(define (cons a b)
  (* (expt 2 a) (expt 3 b)))

(define (car c)
  (if (not (= (modulo c 2) 0))
      0
      (+ (car (/ c 2)) 1)))

(define (cdr c)
  (if (not (= (modulo c 3) 0))
      0
      (+ (cdr (/ c 3)) 1)))

;> (cons 1 0)
;2
;> (cons 2 0)
;4
;> (cons 3 0)
;8
;> (cons 4 0)
;16
;> (cons 5 0)
;32
;> (cons 6 0)
;64
;> (cons 0 0)
;1
;> (cons 0 1)
;3
;> (cons 0 2)
;9
;> (cons 0 3)
;27
;> (cons 0 4)
;81
;> (cons 0 5)
;243
;> (cons 0 6)
;729
;> (/ 12 3)
;4
;
;> (cons 4 3)
;432
;> (/ 432 2)
;216
;> (/ (/ (/ 432 2) 2) 2)
;54
;> (/ (/ (/ (/ 432 2) 2) 2) 2)
;27
;> (/ (/ (/ (/ (/ 432 2) 2) 2) 2) 2)
;27/2
;> (/ (/ (/ (/ 432 3) 3) 3) 3)
;16/3
;> (/ (/ (/ 432 3) 3) 3)
;16
;> (/ (/ 432 3) 3)
;48
;> (/ 432 3)
;144