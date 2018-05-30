(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) 
         n)
        ((divides? test-divisor n) 
         test-divisor)
        (else (find-divisor 
               n 
               (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(prime? 199)
;; #t
(smallest-divisor 199)
;; 199

(prime? 1999)
;; #t
(smallest-divisor 1999)
;; 1999

(prime? 19999)
;; #f
(smallest-divisor 19999)
;; 7