#|
Implement a representation for rectangles in a plane.

In terms of your constructors and selectors, create procedures that compute the perimeter and the area of a given rectangle.
|#

(define (make-rect top right bottom left)
  (cons top (cons right (cons bottom left))))

(define (top rect) (car rect))
(define (right rect) (car (cdr rect)))
(define (bottom rect) (car (cdr (cdr rect))))
(define (left rect) (cdr (cdr (cdr rect))))

(define (make-segment start end) (cons start end))
(define (start-segment seg) (car seg))
(define (end-segment seg) (cdr seg))

(define (make-point x y) (cons x y))
(define (x-point pt) (car pt))
(define (y-point pt) (cdr pt))

;; d = √( (x2 - x1)^2 + (y2 - y1)^2 )
(define (length seg)
  (let ((pt1 (start-segment seg))
        (pt2 (end-segment seg))
        (diff-x (- (x-point pt2) (x-point pt1)))
        (diff-y (- (y-point pt2) (y-point pt1))))
    (sqrt (+ (square diff-x)
             (square diff-y)))))

(define (perimeter rect)
  (+ (length (top rect))
     (length (right rect))
     (length (bottom rect))
     (length (left rect))))

(define (area rect)
  (* (length (top rect))
     (length (left rect))))

; ;; Test cases
(define (test)
  (let* ((top-left (make-point 0 4))
         (top-right (make-point 6 4))
         (bottom-right (make-point 6 0))
         (bottom-left (make-point 0 0))
         (rect (make-rect (make-segment top-left top-right)
                          (make-segment top-right bottom-right)
                          (make-segment bottom-right bottom-left)
                          (make-segment bottom-left top-left))))
    (newline)
    (display (top rect))
    (newline)
    (display (length (top rect)))
    (newline)
    (display (perimeter rect))
    (newline)
    (display (area rect))))

#|
Now implement a different representation for rectangles. Can you design your system with suitable abstraction barriers, so that the same perimeter and area procedures will work using either representation?
|#