(deffacts dane
(lista 2 7 1 3 8 5 4)
(parzyste )
(nieparzyste )
(zero 0))

(defrule parzyste 
?i <- (lista ?x $?reszta)
?j <- (parzyste $?cos)
(zero ?y&=(mod ?x 2))
=>
(retract ?i ?j)
(assert (lista $?reszta))
(assert (parzyste $?cos ?x)))

(defrule nieparzyste 
?i <- (lista ?x $?reszta)
?j <- (nieparzyste $?cos)
(zero ?y&~=(mod ?x 2))
=>
(retract ?i ?j)
(assert (lista $?reszta))
(assert (nieparzyste $?cos ?x)))

(defrule stop
?i <- (zero ?x)
?j <- (lista)
=>
(retract ?i ?j))