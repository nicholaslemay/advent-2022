#lang racket
(require "../../schemy-spec.rkt")
(require "../day1-sample.rkt")
(require "../day1-input.rkt")

(define (sum x) (apply + x))
(define (most-calories calories-per-elf)
  (sum (take (map sum calories-per-elf) 3))
)

(describe "Calculating top calories by elves"

    (it "returns sum of all calories carried by 3 elves" (lambda (expect)
      (expect (most-calories '((10 10 10) (9 9 9) (8 8 8) (1 1 1))) (toEqual (+ 30 27 24)))
    ))

)