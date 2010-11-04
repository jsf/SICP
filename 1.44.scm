(define (compose f g)
  (lambda (n) (f (g n))))

(define (repeated f n)
  (if (= n 1)
      (lambda (x) (f x))
      (compose f (repeated f (- n 1)))))

(define (average x y z)
  (/ (+ x y z) 3))

(define dx 1.0)

(define (smooth f)
  (lambda (x) (average (f (- x dx)) (f x) (f (+ x dx)))))

(define (square n) (* n n))
((smooth square) 1)

(define (n-smooth f n)
  ((repeated smooth n) f))

((n-smooth square 10) 1)
