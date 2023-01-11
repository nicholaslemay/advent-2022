#lang racket
(require "../../schemy-spec.rkt")


(define most-calories null)

(describe "something"

    (it "does something" (lambda (expect)
      (expect most-calories (toEqual null))
    ))

)