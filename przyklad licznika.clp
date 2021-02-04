(deffacts dane
(licznik 1)
)

(defrule nieskonczonosc
?i<-(licznik ?n)
=>
(retract ?i)
(assert (licznik (+ ?n 1)))
)