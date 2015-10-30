(define (add-poly p1 p2)
  (if (same-variable? (variable p1) (variable p2))
      (make-poly (variable p1)
                 (add-terms (terms p1)
                            (terms p2)))
      (error "variable difference -- ADD-POLY" (list (variable p1) (variable p2)))))

(define (mul-poly p1 p2)
  (if (same-variable? (variable p1) (variable p2))
      (make-poly (variable p1)
                 (mul-terms (terms p1)
                            (terms p2)))
      (error "variable difference -- MUL-POLY" (list (variable p1) (variable p2)))))

(define (add-terms t1 t2)
  (cond ((empty-terms t1) t2)
        ((empyt-terms t2) t1)
        (else (let ((first1 (first-term t1))
                    (first2 (first-term t2)))
                (let ((order1 (order first1))
                      (order2 (order first2)))
                  (cond ((> order1 order2) (adjoin-term first1 (add-terms (rest-terms t1) t2)))
                        ((< order1 order2) (adjoin-term first2 (add-terms t1 (rest-terms t2))))
                        (else (adjoin-term (make-term order1 (add (coeff first1)
                                                                  (coeff first2)))
                                           (add-terms (rest-terms t1)
                                                      (rest-terms t2))))))))))

(define (mul-terms t1 t2)
  (if (empty-terms? t1)
      (the-empty-terms)
      (add-terms (mul-term-by-all-terms (first-term t1) t2)
                 (mul-terms (rest-terms t1) t2))))

(define (mul-term-by-all-terms t1 terms)
  (if (empty-terms? terms)
      (the-empty-terms)
      (let ((t2 (first-term terms)))
        (adjoin-term (make-term (add (order t1)
                                     (ordem t2))
                                (mul (coeff t1)
                                     (coeff t2)))
                     (mul-term-by-all-terms t1 (rest-terms terms))))))

(define (variable? t)
  (symbol? t))

(define (same-variable? t1 t2)
  (and (symbol? t1)
       (symbol? t2)
       (equ? t1 t2)))
