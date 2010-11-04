(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (make-rat n d)
  (let ((g (gcd n d))
        (sign (if (>= (* n d) 0) 1
                  -1)))
    (cons (* sign (abs (/ n g))) (abs (/ d g)))))

(make-rat  1  2)
(make-rat -1  2)
(make-rat  1 -2)
(make-rat -1 -2)