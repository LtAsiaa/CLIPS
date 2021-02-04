(deffacts dane
(liczba 24))

(defrule start
(not (lista $?))
(not (kopia_liczba ?))
(not (potegi $?))
(not (kopia_lista $?))
(not (rozklad $?))
(not (wynik $?))
=>
(assert (lista))
(assert (kopia_liczba))
(assert (potegi))
(assert (kopia_lista))
(assert (rozklad))
(assert (wynik )))

(defrule kopiuj_liczbe
(lista)
(potegi)
(kopia_lista)
(liczba ?l)
?i <- (kopia_liczba)
=>
(retract ?i)
(assert (kopia_liczba ?l)))

(defrule generuj
(kopia_liczba ?s)
?i <- (liczba ?l&~0)
?j <- (lista $?cos)
=>
(retract ?i ?j)
(assert (liczba (- ?l 1)))
(assert (lista ?l $?cos)))

(defrule kwadraty
(kopia_liczba ?s)
(liczba 0)
?i <- (lista ?x $?reszta)
?j <- (potegi $?cos)
?k <- (kopia_lista $?cos1)
=>
(retract ?i ?j ?k)
(assert (kopia_lista $?cos1 ?x))
(assert (potegi $?cos (div (** ?x 2) 1)))
(assert (lista $?reszta)))

(defrule wieksze
(liczba 0)
(lista)
(kopia_liczba ?kl)
?i <- (potegi $?reszta ?p)
(test(< ?kl ?p))
=>
(retract ?i)
(assert (potegi $?reszta)))

(defrule mniejsze_rowne
(liczba 0)
(lista)
?i <- (kopia_liczba ?kl)
(potegi $?reszta ?p)
?j <- (rozklad $?cos)
(test(>= ?kl ?p))
=>
(retract ?i ?j)
(assert (kopia_liczba (- ?kl ?p)))
(assert (rozklad ?p $?cos)))

(defrule pierwiastki
(kopia_liczba 0)
(liczba 0)
(potegi)
(lista)
(kopia_lista $?cos ?x)
?i <- (rozklad $?przod ?y)
?j <- (wynik $?koniec)
(test(= (** ?x 2) ?y))
=>
(retract ?i ?j)
(assert (wynik ?x $?koniec))
(assert (rozklad $?przod)))

(defrule pierwiastki1
(kopia_liczba 0)
(liczba 0)
(potegi)
(lista)
?i <- (kopia_lista $?cos ?x)
(rozklad $?przod ?y)
(test(!= (* ?x ?x) ?y))
=>
(retract ?i)
(assert (kopia_lista $?cos)))