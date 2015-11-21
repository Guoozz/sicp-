;; 基于消息传递的队列实现

(define (make-queue)
  (let ((front-ptr '())
        (rear-ptr '()))

    (define (empty?)
      (null? front-ptr))

    (define (insert! item)
      (let ((new-pair (cons item '())))
        (cond ((empty?) (set! front-ptr new-pair) ;;无法对null表进行cdr
                      (set! rear-ptr new-pair)
                      front-ptr)
              (else (set-cdr! rear-ptr new-pair)
                    (set! rear-ptr new-pair)
                    front-ptr))))

    (define (delete!)
      (cond ((empty?) (error "queue is empty --QUEUE"))
            (else (set! front-ptr (cdr front-ptr))
                  front-ptr)))

    (define (print-queue)
      (cond ((empty?) 'queue-is-empty)
            (else (display front-ptr))))

    (define (dispatch m)
      (cond ((equal? m 'insert) insert!)
            ((equal? m 'delete) delete!)
            ((equal? m 'print) print-queue)
            (else ("no such methmod to call --Dispatch" m))))
    dispatch))
