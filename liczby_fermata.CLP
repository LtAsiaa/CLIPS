(deffacts dane
(liczba 5))

(defrule start
(not (lista $?))
(not (fermata ? ?))
=>
(assert (lista))
(assert (fermata)))

(defrule generowanie
(fermata)
?i <- (liczba ?x&~-1)
?j <- (lista $?cos)
=>
(retract ?i ?j)
(assert (liczba (- ?x 1)))
(assert (lista ?x $?cos)))

(defrule liczby_fermata
(liczba -1)
?i <- (lista ?x $?reszta)
?j <- (fermata)
=>
(retract ?i)
(assert (lista $?reszta))
(assert (fermata ?x (div (+ (** 2(** 2 ?x))1)1))))

(defrule stop
?i <- (liczba -1)
?j <- (lista)
?k <- (fermata)
=>
(retract ?i ?j ?k))