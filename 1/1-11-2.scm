; input: n
; output: f(n), using iteration

(define (f n)
    (f-iter 2 1 0 n)
)

(define (f-iter a b c count)
    (if (< count 3) ;iterration over
        (if (= count 2)
            a
            count
        )
        (f-iter
            (+
                a
                (* b 2)
                (* c 3)
            )
            a
            b
            (- count 1)
        )
    )
)

(display (f (read)))
(newline)
