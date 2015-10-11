(load "2.69.scm")
(load "2.68.scm")
(load "huffman-decode.scm")

(define song (list '(a 2) '(na 16) '(boom 1)
                   '(sha 3) '(get 2) '(yip 9)
                   '(job 2) '(wah 1)))

(define song-huffman-tree (generate-huffman-tree song))

(define lyric '(get a job sha na na na na na na na na get a job sha na na na na na na na na wah yip yip yip yip yip yip yip yip yip sha boom))

(define (len l)
  (if (null? l)
      0
      (+ 1
         (len (cdr l)))))

(define song-encode-length (len (encode lyric song-huffman-tree)))
