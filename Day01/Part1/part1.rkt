#lang racket
(require "../../schemy-spec.rkt")


(describe "something"

    (it "does something" (lambda (expect)
      (expect 2 (toEqual 2))
    ))

)