;a.
(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

(define (identity x) x)
(define (inc n) (+ n 1))

(define (factorial n)
  (product identity 1 inc n))

  (define (pi-term x)
    (* x x))
  (define (pi-next x)
    (+ x 2))

(define (pi n)
  (define (pi-term x)
    (* x x))
  (define (pi-next x)
    (+ x 2))
  (/ (* 4.0 2 (/ (product pi-term 4 pi-next n ) n))
     (product pi-term 3 pi-next (- n 1))))

(define (pi n)
  (define (pi-term x)
    (/ (* x (+ x 2))
       (* (+ x 1) (+ x 1))))
  (define (pi-next x)
    (+ x 2))
  (* 4.0 (product pi-term 2 pi-next n)))

;b.
(define (product term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* (term a) result))))
  (iter a 1))
