#lang racket
(require "../../schemy-spec.rkt")


(define (most-calories x) x)

(describe "Calculating most calories per elf"

    (it "returns null" (lambda (expect)
      (expect (most-calories 1) (toEqual 1))
    ))

)