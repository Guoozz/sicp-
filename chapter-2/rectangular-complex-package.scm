(define (install-rectangular-package)
  (define (real-part z) (car z))
  (define (imag-part z) (cdr z))
  (define (magnitude z) (sqrt (+ (square (real-part z))
                                 (square (imag-part z)))))
  (define (angle z) (atan (imag-part z) (real-part z)))
  (define (make-from-real-imag x y) (cons x y))
  (define (make-from-mag-ang r a)
    (cons (* r (cos a)) (* r (sin a))))

  ;; interface to the rest of system
  (define (tags x) (attach-tag 'rectangular x))
  (put 'real-part '(rectangular) real-part)
  (put 'imag-part '(rectangular) imag-part)
  (put 'angle '(rectangular) angle)
  (put 'magnitude '(rectangular) magnitude)
  (put 'make-from-real-imag 'rectangular
       (lambda (x y) (tags (make-from-real-imag x y))))
  (put 'make-from-mag-ang 'rectangular
       (lambda (x y) (tags (make-from-mag-ang x y))))
  'done)
