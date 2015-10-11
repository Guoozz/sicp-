(load "huffman-code-tree.scm")

;; 给定Huffman树,解码[01]序列

(define (huffman-decode x tree)
  (if (null? x)
      '()
      (let ((next-branch (chose-branch (car x) tree)))
        (if (leaf? next-branch)
            (cons (leaf-symbol next-branch)
                  (huffman-decode (cdr x) tree))
            (huffman-decode (cdr x) next-branch)))))

(define (chose-branch bit tree)
  (cond ((= bit 0) (left-branch tree))
        ((= bit 1) (right-branch tree))
        (else (error "bad bit -- CHOSE-BRANCH" bit))))
