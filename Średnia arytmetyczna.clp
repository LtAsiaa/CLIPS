; wynik : srednia arytmetyczna

(deffacts start
(lista -5 6 -8 9 10 -6)
(suma 0)
(licznik 0))

(defrule lenght
?i<-(lista ?x $?r)
?ii<-(suma ?n)
?iii<-(licznik ?b)
=>
(retract ?i ?ii ?iii)
(assert (lista $?r))
(assert (suma (+ ?n ?x)))
(assert (licznik (+ ?b 1))))

(defrule suma
(lista)
(suma ?x)
(licznik ?y)
=>
(printout t (/ ?x ?y) crlf))