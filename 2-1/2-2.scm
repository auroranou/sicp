#|
Consider the problem of representing line segments in a plane. Each segment is represented as a pair of points: a starting point and an ending point.

Define a constructor `make-segment` and selectors `start-segment` and `end-segment` that define the representation of segments in terms of points.
|#

(define (make-segment start end) (cons start end))
(define (start-segment seg) (car seg))
(define (end-segment seg) (cdr seg))

#|
Furthermore, a point can be represented as a pair of numbers: the x coordinate and the y coordinate. Accordingly, specify a constructor `make-point` and selectors `x-point` and `y-point` that define this representation.
|#

(define (make-point x y) (cons x y))
(define (x-point pt) (car pt))
(define (y-point pt) (cdr pt))

#|
Finally, using your selectors and constructors, define a procedure `midpoint-segment` that takes a line segment as argument and returns its midpoint (the point whose coordinates are the average of the coordinates of the endpoints).
|#

(define (avg x y) (/ (+ x y) 2))

(define (midpoint-segment seg)
  (let ((start-x (car (car seg)))
        (start-y (cdr (car seg)))
        (end-x (car (cdr seg)))
        (end-y (cdr (cdr seg))))
    (cons 
      (avg start-x end-x)
      (avg start-y end-y))))

#|
To try your procedures, you'll need a way to print points (provided):
|#

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ", ")
  (display (y-point p))
  (display ")"))

(print-point 
  (midpoint-segment 
    (make-segment (make-point 0 0) (make-point 0 4))))

(print-point 
  (midpoint-segment 
    (make-segment (make-point 1 2) (make-point 4 15))))