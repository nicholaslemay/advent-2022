#lang racket
(require "../../schemy-spec.rkt")
(require "../day1-sample.rkt")
(require "../day1-input.rkt")

(define (sum x) (apply + x))
(define (most-calories calories-per-elf) (sum (map sum calories-per-elf)))

(describe "Calculating top calories by elves"

    (it "returnssum of all calories carried by elves" (lambda (expect)
      (expect (most-calories '((1 1 1) (3 3 3) (2 2 2))) (toEqual (+ 3 9 6)))
    ))

)