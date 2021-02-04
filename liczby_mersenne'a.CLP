(deffacts dane
(granica 24))

(defrule start
(not (lista $?))
(not (zero ?))
(not (bufor $?))
(not (pierwsze $?))
(not (mersenne $?))
=>
(assert (lista))
(assert (zero 0))
(assert (bufor))
(assert (pierwsze))
(assert (mersenne)))

(defrule generowanie
?i <- (granica ?x&~1)
?j <- (lista $?cos)
=>
(retract ?i ?j)
(assert (granica (- ?x 1)))
(assert (lista ?x $?cos)))

(defrule rowne_zero
(granica 1)
?i <- (lista ?x ?y $?reszta)
(zero ?z&=(mod ?y ?x))
=>
(retract ?i)
(assert (lista ?x $?reszta)))

(defrule rozne_zero
(granica 1)
?i <- (lista ?x ?y $?reszta)
?j <- (bufor $?cos)
(zero ?z&~=(mod ?y ?x))
=>
(retract ?i ?j)
(assert (lista ?x $?reszta))
(assert (bufor $?cos ?y)))

(defrule liczby_pierwsze
(granica 1)
?i <- (lista ?x)
?j <- (bufor $?cos)
?k <- (pierwsze $?cos1)
=>
(retract ?i ?j ?k)
(assert (lista $?cos))
(assert (bufor))
(assert (pierwsze $?cos1 ?x)))

(defrule liczby_mersenne
(granica 1)
(lista)
(bufor)
?i <- (pierwsze ?x $?reszta)
?j <- (mersenne $?cos)
=>
(retract ?i ?j)
(assert (pierwsze $?reszta))
(assert (mersenne $?cos (div (- (** 2 ?x) 1) 1))))