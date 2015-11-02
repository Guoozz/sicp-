(define (install-polynomial-package)
  (define (make-poly var terms) (cons var terms))

  (define (variable poly) (car poly))

  (define (terms poly) (cdr poly))

  (define (adjoin-term term term-list)
    (cond ((empty-terms? term-list) (list term))
          ((> (order term) (order (first-term term-list))) (cons term term-list))
          ((= (order term) (order (first-term term-list))) (cons (make-term (add (coeff term)
                                                                                 (coeff (car term-list)))
                                                                            (order term))
                                                                 (rest-terms term-list)))
          (else (cons (first-term term-list) (adjoin-term term (rest-terms term-list))))))

  (define (first-term term-list)
    (car term-list))

  (define (rest-terms term-list)
    (cdr term-list))

  (define (=zero? p)
    (if (empty-terms? (terms p))
        true
        (and (= (coeff (first-term (terms p))) 0)
             (=zero? (make-poly (variable p) (cdr (terms p)))))))

  ;; 项的表示

  (define (make-term coeff order)
    (cons coeff order))

  (define (coeff term)
    (car term))

  (define (order term)
    (cdr term))

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
    (cond ((empty-terms? t1) t2)
          ((empty-terms? t2) t1)
          (else (let ((first1 (first-term t1))
                      (first2 (first-term t2)))
                  (let ((order1 (order first1))
                        (order2 (order first2)))
                    (cond ((> order1 order2) (adjoin-term first1 (add-terms (rest-terms t1) t2)))
                          ((< order1 order2) (adjoin-term first2 (add-terms t1 (rest-terms t2))))
                          (else (adjoin-term (make-term  (add (coeff first1)
                                                              (coeff first2))
                                                         order1)
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
          (adjoin-term (make-term (mul (coeff t1)
                                       (coeff t2))
                                  (add (order t1)
                                       (order t2)))
                       (mul-term-by-all-terms t1 (rest-terms terms))))))

  (define (variable? t)
    (symbol? t))

  (define (same-variable? t1 t2)
    (and (symbol? t1)
         (symbol? t2)
         (eq? t1 t2)))
  (define (empty-terms? t)
    (null? t))
  (define (the-empty-terms) '())

  (define (tag x) (attach-tag 'polynomial x))
  (put 'add '(polynomial polynomial)
       (lambda (x y) (tag (add-poly x y))))
  (put 'mul '(polynomial polynomial)
       (lambda (x y) (tag (mul-poly x y))))
  (put 'make 'polynomial
       (lambda (x y) (tag (make-poly x y))))
  (put '=zero? '(polynomial) =zero?)
  'done)

(define (make-poly var term)
  ((get 'make 'polynomial) var term))
