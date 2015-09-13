;; 递归版本
(define (cont-frac n d k)
  (define (rc i)
    (if (= i k)
        (/ (n i) (d i))
        (/ (n i)
           (+ (rc (+ i 1))
              (d i)))))
  (rc 1))

;; 迭代版本
(define (cont-frac-iter n d k)
  (define (iter i result)
    (if (= i 0)
        result
        (iter (- i 1) ((lambda (a b c) (/ a (+ b c)))
                       (n i) (d i)  result))))
  (iter k 0))

;; 计算黄金分割率
(define (golden-ration k)
  (/ 1 (cont-frac-iter (lambda (x) 1.0)
                       (lambda (x) 1.0)
                       k)))

;; 递归与迭代相同的一点:都从第K项开始算起
