(deffacts dane
	
	(do_sprawdzenia 24)
	(liczba 1)
	(dzielna 2)
	(dzielniki 1)
	(licznik 0)
	(najwyzszy 0 0)

)

(defrule dzielniki

	(liczba ?x)
	?j<-(dzielna ?y)
	?z<-(dzielniki $?cos)
	(test (<= ?y ?x))
	(test (= (mod ?x ?y) 0))

=>

	(retract ?z ?j)
	(assert (dzielniki $?cos ?y))
	(assert (dzielna (+ ?y 1)))

)

(defrule dzielniki1

	(liczba ?x)
	?j<-(dzielna ?y)
	(test (<= ?y ?x))
	(test (> (mod ?x ?y) 0))

=>

	(retract ?j)
	(assert (dzielna (+ ?y 1)))

)

(defrule zlicz

	(liczba ?x)
	(dzielna ?y)
	?i<-(dzielniki ?d $?cos)
	?j<-(licznik ?z)
	(test (< ?x ?y))

=>

	(retract ?i ?j)
	(assert (licznik (+ ?z 1)))
	(assert (dzielniki $?cos))

)

(defrule nowy

	(liczba ?x)
	?jj<-(dzielna ?y)
	?ii<-(dzielniki)
	?i<-(licznik ?l)
	?j<-(najwyzszy ?n1 ?n)
	(do_sprawdzenia ?ds)
	?z<-(liczba ?x)
	(test (< ?x ?y))
	(test (> ?l ?n))
	(test (<= (+ ?x 1) ?ds))

=>

	(retract ?i ?j ?z ?jj ?ii)
	(assert (najwyzszy ?x ?l))
	(assert	(licznik 0))
	(assert (liczba (+ ?x 1)))
	(assert (dzielna 2))
	(assert (dzielniki 1))

)

(defrule stary

	?z<-(liczba ?x)
	?j<-(dzielna ?y)
	?jj<-(dzielniki)
	?i<-(licznik ?l)
	(do_sprawdzenia ?ds)
	(najwyzszy ?n1 ?n)
	(test (< ?x ?y))
	(test (<= ?l ?n))
	(test (<= (+ ?x 1) ?ds))

=>

	(retract ?i ?z ?j ?jj)
	(assert	(licznik 0))
	(assert (liczba (+ ?x 1)))
	(assert (dzielna 2))
	(assert (dzielniki 1))

)

(defrule sprawdz

	(do_sprawdzenia ?x)
	(najwyzszy ?n1 ?n)
	(liczba ?x)
	(dzielna ?y)
	(licznik ?l)
	(dzielniki)
	(test (> ?l ?n))
	(test (< ?x ?y))

=>

	(printout t "Jest antypierwsza" crlf)

)

(defrule sprawdz1

	(do_sprawdzenia ?x)
	(najwyzszy ?n1 ?n)
	(liczba ?x)
	(dzielna ?y)
	(licznik ?l)
	(dzielniki)
	(test (< ?l ?n))
	(test (< ?x ?y))

=>

	(printout t "Nie jest antypierwsza" crlf)

)
