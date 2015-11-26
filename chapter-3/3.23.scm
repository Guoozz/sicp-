;; 双端队列的实现
;; 题目有一个要求,双端队列的插入与删除操作必须在O(1)时间内完成
;; 因此,我们必须记录每个结点的前驱,头结点的前驱为空

(define (make-dequeue) (cons '() '()))

(define (front-ptr queue) (car queue))
(define (rear-ptr queue) (cdr queue))

(define (set-front-ptr! queue new-pair) (set-car! queue new-pair))
(define (set-rear-ptr! queue new-pair) (set-cdr! queue new-pair))

;;队列结点的构造和选择函数
(define (make-node key pre) (cons key pre))
(define (pre node) (cdr node))
(define (value node) (car node))

(define (empty? queue) (null? (front-ptr queue)))

;;选取双端队列前端的元素
(define (front-dequeue queue)
  (if (empty? queue)
      (error "dequeue is empty")
      (value (car (front-ptr queue)))))

;;选取双端队列末端的元素
(define (rear-dequeue queue)
  (if (empty? queue)
      (error "dequeue is empty")
      (value (car (rear-ptr queue)))))

;; 由于双端队列包含环，因此不能简单的返回该队列
(define (front-insert! queue item)
  (let ((new-node (make-node item '())))
    (let ((new-pair (cons new-node '())))
      (cond ((empty? queue)
             (set-front-ptr! queue new-pair)
             (set-rear-ptr! queue new-pair)
             (print-dequeue queue))
            (else (let ((node (car (front-ptr queue))))
                    (set-cdr! node new-pair)
                    (set-cdr! new-pair (front-ptr queue))
                    (set-front-ptr! queue new-pair)
                    (print-dequeue queue)
                    ))))))

(define (rear-insert! queue item)
  (let ((new-node (make-node item '())))
    (let ((new-pair (cons new-node '())))
      (cond ((empty? queue)
             (set-front-ptr! queue new-pair)
             (set-rear-ptr! queue new-pair)
             (print-dequeue queue))
            (else (set-cdr! new-node (rear-ptr queue))
                  (set-cdr! (rear-ptr queue) new-pair)
                  (set-rear-ptr! queue new-pair)
                  (print-dequeue queue))))))

(define (only-one-item? queue)
  (and (not (empty? queue))
       (eq? (front-ptr queue)
            (rear-ptr queue))))

;; 删除前端节点，分为3种情况
;; A. 队列为空，报错
;; B. 队列只有一个元素，使头指针和尾指针指向NULL
;; C. 队列多于一个元素,使front-ptr指向队列的下一个节点next-pair,并使(pre (car next-pair))
;; 指向NULL

(define (front-delete! queue)
  (cond ((empty? queue) (error "dequeue is empty"))
        ((only-one-item? queue) (set-front-ptr! queue '()) (set-rear-ptr! queue '()) (print-dequeue queue))
        (else (let ((next-pair (cdr (front-ptr queue))))
                (let ((next-node (car next-pair)))
                  (set-cdr! next-node '())
                  (set-front-ptr! queue next-pair)
                  (print-dequeue queue))))))

;; 删除尾部节点与前端节点的情况类似，也是分为3种情况
(define (rear-delete! queue)
  (cond ((empty? queue) (error "dequeue is empty"))
        ((only-one-item? queue)(set-front-ptr! queue '()) (set-rear-ptr! queue '()) (print-dequeue queue))
        (else (let ((node (car (rear-ptr queue))))
                (let ((pre-pair (pre node)))
                  (set-cdr! pre-pair '())
                  (set-rear-ptr! queue pre-pair)
                  (print-dequeue queue))))))

;;打印队列元素
(define (print-dequeue queue)
  (define (iter node)
    (cond ((null? node) 'ok)
          (else (display (value (car node))) (display ",") (iter (cdr node)))))
  (iter (front-ptr queue)))
