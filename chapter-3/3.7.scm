(load "3.3.scm")

;; 这样写没有解决同一个账户对应多个密码的问题
(define (make-joint account secret-number new-secret-number)
  ((account secret-number 'add) new-secret-number))

;; 这样写没有对密码输入的次数进行限制(当然解决办法也很简单),可能这下面这种方法更符合题目要求
(define (make-joint-2 account secret-number new-secret-number)
  (lambda (given-secret-number mode)
    (if (eq? given-secret-number new-secret-number)
        (account secret-number mode)
        (error "password was wrong"))))
