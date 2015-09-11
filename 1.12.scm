(define (Pascal-triangle row col)
  (cond ((> col row ) (error "input error col > row"))
        ((or (= col 1) (= col row)) 1)
        (else (+ (Pascal-triangle (- row 1) (- col 1))
                 (Pascal-triangle (- row 1) col)))))


;; 迭代版本 利用组合公式求
(define (factorial n)
  (factorial-iter 1  n))

(define (factorial-iter product n)
  (if (= 1 n) product
      (factorial-iter (* product n) (- n 1))))

(define (c n m)
  (/ (factorial n) (* (factorial m) (factorial (- n m)))))

(define (Pascal-triangle2 row col)
  (c (- row 1)  (- col 1)))
