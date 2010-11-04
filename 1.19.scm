; p' = p^2 + q^2
; q' = q^2 + 2pq

;0 1 2 3 4 5 6  7  8  9 10 11  12
;0 1 1 2 3 5 8 13 21 34 55 89 144

(define (square x)
  (* x x))

(define (fib n)
  (fib-iter 1 0 0 1 n))
(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (square p) (square q))
                   (+ (square q) (* 2 p q))
                   (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))

(fib 4)
(fib-iter 1 0 0 1 4)
(fib-iter 1 0 1 1 2)
(fib-iter 1 0 2 3 1)
(fib-iter 5 3 2 3 0)
3