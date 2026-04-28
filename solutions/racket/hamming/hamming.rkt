#lang racket

(provide hamming-distance)

(define (hamming-distance source target)

  (if
    (not (eq? (string-length source) (string-length target)))
    (error 'hamming-distance "strands have different lengths")
    void
    )

  (if
    (zero? (string-length source))
    0
    (if
      (char=? (string-ref source 0) (string-ref target 0))
      (+ (hamming-distance (substring source 1) (substring target 1)) 0)
      (+ (hamming-distance (substring source 1) (substring target 1)) 1)
      )
    )
  )
