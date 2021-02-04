(deffacts bity
	(lista 5 12 17 1 6 11)
	(bin)
	(reszta)
	(licznik 0)
	(suma 0)
	(bufor))

(defrule binarny
	?i <- (lista $?reszta ?x)
	(test(!= ?x 0))
	?j <- (bin $?r)
	?z <- (suma ?n)
=>
	(retract ?i ?j ?z)
	(assert (lista $?reszta (div ?x 2)))
	(assert (bin (mod ?x 2)$?r))
	(assert (suma(+ ?n 1))))

(defrule wyrzucaniezera
	?i<-(lista $?reszta ?x)
	?j<-(licznik ?y)	
	(test(= ?x 0))
=>
	(retract ?i ?j)
	(assert(lista $?reszta))
	(assert(licznik (+ ?y 1))))

(defrule srednia 
	?i<-(lista)
	(licznik ?x)
	(suma ?y)
=>	
	(retract ?i)
	(assert (srednia(div ?y ?x)))
	(assert (dlugosc 0))
	(assert (tmp 0))
	(assert (wynik)))

(defrule rekonwersja
	?i<-(bin $?reszta ?x)
	(srednia ?y)
	?j<-(tmp ?z)
	?k<-(dlugosc ?v)
	(test (!= ?y ?v))
=>
	(retract ?i ?j ?k)
	(assert(bin $?reszta))
	(assert(dlugosc(+ ?v 1)))
	(assert(tmp(+ ?z (* ?x (** 2 ?v))))))

(defrule rekonwersja2
	(srednia ?x)
	?i<-(dlugosc ?x)
	?j<-(wynik $?cos)
	?k<-(tmp ?z)
	(bin ? $?)
=>
	(retract ?i ?j ?k)
	(assert(dlugosc 0))
	(assert(wynik ?z $?cos))
	(assert(tmp 0))) 

(defrule rekonwersjakoniec
	(bin)
	?j<-(tmp ?x)
	?i<-(wynik $?cos)
=>
	(retract ?i ?j)
	(assert(wynik ?x $?cos)))
	
