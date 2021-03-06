; input: start, end
; output:

; Gambit is not in "most Lisp implementations". will test this later

(define (timed-prime-test n)
    (newline)
    (display n)
    (start-prime-test n (runtime))
)

(define (start-prime-test n start-time)
    (if (prime? n)
        (report-prime 
            (- (runtime) start-time)
        )
    )
)

(define (report-time elapsed-time)
    (display " *** ")
    (display elapsed-time)
)

(define (smallest-divisor n)
    (find-divisor n 2)
)

(define (find-divisor n test-divisor)
    (cond
        ((> (square test-divisor) n) 
            n
        )
        ((divides? test-divisor n)
            test-divisor
        )
        (else
            (find-divisor
                n
                (+ test-divisor 1)
            )
        )
    )
)

(define (divides? a b)
    (=
        (remainder b a)
        0
    )
)

(define (prime? n)
    (=
        n
        (smallest-divisor n)
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
