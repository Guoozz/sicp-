;; test 1.11 answer

;; 递归形式的解

(define (f n)
  (if (< n 3) n
  (+ (f (- n 1)) (* 2 (f (- n 2))) (* 3 (f (- n 3))))))

;; 迭代求解

(define (ff n)
  (ff-iter 0 1 2 n))
(define (ff-iter a b c n)
  (cond ((= n 2) c)
        ((< n 2) n)
        (else (ff-iter b c (+ c (* 2 b) (* 3 a)) (- n 1)))))
