#lang racket

(provide create-queen
         can-attack?)

(define (create-queen row column)

  (if
    (and (>= row 0) (<= row 7) (>= column 0) (<= column 7))
    (list row column)
    (error 'create-queen "")
    )
  )

(define (can-attack? white-queen black-queen)

  (or
    (eq? (first white-queen) (first black-queen))
    (eq? (second white-queen) (second black-queen))
    (eq? (abs (- (first white-queen) (first black-queen))) (abs (- (second white-queen) (second black-queen))))
    )

  )
