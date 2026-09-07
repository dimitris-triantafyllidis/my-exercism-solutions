#lang racket

(provide nth-prime)

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

(define (nth-prime number)

  (define upper-bound-for-nth-prime
    (if
      (<= number 6)
      13
      (ceiling (* number (+ (log number) (log (log number)))))
      )
  )

  (if
    (zero? number)
    (error 'nth-prime "")
    (list-ref (primes upper-bound-for-nth-prime) (sub1 number))
    )
  )
