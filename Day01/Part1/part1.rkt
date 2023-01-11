#lang racket
(require "../../schemy-spec.rkt")


(define most-calories null)

(describe "Calculating most calories per elf"

    (it "returns null" (lambda (expect)
      (expect most-calories (toEqual null))
    ))

)