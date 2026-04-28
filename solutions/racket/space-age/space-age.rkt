#lang racket

(provide on-mercury
         on-venus
         on-earth
         on-mars
         on-jupiter
         on-saturn
         on-uranus
         on-neptune)

(define (on-earth seconds)
  (/ seconds (* 365.25 86400.0))
  )

(define (on-mercury seconds)
  (/ (on-earth seconds) 0.2408467)
  )

(define (on-venus seconds)
  (/ (on-earth seconds) 0.61519726)
  )

(define (on-mars seconds)
  (/ (on-earth seconds) 1.8808158)
  )

(define (on-jupiter seconds)
  (/ (on-earth seconds) 11.862615)
  )

(define (on-saturn seconds)
  (/ (on-earth seconds) 29.447498)
  )

(define (on-uranus seconds)
  (/ (on-earth seconds) 84.016846)
  )

(define (on-neptune seconds)
  (/ (on-earth seconds) 164.79132)
  )
