;; 例题3.7通过将密码保存在列表中,实现账号共享
;; 这样写有一个弊端,没有实现账户与密码一对一的关系,即账户可以输入密码列表中的任意一个对账户进行访问.

(define (make-account balance secret-number)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount)) balance)
        "insufficient funds"))

  (define (deposit amount)
    (begin (set! balance (+ balance amount)) balance))

  (define input-counts 0)

  (define secret-list (list secret-number))

  (define (adjoin-secret-list secret-number)
    (begin (set! secret-list (cons secret-number secret-list)) secret-list))

  (define (in-secret-list? password)
    (define (iter rest-secret-list)
      (if (null? rest-secret-list)
          false
          (if (eq? (car rest-secret-list) password)
              true
              (iter (cdr rest-secret-list)))))
    (iter secret-list))


  (define (dispatch password m)
    (if (in-secret-list? password)
        (begin (set! input-counts 0)
               (cond ((eq? m 'withdraw) withdraw)
                     ((eq? m 'deposit) deposit)
                     ((eq? m 'add) (lambda (number) (begin (adjoin-secret-list number) dispatch)))
                     (else "no such requests")))
        (begin (set! input-counts (+ input-counts 1))
               (cond ((> input-counts 2) (error "We have called the cops!!!!"))
                     (else (error "incorrect password,please retry --PASSWORD" password))))))
  dispatch)
