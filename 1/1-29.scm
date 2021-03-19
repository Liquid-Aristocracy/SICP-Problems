; input: n
; output: int (cube x) dx, x from 0 to 1

(define (cube x)
    (* x x x)
)

(define (simpson-integral f a b n)
    (define h 
        (/ (- b a) n)
    )
    (if (> a b)
        0
        (*
            (+
                (integral-odd f (+ a h) b h (- n 1))
                (f a)
            )
            (/ h 3)
        )
    )
)

(define (integral-odd f a b h n)
    (+
        (integral-even f (+ a h) b h (- n 1))
        (* (f a) 4)
    )
)

(define (integral-even f a b h n)
    (if (= n 0)
        (f a)
        (+
            (integral-odd f (+ a h) b h (- n 1))
            (* (f a) 2)
        )
    )
)

(display (simpson-integral cube 0.0 1.0 ()))
(newline)
