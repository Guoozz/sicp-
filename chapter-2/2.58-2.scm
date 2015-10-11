(define (deriv exp v)
  (if (number? exp)
      0
      (if (variable? exp)
          (if (same-variable? exp v)
              1
              0)
          (if (sum? exp)
              (make-sum (deriv (addend exp) v)
                        (deriv (augend exp) v))
              (if (product? exp)
                  (make-sum
                   (make-product (multiplier exp)
                                 (deriv (multiplicand exp) v))
                   (make-product (deriv (multiplier exp) v)
                                 (multiplicand exp)))
                  (if (exponentiation? exp)
                      (make-product (make-product (exponent exp)
                                                  (make-exponentiation (base exp)
                                                                       (make-sub (exponent exp) 1)))
                                    (deriv (base exp) v))
                      (error "unknown expression type -- DERIV" exp)))))))

(define (make-exponentiation base exponent)
  (if (=number? exponent 0)
      1
      (if (or (=number? base 1)
              (=number? base 0)
              (=number? exponent 1))
          base
          (list  base '**  exponent))))

(define (make-product exp1 exp2)
  (if (or (=number? exp1 0)
          (=number? exp2 0))
      0
      (if (=number? exp1 1)
          exp2
          (if (=number? exp2 1)
              exp1
              (if (and (number? exp1)
                       (number? exp2))
                  (* exp1 exp2)
                  (list  exp1 '* exp2))))))


(define (make-sum exp1 exp2)
  (if (=number? exp1 0)
      exp2
      (if (=number? exp2 0)
          exp1
          (if (and (number? exp1)
                   (number? exp2))
              (+ exp1 exp2)
              (list  exp1 '+  exp2)))))

(define (make-sub exp1 exp2)
  (if (=number? exp1 0)
      (list '- 'exp2)
      (if (=number? exp2 0)
          exp1
          (if (and (number? exp1)
                   (number? exp2))
              (- exp1 exp2)
              (list  exp1 '-  exp2)))))


(define (base exp)
  (car exp))

(define (exponent exp)
  (caddr exp))

(define (exponentiation? exp)
  (and (pair? exp)
       (eq? (cadr exp) '**)))

(define (variable? exp)
  (symbol? exp))

(define (same-variable? v1 v2)
  (and
   (variable? v1)
   (variable? v2)
   (eq? v1 v2)))

(define (sum? exp)
  (and
   (pair? exp)
   (eq? (cadr exp) '+)))

(define (product? exp)
  (and
   (pair? exp)
   (eq? (cadr exp) '*)))



(define (=number? exp num)
  (and (number? exp) (= exp num)))

(define (addend exp)
  (car exp))

(define (augend exp)
  (caddr exp))

(define (multiplier exp)
  (car exp))

(define (multiplicand exp)
  (caddr exp))
