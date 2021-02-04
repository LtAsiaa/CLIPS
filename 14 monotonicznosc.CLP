(deffacts fact
(lista -63 -21 17 33)
(pomoc)
)


(defrule init
?i<-(lista ?x ?y $?reszta)
?ii<-(pomoc $?pom)
(test (<= (- ?x ?y) 0))
=>
(retract ?i ?ii)
(assert (lista ?y $?reszta))
(assert (pomoc ?pom -1))
)

(defrule init1
?i<-(lista ?x ?y $?reszta)
?ii<-(pomoc $?pom)
(test (>= (- ?x ?y) 0))
=>
(retract ?i ?ii)
(assert (lista ?y $?reszta))
(assert (pomoc ?pom 1))
)

(defrule spr
(lista ?x)
?i<-(pomoc ?y ?y $?reszta)
=>
(assert (pomoc ?y $?reszta))
(retract ?i)
)

(defrule spr1
?ii<-(lista ?x)
?i<-(pomoc ?y ?z&~?y $?reszta)
=>
(printout t "Nie monotoniczny" crlf)
(retract ?i ?ii)
)

(defrule spr2
?i<-(lista ?x)
?ii<-(pomoc ?y)
=>
(printout t "Monotoniczny" crlf)
(retract ?i ?ii)
)