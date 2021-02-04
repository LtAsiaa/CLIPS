(deffacts sortowaniebabelkowe
	(lista -3 11 -7 6 -1 3 8)
	(bufor))

(defrule bubblesortx1
;	?i <- (lista ?x ?y $?lr)
;	?j <- (bufor $?br)
;	(test (< ?x ?y))
;=>
;	(retract ?i)
;	(assert (lista ?y $?lr))
;	(retract ?j)
;	(assert (bufor $?br ?x)))

;(defrule bubblesortx2
;	?i <- (lista ?x ?y $?lr)
;	?j <- (bufor $?br)
;	(test (> ?x ?y))
;=>
;	(retract ?i)
;	(assert (lista $?br ?y ?x $?lr))
;	(retract ?j)
;	(assert (bufor)))

;(defrule bubblesortx3
;	?i <- (lista ?x)
;	?j <- (bufor $?br)
;=>
;	(retract ?i)
;	(assert (lista $?br ?x))
;	(retract ?j))