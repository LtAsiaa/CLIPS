(deffacts dane
(lista -6 1 7 -5 2 9 11 -2 3)
(licznik 1)
)

(defrule podlista
?i<-(lista ?x $?srodek ?y)
?j<-(licznik ?l)
(not (max $?))
=>
(retract ?i ?j)
(assert (podlista ?l ?x $?srodek ?y) (licznik (+ 1 ?l)) (lista $?srodek)  (para ?l (+ ?x ?y))))

(defrule ostatni
?i<-(lista ?x)
(not (max $?))
?j<-(licznik ?l)
=>
(retract ?i ?j)
(assert (podlista ?l ?x)(para ?l ?x)))

(defrule pusta
?i<-(lista)
(not (max $?))
?j<-(licznik ?l)
=>
(retract ?i ?j))

(defrule suma_start
(not (licznik ?))
(not (max $?))
?i<-(podlista ?l ?x $?reszta)
(not (suma ?l $?))
=>
(retract ?i)
(assert (suma ?l ?x) (podlista ?l $?reszta)))

(defrule suma
(not (licznik ?))
(not (max $?))
?i<-(podlista ?l ?x $?reszta)
?j<-(suma ?l ?s)
=>
(retract ?i ?j)
(assert (suma ?l (+ ?s ?x)) (podlista ?l $?reszta)))

(defrule suma_stop
(not (licznik ?))
(not (max $?))
(suma ?l ?)
?i<-(podlista ?l)
=>
(retract ?i))

(defrule max_start
(not (max $?))
(not (lista $?))
(not (podlista $?))
?i<-(suma ?x ?y)
=>
(retract ?i)
(assert (max ?x ?y)))

(defrule max_nowy
?i<-(max ?x ?y)
?j<-(suma ?xx ?yy)
(test (> ?yy ?y))
=>
(retract ?i ?j)
(assert (max ?xx ?yy)))

(defrule max_not
(max ?x ?y)
?i<-(suma ?xx ?yy)
(test (<= ?yy ?y))
=>
(retract ?i))