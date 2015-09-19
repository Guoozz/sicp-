(load "newtons-method")
(load "common.scm")

(define (cubic a b c)
  (lambda (x) (+ (cube x)
                 (* a (* Xx x))
                 (* b x)
                 c)))
