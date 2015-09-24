(load "list.scm")
;;序列作为一种约定的界面
;;从而作为一种信号在各个模块之间流动

(define (filter predicate sequences)
  (if (null? sequences)
      nil
      (if (predicate (car sequences))
          (cons (car sequences)
                (filter predicate (cdr sequences)))
          (filter predicate (cdr sequences)))))

(define (accumulate op init sequences)
  (if (null? sequences)
      init
      (op (car sequences)
          (accumulate op init (cdr sequences)))))

(define (enumerate-tree tree)
  (if (null? tree)
      nil
      (if (pair? tree)
          (append  (enumerate-tree (car tree))
                   (enumerate-tree (cdr tree)))
          (list tree)))) ;; append只能对序列进行操作


(define (sum-odd-square tree)
  (accumulate +
              0
              (map square
                   (filter odd?
                           (enumerate-tree tree)))))

(define (enumerate-interval low high)
  (if (> low high)
      nil
      (cons low
            (enumerate-interval (+ low 1) high))))

(define (even-fibs n)
  (accumulate cons
              nil
              (filter even?
                      (map fib
                           (enumerate-interval 0 n)))))

(define (fib n)
  (define (iter a b n)
    (if (= n 1)
        b
        (if (= n 0)
            0
            (iter b (+ a b) (- n 1)))))
  (iter 0 1 n))
