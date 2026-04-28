#lang racket

(provide isogram?)

(define (isogram? s)
  (define sn (filter char-alphabetic? (string->list (string-upcase s))))
  (equal? (set-count (list->set sn)) (length sn))
)
