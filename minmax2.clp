(deffacts dane
(lista -11 6 -19 8 -2 18 -23 7 21 6 -3)
(min)
(max)
)

(defrule pierwsze-min-max
(lista ?x $?)
?i<-(min)
?ii<-(max)
=>
(retract ?i ?ii)
(assert (min ?x) (max ?x))
)

(defrule nowe-min
?ii<-(lista ?x $?reszta)
?i<-(min ?m)
(test (<= ?x ?m))
=>
(retract ?i ?ii)
(assert (min ?x))
(assert (lista $?reszta))
)

(defrule nowe-max
?ii<-(lista ?x $?reszta)
?i<-(max ?m)
(test (>= ?x ?m))
=>
(retract ?i ?ii)
(assert (max ?x))
(assert (lista $?reszta))
)
;; TRZEBA DOPISAC REGULE POMIJANIA ELEMENETÓW WIEKSZYCH OD min I MNIEJSZYCH OD max