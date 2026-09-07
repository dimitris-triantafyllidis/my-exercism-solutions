#lang racket

(provide sum-of-squares square-of-sum difference)

(define (sum-of-squares number)
  (apply + (map (lambda (n) (expt n 2)) (range 1 (+ number 1))))
  )

(define (square-of-sum number)
  (expt (apply + (range 1 (+ number 1))) 2)
  )

(define (difference number)
  (- (square-of-sum number) (sum-of-squares number))
  )
