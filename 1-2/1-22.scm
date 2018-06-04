;; ***********************************************
;; Procedures for timing tests
(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) 
                      start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

;; ***********************************************
;; Procedures for determining if a single integer is prime
(define (prime? n)
  (= n (smallest-divisor n)))

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

;; ***********************************************
;; Procedures for finding multiple primes given a range/constraints

;; Given a starting point and target number of primes to find,
;; try finding primes by incrementing start until found = target
(define (search-for-primes start end found)
  (cond ((= 3 found)
        found)
      ((>= start end)
        found)
      (else
        (timed-prime-test start)
        (search-for-primes
          (+ start 2)
          end
          (+ found (find-prime start))))))

(define (find-prime n)
  (if (prime? n)
      1
      0))