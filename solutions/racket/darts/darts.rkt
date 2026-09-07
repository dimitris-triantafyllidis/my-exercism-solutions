#lang racket

(provide score)

(define (score x y)

  (let
    ([r (sqrt (+ (* x x) (* y y)))])
    (cond
      [(> r 10) 0]
      [(> r 5) 1]
      [(> r 1) 5]
      [else 10]
      )
    )
  )

(score 1 1)
