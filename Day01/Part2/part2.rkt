#lang racket
(require "../../schemy-spec.rkt")
(require "../day1-sample.rkt")
(require "../day1-input.rkt")

(define (sum x) (apply + x))
(define (most-calories calories-per-elf)
  (sum (take (sort (map sum calories-per-elf) >) 3))
)

(describe "Calculating top calories by elves"

    (it "returns sum of all calories carried by top 3 elves" (lambda (expect)
      (expect (most-calories '((10 10 10) (1 1 1) (9 9 9) (8 8 8) )) (toEqual (+ 30 27 24)))
    ))

)