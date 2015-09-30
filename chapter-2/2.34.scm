(load "sequences_interface.scm")

(define (hornel-eval x cofficient-sequence)
  (accumulate
   (lambda (this-coeff higher-term)
     (+ this-coeff
        (* x higher-term)))
   0
   cofficient-sequence))
