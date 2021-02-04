(deffacts cos
(lista a b c d f)
(revers)
)

(defrule odwroc
?i<-(lista $?reszta ?im1)
?ii<-(revers $?wpis)
=>
(assert (lista $?reszta))
(assert (revers $?wpis ?im1))
(retract ?i ?ii)
)