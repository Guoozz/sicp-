(define nil ())

;; 求表元素的数目
;; 递归求解 表 l 为空 len = 0 否则 len = 1 + len(cdr l)

(define (len l)
  (if (null? l)
      0
      (+ 1 (len (cdr l)))))

;; len = c + 1 + len(cdr l);
;; 迭代求解

(define (len-iter l)
  (define (iter c l)
    (if (null? l)
        c
        (iter (+ c 1) (cdr l))))
  (iter 0 l))

;;递归

(define (append l1 l2)
  (if (null? l1)
      l2
      (cons (car l1) (append (cdr l1) l2)))
  )

;;迭代 append 写起来好麻烦，时间效率上不如递归版本
;;ref-list 默认下标从0开始
(define (ref-list n items)
  (if (= n 0)
      (car items)
      (ref-list (- n 1) (cdr items))))


(define (append-iter l1 l2)
  (define (iter k c)
    (if (= k 0)
        c
        (iter (- k 1) (cons (ref-list (- k 1) l1) c))))
  (iter (len l1) l2))

(define (square-list item)
  (map (lambda (x) (* x x))
       item))
