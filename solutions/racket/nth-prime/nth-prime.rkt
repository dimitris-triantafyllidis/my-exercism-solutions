#lang racket

(provide nth-prime)

(define (prime? n)
  (define (prime?-recurse n m)
    (cond
      [(< n 2) #f]
      [(> m (sqrt n)) #t]
      [(zero? (modulo n m)) #f]
      [else (prime?-recurse n (add1 m))]
      )
    )
  (prime?-recurse n 2)
  )

(define (nth-prime number)
  (define (nth-prime-recurse number m)
    (cond
      [(and (prime? m) (zero? (sub1 number))) m]
      [(prime? m) (nth-prime-recurse (sub1 number) (add1 m))]
      [(not (prime? m)) (nth-prime-recurse number (add1 m))]
      )
    )
  (if
    (< number 1)
    (error 'nth-prime "no zeroth prime")
    (nth-prime-recurse number 0)
    )
  )
