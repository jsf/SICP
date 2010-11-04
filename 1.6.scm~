(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(new-if (= 2 3) 0 5)

(new-if (= 1 1) 0 5)

(define (average x y)
  (/ (+ x y) 2))

(define (square x)
  (* x x))

(define (improve guess x)
  (average guess (/ x guess)))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt-iter guess x)
  (begin (print guess)
         (newline))
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))
(sqrt 4e44)

(define (sqrt x)
  (sqrt-iter 1.0 x))

(sqrt 9)
(sqrt (+ 100 37))
(sqrt (+ (sqrt 2) (sqrt 3)))
(square (sqrt 1000))

(sqrt .004)
(sqrt 4e46)

(* .2 .2)

;(define (sqrt-iter guess x)
; (new-if (good-enough? guess x)
;         guess
;         (sqrt-iter (improve guess x)
;                    x)))
