(load "tagged-data.scm")

(define get 2d-get)
(define put 2d-put!)

;; a) 因为我们必须为数字或变量加上标记.而在求导的自然表示中,我们并没有标记数字或变量;还有一点就是求导程序是递归定义的
;; 因此无论什么样的表达式,我们都必须测试这两个表达式其中的一个或者两个.当然,我们也可以这样写,这样做的代价,就必须在每个求导
;; 类型(除这两个判断谓词)加入这两个判断谓词.并且标记为数字.

;; b) c) 其中有很多类似的情况,因此没有一一写出来

(define (install-sum-deriv-package)
  (define (augend exp) (car exp))
  (define (addend exp) (cadr exp))
  (define (make-sum x y ) (list x y))

  (put  'deriv '+ (lambda (exp var)
                   (attach-tag '+ (make-sum (deriv (augend exp) var)
                                            (deriv (addend exp) var)))))
  'done)


(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp) (if (same-variable? exp var) 1 0))
        (else ((get 'deriv (operator exp) ) (operands exp) var))))

(define (operator exp)
  (type-tag exp))

(define (operands exp)
  (contents exp))

(define (variable? v)
  (symbol? v))

(define (same-variable? v1 v2)
  (and
   (variable? v1)
   (variable? v2)
   (eq? v1 v2)))



;; d) 只需将(put 'deriv (operator x) deriv) 改成 (put (operator x) 'deriv deriv)
