;; Huffman 编码树

;; Huffman树的构造函数,通过该树的构造过程可以看出,每棵树(子树)都是由left-branch和
;; right-branch,以及这两个子分支的总权重和总元素组成

(define (make-code-tree left right)
  (list left right
        (+ (weight left)
           (weight right))
        (append (symbols right)
                (symbols left))))

;; 编码树的选择函数

(define (left-branch tree)
  (car tree))

(define (right-branch tree)
  (cadr tree))

(define (weight tree)
  (if (leaf? tree)
      (leaf-weight tree)
      (caddr tree)))

(define (symbols tree)
  (if (leaf? tree)
      (list (leaf-symbol tree))
      (cadddr tree)))

;; 树叶的选择和构造函数

(define (make-leaf symbol weight)
  (list 'leaf symbol weight))

(define (leaf-symbol l)
  (cadr l))

(define (leaf-weight l)
  (caddr l))

(define (leaf? object)
  (eq? (car object) 'leaf))

;; sets of weighted elements

(define (adjoin-set x set)
  (cond ((null? set) (cons x '()))
        ((< (leaf-weight x) (weight (car set))) (cons x set))
        (else (cons (car set) (adjoin-set x (cdr set))))))

(define (make-leaf-set pairs)
  (if (null? pairs)
      '()
      (let ((pair (car pairs)))
        (adjoin-set (make-leaf (car pair)
                               (cadr pair))
                    (adjoin-set (cdr pairs))))))
