(deffacts dane
(lista1 b f t i m)
(lista2 a i z k f d m)
(bufor)
(xor))

(defrule zgodne
?i <- (lista1 ?x $?reszta)
?j <- (lista2 ?x $?reszta1)
?k <- (bufor $?reszta2)
=>
(retract ?i ?j ?k)
(assert (lista1 $?reszta))
(assert (lista2 $?reszta2 $?reszta1))
(assert (bufor )))

(defrule niezgodne
?i <- (lista1 ?x $?reszta)
?j <- (lista2 ?y&~?x $?reszta1)
?k <- (bufor $?reszta2)
?m <- (xor $?cos)
=>
(retract ?i ?j ?k)
(assert (lista1 ?x $?reszta))
(assert (lista2 $?reszta1))
(assert (bufor $?reszta2 ?y))
(assert(xor $?cos)))

(defrule nalezy
?i <- (lista1 ?x $?reszta)
?j <- (lista2)
?k <- (bufor $?reszta2)
?l <- (xor $?reszta3)
=>
(retract ?i ?j ?k ?l)
(assert (lista1 $?reszta))
(assert (lista2 $?reszta2))
(assert (bufor))
(assert (xor $?reszta3 ?x)))

(defrule stop 
?i <- (lista1)
?j <- (lista2 $?reszta1)
?m <- (bufor $?cos)
?k <- (xor $?reszta2)
=>
(retract ?i ?j ?m ?k)
(assert(xor $?reszta2 $?reszta1)))