(deffacts frags
	(lista a b c a b c a b c)
	(frag)
	(lbufor)
	(fbufor)
	(licznik 0)
	(flicznik 1))

(defrule frag1
	?i <- (lista ?x $?lreszta)
	?j <- (frag $?freszta)
	?k <- (lbufor $?lbreszta)
	(flicznik ?n)
	?l <- (licznik ?m)
	(test (!= ?n ?m))
=>
	(retract ?i ?j ?k ?l)
	(assert (lista $?lreszta))
	(assert (frag $?freszta ?x))
	(assert (lbufor $?lbreszta ?x))
	(assert (licznik (+ ?m 1))))

(defrule frag2
	?i <- (lista ?x $?lreszta)
	?j <- (frag ?x $?freszta)
	?k <- (lbufor $?lbreszta)
	?l <- (fbufor $?fbreszta)
	(flicznik ?n)
	(licznik ?n)
=>
	(retract ?i ?j ?k ?l)
	(assert (lista $?lreszta))
	(assert (frag $?freszta))
	(assert (lbufor $?lbreszta ?x))
	(assert (fbufor $?fbreszta ?x)))

(defrule frag3
	(lista ? $?)
	?i <- (frag)
	?j <- (fbufor $?fbreszta)
	(flicznik ?n)
	(licznik ?n)
=>
	(retract ?i ?j)
	(assert (frag $?fbreszta))
	(assert (fbufor)))

(defrule frag4
	?i <- (lista ?x $?lreszta)
	?j <- (frag ?y&~?x $?freszta)
	?k <- (lbufor $?lbreszta)
	?l <- (fbufor $?)
	?ii <- (flicznik ?n)
	?jj <- (licznik ?n)
=>
	(retract ?i ?j ?k ?l ?ii ?jj)
	(assert (lista $?lbreszta ?x $?lreszta))
	(assert (frag))
	(assert (lbufor))
	(assert (fbufor))
	(assert (licznik 0))
	(assert (flicznik (+ ?n 1))))

(defrule frag5
	(lista)
	(frag)
	(fbufor $?fbreszta)
=>
	(printout t "Powtarzajacy sie fragment: " $?fbreszta crlf))

(defrule frag6
	(lista)
	(frag ? $?)
=>
	(printout t "Brak powtarzajacego sie fragmentu" crlf))