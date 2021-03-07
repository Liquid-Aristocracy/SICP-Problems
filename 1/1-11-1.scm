; input: n
; output: f(n), using recursion

(define (f n)
    (if (< n 3)
        n
        (+
            (f (- n 1))
            (*   
                (f (- n 2))
                2
            )
            (*
                (f (- n 3))
                3
            )
        )
    )
)

(display (f (read)))
(newline)
