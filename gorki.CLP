(deffacts generowanie
(lista / / / / \ \ \ / / / \ \ / /)
(dod /)
(ode \)
(min 0)
(max 0))

(defrule sprawdzenie
(dod ?a)
?k <- (lista ?a $?t)
?i <- (max ?z)
=>
(retract ?i ?k)
(assert (lista $?t))
(assert (max (+ ?z 1))))

(defrule sprawdzeniee
(ode ?a)
?k <- (lista ?a $?t)
?i <- (min ?z)
=>
(retract ?i ?k)
(assert (lista $?t))
(assert (min (- ?z 1))))