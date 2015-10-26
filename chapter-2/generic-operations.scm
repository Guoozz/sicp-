(load "tagged-data.scm")
(load "get-put.scm")
(load "apply-generic.scm")
(load "scheme-number-package.scm")
(load "rational-package.scm")
(load "complex-package.scm")
(load "coercion.scm")
;; 定义一个通用型的算术运算

(define (install-package)
  (install-complex-package)
  (install-rational-package)
  (install-scheme-number-package)
  'ok)

(define (add x y)
  (apply-generic 'add x y))

(define (sub x y)
  (apply-generic 'sub x y))

(define (mul x y)
  (apply-generic 'mul x y))

(define (div x y)
  (apply-generic 'div x y))

(define (equ? x y)
  (apply-generic 'equ? x y))

(define (=zero? x)
  (apply-generic '=zero? x))

(define (project x)
  ((get  'project (type-tag x)) (contents x)))

(define (drop x)
  (if (drop? x)
      (drop (project x))
      x))

(define (drop? x)
  (if (not (boolean? x)) ;; 防止对equ?过程生成的结果进行drop 或 project
      (let ((dropped (project x)))
        (if (and (> (level x) 1)
                 (equ? (raise dropped) x))
            true
            false))
      false))
