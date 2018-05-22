(define (double x) (* x 2))
(define (even? x) (= (remainder x 2) 0))
(define (halve x) (/ x 2))

(define (multiply a b) (multiply-inner a b 0))

(define (multiply-inner a b sum)
  (cond ((= b 1)
          (+ a sum))
        ((even? b)
          (multiply-inner (double a) (halve b) sum))
        (else
          (multiply-inner (double a) (halve (- b 1)) (+ sum a)))))