(define (square x)
  (* x x))

(define (even? n)
  (= (remainder n 2) 0))

(define (fast-expt-iter b n a)
  (cond ((= n 0) a)
        ((even? n) (fast-expt-iter (square b) (/ n 2) a))
        (else (fast-expt-iter (square b) (/ (- n 1) 2) (* b a)))))

(define (fast-expt b n)
  (fast-expt-iter b n 1))


(define (expmod-orig base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod-orig base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod-orig base (- exp 1) m))
                    m))))

(define (expmod base exp m)
  (remainder (fast-expt base exp) m))

