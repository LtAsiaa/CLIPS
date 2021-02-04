(deffacts dane
(lista1 b f t i m)
(lista2 a i z k f d m)
(bufor)
(xor))

(defrule laczenie
?i <- (lista1 $?cos)
?j <- (lista2 $?cos1)
=>
(retract ?i ?j)
(assert (lista $?cos $?cos1)))

(defrule niezgodne
?i <- (lista ?x ?y&~?x $?reszta)
?j <- (bufor $?reszta1)
=>
(retract ?i ?j)
(assert (lista ?x $?reszta))
(assert (bufor $?reszta1 ?y)))

(defrule zgodne
?i <- (lista ?x ?x $?reszta)
?j <- (bufor $?reszta1)
=>
(retract ?i ?j)
(assert (lista $?reszta1 $?reszta))
(assert (bufor)))

(defrule jeden
?i <- (lista ?x)
?j <- (bufor $?reszta1)
?k <- (xor $?cos)
=>
(retract ?i ?j ?k)
(assert (lista $?reszta1))
(assert (bufor))
(assert (xor $?cos ?x)))

(defrule stop
?i <- (lista)
?j <- (bufor)
=>
(retract ?i ?j))