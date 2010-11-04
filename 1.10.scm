(define (A x y)
  (cond ((= y 0) 0)
	((= x 0) (* 2 y))
	((= y 1) 2)
	(else (A (- x 1)
		 (A x (- y 1))))))

(A 1 10)
;1024

(A 2 4)
;65536

(A 3 3)
;65536

(define (f n) (A 0 n))
;Computes 2*n from the definition of A

(define (g n) (A 1 n))
;;Examples:
;n (g n) 
;0 0
;1 2
;2 4
;3 8
;4 16
;5 32
;;Proof:
;If n>0 computes 2^n:
;i. b. (g 1) = 2
;h. i. (g n) (A 1 n) = 2^n
;P. d. (g (+ n 1)) = 2^(+ n 1)
;(g (+ n 1))
;(A 1 (+ n 1))
;(A 0 (A 1 n))
;(* 2 (A 1 n))
;(* 2 (exp 2 n))
;(exp 2 (+ n 1))

(define (h n) (A 2 n))
(h 1)
;;n (h n)
;0 0
;1 2=2^1=2
;2 4=2^2=2^2=2^h(1)
;3 16=2^4=2^(2^2)=h(2)
;4 65536=2^16=2^(2^(2^2))=h(3)
;5 A very big number
;;Expansion:
;(h n)
;(A 2 n)
;(A 1 (A 2 (- n 1)))
;(A 1 (A 1 (A 1 (- (A 2 (- n 1))))))
;;Another one:
;(h 1)
;(A 2 1)
;2
;;Proof:
;If n>1 (h n) computes 2^(h (- n 1))
;i. b. (h 2) = 4 = 2^2 = 2^(h 1)
;i. h. (hn ) = 2^(h (- n 1))
;P.d. (h (+ n 1)) = 2^(h n)
;(h (+ n 1))
;(A 2 (+ n 1))
;(A 1 (A 2 n))
;(A 1 (h n))
;From previous exercise:
;2^(h n)
;q.e.d.



(define (k n) (* 5 nn))
;Computes 5n^2
