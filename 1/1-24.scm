; input:
; output:

(define (timed-prime-test n)
    (newline)
    (display n)
    (start-prime-test n (runtime))
)

(define (start-prime-test n start-time)
    (if (fast-prime? n)
        (report-prime 
            (- (runtime) start-time)
        )
    )
)

(define (expmod base exp m)
    (cond
        ((= exp 0) 1)
        ((even? exp)
            (remainder
                (square
                    (expmod
                        base
                        (/ exp 2)
                        m
                    )
                )
                m
            )
        )
        (else
            (remainder
                (*
                    base
                    (expmod
                        base
                        (- exp 1)
                        m
                    )
                )
                m
            )
        )
    )
)

(define (square x)
    (* x x)
)

(define (fermat-test n)
    (define (try-it a)
        (=
            (expmod a n n)
            a
        )
    )
    (try-it
        (+
            1
            (random (- n 1))
        )
    )
)
        
(define (fast-prime? n times)
    (cond
        ((= times 0) true)
        ((fermat-test n)
            (fast-prime?
                n
                (- times 1)
            )
        )
        (else false)
    )
)

(define (search-for-prime start end)
    (cond
        ((> start end))
        ((even? start)
            (search-for-prime
                (+ start 1)
                end
            )
        )
        (else
            (timed-prime-test start)
            (search-for-prime
                (+ start 2)
                end
            )
        )
    )
)

(search-for-prime (read) (read))
