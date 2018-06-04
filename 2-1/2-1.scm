#|
Define a better version of `make-rat` that handles both positive and negative arguments. `make-rat` should normalize the sign so that if the rational number is positive, both the numerator and denominator are positive, and if the rational number is negative, only the numerator is negative.
|#

(define (positive? x) (>= 0 x))
(define (negative? x) (< 0 x))

(define (make-rat n d)
  (let ((g (gcd n d)))
    (cons (/ n g) (/ d g))))

(define (better-make-rat n d)
  (if (or (and (positive? n) (positive? d))
          (and (negative? n) (negative? d)))
      (make-rat n d)
      (make-rat (* -1 (abs n)) (abs d))))

