#lang racket

(provide binary-search)

(define (binary-search array value)

  (define (binary-search-recurse array value from-idx to-idx)

    (define mid-idx (quotient (+ from-idx to-idx) 2))

    (cond
      [(vector-empty? array) #f]
      [(< to-idx from-idx) #f]
      [else
        (cond
          [(= value (vector-ref array from-idx)) from-idx]
          [(= value (vector-ref array to-idx))   to-idx]
          [(= value (vector-ref array mid-idx))  mid-idx]
          [(> value (vector-ref array mid-idx))  (binary-search-recurse array value ( add1 mid-idx) to-idx)]
          [(< value (vector-ref array mid-idx))  (binary-search-recurse array value from-idx (sub1 mid-idx))]
          )]))

  (binary-search-recurse array value 0 (- (vector-length array) 1))
  )
