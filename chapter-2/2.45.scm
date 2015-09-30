; 该源码需要DrRacket进行编译,官方给的老是出错

(require sicp-pict)

(define (split direction partition)
  (lambda (painter n)
    (if (= n 0)
       painter
       (let ((smaller ( (split direction partition) painter (- n 1))))
         (direction painter (partition smaller smaller))))))

(define right-split (split beside below))
(define up-split (split below beside))
