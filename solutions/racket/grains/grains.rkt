#lang racket

(provide square total)

(define (square a-square)
  (expt 2 (- a-square 1)))

(define (total)
  (define (t n)
    (if
      (= n 1)
      (square n)
      (+ (square n) (t (- n 1)))
      )
    )
  (t 64)
  )
