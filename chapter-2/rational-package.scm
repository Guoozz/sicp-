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
       (lambda (x) (exact->inexact (div (numer x)
                                        (denom x)))))
  (put 'project 'rational
       (lambda (x)
         (inexact->exact
          (round (div (numer x)
                      (denom x))))))

  ;; 构造sine,cosine,g-atan,g-sqrt,g-square通用型过程
  ;; 这里需要注意的是,cosine sine,g-atan,g-sqrt过程生成的结果用scheme-number进行表示(没有找到用分数表示的方法)
  (put 'sine '(rational)
       (lambda (x) (attach-tag 'scheme-number (sine (div (numer x)
                                                         (denom x))))))

  (put 'cosine '(rational)
       (lambda (x) (attach-tag 'scheme-number (cosine (div (numer x)
                                                           (denom x))))))

  (put 'g-atan '(rational rational)
       (lambda (x y) (attach-tag 'scheme-number
                                 (g-atan (div (numer x) (denom x))
                                         (div (numer y) (denom y))))))

  (put 'g-sqrt '(rational)
       (lambda (x) (attach-tag 'scheme-number (g-sqrt (div (numer x)
                                                           (denom x))))))

  (put 'g-square '(rational)
       (lambda (x) (tag (make-rat (g-square (numer x))
                                  (g-square (denom x))))))
  'done)

(define (make-rational n d)
  ((get 'make 'rational) n d))
