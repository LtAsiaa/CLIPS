(deffacts dane
(liczby  7 5)
(potega 2)
(wesole ))

(defrule stworz 
(liczby $?cos)
(not(liczbadopotegi $?))
(not(listarozbic $?))
(not(lpot $?))
(not(licznik $?))
(not(kopialiczby $?))
=>
(assert(liczbadopotegi) (listarozbic) (kopialiczby $?cos)(lpot 0)(licznik 0)))

(defrule podniesdopotegi1
?i<-(liczby ?x $?cos)
(potega ?p)
?ii<-(liczbadopotegi )
=>
(retract ?i ?ii)
(assert(liczby $?cos))
(assert(liczbadopotegi(div (** ?x ?p)1))))



(defrule podniesdopotegiliczby
?i<-(liczbadopotegi ?x )
?ii<-(listarozbic $?cos )
?iii<-(licznik ?l)
(lpot ?k)

(test(!= ?x 0))
=>
(retract ?i ?ii ?iii)
(assert(licznik(+ ?l 1)))
(assert(liczbadopotegi (div ?x 10)))
(assert(listarozbic (mod ?x 10) $?cos))))

(defrule pod2
(potega ?p)
(licznik ?l)
?i<-(liczbadopotegi ?r)
?ii<-(listarozbic ?x $?cos )
?iii<-(lpot ?k)
(test(!= ?l 1))
(test(= ?r 0))
=>
(retract ?i ?ii ?iii )
(assert(liczbadopotegi ?r))
(assert(listarozbic  $?cos))
(assert(lpot (div (+ ?k (** ?x ?p))1))))




(defrule podniesdopotegiliczby3
(potega ?p)
?iiii<-(licznik ?l)
?i<-(liczbadopotegi ?r)
?ii<-(listarozbic  )
?iii<-(lpot ?k)
(test(= ?r 0))
(test(!= ?l 1))
=>
(retract ?i ?ii ?iii ?iiii)
(assert(licznik 0))
(assert(liczbadopotegi ?k))
(assert(listarozbic ))
(assert(lpot 0)))

(defrule podniesdopotegiliczby4
?g<-(kopialiczby ?x $?cos)
?iiii<-(licznik ?l)
?i<-(liczbadopotegi ?r)
?ii<-(listarozbic ?y )
?iii<-(lpot ?k)
(test(= ?r 0))
(test(= ?l 1))
(test(= ?y 1))
=>
(retract ?g ?i ?ii ?iii ?iiii)
(assert(kopialiczby $?cos))
(printout t "jest liczba wesola " ?x crlf)
(assert(licznik 0))
(assert(liczbadopotegi))
(assert(listarozbic ))
(assert(lpot 0)))

(defrule podniesdopotegiliczby5
?g<-(kopialiczby ?x $?cos)
?iiii<-(licznik ?l)
?i<-(liczbadopotegi ?r)
?ii<-(listarozbic ?y )
?iii<-(lpot ?k)
(test(= ?r 0))
(test(= ?l 1))
(test(!= ?y 1))
=>
(retract ?g ?i ?ii ?iii ?iiii)
(assert(kopialiczby $?cos))
(printout t "nie jest liczba wesola " ?x crlf)
(assert(licznik 0))
(assert(liczbadopotegi))
(assert(listarozbic ))
(assert(lpot 0)))




