(deffacts przedzial
	(przedzial 1 9)
	(lista 1 5 7 2 -3 14 11 -9 8 12 4)
	(do))	

(defrule naleza
	(przedzial ?l ?p)
	?i <- (lista ?x $?reszta)
	?j <- (do $?z)
	(test (>= ?x ?l))
	(test (<= ?x ?p))
=>
	(retract ?i ?j)
	(assert (lista $?reszta))
	(assert (do $?z ?x)))

(defrule nienaleza
	(przedzial ?l ?p)
	?i <- (lista ?x $?reszta)
	(test (> ?x ?p))
=>
	(retract ?i)
	(assert (lista $?reszta)))

(defrule nienaleza1 
	(przedzial ?l ?p)
	?i <- (lista ?x $?reszta)
	(test (< ?x ?l))
=>
	(retract ?i)
 	(assert (lista $?reszta)))