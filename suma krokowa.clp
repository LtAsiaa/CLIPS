(deffacts do_sum_krok
	(krok 3)
	(lista 1 3 5 2 6 8 9)
	(suma 0)
	(licznik 0)
	(indeks 1))

(defrule sum_krok1
	(krok ?n)
	?i <- (lista ?x $?lreszta)
	?j <- (suma ?y)
	?k <- (licznik ?m&~?n)
=>
	(retract ?i)
	(assert (lista $?lreszta))
	(retract ?j)
	(assert (suma (+ ?x ?y)))
	(retract ?k)
	(assert (licznik (+ ?m 1))))

(defrule sum_krok2
	(krok ?n)
	?i <- (licznik ?n)
	?j <- (indeks ?x)
	?k <- (suma ?y)
	(lista ?z $?r)
=>
	(retract ?i)
	(assert (licznik 0))
	(assert (suma ?x ?y))
	(retract ?j)
	(assert (indeks (+ ?x 1)))
	(retract ?k)
	(assert (suma 0)))

(defrule sum_krok3
	(lista)
	(suma ?x)
	(indeks ?y)
=>
	(assert (suma ?y ?x)))