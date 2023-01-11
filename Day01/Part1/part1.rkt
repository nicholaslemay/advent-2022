#lang racket
(require "../../schemy-spec.rkt")
(require "../day1-sample.rkt")
(require "../day1-input.rkt")

(define (sum x) (apply + x))
(define (most-calories calories-per-elf) (apply max (map sum calories-per-elf)))

(describe "Calculating most calories per elf"

    (it "returns highest total calory carried by single elf" (lambda (expect)
      (expect (most-calories '((1 1 1) (3 3 3) (2 2 2))) (toEqual 9))
    ))


    (it "resolve sample input" (lambda (expect)
      (expect (most-calories day1-sample) (toEqual 24000))
    ))

        (it "resolve my own input" (lambda (expect)
      (expect (most-calories day1-input) (toEqual 74711))
    ))

)