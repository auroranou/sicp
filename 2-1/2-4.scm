#|
Here is an alternative procedural representation of pairs. For this representation, verify that `(car (cons x y))` yields x for any objects x and y.
|#

(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))

(define (cdr z)
  (z (lambda (p q) q)))

;; Replacing car and cons with procedures above
;1 (car (lambda (m) (m x y)))
;2 ((lambda (m) (m x y)) (lambda (p q) p))
;3 ((lambda (p q) p) x y)