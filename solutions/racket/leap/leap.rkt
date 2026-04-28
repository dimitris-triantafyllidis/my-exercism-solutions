#lang racket

(provide leap-year?)

(define (leap-year? year)
  (if (zero? (modulo year 4)) (if (zero? (modulo year 100)) (if (zero? (modulo year 400)) #t #f) #t) #f))
