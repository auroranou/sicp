#|
Show that we can represent pairs of nonnegative integers using only numbers and arithmetic operations if we represent the pair a and b as the integer that is the product 2^a * 3^b.

Give the corresponding definitions of the procedures cons, car, and cdr.
|#

(define (cons a b)
  (* (expt 2 a) (expt 3 b)))

(define (car x)
  (iter 2 x 0))

(define (cdr x)
  (iter 3 x 0))

;; num is 2 or 3 depending on whether car or cdr is called
;; rest represents the amount remaining after dividing by num each iteration
;; count keeps a running tally of the number of times num divides into the initial cons
(define (iter num rest count)
  (if (= 0 (remainder rest num))
    (iter num (/ rest num) (+ count 1))
    count))

;; this works because 2 and 3 are unique primes