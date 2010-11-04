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

(define (length-segment s)
  (let ((start-segment (start-segment s)) (end-segment (end-segment s)))
    (let ((x-point-start (x-point start-segment)) (y-point-start (y-point start-segment))
          (x-point-end (x-point end-segment)) (y-point-end (y-point end-segment)))
      (let ((x-length (- x-point-end x-point-start)) (y-length (- y-point-end y-point-start)))
        (sqrt (+ (expt x-length 2) (expt y-length 2)))))))

(length-segment (make-segment (make-point 0 0) (make-point 20 0)))
(length-segment (make-segment (make-point 1 1) (make-point 1 20)))
(length-segment (make-segment (make-point 1 1) (make-point 6 1)))
(length-segment (make-segment (make-point 1 1) (make-point 2 2)))

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

;Rectangle
(define (make-rectangle w h)
  (cons w h))

(define (width r)
  (car r))

(define (height r)
  (cdr r))

(define (perimeter r)
  (+ (* (length-segment (width r)) 2) (* (length-segment (height r)) 2)))

(define (area r)
  (* (length-segment (width r)) (length-segment (height r))))

(define bottom-left (make-point 0 0))
(define bottom-right (make-point 3 0))
(define top-left (make-point 0 2))

(define rectangle-width (make-segment bottom-left bottom-right))
(define rectangle-height (make-segment bottom-left top-left))

(define rectangle (make-rectangle rectangle-width rectangle-height))

(perimeter rectangle)

(area rectangle)

;Another representation
(define (make-rectangle w h)
  (let ((bottom-left (start-segment w)) (bottom-right (end-segment w)) (top-left (end-segment h)))
    (cons bottom-left (cons bottom-right top-left))))

(define (bottom-left-rectangle r)
  (car r))
(define (bottom-right-rectangle r)
  (car (cdr r)))
(define (top-left-rectangle r)
  (cdr (cdr r)))

(define (width r)
  (make-segment (bottom-left-rectangle r) (bottom-right-rectangle r)))
(define (height r)
  (make-segment (bottom-left-rectangle r) (top-left-rectangle r)))

(define (perimeter r)
  (+ (* (length-segment (width r)) 2) (* (length-segment (height r)) 2)))

(define (area r)
  (* (length-segment (width r)) (length-segment (height r))))
 
(define bottom-left (make-point 0 0))
(define bottom-right (make-point 3 0))
(define top-left (make-point 0 2))

(define rectangle-width (make-segment bottom-left bottom-right))
(define rectangle-height (make-segment bottom-left top-left))

(define rectangle (make-rectangle rectangle-width rectangle-height))

(perimeter rectangle)

(area rectangle)
