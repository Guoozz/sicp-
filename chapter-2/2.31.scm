(load "list.scm")

(define (tree-map p tree)
  (map (lambda (subtree)
       (if (pair? subtree)
           (tree-map p subtree)
           (p subtree)))
       tree))

(define (square-tree tree)
  (tree-map square tree))
