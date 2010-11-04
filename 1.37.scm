;a
;Not really, but cool none-the-less, gives you phi (see wikipedia entry for golden ratio):
(define (cont-frac n d k)
  (if (= k 1)
      (d k)
      (+ (d k) (/ (n (- k 1)) (cont-frac n d (- k 1))))))

;Works for n, d constant functions, not otherwise since we are doing it "upside down":
(define (cont-frac n d k)
  (if (= k 1)
      (/ (n k) (d k))
      (/ (n k) (+ (d (- k 1)) (cont-frac n d (- k 1))))))

;First
(define (cont-frac n d k)
  (define (aux n d i)
    (if (= i k)
        (/ (n i) (d i))
        (/ (n i) (+ (d i) (aux n d (+ i 1))))))
  (aux n d 1))
;But we don't really need to pass n and d around:
(define (cont-frac n d k)
  (define (aux i)
    (if (= i k)
        (/ (n i) (d i))
        (/ (n i) (+ (d i) (aux (+ i 1))))))
  (aux 1))
;Other option:
(define (cont-frac n d k)
  (define (aux i)
    (if (> i k)
        0
        (/ (n i) (+ (d i) (aux (+ i 1))))))
  (aux 1))

;(define (cont-frac n d k)
;  (define (sub-expr i)
;    (if (= i k) 
;        (/ (n i) (d i))
;        (/ (n i) (+ (d i) (sub-expr (+ i 1))))))
;  (sub-expr 1))
;(define (cont-frac n d k)
;  (define (cont-frac-helper i)
;    (if (> i k)
;        0
;        (/ (n i) (+ (d i) (cont-frac-helper (+ i 1))))))
;  (cont-frac-helper 1))

;(define (golden-ratio k) 
;  (cont-frac (lambda (i) 1.0)
;             (lambda (i) 1.0)
;             k))
;
;(define (iterations-required)
;  (define (iter i previous)
;    (let ((current (golden-ratio i)))
;      (if (= (round (* current 10000))
;             (round (* previous 10000)))
;          (- i 1)
;          (iter (+ i 1) current))))
;  (iter 1 0.0))

(/ 1.0 1.6180)
;0.6180469715698392

(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           11)

(define (find-minimum-k)
  (define 1/phi (/ 1.0 1.6180))
  (define tolerance .00001) ;Takes too long for .000001
  (define (good-enough x)
    (< (abs (- 1/phi x)) tolerance))
  (define (try k)
    (cont-frac (lambda (i) 1.0)
               (lambda (i) 1.0)
               k))
  (define (aux x)
    (if (good-enough (try x))
        x
        (aux (+ x 1))))
  (aux 1))
(find-minimum-k)

;b
(define (cont-frac n d k)
  (define (aux n d i a)
    (if (= i 1)
        a
        ;(/ (n i) (+ (d i) (aux n d (+ i 1))))
        (aux n d (- i 1) (/ (n (- i 1)) 
                            (+ (d (- i 1)) a)))))
  (aux n d k (/ (n k) (d k))))
