;TODO: Find out how to load another file and load 1.6.scm

(define (average x y)
  (/ (+ x y) 2))

(define (square x)
  (* x x))

(define (improve guess x)
  (average guess (/ x guess)))
;;;;Updated functions
(define (good-enough? guess old_guess)
  (< (abs (- guess old_guess)) .01))

(define (sqrt-iter guess old_guess x)
  (if (good-enough? guess old_guess)
      guess
      (sqrt-iter (improve guess x)
                 guess
                 x)))

(define (sqrt x)
  (sqrt-iter 1.0 0.0 x))
;;;;Updated functions

(sqrt 9)
(sqrt (+ 100 37))
(sqrt (+ (sqrt 2) (sqrt 3)))
(square (sqrt 1000))

(sqrt .004)
(sqrt .0004)
(sqrt 4e46)

