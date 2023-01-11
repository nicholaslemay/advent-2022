#lang racket
(require "../../schemy-spec.rkt")
(require "../day1-sample.rkt")
(require "../day1-input.rkt")

(define (sum x) (apply + x))
(define (sums-of x)(map sum x)) 
(define (top n numbers)(take (sort numbers >) 3))

(define (top-calories calories-per-elf)
  (sum (top 3 (sums-of calories-per-elf)))
)

(describe "Calculating top calories by elves"

    (it "returns sum of top 3 total calories carried by different elves" (lambda (expect)
      (expect (top-calories '((10 10 10) (1 1 1) (9 9 9) (8 8 8) )) (toEqual (+ 30 27 24)))
    ))

)