(deffacts ciag
	(liczba 51)
	(fib 1 1)
	(rozklad))

(defrule generowanie
	(liczba ?x)
	?j <-(fib $?reszta ?z ?y)
	(test(> ?x ?y))	
=>
	(retract ?j)
	(assert (fib $?reszta ?z ?y (+ ?z ?y))))


(defrule rozklad1
	?i <- (liczba ?x)
	?j <- (fib $?reszta ?z ?y)
	?k <- (rozklad $?r)
	(test(> ?y ?x))
	(test(>= ?x ?z))
	(test(> ?x 0))
=>
	(retract ?i ?j ?k)
	(assert	(fib $?reszta ?z))
	(assert(rozklad $?r ?z))
	(assert(liczba(- ?x ?z))))
(defrule rozklad2
	(liczba ?x)
	?j <- (fib $?reszta ?z ?y)
	(test(> ?y ?x))
	(test(> ?z ?x))
	(test(> ?x 0))
=>
	(retract ?j)
	(assert	(fib $?reszta ?z)))