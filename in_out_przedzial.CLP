(deffacts dane
(lista 7 -1 3 12 8 -5 4 11)
(zakres 2 9)
(w)
(poza))

(defrule in
?i <- (lista ?x $?reszta)
?j <- (w $?cos)
(zakres ?l ?p)
(test (<= ?l ?x))
(test (<= ?x ?p))
=>
(retract ?i ?j)
(assert (lista $?reszta))
(assert (w $?cos ?x)))

(defrule pozalewa
?i <- (lista ?x $?reszta)
?j <- (poza $?cos)
(zakres ?l ?p)
(test (< ?x ?l))
=>
(retract ?i ?j)
(assert (lista $?reszta))
(assert (poza $?cos ?x)))

(defrule pozaprawa
?i <- (lista ?x $?reszta)
?j <- (poza $?cos)
(zakres ?l ?p)
(test (> ?x ?p))
=>
(retract ?i ?j)
(assert (lista $?reszta))
(assert (poza $?cos ?x)))