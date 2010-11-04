
(define (square n)
  (* n n))

(define (divides? a b)
  (= (remainder b a) 0))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

;;mzscheme compatibility
(define (runtime) (current-milliseconds))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (cond ((fast-prime? n 1000)
         (report-prime (- (runtime) start-time)))))
(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (primes-in-range l h)
  (cond ((even? l) (primes-in-range (+ l 1) h))
        ((< l h)
         (timed-prime-test l)
         (primes-in-range (+ l 2) h))))

(define (n-primes-larger-than x n)
  (cond ((= n 0) 0)
        ((even? x) (n-primes-larger-than (+ x 1) n))
        ((fast-prime? x 1000)
         (timed-prime-test x)
         (n-primes-larger-than (+ x 2) (- n 1)))
        (else (n-primes-larger-than (+ x 2) n))))

(n-primes-larger-than 100000000 3)
(log 100000000)
(n-primes-larger-than 1000000000 3)
(log 1000000000)
(n-primes-larger-than 10000000000 3)
(log 10000000000)
(n-primes-larger-than 100000000000 3)
(log 100000000000)
