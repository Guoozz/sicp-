(load "../chapter-1/prime.scm")

(define (unique-pairs n)
  (flatmap (lambda (i)
             (map (lambda (j)
                    (list i j))
                  (enumerate-interval 1 (- i 1))))
           (enumerate-interval 1 n)))

(define (make-pair-sum pair)
  (append pair (list (+ (car pair)
                        (cadr pair)))))

(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter (lambda (pair)
                 (prime? (+ (car pair)
                            (cadr pair))))
               (unique-pairs n))))
