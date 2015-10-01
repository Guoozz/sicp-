;向量的加 (x1,y1) + (x2,y2) = (x1+x2,y1+y2)
(define (add-vect v1 v2)
  (make-vect (+ (xcor-vect v1)
                (xcor-vect v2))
             (+ (ycor-vect v1)
                (ycor-vect v2))))

;向量的减法 (x1,y1) - (x2,y2) = (x1-x2,y1-y2)
(define (sub-vect v1 v2)
  (make-vect (- (xcor-vect v1)
                (xcor-vect v2))
             (- (ycor-vect v1)
                (ycor-vect v2))))


;向量的伸缩 s * (x,y) = (s * x,s * y)

(define (scale-vect s v)
  (make-vect (* s (xcor-vect v))
             (* s (ycor-vect v))))


; 向量的构造函数

(define (make-vect x y)
  (list x y))

; 向量的选择函数

(define (xcor-vect v)
  (car v))

(define (ycor-vect v)
  (cadr v))
