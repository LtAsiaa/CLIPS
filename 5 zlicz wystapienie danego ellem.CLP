(deffacts cos
(elem a b a d a c a f a c d v a c a g v a)
(szuk a)
(wynik 0)
)


(defrule wyn
(szuk ?x)
?ii<-(elem $?pocz ?x $?kon)
?iii<-(wynik ?ile)
=>
(retract ?ii ?iii)
(assert (elem $?pocz $?kon))
(assert (wynik (+ ?ile 1)))
)

