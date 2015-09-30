(load "sequences_interface.scm")

(define (car-n seqs)
  (map car seqs))
(define (cdr-n seqs)
  (map cdr seqs))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init (car-n seqs))
            (accumulate-n op init (cdr-n seqs)))))
