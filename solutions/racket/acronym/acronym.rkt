#lang racket

(provide acronym)

(define (acronym string)
  (define (clean s)
    (string-normalize-spaces
      (list->string
        (filter
          (lambda (c)
            (or (char-alphabetic? c)
                (char=? c #\space)
                (char=? c #\-))
            )
          (string->list s)
          )
        )
      #rx"[ -]+"
      )
    )
  (define (words) (regexp-split #rx"[ -]" (clean string)))
  (define (initials words)
    (if
      (null? words)
      ""
      (string-append (make-string 1 (char-upcase (first (string->list (car words))))) (initials (cdr words)))
      )
    )
  (initials (words))
  )

(acronym "Something - I made up from thin air")
