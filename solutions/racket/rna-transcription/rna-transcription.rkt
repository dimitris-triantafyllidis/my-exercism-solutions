#lang racket

(provide to-rna)

(define (to-rna dna)
  (list->string
    (map
      (lambda
        (c)
        (match c
          [#\A #\U]
          [#\C #\G]
          [#\G #\C]
          [#\T #\A]
          [_ (error 'step "invalid character")]
          )
        )
        (string->list dna)
      )
    )
  )
