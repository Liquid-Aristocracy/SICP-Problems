; input: n
; output: cbrt of n

(define (cbrt-iter guess x)
    (if (good-enough? guess x)
        guess
        (cbrt-iter 
            (improve guess x)
            x
        )
    )
)

(define (improve guess x)
    (/
        (+
            (/
                x
                (square guess)
            )
            (*
                guess
                2
            )
        )
        3
    )
)

(define (good-enough? guess x)
    (<  ;difference between this and next iter is small enough
        (abs
            (- 
                guess
                (improve guess x)
            )
        )
        0.001
    )
)

(define (square x)
    (* x x)
)

(define (cbrt x)
    (cbrt-iter
        1.0
        x
    )
)

(display (cbrt (read)))
(newline)
