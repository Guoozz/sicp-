(load "sequences_interface.scm")

(define (order n)
  (accumulate
   append
   nil
   (map (lambda (i)
          (map (lambda (j)
                 (list i j))
               (enumerate-interval (+ i 1)  n)))
        (enumerate-interval 0 n))))


(define (three n)
  (accumulate
   append
   nil
  (map (lambda (i)
         (map (lambda (j)
                (cons j i))
              (enumerate-interval (+ (cadr (car i)) 1) n)))
       (order n))))
