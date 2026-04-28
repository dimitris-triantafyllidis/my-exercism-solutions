#lang racket

(provide triangle?)

(define (triangle? sides kind)

  (let
    (
      [s1(first  sides)]
      [s2(second sides)]
      [s3(third  sides)]
      )
    (cond
      [(not (and (> (+ s1 s2) s3) (> (+ s2 s3) s1) (> (+ s3 s1) s2))) #f]
      [(and (eq? kind 'equilateral) (= s1 s2) (= s2 s3)) #t]
      [(and (eq? kind 'isosceles) (or (= s1 s2) (= s1 s3) (= s2 s3))) #t]
      [(and (eq? kind 'scalene) (not (or (= s1 s2) (= s2 s3) (= s3 s1)))) #t]
      [else #f]
      )
    )
  )
