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


(define (real-part z) ((get 'real-part (type-tag z)) (contents z)))
(define (imag-part z) ((get 'imag-part (type-tag z)) (contents z)))
(define (magnitude z) ((get 'magnitude (type-tag z)) (contents z)))
(define (angle z) ((get 'angle (type-tag z) (contents z))))

(define (make-from-real-imag x y)
  ((get 'make-from-real-imag 'rectangular) x y))

(define (make-from-mag-ang r a)
  ((get 'make-from-mag-ang 'polar) r a))
