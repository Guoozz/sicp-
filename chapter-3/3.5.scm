(load "monte-carlo.scm")

(define (estimate-integral p x1 x2 y1 y2 trials)
  (let ((area (* (- x2 x1) (- y2 y1))))
    (/ (* area (monte-carlo trials (lambda () (p (random-in-range x1 x2)
                                                 (random-in-range y1 y2)))))
       9.0)))

(define (random-in-range low high)
  (let ((range (- high low)))
    (+ low (random range))))

(define (in-circle? x y)
             (<= (+ (square (- x 5))
                    (square (- y 7))) 9))
