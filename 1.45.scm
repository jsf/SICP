(define tolerance 0.00001)
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

(define (compose f g)
  (lambda (n) (f (g n))))
(define (repeated f n)
  (if (= n 1)
      (lambda (x) (f x))
      (compose f (repeated f (- n 1)))))

(define (average x y)
  (/ (+ x y) 2))
(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (sqrt x)
  (fixed-point (lambda (y) (average y (/ x y)))
               1.0))
(sqrt 4)

(define (log2 n)
  (/ (log n) (log 2)))

(define (root-3 x)
  (fixed-point (lambda (y) (average y (/ x (expt y 2))))
               1.0))
(root-3 27)

(define (root-4 x)
  (fixed-point (lambda (y) (average y (average y (/ x (expt y 3)))))
               1.0))
(root-4 16)

(define (root-5 x)
  (fixed-point (lambda (y) (average y (average y (/ x (expt y 4)))))
               1.0))
(root-5 32)

(define (root-6 x)
  (fixed-point (lambda (y) (average y (average y (/ x (expt y 5)))))
               1.0))
(root-6 64)


;;root-n
(define (root-n n x)
  (fixed-point (lambda (y) (/ x (expt y (- n 1))))
               1.0))
;none work

(define (root-n n x)
  (fixed-point (lambda (y) (average y (/ x (expt y (- n 1)))))
               1.0))
(root-n 2 4)
(root-n 3 8)

(define (root-n n x)
  (fixed-point (lambda (y) (average y (average y (/ x (expt y (- n 1))))))
               1.0))
(root-n 4 16)
(root-n 5 32)
(root-n 6 64)
(root-n 7 128)

(define (root-n n x)
  (fixed-point (lambda (y) (average y (average y (average y (/ x (expt y (- n 1)))))))
               1.0))
(root-n 8 256)
(root-n 9 512)
(root-n 10 1024)
(root-n 11 2048)
(root-n 12 4096)
(root-n 13 8192)
(root-n 14 16384)
(root-n 15 32768)
(define (root-n n x)
  (fixed-point (lambda (y) (average y (average y (average y (average y (/ x (expt y (- n 1))))))))
               1.0))
(root-n 16 65536)

1  2  3  4  5  6
2  4  8 16 32 64

;missing: (expt y (- n 1))
(define (root-n n x)
  (fixed-point ((repeated average-damp (floor (log2 n)))
                (lambda (y) (/ x (expt y (- n 1)))))
               1.0))

;;test
(average-damp (average-damp f))
(average-damp (lambda (x) (average x (f x))))
(lambda (x) (average x ((lambda (x) (average x (f x))) x)))
(lambda (x) (average x (average x (f x))))
(define (add1 n)
  (+ n 1))
