(load "sequences_interface.scm")
(load "2.36.scm")

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map  (lambda (w)
          (dot-product v w)) m))

(define (transpose mat)
  (accumulate-n (lambda (x y)
                  (cons x y))
                nil
                mat))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (x)
           (matrix-*-vector cols x))
         m)))
