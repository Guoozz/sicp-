(load "tagged-data.scm")
(load "get-put.scm")

(define get-coercion get)

(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
          (apply proc (map contents args))
          (if (= (length type-tags) 2)
              (let ((type1 (car type-tags))
                    (type2 (cadr type-tags))
                    (a1 (car args))
                    (a2 (cadr args)))
                (let ((t1->t2 (get-coercion type1 type2))
                      (t2->t1 (get-coercion type2 type1)))
                  (cond ((eq? type1 type2) (error "no such method for these operations --APPLY-GENERIC" (list op type-tags)))
                        (t1->t2 (apply-generic op (t1->t2  a1) a2))
                        (t2->t1 (apply-generic op a1 (t2->t1 a2)))
                        (else (error "no such method --APPLY-GENERIC" (list op type-tags))))))
              (error "no such method --APPLY-GENERIC" (list op type-tags)))))))
