(define (cube x) (* x x x))
(define (p x) (- (* 3 x) (* 4 (cube x))))
(define (sine angle)
   (if (not (> (abs angle) 0.1))
       angle
       (p (sine (/ angle 3.0)))))

(define (test-sine n)
  (cond ((= n 0) (printf "~v~n" (caddr (time-apply sine '(0)))))
        (else (printf "~v~n" (caddr (time-apply sine (list n))))
              (test-sine (- n 1)))))

(sine 12.15)
(p (sine 4.05))
(p (p (sine 1.35)))
(p (p (p (sine 0.45))))
(p (p (p (p (sine 0.15)))))
(p (p (p (p (p (sine 0.05))))))
(p (p (p (p (p 0.05)))))
(p (p (p (p 0.1495))))
(p (p (p 0.43513455)))
(p (p 0.9758465328))
(p -0.78956311137)
-0.3998
