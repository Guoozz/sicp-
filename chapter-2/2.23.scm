;看似简单，实则暗藏玄机。继续处理下一个元素与处理当前元素满足
;同一个条件，而if只支持处理一个

;这里利用scheme编译器的特性(不提倡这样写)，scheme过程采取应用序求值

(define (for-each-c proc seq)
  (define (iter c seq) ;c只是为了占用个位置
    (if (null? seq)
        true
        (iter (proc (car seq)) (cdr seq))))
  (iter 3 seq))

;直接求解
(define (for-each proc seq)
  (if (not (null? seq))
      (proc (car seq)))
  (if (not (null? seq))
      (for-each proc (cdr seq))
      true))





(define (display-list seq)
  (for-each (lambda (x)
              (newline)
              (display x))
            seq))
