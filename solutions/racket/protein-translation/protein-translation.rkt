#lang racket

(provide proteins)

(define (proteins strand)

  (define translated-codon
    (cond
      [(zero? (string-length strand)) "STOP" ]
      [(< (string-length strand) 3) (error 'proteins strand)]
      [else
        (match (substring strand 0 3)
          ["AUG"	                      "Methionine"]
          [(or "UUU" "UUC")	            "Phenylalanine"]
          [(or "UUA" "UUG")	            "Leucine"]
          [(or "UCU" "UCC" "UCA" "UCG")	"Serine"]
          [(or "UAU" "UAC")	            "Tyrosine"]
          [(or "UGU" "UGC")	            "Cysteine"]
          ["UGG"	                      "Tryptophan"]
          [(or "UAA" "UAG" "UGA")       "STOP"]
          )
        ]
      )
    )

    (if
      (string=? translated-codon "STOP")
      '()
      (cons translated-codon (proteins (substring strand 3)))
      )
  )