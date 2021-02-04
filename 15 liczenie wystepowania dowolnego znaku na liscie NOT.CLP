(deffacts hm
(lista a f b a g f a b)
)

(defrule pierwsza
(lista ?x $?reszta)
(not (ile  ?x ?))
=>
(assert (ile ?x 0))
)

(defrule druga
?i<-(lista ?x $?reszta)
?ii<-(ile ?x ?y)
=>
(retract ?i ?ii)
(assert (lista $?reszta))
(assert (ile ?x (+ ?y 1)))
)
