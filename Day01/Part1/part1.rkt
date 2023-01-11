#lang racket
(require "../../schemy-spec.rkt")

(define (sum x) (apply + x))
(define (most-calories calories) (apply max (map sum calories))))

(describe "Calculating most calories per elf"

    (it "returns highest calory received" (lambda (expect)
      (expect (most-calories '((1 1 1) (3 3 3) (2 2 2)) (toEqual 9))
    ))


    (it "can sum calories per elf" (lambda (expect)
      (expect (sum '(1 2 3 4)) (toEqual 10))
    ))

)