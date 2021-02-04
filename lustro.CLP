(deffacts dane 
(lista 21 32 43 54 65 76 12 23 34 45 56 67))

(defrule stworz 
(not(lustrzane $?))
(not(rozbite $?))
(not(bufor $?))
=>
(assert(lustrzane) (rozbite)(bufor)))

(defrule dobufora
?i<-(lista $?cos ?x&~0)
?ii<-(bufor $?cos1)
=>
(retract ?i ?ii)
(assert(lista $?cos (div ?x 10)))
(assert(bufor (mod ?x 10) $?cos1)))


(defrule dobufora1
?i<-(lista $?cos 0)
?ii<-(bufor $?cos1)
=>
(retract ?i ?ii)
(assert(lista $?cos ))
(assert(bufor # $?cos1)))

(defrule usunseparatoriwsadzdorozbite
(lista)
?i<-(bufor # $?cos)
?ii<-(rozbite )
=>
(retract ?i ?ii)
(assert(bufor))
(assert(rozbite $?cos)))



(defrule lustrzane1
(lista)
(bufor)
?i<-(rozbite $?przod # ?x ?y # $?srodek # ?y ?x # $?koniec)
=>
(retract ?i)
(assert(rozbite $?przod # $?srodek # $?koniec))
(assert(lustrzane ?x ?y # ?y ?x)))


(defrule lustrzane2
(lista)
(bufor)
?i<-(rozbite $?przod # ?x ?y # $?srodek # ?y ?x )
=>
(retract ?i)
(assert(rozbite $?przod # $?srodek ))
(assert(lustrzane ?x ?y # ?y ?x)))



(defrule lustrzane3
(lista)
(bufor)
?i<-(rozbite ?x ?y # ?y ?x )
=>
(retract ?i)
(assert(lustrzane ?x ?y # ?y ?x)))

(defrule lustrzane4
(lista)
(bufor)
(not(rozbite $?))
?i<-(lustrzane  ?x ?y # ?y ?x )
=>
(retract ?i)
(assert(lustrzane (+(* ?x 10) ?y) # (+ (* ?y 10) ?x))))
