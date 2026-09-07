#lang racket

(provide my-reverse)

(define (my-reverse s)
  (define l (string-length s))
  (if
    (= l 0)
    ""
    (string-append (my-reverse (substring s 1)) (substring s 0 1))
    )
  )
