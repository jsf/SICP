(define (mult a b)
  (if (= b 0)
      0
      (+ a (* a (- b 1)))))

(define (double a)
  (* a 2))

(define (halve a)
  (/ a 2))

(define (fast-mult a b)
  (cond ((= b 0) 0)
        ((even? b) (double (fast-mult a (halve b))))
        (else (+ (fast-mult a (- b 1)) a))))

(fast-mult 2 3)
(+ (fast-mult 2 2) 2)
(+ (double (fast-mult 2 1)) 2)
(+ (double (+ (fast-mult 2 0) 2)) 2)
(+ (double (+ 0 2)) 2)
(+ (double 2) 2)
(+ 4 2)
6