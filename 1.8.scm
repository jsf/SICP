;TODO: Find out how to load another file and load 1.7.scm

(define (square x)
  (* x x))

(define (cube x)
  (* x x x))

(define (improve guess x)
  (/ (+ (/ x (square guess))
        (* 2 guess))
     3))

(define (good-enough? guess old_guess)
  (< (abs (- guess old_guess)) .01))

(define (cbrt-iter guess old_guess x)
  (if (good-enough? guess old_guess)
      guess
      (cbrt-iter (improve guess x)
                 guess
                 x)))

(define (cbrt x)
  (cbrt-iter 1.0 0.0 x))

(cbrt 27)

