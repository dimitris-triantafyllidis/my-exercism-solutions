#lang racket

(provide largest-product)

(define (largest-product digits span)
  (for ([c (in-string digits)])
    (unless (char-numeric? c)
      (error 'largest-product "non-digit character in input")))

  (define (char->digit c)
    (- (char->integer c) (char->integer #\0)))

  (define digits-list
    (for/list ([c (in-string digits)])
      (char->digit c)))

  (define windows
    (for/list ([i (range 0 (add1 (- (length digits-list) span)))])
      (take (drop digits-list i) span)))

  (apply max
         (map (λ (lst) (apply * lst))
              windows)))
