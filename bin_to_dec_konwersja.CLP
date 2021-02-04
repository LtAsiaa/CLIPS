(deffacts binarny
(lista 14 5 13)
(bin)
(liczba 0))

(defrule binarny
?i <- (lista $?reszta ?x)
(test (!= ?x 0))
?j <- (bin $?reszta1)
=>
(retract ?i ?j)
(assert (lista $?reszta (div ?x 2)))
(assert (bin (mod ?x 2) $?reszta1)))

(defrule usuwaniezera
?i <- (lista $?reszta ?x)
(test (= ?x 0))
=>
(retract ?i)
(assert (lista $?reszta)))

(defrule konwersja
?i <- (bin ?x $?reszta)
?j <- (liczba ?l)
(lista)
=>
(retract ?i ?j)
(assert (liczba (+ (* ?l 2) ?x)))
(assert (bin $?reszta)))

(defrule stop 
?i <- (lista)
?j <- (bin)
=>
(retract ?i ?j))
