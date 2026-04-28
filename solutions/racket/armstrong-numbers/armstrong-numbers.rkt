#lang racket

(provide armstrong-number?)

(define (armstrong-number? n)
  (define
    digits
    (map
      (lambda (c) (string->number (string c))) (string->list (number->string n))
      )
    )
  (= n (apply + (map (lambda (d) (expt d (length digits))) digits)))
  )
