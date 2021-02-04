(deffacts rozklad
	(liczba 60)
	(podzielnik 2)
	(czynniki))

(defrule nwd
	?i <- (liczba ?x&~1)
	?j <- (podzielnik ?y)
	?k <- (czynniki $?z)
	(test(= (mod ?x ?y) 0))
=>
	(retract ?i ?j ?k)
	(assert (liczba (div ?x ?y))) 
	(assert (podzielnik 2))
	(assert (czynniki ?z $?y)))

(defrule nwd1
	(liczba ?x&~1)
	?j <- (podzielnik ?y)
	(test(!= (mod ?x ?y) 0))
=>
	(retract ?j)
	(assert (podzielnik (+ ?y 1))))