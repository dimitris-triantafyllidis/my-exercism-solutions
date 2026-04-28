#lang racket

(provide yacht)

(define (dice-face-occurences dice face)
  (apply + (map (λ (d) (if (= d face) 1 0)) dice)))

(define (yacht dice category)

  (define dice-sorted (sort dice <))

  (cond [(string=? category "ones")
         (* (dice-face-occurences dice 1) 1)]
        [(string=? category "twos")
         (* (dice-face-occurences dice 2) 2)]
        [(string=? category "threes")
         (* (dice-face-occurences dice 3) 3)]
        [(string=? category "fours")
         (* (dice-face-occurences dice 4) 4)]
        [(string=? category "fives")
         (* (dice-face-occurences dice 5) 5)]
        [(string=? category "sixes")
         (* (dice-face-occurences dice 6) 6)]
        [(and (string=? category "little straight")
              (equal? dice-sorted '(1 2 3 4 5)))
         30]
        [(and (string=? category "big straight")
              (equal? dice-sorted '(2 3 4 5 6)))
         30]
        [(string=? category "choice")
         (apply + dice)]
        [(and (string=? category "yacht")
              (= (set-count (list->set dice)) 1))
         50]
        [(string=? category "four of a kind")
         (cond [(>= (dice-face-occurences dice 1) 4)  4]
               [(>= (dice-face-occurences dice 2) 4)  8]
               [(>= (dice-face-occurences dice 3) 4) 12]
               [(>= (dice-face-occurences dice 4) 4) 16]
               [(>= (dice-face-occurences dice 5) 4) 20]
               [(>= (dice-face-occurences dice 6) 4) 24]
               [else 0])
          ]
        [(string=? category "full house")
         (cond [(or (and (= (list-ref dice-sorted 0)
                            (list-ref dice-sorted 1)
                            (list-ref dice-sorted 2))
                         (= (list-ref dice-sorted 3)
                            (list-ref dice-sorted 4))
                         (= (set-count (list->set dice)) 2))
                    (and (= (list-ref dice-sorted 0)
                            (list-ref dice-sorted 1))
                         (= (list-ref dice-sorted 2)
                            (list-ref dice-sorted 3)
                            (list-ref dice-sorted 4))
                         (= (set-count (list->set dice)) 2)))
                (apply + dice)]
               [else 0])
          ]
        [else 0]

    )
  )
