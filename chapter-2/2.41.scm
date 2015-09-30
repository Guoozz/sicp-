(load "2.40.scm")

(define (unique-triad n s)
  (filter (lambda (triad)
            (= (+ (car triad)
                  (cadr triad)
                  (car (cdr (cdr triad))))
               s))
          (triad n)))

(define (triad n)
  (flatmap (lambda (pair)
             (map (lambda (i)
                    (append  pair (list i)))
                  (enumerate-interval 1 (- (cadr pair) 1))))
           (unique-pairs n)))