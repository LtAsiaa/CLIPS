(deffacts dane
(lista 11 10 1997)
(suma 0))

(defrule rozbijanie
?i <- (lista ?x $?reszta)
(test (> ?x 9))
=>
(retract ?i )
(assert (lista (mod ?x 10) (div ?x 10) $?reszta)))

(defrule nierozbijaj
?i <- (lista ?x $?reszta)
?j <- (suma ?y)
(test (<= ?x 9))
=>
(retract ?i ?j)
(assert (suma (+ ?y ?x)))
(assert (lista $?reszta)))

(defrule sumuj
?i <- (lista)
?j <- (suma ?x)
(test (> ?x 9))
=>
(retract ?i ?j)
(assert (lista ?x))
(assert (suma 0)))
