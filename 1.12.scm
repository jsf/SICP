(define (pt x y)
  (cond ((= y 1) 1)
        ((= x y) 1)
        (else (+ (pt (- x 1) (- y 1)) (pt (- x 1) y)))))
