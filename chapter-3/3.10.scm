(define (make-withdraw init-amount)
  (let ((balance init-amount))
    (lambda (amount)
      (if (> amount balance)
          (error "Insufficent funds")
          (begin (set! balance (- balance amount)) balance)))))

;;为了方便阅读
;;约定,环境格式:  environment_name = {[variable-list],[procedures],[environment_pointer]}
;;global-environment = {,(make-withdraw,W1),}
;;e1 = {(init-amount:100),(lambda (balance)...),global-environment} #(make-withdraw 100)
;;e2 = {(balance:100),(lambda (amount) ...),e1}
;;e3 = {(amount:50),(...balance),e2} #(W1 50)执行该过程会修改 e2中balance的值
;;e2 = {(balance:50),...,...}
