(define (make-tree root left right)
  (list root left right))

(define (root tree)
  (car tree))

(define (left tree)
  (cadr tree))

(define (right tree)
  (caddr tree))

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((> x (root set)) (element-of-set? x (right tree)))
        ((< x (root set)) (element-of-set? x (left tree)))
        (else true)))

(define (adjoin-set x set)
  (cond ((null? set) (make-tree x '() '()))
        ((= x (root set)) set)
        ((> x (root set)) (make-tree (root set) (left set)(adjoin-set x (right set))))
        (else (make-tree (root set) (adjoin-set x (left set)) (right set)))))

;;将树转换为表
;; 1)
(define (tree->list-1 tree)
  (if (null? tree)
      '()
      (append (tree->list-1 (left tree))
              (cons (root tree) (tree->list-1 (right tree))))))



(define (tree->list-2 tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
        result-list
        (copy-to-list (left tree)
                      (cons (root tree)
                            (copy-to-list (right tree)
                                          result-list)))))
  (copy-to-list tree '()))
