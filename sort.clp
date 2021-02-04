(deffacts dane
(lista a b a b b c a c a b c c b c b a b a c b c a)
(order x a y b z c)
)

(defrule sort
?i<-(lista $?przed ?x ?y $?po)
(order $? ?y $? ?x $?) 
=>
(retract ?i)
(assert (lista $?przed ?y ?x $?po))
)