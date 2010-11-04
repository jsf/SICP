(define (square n)
  (* n n))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (fermat-fooler-iter a n)
  (if (= a 1) true
      (and (= (expmod a n n) a)
           (fermat-fooler-iter (- a 1) n))))

(define (fermat-fooler n)
  (fermat-fooler-iter (- n 1) n))

(fermat-fooler 561)
(fermat-fooler 1105)
(fermat-fooler 1729)
(fermat-fooler 2465)
(fermat-fooler 6601)
