(deffacts lista
(lista a f g c h i j k)
)
(defrule sprawdzanie
?i<-(lista ?im1 ?im2 $?reszta)
=>
(assert (lista $?reszta))
(retract ?i)
)
(defrule parzyste
(lista)
=>
(printout t "lista parzysta" crlf)
)
(defrule nieparzyste
(lista ?im1)
=>
(printout t "lista nieparzysta" crlf)
)
)