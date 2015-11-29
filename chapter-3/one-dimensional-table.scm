;; 利用变动数据构造一维表格

;;查找过程
(define (look-up key table)
  (let ((record (assoc key (cdr table))))
    (if record
        (cdr record)
        false)))

(define (assoc key records)
  (cond ((null? records) false)
        ((equal? key (caar records)) (car records))
        (else (assoc key (cdr records)))))

;;插入过程以关键值,值，表格为参数
;;如果关键值存在，更新关键值对应的值
;;关键值不存在，将关键值对插入表头
(define (insert! key value table)
  (let ((record (assoc key (cdr table))))
    (if record
        (set-cdr! record value)
        (set-cdr! table
                  (cons (cons key value) (cdr table)))))
  'ok)

(define (make-table)
  (list '*table*))
