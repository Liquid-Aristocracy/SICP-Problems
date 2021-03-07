; input: b, n
; output: b^n, theta(log n), iteration

(define (fast-expt b n)
    (fast-expt-iter 1 b n)
)

(define (fast-expt-iter a b n)
    (cond
        ((= n 0) a)
        ((even? n)  ; b ^ n = (b^2) ^ (n/2)
            (fast-expt-iter
                a
                (square b)
                (/ n 2)
            )
        )
        (else
            (fast-expt-iter
                (* a b)
                b
                (- n 1)
            )
        )
    )
)
        

(define (even? n)
    (=
        (remainder n 2)
        0
    )
)

(define (square x)
    (* x x)
)

(display (fast-expt (read) (read)))
(newline)
