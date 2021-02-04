(deffacts sufitpodloga
	(lista 8 -5 1 -2 5 10 -3 12)
	(liczba 3)
	(sufit)
	(podloga)
	(lista_m)
	(lista_w))
(defrule suf_pod1
	?i <- (lista ?x $?r)
	?j <- (lista_m $?mr)
	(liczba ?y)
	(test (< ?x ?y))
=>
	(retract ?i ?j)
	(assert (lista $?r))
	(assert (lista_m $?mr ?x)))

(defrule suf_pod2
	?i <- (lista ?x $?r)
	?j <- (lista_w $?wr)
	(liczba ?y)
	(test (> ?x ?y))
=>
	(retract ?i  ?j)
	(assert (lista $?r))
	(assert (lista_w $?wr ?x)))

(defrule podloga1
	(lista)
	?i <- (lista_m ?x $?mr)
	?j <- (podloga)
=>
	(retract ?i ?j)
	(assert (lista_m $?mr))
	(assert (podloga ?x)))

(defrule podloga2
	?i <- (podloga ?x)
	?j <- (lista_m ?y $?mr)
	(test (< ?x ?y))
=>
	(retract ?i ?j)
	(assert (podloga ?y))
	(assert (lista_m $?mr))) 

(defrule podloga3
	(podloga ?x)
	?i <- (lista_m ?y $?mr)
	(test (> ?x ?y))
=>
	(retract ?i)
	(assert (lista_m $?mr)))

(defrule sufit1
	(lista)
	?i <- (lista_w ?x $?wr)
	?j <- (sufit)
=>
	(retract ?i ?j)
	(assert (lista_w $?wr))
	(assert (sufit ?x)))

(defrule sufit2
	?i <- (sufit ?x)
	?j <- (lista_w ?y $?wr)
	(test (> ?x ?y))
=>
	(retract ?i ?j)
	(assert (sufit ?y))
	(assert (lista_w $?wr))) 

(defrule sufit3
	(sufit ?x)
	?i <- (lista_w ?y $?wr)
	(test (< ?x ?y))
=>
	(retract ?i)
	(assert (lista_w $?wr)))