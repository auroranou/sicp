(define (double x) (* x 2))
(define (even? x) (= (remainder x 2) 0))
(define (halve x) (/ x 2))

(define (multiply a b)
  (cond ((= b 0)
          0)
        ((even? b)
          (+ (double a) (multiply a (- b 2))))
        (else
          (+ (halve (double a)) (multiply a (- b 1))))))