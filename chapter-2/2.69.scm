;;利用符号-权重对偶表产生Huffman编码树

(load "huffman-code-tree.scm")


(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))

;; 手动实现一下,思路会清晰许多
(define (successive-merge pairs)
  (cond ((null? pairs) ())
        ((null? (cdr pairs)) (car pairs))
        (else (successive-merge (adjoin-set (make-code-tree (car pairs) (cadr pairs))
                                            (cddr pairs))))))
