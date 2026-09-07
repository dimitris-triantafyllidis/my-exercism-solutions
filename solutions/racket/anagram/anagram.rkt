#lang racket

(provide anagrams-for)

(define (is-anagram-for subject candidate)
  (and
    (not
      (string=?
        (string-downcase subject)
        (string-downcase candidate)))
    (equal?
      (sort (string->list (string-downcase subject)) char<?)
      (sort (string->list (string-downcase candidate)) char<?)))
  )

(define (anagrams-for subject candidates)
 (filter (λ (candidate) (is-anagram-for subject candidate)) candidates)
  )
