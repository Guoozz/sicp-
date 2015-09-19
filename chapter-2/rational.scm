;; make-rat 返回一个有理数
;; numer 选择分子 denom 选择分母

(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (sub-rat x y)
  (make-rat  (- (* (numer x) (denom y))
                (* (numer y) (denom x)))
             (* (denom x) (denom y))))

(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))))

(define (div-rat x y)
  (make-rat (* (numer x) (denom y))
            (* (denom x) (denom y))))

(define (equal-rat? x y)
  (= (* (numer x) (denom y))
     (* (numer y) (denom x))))



(define (numer x) (car x))

(define (denom x) (cdr x))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x))
  0)
(define (make-rat n d)
  (define (gcd a b)
    (if (= b 0) a (gcd b (remainder a b))))
  (let ((g (abs(gcd n d))))
    (if (< d 0)
        (cons (/ (- n) g)
              (/ (- d) g))
        (cons (/ n g)
              (/ d g)))))

