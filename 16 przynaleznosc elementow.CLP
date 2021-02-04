(deffacts lis
(lista b g a f b a g f h)
(set f a b k m)
(ile 0)
)


(defrule begin
?i<-(lista $?pocz ?x $?kon)
?ii<-(ile ?q)
(not (set $?c ?x $?v))
=>
(assert (ile (+ ?q 1)))
(assert (lista $?pocz $?kon))
(retract ?i ?ii)
)
