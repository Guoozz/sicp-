(define nil ())
(define (deep-reverse tree)
  (if (null? tree)
      nil
      (if (pair? tree)
          (append (deep-reverse (cdr tree))
                  (cons (deep-reverse (car tree)) nil))
          tree)
          ))
