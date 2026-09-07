#lang racket

(provide primes)

(define (primes limit)

  (define sieve (range 2 (add1 limit)))

  (define (primes-recurse sieve base-multiple limit)
    (cond
      [(< limit 2) '()]
      [(= base-multiple limit) sieve]
      [else (primes-recurse (filter (lambda (n) (or (<= n base-multiple) (not (zero? (modulo n base-multiple))))) sieve) (add1 base-multiple) limit)]
      ))

  (primes-recurse sieve 2 limit)

  )
