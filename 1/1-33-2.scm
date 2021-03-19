; iteration

(define (filtered-accumulate filter combiner null-value term a next b)
    (define (iter a result)
        (if (> a b)
            null-value
            (if (filter a)
                (iter 
                    (next a)
                    (combiner result (term a))
                )
                (iter (next a) result)
            )
        )
    )
    (iter a null-value)
)

(define (prime-sum a b)
    (define (identity x)
        x
    )
    (define (next x)
        (+ x 1)
    )
    (filtered-accumulate
        prime?
        +
        0
        identity
        a
        next
        b
    )
)

(define (the-product n)
    (define (identity x)
        x
    )
    (define (next x)
        (+ x 1)
    )
    (define (filter x)
        (if (= (gcd x n) 1)
            #t
            #f
        )
    )
    (filtered-accumulate
        filter
        *
        1
        identity
        2
        next
        n
    )
)
