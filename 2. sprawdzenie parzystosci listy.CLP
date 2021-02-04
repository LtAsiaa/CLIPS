(deffacts listy
(lista a  b g c h)
)

(defrule sprawdz
?i<-(lista ?im1 ?im2 $?reszta)
=>
(assert (lista $?reszta))
(retract ?i)
)

(defrule parzyste
(lista)
=>
(printout t "Parzysta" crlf)
)

(defrule nieparzyste
(lista ?im1)
=>
(printout t "Nieparzysta" crlf)
)

