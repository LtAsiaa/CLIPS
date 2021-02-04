(deffacts arytmetyczny
(first 5)
(last 50)
(difference 3))

(defrule start
(not(wynik $?))
=>
(assert (wynik)))

(defrule zaczynamy
?i <- (first ?x)
(difference ?y)
?j <- (wynik)
=>
(retract ?i ?j)
(assert(wynik ?x))
(assert (first (+ ?x ?y))))

(defrule koniec
?j <- (first ?x)
(last ?y)
(difference ?z)
?i <- (wynik  $?cos)
(test (<= ?x ?y))
=>
(retract ?i ?j)
(assert(first (+ ?x ?z)))
(assert(wynik $?cos ?x)))