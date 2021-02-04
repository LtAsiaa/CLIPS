(deffacts dane
(liczba 25))

(defrule start
(not (kwadrat ?))
(not (rozbite $?))
(not (cyfry $?))
=>
(assert (kwadrat))
(assert (rozbite))
(assert (cyfry)))

(defrule do_kwadratu
(rozbite)
(liczba ?x)
?i <- (kwadrat)
=>
(retract ?i)
(assert (kwadrat (* ?x ?x))))

(defrule rozbij_kwadrat
?i <- (kwadrat ?x&~0)
?j <- (rozbite $?cos)
=> 
(retract ?i ?j)
(assert (kwadrat (div ?x 10)))
(assert (rozbite (mod ?x 10) $?cos)))

(defrule rozbij_liczbe
(rozbite ? $?)
(kwadrat 0)
?i <- (liczba ?x&~0)
?j <- (cyfry $?cos)
=> 
(retract ?i ?j)
(assert (liczba (div ?x 10)))
(assert (cyfry (mod ?x 10) $?cos)))

(defrule usun_zero
(rozbite ? $?)
(cyfry ? $?)
?i <- (kwadrat 0)
?j <- (liczba 0)
=>
(retract ?i ?j)
(assert (kwadrat))
(assert (liczba)))

(defrule sprawdzanie_jezeli_takie_same
(liczba)
?i <- (rozbite $?przod ?x)
?j <- (cyfry $?przod1 ?x)
=>
(retract ?i ?j)
(assert (rozbite $?przod))
(assert (cyfry $?przod1)))

(defrule sprawdzanie_jezeli_rozne
(liczba)
(rozbite $?przod ?x)
(cyfry $?przod1 ?y)
(test( != ?x ?y))
=>
(printout t "Liczby nie sa automorficzne" crlf))

(defrule jezeli_sa
(liczba)
(kwadrat)
(cyfry)
(rozbite $?cos)
=>
(printout t "Liczby sa automorficzne" crlf))