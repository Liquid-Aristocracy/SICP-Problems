; input: a, b
; output: a*b

(define (double x)
    (+ x x)
)

(define (halve x)
    (/ x 2)
)

(define (even? n)
    (=
        (remainder n 2)
        0
    )
)

(define (* a b)
    (cond
        ((= b 0) 0)
        ((even? b)
            (double
                (*
                    a
                    (halve b)
                )
            )
        )
        (else
            (+
                a
                (*
                    a
                    (- b 1)
                )
            )
        )
    )
)

(display (* (read) (read)))
(newline)
