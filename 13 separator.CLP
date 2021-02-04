(deffacts fakty
(separator #)
(ciag a f d e # f r e w # r # gg # ff)
)

(defrule kon
?ii<-(separator ?s)
?i<-(ciag)
=>
(retract ?i ?ii)
)

(defrule podlisty
(separator ?s)
?i<-(ciag $?x ?s $?y)
=>
(assert (ciag $?x))
(assert (ciag $?y ?s))
(retract ?i)
)

