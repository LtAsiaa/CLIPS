(deffacts dane 
(lista1 f b m t i)
(lista2 p i g b z f d)
(bufor)
(naleza))

(defrule niezgodne
?i <- (lista2 ?x $?reszta)
?j <- (bufor $?reszta2)
(not (lista1 ?x $?reszta3))
=>
(retract ?i ?j)
(assert (lista2 $?reszta))
(assert (bufor $?reszta2 ?x )))

(defrule zgodne
?i <- (lista1 ?x $?reszta1)
?j <- (lista2 ?x $?reszta2)
?k <- (naleza $?reszta3)
?m <- (bufor $?cos)
=>
(retract ?i ?j ?k ?m)
(assert (lista1 $?reszta1))
(assert (lista2 $?cos))
(assert (naleza $?reszta3 ?x))
(assert (bufor)))

(defrule naleza
?i <- (lista1 ?x $?reszta)
?j <- (lista2)
?k <- (bufor $?cos)
=>
(retract ?i ?j ?k)
(assert (lista1 $?reszta))
(assert (lista2 $?cos))
(assert (bufor)))

(defrule stop
?i <- (lista1)
?j <- (lista2)
?k <- (bufor $?cos)
=>
(retract ?i ?j ?k))