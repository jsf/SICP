
(define (filtered-accumulate combiner null-value filter term a next b)
  (if (> a b)
      null-value
      (combiner (if (filter a) (term a) null-value)
                (filtered-accumulate combiner null-value
                                     filter term (next a) next b))))

;a.
;load 1.24.scm
(define (sum-square-primes a b)
  (define (next n) (+ n 1))
  (define (square n) (* n n))
  (filtered-accumulate + 0 prime? square a next b))

;b.
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (product-relative-prime n)
  (define (next i) (+ i 1))
  (define (filter i) (= (gcd i n) 1))
  (define (identity i) i)
  (filtered-accumulate * 1 filter identity 1 next n))