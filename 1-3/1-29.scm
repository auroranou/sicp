(define (cube x) (* x x x))

(define (sum term a next b)
  (if (> a b)
    0
    (+ (term a)
       (sum term (next a) next b))))

(define (integral f a b n)
  (define (h)
    (/ (- b a) n))
  
  (define (y k)
    (f (+ a
          (* k h))))
  
  (define (term x)
    (cond ((or (= 0 x) (= n x))
            (y x))
          ((even? x)
            (* 2 (y x)))
          (else
            (* 4 (y x)))
          ))

  (define (next x)
    (+ x 1))

  (define (simpson f a b n)
    (/ (* h 
          (sum term 0 next n))
       3))
        
  (simpson f a b n))