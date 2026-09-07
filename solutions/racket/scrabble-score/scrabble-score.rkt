#lang racket

(provide score)

(define (score word)
  (apply
    +
    (map
      (lambda
        (c)
        (cond
          [(member c '(#\A #\E #\I #\O #\U #\L #\N #\R #\S #\T)) 1]
          [(member c '(#\D #\G)) 2]
          [(member c '(#\B #\C #\M #\P)) 3]
          [(member c '(#\F #\H #\V #\W #\Y)) 4]
          [(member c '(#\K)) 5]
          [(member c '(#\J #\X)) 8]
          [(member c '(#\Q #\Z)) 10]
          )
        )
      (string->list (string-upcase word))
      )
    )
  )
