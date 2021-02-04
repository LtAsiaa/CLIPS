(deffacts ldoskonala
	(liczba 28)
	(dzielnik 1)
	(suma 0))
(defrule dosk1
	(liczba ?x)
	?i <- (suma ?y)
	?j <- (dzielnik ?z)
	(test (= (mod ?x ?z) 0))
	(test (>= (/ ?x 2) ?z))
=>
	(retract ?i)
	(assert (suma (+ ?y ?z)))
	(retract ?j)
	(assert (dzielnik (+ ?z 1))))

(defrule dosk2
	(liczba ?x)
	?i <- (dzielnik ?z)
	(test (!= (mod ?x ?z) 0))
	(test (>= (/ ?x 2) ?z))
=>
	(retract ?i)
	(assert (dzielnik (+ ?z 1))))

(defrule dosk3
	(liczba ?x)
	(dzielnik ?y)
	(test (< (/ ?x 2) ?y))
	(suma ?z)
	(test (= ?x ?z))
=>
	(printout t "Liczba " ?x " jest doskonala" crlf))

(defrule dosk4
	(liczba ?x)
	(dzielnik ?y)
	(test (< (/ ?x 2) ?y))
	(suma ?z)
	(test (!= ?x ?z))
=>
	(printout t "Liczba " ?x " nie jest doskonala" crlf))