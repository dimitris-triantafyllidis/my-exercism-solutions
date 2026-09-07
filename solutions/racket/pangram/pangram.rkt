#lang racket

(provide pangram?)

(define (pangram? sentence) (equal? (set-count (list->set (filter char-alphabetic? (string->list (string-upcase sentence))))) 26))
