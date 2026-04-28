#lang racket

(provide square-root)

(define (square-root radicand)

  (define (find-square-root radicand test-value)
    (if
      (eq? (expt test-value 2) radicand)
      test-value
      (find-square-root radicand (- test-value 1))
      )
    )

  (find-square-root radicand radicand)

  )
