(load "polar-complex-package.scm")
(load "rectangular-complex-package.scm")

(define (add-complex z1 z2)
  (make-from-real-imag (+ (real-part z1)
                          (real-part z2))
                       (+ (imag-part z1)
                          (imag-part z2))))

(define (sub-complex z1 z2)
  (make-from-real-imag (- (real-part z1)
                          (real-part z2))
                       (- (real-part z1)
                          (real-part z2))))

(define (mul-complex z1 z2)
  (make-from-mag-ang (* (magnitude z1)
                        (magnitude z2))
                     (+ (angle z1)
                        (angle z2))))

(define (div-complex z1 z2)
  (make-from-mag-ang (/ (magnitude z1)
                        (magnitude z2))
                     (- (angle z1)
                        (angle z2))))



(define (make-from-real-imag x y)
  ((get 'make-from-real-imag 'rectangular) x y))

(define (make-from-mag-ang r a)
  ((get 'make-from-mag-ang 'polar) r a))


(define (apply-generic op . arg)
  (let ((type-tags (map type-tag arg)))
    (let ((proc (get op type-tags)))
      (if proc
          (apply proc (map contents arg)) ;; apply 过程以一个过程和表为参数,apply 将表中元素作为参数传递给proc(例如 (apply + (list 1 2 3)) 结果为6)
          (error "No method for these types -- APPLY-GENERIC" (list op type-tags))))))

(define (real-part z)
  (apply-generic 'real-part z))

(define (imag-part z)
  (apply-generic 'imag-part z))

(define (magnitude z)
  (apply-generic 'magnitude z))

(define (angle z)
  (apply-generic 'angle z))
