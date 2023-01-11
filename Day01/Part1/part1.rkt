#lang racket
(require "../../schemy-spec.rkt")


(define (most-calories calory) (apply max calory))

(describe "Calculating most calories per elf"

    (it "returns highest calory received" (lambda (expect)
      (expect (most-calories '(1 2 3 4 3 2 1)) (toEqual 4))
    ))

)