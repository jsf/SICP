(define (f n)
  (cond ((< n 3) n)
	(else (+ (f (- n 1)) (f (- n 2)) (f (- n 3))))))

(define (fi n)
  (define (fi-iter a b c i)
    (cond ((= n i) c)
          (else (fi-iter (+ a b c) a b (+ i 1)))))
  (fi-iter 3 2 1 1))
