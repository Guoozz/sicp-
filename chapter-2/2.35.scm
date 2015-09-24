(load "sequences_interface.scm")
(define (count-leaves t)
  (accumulate +
              0
              (map (lambda (x) 1)
                   (enumerate-tree t))
              ))
