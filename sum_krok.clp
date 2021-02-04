;(deffacts start
;(licznik 25))
;(defrule zliczaj
;?i<-(licznik ?n)
;=>
;(retract ?i)
;(assert(licznik (+ ?n 1))))

;(deffacts lista
;	(licznik 0)
;	(lista a b f t i k)
;	(rozmiar 0))
;(defrule rozm
;	?r <- (rozmiar ?size)
;	?l <- (lista ?a $?as)
;	=>
;	(retract ?r)
;	(retract ?l)
;	(assert (lista $?as))
;	(assert (rozmiar (+ 1 ?size))))
;
(deffacts lista
	(licznik 0)
	(lista -1 7 3 2 -5 9)
	(rozmiar 0)
	(suma 0))
(defrule suma
 	?s <- (suma ?x)
	?l <- (lista ?el $?elems)
	?i <- (licznik ?k)
	=>
	(retract ?s ?l ?i)
	(assert (lista $?elems))
	(assert (suma (+ ?el ?x)))
	(assert (licznik (+ 1 ?k))))

(defrule srednia
	(lista)
(suma ?s)
(licznik ?r)
=>
(assert (srednia (/ ?s ?r))))
//////////////////////////////////
(deffacts lista
	(lista 2 -7 1 3 -5 9 4 -1)
	(krok 3)
	(licznik 0)
	(suma 0)
	(indeks 1))
(defrule krok
	?i <- (lista ?a $?b)
	(krok ?q)
	?j <- (licznik ?l&~q)
	?k <- (suma ?s)
	
=>
	(retract ?i)
	(retract ?j)
	(retract ?k)
	(assert (lista $?b))
	(assert (licznik (+ ?l 1)))
	(assert (suma (+ ?a ?s))))
(defrule pokroku
	(krok ?a)
	?i <- (licznik ?a )
	?j <- (indeks ?b)
	?k <- (suma ?c)
=>
	(retract ?i)
	(retract ?j)
	(retract ?k)
	(assert (licznik 0))
	(assert (indeks (+ ?b 1)))
	(assert (suma 0))
	(assert (suma ?b ?c)))
(defrule lista
	(lista)
	(suma ?a)
	(indeks ?b)
=>
	(assert (suma ?b ?a)))