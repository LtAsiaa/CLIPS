(deffacts sitoerastotenesa
	(liczba 20)
	(lista)
	(bufor)
	(pierwsze))
(defrule sito1
	?i <- (liczba ?x)
	?j <- (lista $?lr)
	(test (>= ?x 2))
=>
	(retract ?i)
	(assert (liczba (- ?x 1)))
	(retract ?j)
	(assert (lista ?x $?lr)))

(defrule sito2
	?i <- (lista ?x ?y $?lr)
	?j <- (bufor $?br)
	(test (= (mod ?y ?x) 0))
	(liczba ?z)
	(test (= ?z 1))
=>
	(retract ?i)
	(assert (lista ?x $?lr))
	(retract ?j)
	(assert (bufor $?br)))

(defrule sito3
	?i <- (lista ?x ?y $?lr)
	?j <- (bufor $?br)
	(test (!= (mod ?y ?x) 0))
	(liczba ?z)
	(test (= ?z 1))
=>
	(retract ?i)
	(assert (lista ?x $?lr))
	(retract ?j)
	(assert (bufor $?br ?y)))

(defrule sito4
	?i <- (lista ?x)
	?j <- (bufor $?br)
	?k <- (pierwsze $?pr)
	(liczba ?z)
	(test (= ?z 1))
=>
	(retract ?i)
	(assert (lista $?br))
	(retract ?j)
	(assert (bufor))
	(retract ?k)
	(assert (pierwsze $?pr ?x)))