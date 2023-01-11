#lang racket

(provide context)
(provide toEqual)
(provide describe)
(provide before-each)
(provide it)
(provide expect)
(provide number-of-specs-ran)
(provide number-of-specs-passed)
(provide exception-from)

(define true #t)
(define false #f)
(define append-to-list cons)
(define number-of-specs-ran 0)
(define number-of-specs-passed 0)

(define (adjust-specs-counts spec-success)
  (when spec-success
    (set! number-of-specs-passed (+ 1 number-of-specs-passed))
  ) 
  (set! number-of-specs-ran (+ 1 number-of-specs-ran))
)

(define (make-test-result success output)
  (adjust-specs-counts success)
  (cons success output)
)

(define (test-result-passed? test-result) (car test-result))
(define (test-result-message test-result) (cdr test-result))

(define (display-on-single-line . args)
   (map display args)
   (display "\n")
) 

(define (pretty-print object)
  (define (to-string element)
    (cond
      [(symbol? element) (symbol->string element)]
      [(number? element) (number->string element)]
      [else element]
     )
  )
  
  (define (spaced-element element)
	(string-append element " ")
  )

  (define (do-pretty-print aList)
    (define content 
       (apply string-append (map spaced-element (map to-string aList)))
    )
    (string-append "(" (string-append content ")") )	
  )

  
  (if (list? object)
     (do-pretty-print object)
     (to-string object)
  )
  
)


(define (indented-string nesting-level . args )
  (apply string-append (make-string nesting-level #\ ) args)
)

(define (display-with-indent nesting-level message)
  (display-on-single-line (indented-string nesting-level message))
)

(define (make-error-message expected actual)
      (string-append "Expected: " (pretty-print expected) 
                      " but was " (pretty-print actual)
      )
)

(define (exception-from fun)
  (with-handlers ([(lambda (e) #t) (lambda (e) e)])
    (fun)
  )
)

(define (toEqual expected)
  (lambda (actual)
    (if (equal? actual expected)
      (make-test-result true "")
      (make-test-result false (make-error-message expected actual))
    )
  )
)

(define (expect value matcher) (matcher value))

(define (execute-each current-nesting-level sections)
  (define sub-section-nesting (+ current-nesting-level 1))
  (for-each (lambda (section) (section sub-section-nesting)) sections)
)

(define before-each-callback null)

(define (before-each callback)
  (lambda (nesting) (set! before-each-callback callback))
)

(define (describe description . sections)
  (set! before-each-callback null)
  (define current-nesting-level 0)
  (display-on-single-line "Describing: " description)
  (execute-each current-nesting-level sections)
  (display "\n")
) 

(define (context description . tests)
  (lambda (current-nesting-level)
    (display-with-indent current-nesting-level (string-append "When " description)) 
    (execute-each current-nesting-level tests)
  )
) 

(define (display-test-failed nesting-level complete-description result)
  (display-with-indent nesting-level (string-append "* "complete-description)) 
  (display-with-indent (+ 1 nesting-level) (test-result-message result)) 
)

(define (display-test-result nesting-level complete-description result)
  (if (test-result-passed? result)
    (display-with-indent nesting-level (string-append "✓ " complete-description)) 
    (display-test-failed nesting-level complete-description result)
  )
)

(define (it description test)
  (lambda (nesting-level)
    (define complete-description (string-append "It " description)) 
    (define (test-breaking-expectation value matcher) 
      (let ((result (expect value matcher)))
        (display-test-result nesting-level complete-description result)
      )
    )(unless (null? before-each-callback) (before-each-callback))
    (test test-breaking-expectation)
  )
)
