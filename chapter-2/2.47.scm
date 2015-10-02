(load "2.46.scm") ; 加载向量的构造和选择函数

;利用序列表示框架
(define (make-frame origin edge1 edge2)
  (list origin edge1 edge2))

(define (origin-frame frame)
  (car frame))

(define (edge1-frame frame)
  (cadr frame))

(define (edge2-frame frame)
  (cadr (cdr frame)))

;利用cons直接构造
(define (make-frame-c origin edge1 edge2)
  (cons origin (cons edge1 edge2)))

(define (origin-frame-c frame)
  (car frame))

(define (edge1-frame-c frame)
  (cadr frame))

(define (edge2-frmae-c frame)
  (cdr (cdr frame)))
