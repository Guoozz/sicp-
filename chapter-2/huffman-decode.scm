(load "huffman-code-tree.scm")

;; 给定Huffman树,解码[01]序列

;; 下面是错误的答案,出现这样的错误,主要原因在于自己的思路不清晰,以及变量命名造成的误解.
;;一开始我是这样写的,
(define (huffman-decode-error x tree)
  (if (null? x)
      '()
      (let ((next-branch
             (choose-branch (car x) tree)))
        (if (leaf? next-branch)
            (cons (leaf-symbol next-branch)
                  (huffman-decode-error (cdr x) tree)) ;;错误在这里,到达叶子节点之后,应该从总分支上重新进行解码,而不是从左分支或右分支上
            (huffman-decode-error (cdr x) next-branch)))))

;; 正确的答案,其实这样写主要是为了保存tree,也就是整个Huffman树

(define (decode bits tree)
  (define (decode-1 bits current-branch)
    (if (null? bits)
        '()
        (let ((next-branch
               (choose-branch
                (car bits)
                current-branch)))
          (if (leaf? next-branch)
              (cons
               (leaf-symbol next-branch)
               (decode-1 (cdr bits) tree))
              (decode-1 (cdr bits)
                        next-branch)))))
  (decode-1 bits tree))


(define (choose-branch bit branch)
  (cond ((= bit 0) (left-branch branch))
        ((= bit 1) (right-branch branch))
        (else (error "bad bit:
               CHOOSE-BRANCH" bit))))
