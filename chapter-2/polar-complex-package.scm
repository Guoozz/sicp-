(load "tagged-data.scm")

;; get,put 定义
(define get 2d-get)
(define put 2d-put!)

(define (install-polar-package)
  (define (magnitude z) (car z))
  (define (angle z) (cdr z))
  (define (real-part z) (* (magnitude z) (cons (angle z))))
  (define (imag-part z) (* (magnitude z) (sin (angle z))))
  (define (make-from-mag-ang r a) (cons r a))
  (define (make-from-real-imag x y)
    (cons (sqrt (+ (square x) (square y)))
          (atan y x)))

  ;; interface to the rest of system
  (define (tags x) (attach-tag 'polar x))
  (put 'real-part 'polar real-part)
  (put 'imag-part 'polar imag-part)
  (put 'angle 'polar angle)
  (put 'magnitude 'polar magnitude)
  (put 'make-from-real-imag 'polar
       (lambda (x y) (tags (make-from-real-imag x y))))
  (put 'make-from-mag-ang 'polar
       (lambda (x y) (tags (make-from-mag-ang x y))))
  'done)
