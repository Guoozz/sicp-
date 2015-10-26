(load "rational.scm")

(define (install-rational-package)
  (define make-real (get 'make 'scheme-number))
  (define (tag x) (attach-tag 'rational x))
  (put 'add '(rational rational) (lambda (x y) (tag (add-rat x y))))
  (put 'sub '(rational rational) (lambda (x y) (tag (sub-rat x y))))
  (put 'mul '(rational rational) (lambda (x y) (tag (mul-rat x y))))
  (put 'div '(rational rational) (lambda (x y) (tag (div-rat x y))))
  (put 'make 'rational
       (lambda (n d) (tag (make-rat n d))))
  (put 'equ? '(rational rational)
       (lambda (x y)
           (and (= (numer x) (numer y))
                (= (denom x) (denom y)))))
  (put '=zero? '(rational)
       (lambda (x)
         (= (numer x) 0)))
  (put 'raise 'rational
       (lambda (x) (exact->inexact (/ (numer x)
                                      (denom x)))))
  (put 'project 'rational
       (lambda (x)
         (inexact->exact
          (round (/ (numer x)
                    (denom x))))))
  'done)

(define (make-rational n d)
  ((get 'make 'rational) n d))
