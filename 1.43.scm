(define (repeated f n)
  (if (= n 1)
      (lambda (x) (f x))
      (lambda (x) (f ((repeated f (- n 1))
                      x)))))

;With compose:
(define (compose f g)
  (lambda (n) (f (g n))))

(define (reapeated f n)
  (if (= n 1)
      (lambda (x) (f x))
      (compose f (repeated f (- n 1)))))

(define (square n)
  (* n n))

((repeated square 2) 5)
;625