(deffacts lista
(lista / / / \ \ \ \ \ / / / / / / / / / \ \ \)
)


(defrule start
(not (poziom $?))
(not (max $?))
(not (min $?))
=>
(assert (poziom 0) (max 0) (min 0)))


(defrule goranowymax
?i<-(poziom ?p)
?ii<-(max ?m)
?iii<-(lista / $?cos)
(test(>(+ ?p 1) ?m))
=>
(retract ?i ?ii ?iii)
(assert(poziom(+ ?p 1)))
(assert(max (+ ?m 1)))
(assert(lista $?cos)))

(defrule dolnowymin
?i<-(poziom ?p)
?ii<-(min ?n)
?iii<-(lista \ $?cos)
(test(<=(- ?p 1) ?n))
=>
(retract ?i ?ii ?iii)
(assert(poziom(- ?p 1)))
(assert(min (- ?p 1)))
(assert(lista $?cos)))


(defrule gora 
?i<-(lista / $?cos)
?ii<-(poziom ?p)
(max ?m)
(test(<= (+ ?p 1) ?m))
=>
(retract ?i ?ii)
(assert(lista $?cos))
(assert(poziom(+ ?p 1))))



(defrule dol
?i<-(lista \ $?cos)
?ii<-(poziom ?p)
(min ?n)
(test(>= (- ?p 1) ?n))
=>
(retract ?i ?ii)
(assert(lista $?cos))
(assert(poziom(- ?p 1))))












