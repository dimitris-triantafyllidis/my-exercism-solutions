#lang racket

(provide nucleotide-counts)

(define (nucleotide-counts nucleotides)
  (define (step ch counts)
    (match ch
      [#\A (update counts 0)]
      [#\C (update counts 1)]
      [#\G (update counts 2)]
      [#\T (update counts 3)]
      [_ (error 'step "invalid nucleotide character")]))

  (define (update counts idx)
    (list-update counts idx add1))

  (define counts '(0 0 0 0))

  (define final
    (foldl step counts (string->list nucleotides)))

  (list (cons #\A (list-ref final 0))
        (cons #\C (list-ref final 1))
        (cons #\G (list-ref final 2))
        (cons #\T (list-ref final 3))))

