#lang racket
(require "../../schemy-spec.rkt")


(define (most-calories calory) calory)

(describe "Calculating most calories per elf"

    (it "returns calory received" (lambda (expect)
      (expect (most-calories 1) (toEqual 1))
    ))

)