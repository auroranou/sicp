;; Helpers
(define (even? n) (= (remainder n 2) 0))

(define (square x) (* x x))

;; Exponentiation example from SICP
(define (fast-expt b n)
  (cond ((= n 0) 
         1)
        ((even? n) 
         (square (fast-expt b (/ n 2))))
        (else 
         (* b (fast-expt b (- n 1))))))

; ;; Alternate implementation
(define (expt b n) (inner-expt b n 1))

(define (inner-expt b n a)
  (cond ((= n 0)
          a)
        ((even? n)
          (inner-expt (square b) (/ n 2) a))
        (else
          (inner-expt b (- n 1) (* a b)))))