(define tolerance 0.00001)
(define (average x y)
  (/ (+ x y) 2))
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (display guess)
    (newline)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (newline)
  (try first-guess))

;(fixed-point cos 1.0)
;(fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0)

(fixed-point (lambda (x) (/ (log 1000) (log x))) 1.1)
;4.555538934848503
;Took 38 iterations
(fixed-point (lambda (x) (average x (/ (log 1000) (log x)))) 1.1)
;4.555536364911781
;Took 14 iterations
