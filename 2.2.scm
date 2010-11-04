(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (print-segment s)
  (print-point (start-segment s))
  (print-point (end-segment s)))

;Segment
(define (make-segment s e)
  (cons s e))

(define (start-segment s)
  (car s))

(define (end-segment s)
  (cdr s))

;Point
(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

(define (midpoint-segment s)
  (let ((s (start-segment s)) (e (end-segment s)))
    (make-point (/ (+ (x-point s) (x-point e)) 2 )
                (/ (+ (y-point s) (y-point e)) 2))))

(define s (make-point 1 1))
(define e (make-point 2 2))
(print-point s)
(print-point e)
(define a (make-segment s e))
(print-segment a)
(print (midpoint-segment a))
