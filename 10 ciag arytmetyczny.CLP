(deffacts fakty
(lista -5 -3 0 1)
(roznice)
)

(defrule init
?i<-(lista ?x ?y $?reszta)
?ii<-(roznice $?cos)
=>
(assert (lista ?y $?reszta))
(assert (roznice (- ?x ?y) $?cos))
(retract ?i ?ii)
)

(defrule spr
?i<-(lista ?z)
?ii<-(roznice ?x ?x $?reszta)
=>
(assert (roznice ?x $?reszta))
(retract ?ii)
)


(defrule arytmetyczny
?i<-(lista ?x)
?ii<-(roznice ?y)
=>
(printout t "Ciag arytmetyczny" crlf)
(retract ?i ?ii)
)

(defrule niearytmetyczny
?i<-(lista ?x)
?ii<-(roznice ?z ?y&~?z $?reszta)
=>
(printout t "Ciag niearytmetyczny" crlf)
(retract ?i ?ii)
)
