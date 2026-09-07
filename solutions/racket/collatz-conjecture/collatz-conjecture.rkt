#lang racket

(provide collatz)

(define (collatz num)

  (if (< num 1) (error 'collatz "") (void))
  (if (inexact? num) (error 'collatz "") (void))

  (if
    (= num 1)
    0
    (+ 1 (collatz (if (= (modulo num 2) 0) (quotient num 2) (+ (* num 3) 1))))
    )
  )
