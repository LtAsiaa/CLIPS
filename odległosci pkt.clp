(deffacts punkty
(punkty 1 7 2 1 3 3 4 9 5 11 6 2 7 4 8 3)
(suma 0 0)
(licznik 0))

(defrule punkty
	?i <- (punkty ?x ?y $?reszta)
	?j <- (suma ?a ?b)
	?k <- (licznik ?n)
=>
	(retract ?i ?j ?k)
	(assert (punkty $?reszta))
	(assert (suma (+ ?a ?x) (+ ?b ?y)))
	(assert (licznik (+ ?n 1)))
	(assert (punkt ?x ?y)))

(defrule distance
	(punkty)
	(suma ?a ?b)
	(licznik ?n)
	?i <- (punkt ?x ?y)
=>
	(retract ?i)
	(assert(punkt ?x ?y (sqrt(+(**(- ?x (/ ?a ?n))2) (** (- ?y (/ ?b ?n))2)))))))


(defrule srednia
	(punkty)
	(suma ?a ?b)
	(licznik ?n)
=>
	(assert (srednia (/ ?a ?n) (/ ?b ?n))))

(defrule najblizszystart
	?i<-(punkt ?x ?y ?z)
	(not(najblizszy ? ? ?))
=>
	(retract ?i)
	(assert (najblizszy ?x ?y ?z)))

(defrule najblizszyporownanie
	?i<-(punkt ?x ?y ?z)
	?j<-(najblizszy ? ? ?l)
	(test(> ?l ?z))
=>
	(retract ?i ?j)
	(assert(najblizszy ?x ?y ?z)))
	
(defrule najblizszyporownanie2
	?i<-(punkt ?x ?y ?z)
	?j<-(najblizszy ? ? ?l)
	(test(<= ?l ?z))
=>
	(retract ?i))

(defrule koniec
	(not(punkt ? ? ? ))
	(not(punkt ? ?))
	(najblizszy ?x ?y ?z)
=>
	(printout t "wpolrzednie nalblizszego wynosza:" ?x" " ?y crlf))
	