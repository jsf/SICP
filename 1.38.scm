(define (cont-frac n d k)
  (define (aux i)
    (if (> i k)
        0
        (/ (n i) (+ (d i) (aux (+ i 1))))))
  (aux 1))

;    0        1        2        3        4        5
;    1        2        3        4        5        6
; 1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17
; 1  2  1  1  4  1  1  6  1  1  8  1  1 10  1  1 12

(define (n i) 1.0)
;Wrong:
(define (d i)
  (if (= (remainder (+ i 1) 3) 0)
      (- i (- (floor (/ i 2.0)) 1.0))
      1.0))
;Right:
(define (d i)
  (if (= (remainder (+ i 1) 3) 0)
      (- i (- (/ (+ i 1)
                 3)
              1))
      1.0))
;Another option:
(define (d i)
  (if (= (remainder (+ i 1) 3) 0)
      (/ (+ (* 2 i) 2)
         3)
      1.0))

(define e 2.7182818284590452353602874713526624977572470936999595749669)
(- e 2)
;0.7182818284590455
 0.7182818284590453

(cont-frac n d 1000)
