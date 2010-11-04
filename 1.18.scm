(define (double a)
  (* a 2))

(define (halve a)
  (/ a 2))

(define (fast-mult-iter a b c)
  (cond ((= b 0) c)
        ((even? b) (fast-mult-iter (double a) (halve b) c))
        (else (fast-mult-iter (double a) (halve (- b 1)) (+ a c)))))

(define (fast-mult a b)
  (fast-mult-iter a b 0))
