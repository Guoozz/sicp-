(load "get-put.scm")
(load "scheme-number-package.scm")
(load "complex-package.scm")

(define put-coercion put)
(define get-coercion get)

(install-complex-package)
(install-scheme-number-package)

(define (install-coercion-package)
  (define (scheme-number->complex n)
    (make-complex-from-real-imag (contents n) 0))
  (put-coercion 'scheme-number 'complex scheme-number->complex)
'done)
