; input: n
; output: Is n a prime? (bool)

(define (expmod base exp m)
    (define (get-result r)
        (define (test x)
            (if (= x 1)
                0   ; died in this layer
                x   ; fine
            )
        )
        (cond
            ((= r 0) 0)    ; died in deeper recursion
            ((or (= r 1) (= r (- m 1)))
                (remainder      ; no need for test
                    (square r)
                    m
                )
            )
            (else   ; test if r is nontrival root
                (test
                    (remainder
                        (square r)
                        m
                    )
                )
            )
        )
    )
    (cond
        ((= exp 0) 1)
        ((even? exp)
            (get-result
                (expmod
                    base
                    (/ exp 2)
                    m
                )
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

(define (miller-rabin-test n)
    (define (try-it a)
        (=
            (expmod a (- n 1) n)
            1
        )
    )
    (try-it
        (+
            1
            (random-integer (- n 1))
        )
    )
)
        
(define (fast-prime? n times)
    (cond
        ((= times 0) #t)
        ((miller-rabin-test n)
            (fast-prime?
                n
                (- times 1)
            )
        )
        (else #f)
    )
)

(display (fast-prime? (read) 1))
