#lang racket

(provide convert)

(define (convert number)
    (define s "")
    (if (= (modulo number 3) 0) (set! s (string-append s "Pling")) (void))
    (if (= (modulo number 5) 0) (set! s (string-append s "Plang")) (void))
    (if (= (modulo number 7) 0) (set! s (string-append s "Plong")) (void))
    (if (string=? s "") (set! s (number->string number)) (void))
    s
  )
