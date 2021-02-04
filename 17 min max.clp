(deffacts minimaxi
(lista 2 6 9 -1 -8 4)
(min)
(max)
)
(defrule cos
?i<-(lista ?x $?reszta)
?ii<-(min)
?iii<-(max)
=>
(retract ?i ?ii ?iii)
(assert (lista $?reszta))
(assert (min ?x))
(assert (max ?x))
)

(defrule minimum
?i<-(lista ?x $?reszta)
?ii<-(min ?y)
(test (< ?x ?y))
=>
(retract ?i ?ii)
(assert (lista $?reszta))
(min ?x)
)
(defrule maximum
?i<-(lista ?x $?reszta)
?ii<-(max ?z)
(test (> ?x ?z))
=>
(retract ?i ?ii)
(assert (lista $?reszta))
(assert (max ?x))
)
(defrule spr
?i<-(lista ?x $?reszta)
=>
(retract ?i)
(assert (lista $?reszta))
)