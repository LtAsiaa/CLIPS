(deffacts fakty
	(Lista -4 -1 2 4 5 7 8 9)
	(Prze -3 5 0 7 2 10 3 8 -2 2)
	;(wynik)
)

(defrule zrobKopie
	(not (przek $?))
	?i <- (Prze ?x ?y $?r)
	(Lista $?a)
	=>
	(retract ?i)
	(assert (przek ?x ?y 0))
	(assert (Prze $?r))
	(assert (Listaa $?a))
)

(defrule testNie
	(przek ?e ?f $?)
	?i <- (Listaa ?x $?kek)
	(or (test (< ?x ?e))
	(test (> ?x ?f)))
	=>
	(retract ?i)
	(assert (Listaa $?kek)) 
)

(defrule testTak
	?i <- (przek ?e ?f ?l $?r)
	?j <- (Listaa ?x $?kek)
	
	(test (>= ?x ?e))
	(test (<= ?x ?f))
	=>

	(retract ?i ?j)
	(assert (Listaa $?kek))
	(assert (przek ?e ?f (+ ?l 1) $?r ?x)) 
	
)

(defrule zmienKopieWPrzedzial
	?i <- (Listaa)
	?j <- (przek $?a)
	=>
	(retract ?i ?j)
	(assert (prze $?a))
)

(defrule zsumujLiczby
	(Prze)
	?i <- (prze ?a ?b ?c ?x ?y $?r)
	=>
	(retract ?i)
	(assert (prze ?a ?b ?c (+ ?x ?y) $?r))
)

(defrule wyliczSreddniaISrodekPrzedzialu
	(Prze)
	?i <- (prze ?a ?b ?l ?s)
	=>
	(retract ?i)
	(assert (wynik ?a ?b 
		srednia (/ ?s ?l)
		srodek (/ (+ ?a ?b) 2)
		roznica (- (/ ?s ?l) (/ (+ ?a ?b) 2) )
	))
)