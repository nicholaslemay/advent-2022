#lang racket
(require "../../schemy-spec.rkt")

(define (sum x) (apply + x))
(define (most-calories calories) (apply max calories))

(describe "Calculating most calories per elf"

    (it "returns highest calory received" (lambda (expect)
      (expect (most-calories '(1 2 3 4 3 2 1)) (toEqual 4))
    ))


    (it "can sum calories per elf" (lambda (expect)
      (expect (sum '(1 2 3 4)) (toEqual 10))
    ))

)