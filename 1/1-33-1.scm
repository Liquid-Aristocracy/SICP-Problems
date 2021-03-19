; recursion

(define (filtered-accumulate filter combiner null-value term a next b)
    (define (test x)
        (if (filter a)
            (combiner a x)
            x
        )
    )
    (if (> a b)
        null-value
        (test
            (filtered-accumulate filter combiner null-value term (next a) next b)
        )
    )
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
