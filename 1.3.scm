(define (square x)
  (* x x))

(square 2)
(square (square 3))

(define (sum-of-squares x y)
  (+ (square x) (square y)))

(sum-of-squares 2 2)
(sum-of-squares 3 4)

(define (f x y z)
  (sum-of-squares (cond ((and (> x y) (> x z)) x)
                        ((and (> y x) (> y z)) y)
                        (else z))
                  (cond ((and (> x y) (< x z)) x)
                        ((and (> y x) (< y z)) y)
                        (else z))))

(f 1 2 3)
(f 5 -3 -2)
(f 1 1 1)
(f 1 2 2)
