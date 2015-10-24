(load "polar-complex-package.scm")
(load "rectangular-complex-package.scm")

(install-polar-package)
(install-rectangular-package)

(define (install-complex-package)
  (define (make-from-real-imag x y)
    ((get 'make-from-real-imag 'rectangular) x y))

  (define (make-from-mag-ang r a)
    ((get 'make-from-mag-ang 'polar) r a))

  (define (real-part z) (apply-generic 'real-part z))

  (define (imag-part z) (apply-generic 'imag-part z))

  (define (magnitude z) (apply-generic 'magnitude z))

  (define (angle z) (apply-generic 'angle z))

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

  (define (tag x) (attach-tag 'complex x))

  (put 'add '(complex complex)
       (lambda (x y) (tag (add-complex x y))))

  (put 'sub '(complex complex)
       (lambda (x y) (tag (sub-complex x y))))

  (put 'mul '(complex complex)
       (lambda (x y) (tag (mul-complex x y))))

  (put 'div '(complex complex)
       (lambda (x y) (tag (div-complex x y))))

  (put 'make-from-real-imag 'complex
       (lambda (x y) (tag (make-from-real-imag x y))))

  (put 'make-from-mag-ang 'complex
       (lambda (r a) (tag (make-from-mag-ang r a))))

  (put 'real-part '(complex) real-part)
  (put 'imag-part '(complex) imag-part)
  (put 'magnitude '(complex) magnitude)
  (put 'angle '(complex) angle)

  'done)

(install-complex-package)

(define (make-complex-from-real-imag x y)
  ((get 'make-from-real-imag 'complex) x y))

(define (make-complex-from-mag-ang r a)
  ((get 'make-from-mag-ang 'complex) r a))

(define (real-part z) (apply-generic 'real-part z))
(define (imag-part z) (apply-generic 'imag-part z))
(define (magnitude z) (apply-generic 'magnitude z))
(define (angle z) (apply-generic 'angle z))

;;only for testing
(define x (make-complex-from-mag-ang 3 4))
(define y (make-complex-from-real-imag 1 2))
