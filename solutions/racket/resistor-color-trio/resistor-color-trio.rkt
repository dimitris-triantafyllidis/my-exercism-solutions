#lang racket

(provide color-code)

(define (color-code colors)
  (define ohms (* (expt 10 (color-digit (third colors))) (+ (* 10 (color-digit (first colors))) (color-digit (second colors)))))
  (cond
    [(>= ohms 1000000000) (string-append(number->string (quotient ohms 1000000000)) " gigaohms")]
    [(>= ohms 1000000)    (string-append(number->string (quotient ohms 1000000))    " megaohms")]
    [(>= ohms 1000)       (string-append(number->string (quotient ohms 1000))       " kiloohms")]
    [else                 (string-append(number->string ohms)                  " ohms")]
    )
  )

(define (color-digit color)
  (cond
    [(string=? color "black")  0]
    [(string=? color "brown")  1]
    [(string=? color "red")    2]
    [(string=? color "orange") 3]
    [(string=? color "yellow") 4]
    [(string=? color "green")  5]
    [(string=? color "blue")   6]
    [(string=? color "violet") 7]
    [(string=? color "grey")   8]
    [(string=? color "white")  9]
    )
  )

