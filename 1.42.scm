(define (compose f g)
  (lambda (n) (f (g n))))

(define (square n)
  (* n n))
(define (inc n)
  (+ n 1))

((compose square inc) 6)
;49
