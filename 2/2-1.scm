(define (make-rat n d)
    (let (
        (g (gcd n d))
    ))
    (if (> d 0)
        (cons (/ n g) (/ d g))
        (cons 
            (- 0 (/ n g))
            (- 0 (/ d g))
        )
    )
)
