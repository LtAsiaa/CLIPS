(deffacts dane
(lista -11 6 -19 8 -2 18 -23 7 21 6 -3)
)

(defrule pierwsze-min-max
(lista ?x $?)
(not (min ?))
(not (max ?))
=>
(assert (min ?x) (max ?x))
)

(defrule nowe-min
(lista $? ?x $?)
?i<-(min ?m)
(test (< ?x ?m))
=>
(retract ?i)
(assert (min ?x))
)

(defrule nowe-max
(lista $? ?x $?)
?i<-(max ?m)
(test (> ?x ?m))
=>
(retract ?i)
(assert (max ?x))
)