(deffacts binarny
	(liczba 35)
	(bin))

(defrule binarny
	?i <- (liczba ?x&~0)
	?j <- (bin $?y)
=>
	(retract ?i ?j)
	(assert (liczba div ?x 2))
	(assert (bin (mod ?x 2)$?y)))