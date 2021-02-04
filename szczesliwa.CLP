(deffacts dane
(liczba 28 09 1996)
)


(defrule stworz 
(not(rozbite $?))
(not(szczesliwa $?))
=>
(assert(rozbite 0) (szczesliwa )))



(defrule rozbij 
?i<-(liczba ?x $?cos)
?ii<-(rozbite ?r)
(test(!= ?x 0))
=>
(retract ?i ?ii)
(assert(liczba (div ?x 10) $?cos))
(assert(rozbite (+ ?r (mod ?x 10)))))

(defrule rozbij1 
?i<-(liczba ?x $?cos)
?ii<-(rozbite ?r)
(test(= ?x 0))
=>
(retract ?i )
(assert(liczba  $?cos)))

(defrule rozbij2 
?i<-(liczba )
?ii<-(rozbite ?r)
(test(>= ?r 10))
=>
(retract ?i ?ii)
(assert(liczba ?r))
(assert(rozbite 0)))



(defrule szczesliwa 
(liczba)
?i<-(rozbite ?r)
?ii<-(szczesliwa )
(test(< ?r 10))
=>
(retract ?i ?ii)
(assert(szczesliwa ?r)))










