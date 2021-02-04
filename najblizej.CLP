(deffacts dane
(lista 8 -5 1 -2 5 10 -3 12)
(liczba 7)
(najblizsza))

(defrule najblizej
?i <- (lista ?x $?reszta)
?j <- (najblizsza)

=>
(retract ?i ?j)
(assert (najblizsza ?x))
(assert (lista $?reszta)))

(defrule najblizej1
?i <- (lista ?x $?reszta)
?j <- (najblizsza ?n)
(liczba ?y)
(test (< (abs ( - ?y ?x)) (abs (- ?y ?n))))
=>
(retract ?i ?j)
(assert (lista $?reszta))
(assert (najblizsza ?x)))

(defrule najblizej2
?i <- (lista ?x $?reszta)
(najblizsza ?n)
(liczba ?y)
(test (>= (abs ( - ?y ?x)) (abs (- ?y ?n))))
=>
(retract ?i)
(assert (lista $?reszta)))