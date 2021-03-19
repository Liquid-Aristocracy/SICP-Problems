; input: b
; output: pi, iteration

(define (product term a next b)
    (define (iter a result)
        (if (> a b)
            result
            (iter 
                (next a)
                (* result (term a))
            )
        )
    )
    (iter a 1)
)

(define (factorial a b)
    (define (identity x)
        x
    )
    (define (next x)
        (+ x 1)
    )
    (product identity a next b)
)

(define (calc-pi a b)
    (define (term x)
        (*
            (/ (- x 1) x)
            (/ (+ x 1) x)
        )
    )
    (define (next x)
        (+ x 2)
    )
    (*
        (product term a next b)
        4
    )
)

(display (calc-pi 3.0 (read)))
(newline)
        
