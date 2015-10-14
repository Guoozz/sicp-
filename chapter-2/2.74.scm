(load "tagged-data.scm")

;; 写这个程序,花费了大量的时间找Bug.
;; 这里面对的问题是,应该边写边做,还是应该写之前规划好.
;; 我是在连问题都没搞清楚的情况下写出来的

(define get 2d-get)
(define put 2d-put!)


(define (make-personnel-file records)
  ((get 'make-personnel-file 'cs) records))

(define (make-record name age sex salary)
  ((get 'make-record 'cs) name age sex salary))


(define (get-record personnel-file name)
  ((get 'get-record (type-tag personnel-file)) (contents personnel-file) name))

(define (get-salary personnel-file name)
  ((get 'get-salary (type-tag personnel-file)) (contents personnel-file) name))

(define (find-employee name . files)
  (if (null? (car files))
      '()
      (let ((record (get-record (car files) name)))
        (if (null? record)
            (find-employee name (cdr files))
            record))))

;;一份人事记录包
(define (install-cs-package)
  (define (make-personnel-file records) records)
  (define (make-record name age sex salary) (list name age sex salary))

  (define (get-name record) (car record))
  (define (get-age  record) (cadr record))
  (define (get-sex record) (caddr record))
  (define (get-salary record) (cadddr record))

  (define (get-personnel-record records) (car records))
  (define (get-personnel-rest-record records) (cdr records))

  (define (get-record records name)
    (if (null? records)
        '()
        (if (equal? (get-name (get-personnel-record records)) name)
            (get-personnel-record records)
            (get-record (get-personnel-rest-record records) name))))

  (define (tag x) (attach-tag 'cs x))
  (put 'make-personnel-file 'cs (lambda (x) (tag (make-personnel-file x))))
  (put 'make-record 'cs make-record)
  (put 'get-record 'cs get-record)
  (put 'get-salary 'cs (lambda (records name) (get-salary (get-record records name))))
  (put 'get-personnel-record 'cs get-personnel-record)
  'done)
