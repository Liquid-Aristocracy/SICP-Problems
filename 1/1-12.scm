; input: n, k
; output: the kth num of nth layer of Pascal triangle

(define (pascal n k)
    (cond
        ((= k 1) 1)
        ((= k n) 1)
        (else
            (+
                (pascal (- n 1) k)
                (pascal (- n 1) (- k 1))
            )
        )
    )
)

(display (pascal (read) (read)))
(newline)
