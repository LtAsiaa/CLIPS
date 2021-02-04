(deffacts dane
(liczba 31))

(defrule start
(not (lista $?))
(not (proniczna $?))
=>
(assert (lista))
(assert (proniczna)))

(defrule generowanie
?i <- (liczba ?x&~0)
?j <- (lista $?cos)
=>
(retract ?i ?j)
(assert (liczba (- ?x 1)))
(assert (lista ?x $?cos)))

(defrule liczba_proniczna
(liczba 0)
?i <- (lista ?x ?y $?reszta)
?j <- (proniczna $?cos)
=>
(retract ?i ?j)
(assert (lista ?y $?reszta))
(assert (proniczna $?cos (* ?x ?y))))

(defrule stop
(liczba 0)
?i <- (lista ?x)
=>
(retract ?i))