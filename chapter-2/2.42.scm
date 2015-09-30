(load "flatmap.scm")

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
         (lambda (positions)
           (safe? k positions))
         (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position  new-row  k rest-of-queens))
                 (enumerate-interval 1 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))

(define (adjoin-position position k rest-of-queens)
  (append rest-of-queens (list k position)))

(define (safe? k position)
  (if (= k 1)
      true
      (and (= ((lambda (x)
                     (+ x
                        (- position k)))
                    (- k 1))
                   position)
                (= ((lambda (x)
                      (+ (- x)
                         (+ position k)))
                   (- k 1))
                   position)
                (safe? (- k 1) (cdr position)))))
