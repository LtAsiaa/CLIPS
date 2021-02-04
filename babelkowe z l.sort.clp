(deffacts sortowaniebabelkowe
	(lista -3 11 -7 6 -1 3 8)
	(bufor)
	(posortowane))

(defrule petla
	?i <- (lista ?x ?y $?reszta)
	?j <- (bufor $?cos)
	(test(> ?x ?y))
=>
	(retract ?i ?j)
	(assert (lista ?x $?reszta))
	(assert (bufor $?cos ?y)))

(defrule petla1
	?i <- (lista ?x ?y $?reszta)
	?j <- (bufor $?cos)
	(test(< ?x ?y))
=>
	(retract ?i ?j)
	(assert (lista ?y $?reszta))
	(assert (bufor $?cos ?x)))

(defrule petla2
	?i <- (lista ?x)
	?j <- (bufor $?y)
	?k <- (posortowane $?reszta)
=>
	(retract ?i ?j ?k)
	(assert (lista $?y))
	(assert (bufor))
	(assert (posortowane ?x $?reszta)))