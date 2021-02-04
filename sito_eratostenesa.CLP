(deffacts dane
(granica 24)
(lista)
(zero 0)
(wynik)
(bufor))

(defrule generowanie
?i <- (lista $?reszta)
?j <- (granica ?y&~1)
=>
(retract ?i ?j)
(assert (granica (- ?y 1)))
(assert (lista ?y $?reszta)))

(defrule sito1
(granica 1)
?i <- (lista ?x ?y $?reszta)
(zero ?z&=(mod ?y ?x))
=>
(retract ?i)
(assert (lista ?x $?reszta)))

(defrule sito2
(granica 1)
?i <- (lista ?x ?y $?reszta)
?j <- (bufor $?cos)
(zero ?z&~=(mod ?y ?x))
=>
(retract ?i ?j)
(assert (lista ?x $?reszta))
(assert (bufor $?cos ?y)))

(defrule sito3
(granica 1)
?i <- (lista ?x)
?j <- (bufor $?cos)
?k <- (wynik $?cos1)
=>
(retract ?i ?j ?k)
(assert (lista $?cos))
(assert (bufor))
(assert (wynik $?cos1 ?x)))

