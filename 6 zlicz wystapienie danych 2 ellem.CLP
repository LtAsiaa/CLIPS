(deffacts cos
(elem a b a d a c a f a c d v a c a g v a)
(szuk a)
(szuk1 b)
(wynik 0)
(wynik1 0)
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

(defrule wyn1
(szuk1 ?x)
?ii<-(elem $?pocz ?x $?kon)
?iii<-(wynik1 ?ile)
=>
(retract ?ii ?iii)
(assert (elem $?pocz $?kon))
(assert (wynik1 (+ ?ile 1)))
)
