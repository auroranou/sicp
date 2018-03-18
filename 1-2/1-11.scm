(define (f-recursive n)
  (if (< n 3)
      n
      (+ (f-recursive (- n 1))
         (* 2 (f-recursive (- n 2)))
         (* 3 (f-recursive (- n 3))))))

(define (f-iterative n)
  (if (< n 3)
      n
      (f-iter n 3 2 1 0)))

(define (f-iter target counter top middle bottom)
  (if (= counter target)
      (+ top (* 2 middle) (* 3 bottom))
      (f-iter target
            (+ counter 1)
            (+ top (* 2 middle) (* 3 bottom))
            top
            middle)))