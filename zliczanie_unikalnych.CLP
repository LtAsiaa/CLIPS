(deffacts dane
(lista a b d a b c d c a))

(defrule nowy
?i <- (lista ?x $?reszta)
(not (licznik ?x ?))
=>
(retract ?i)
(assert (lista $?reszta))
(assert (licznik ?x 1)))

(defrule nastepny
?i <- (lista ?x $?reszta)
?j <- (licznik ?x ?l)
=>
(retract ?i ?j)
(assert (lista $?reszta))
(assert (licznik ?x (+ ?l 1))))

(defrule stop
?i <- (lista )
=>
(retract ?i))