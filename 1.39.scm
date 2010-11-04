(define (cont-frac n d k)
  (define (aux i)
    (if (> i k)
        0
        (/ (n i) (+ (d i) (aux (+ i 1))))))
  (aux 1))

(define (square n)
  (* n n))

;1  2  3  4  5  6  7  8  9 10
;1  3  5  7  9 11 13 15 17 19
(define (tan-cf x k)
  (define (n i)
    (if (= i 1)
        x
        (- (square x))))
  (define (d i)
    (- (* 2 i) 1))
  (cont-frac n
             d
             k))

;tan(1)=1.5574077246549022305069748074583601730872507723815200383839...
