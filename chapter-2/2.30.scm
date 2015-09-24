(load "list.scm")

(define (square-tree tree)
  (if (null? tree)
      nil
      (if (pair? tree)
          (cons (square-tree (car tree))
                (square-tree (cdr tree)))
          (* tree tree))))


(define (square-tree-map tree)
  (map (lambda (subtree)
       (if (pair? subtree)
           (square-tree-map subtree)
           (* subtree subtree)))
       tree))
