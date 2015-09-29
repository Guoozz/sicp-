(load "sequences_interface.scm")

(define (flatmap proc sequence)
  (accumulate append (map proc sequence)))
