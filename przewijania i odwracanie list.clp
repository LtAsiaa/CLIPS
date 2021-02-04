(deffacts przewijanie
	(lista a a b a b c a d f))


;zaczyna od tylu przewijac, wyglada tak samo  
(defrule przewijanie1
	?i <- (lista $?reszta ?x)
=>
	(retract ?i)
	(assert (lista ?x $?reszta)))

;zaczyna od przodu przewijac, wyglada tak samo 
(defrule przewijanie2
	?i <- (lista ?x $?reszta)
=>
	(retract ?i)
	(assert (lista $?reszta ?x)))

;odwraca liste 
(deffacts rev
	(lista a a b a b c a d f)
	(rev))
(defrule odwracanie
	?i <- (lista $?reszta ?y)
	?j <- (rev $?rreszta)
=>
	(retract ?i ?j)
	(assert (lista $?reszta))
	(assert (rev $?rreszta ?y)))