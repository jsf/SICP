(define (square x)
  (* x x))

(define (even? n)
  (= (remainder n 2) 0))

(define (fast-expt-iter b n a)
  (cond ((= n 0) 1)
;        ((even? n) (square))
        (else (fast-expt-iter (* (square b) (square b) (/ n 2) (square b))))))

;; (define (fast-expt-iter b n)
;;   (cond ((= n 1) b)
;;         (else (fast-expt-iter (* (square b) (square b)) (/ n 2)))))

(define (fast-expt-iter b n)
  (cond ((= n 1) b)
        ((even? n) (fast-expt-iter (square b) (/ n 2)))
        (else (* (fast-expt-iter (square b) (/ (- n 1) 2)) b))))

(fast-expt-iter 2 7)
(* (fast-expt-iter 4 3) 2)
(* (* (fast-expt-iter 16 1) 4) 2)
(* (* 16 4) 2)
(* 64 2)
128

(fast-expt-iter 2 5)
(* (fast-expt-iter 4 2) 2)
(* (fast-expt-iter 16 1) 2)
(* 16 2)
32

(define (fast-expt-iter b n a)
  (cond ((= n 0) a)
        ((even? n) (fast-expt-iter (square b) (/ n 2) a))
        (else (fast-expt-iter (square b) (/ (- n 1) 2) (* b a)))))

(fast-expt-iter 2 7 1)
(fast-expt-iter 4 3 2)
(fast-expt-iter 16 1 8)
(* 16 8)
128

(define (fast-expt b n)
  (fast-expt-iter b n 1))
