(deffacts start
(liczba 113)
(podzielnik 2))


(defrule test2
(liczba ?x)
?i<-(podzielnik ?y)
(test (<> (mod ?x ?y) 0)) 
=>
(retract ?i)
(assert (podzielnik (+ ?y 1))))

(defrule test
(liczba ?x)
?i<-(podzielnik ?y)
(test (= ?x ?y))
=>
(retract ?i)
(printout t "liczba jest pierwsza" crlf))

(defrule test3
(liczba ?x)
?i<-(podzielnik ?y)
(test (= (mod ?x ?y) 0)) 
(test (< ?y ?x))
=>
(retract ?i)
(printout t "liczba nie jest pierwsza" crlf))


