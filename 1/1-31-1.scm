; input: b
; output: pi, recursion

(define (product term a next b)
    (if (> a b)
        1
        (*
            (term a)
            (product term (next a) next b)
        )
    )
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
        
