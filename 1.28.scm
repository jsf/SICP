
(define (square n)
  (* n n))

(define (divides? a b)
  (= (remainder b a) 0))

;;    (if (or (= x 1) (= x (- m 1))) 0

;; (define (expmod base exp m)
;;   (define (even-case x)
;;     (if (= x 1) 0
;;         x))
;;   (cond ((= exp 0) 1)
;;         ((even? exp)
;;          (even-case (remainder (square (expmod base (/ exp 2) m)) m)))
;;         (else
;;          (remainder (* base (expmod base (- exp 1) m))
;;                     m))))

(define (expmod base exp m)
  (define (even-case x)
    (if (and (not (or (= x 1)
                      (= x (- m 1))))
             (= (remainder (square x) m) 1))
        0
        (remainder (square x) m)))
  (cond ((= exp 0) 1)
        ((even? exp)
         (even-case (expmod base (/ exp 2) m)))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (miller-rabin-test n)
  (define (try-it a)
    (= (expmod a (- n 1) n) 1))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((miller-rabin-test n) (fast-prime? n (- times 1)))
        (else false)))
