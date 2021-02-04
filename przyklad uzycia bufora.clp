(deffacts start
(lista -36 -2 11 40)
(bufor 0))

(defrule test
?i<-(lista ?x ?y $?r)
?ii<-(bufor ?n)
(test (> (- ?x ?y) 0))
=>
(retract ?i ?ii)
(assert (lista ?y $?r))