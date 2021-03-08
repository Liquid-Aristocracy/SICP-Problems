; input: a, b
; output: a*b (theta(log b), iteration)

(define (double x)
    (+ x x)
)

(define (halve x)
    (/ x 2)
)

(define (* a b)
    (iter-mul a b 0)
)

(define (iter-mul a b x)
    (cond
        ((= b 0) x)
        ((even? b)
            (iter-mul
                (double a)
                (halve b)
                x
            )
        )
        (else
            (iter-mul
                a
                (- b 1)
                (+ x a)
            )
        )
    )
)

(display (* (read) (read)))
(newline)
