(define (install-polar-package)
  (define (magnitude z) (car z))
  (define (angle z) (cdr z))
  (define (real-part z) (mul (magnitude z) (cos (angle z))))
  (define (imag-part z) (mul (magnitude z) (sin (angle z))))
  (define (make-from-mag-ang r a) (cons r a))
  (define (make-from-real-imag x y)
    (cons (sqrt (add (square x) (square y)))
          (atan y x)))

  ;; interface to the rest of system
  (define (tags x) (attach-tag 'polar x))
  (put 'real-part '(polar) real-part)
  (put 'imag-part '(polar) imag-part)
  (put 'angle '(polar) angle)
  (put 'magnitude '(polar) magnitude)
  (put 'make-from-real-imag 'polar
       (lambda (x y) (tags (make-from-real-imag x y))))
  (put 'make-from-mag-ang 'polar
       (lambda (x y) (tags (make-from-mag-ang x y))))
  'done)
