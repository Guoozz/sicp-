(load "sequences_interface.scm")

(define (flatmap proc sequence)
  (accumulate append nil (map proc sequence)))
