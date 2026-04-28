#lang racket

(provide response-for)

(define (response-for prompt)

  (set! prompt (string-normalize-spaces prompt))

  (let*
    (
      [is-silence (string=? prompt "")]
      [is-question (and (string-suffix? prompt "?") (not (string-prefix? prompt "?")))]
      [contains-letters (not (string=? (list->string (filter (lambda (c) (char-alphabetic? c)) (string->list prompt))) ""))]
      [is-yelling (and contains-letters (string=? (string-upcase prompt) prompt))]
      )
    (cond
      [is-silence "Fine. Be that way!"]
      [(and is-question is-yelling) "Calm down, I know what I'm doing!"]
      [is-question "Sure."]
      [is-yelling "Whoa, chill out!"]
      [else "Whatever."]
      )
    )
  )
