#lang racket

(provide largest-product)

(define (largest-product digits span)

  (for ([c (in-string digits)])
    (unless (char-numeric? c)
      (error 'largest-product "non-digit character in input")))

  (define digits-list
    (for/list
      ([i (range 0 (string-length digits))])
      (- (char->integer (string-ref digits i)) (char->integer #\0))))

  (apply max (map (lambda (l) (apply * l)) (for/list ([i (range 0 (add1 (-(length digits-list) span)))]) (take ( drop digits-list i) span)))))
