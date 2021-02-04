(deffacts cos
(licz a b c d a s d w q q a s d f g a s x c v f)
(ilosc 0)
)

(defrule liczymy
?i<-(ilosc ?wyn)
?ii<-(licz ?x $?reszta)
=>
(assert (licz $?reszta))
(assert (ilosc (+ ?wyn 1)))
(retract ?i ?ii)
)