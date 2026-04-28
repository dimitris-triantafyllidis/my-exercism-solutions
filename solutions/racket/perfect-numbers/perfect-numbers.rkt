#lang racket

(provide classify)

(define (aliquot-factors n)
  (for/list ([m (range 1 n)]
             #:when (zero? (modulo n m)))
    m))

(define (aliquot-sum n)
  (apply + (aliquot-factors n)))

(define (classify number)
  (cond [( = (aliquot-sum number) number) 'perfect]
        [( < (aliquot-sum number) number) 'deficient]
        [( > (aliquot-sum number) number) 'abundant]))
