(deffacts dane
(liczba 25))

(defrule start 
(not (dzielniki $?))
(not (licznik ?))
(not (kopia_liczba ?))
(not (kopia_liczba_dod ?))
(not (max ? ?))
=>
(assert (dzielniki))
(assert (kopia_liczba_dod))
(assert (kopia_liczba ))
(assert (licznik 0))
(assert (max 0 0)))

(defrule kopiuj_liczbe
(liczba ?l)
?i <- (kopia_liczba )
?j <- (kopia_liczba_dod)
=>
(retract ?i ?j)
(assert (kopia_liczba ?l))
(assert (kopia_liczba_dod ?l)))

(defrule rowne_zero
(kopia_liczba_dod ?kld)
(kopia_liczba ?kl)
(licznik 0)
?i <- (liczba ?y&~0)
?j <- (dzielniki $?cos)
(test (= (mod ?kl ?y) 0))
=>
(retract ?i ?j)
(assert (dzielniki ?y $?cos))
(assert (liczba (- ?y 1))))

(defrule rozne_zero
(kopia_liczba_dod ?kld)
(kopia_liczba ?kl)
?i <- (liczba ?y&~0)
(test (!= (mod ?kl ?y) 0))
=>
(retract ?i)
(assert (liczba (- ?y 1))))

(defrule zlicz_dzielnik
(kopia_liczba_dod ?kld)
(liczba 0)
?i <- (dzielniki ?x $?reszta)
?j <- (licznik ?y)
=>
(retract ?i ?j)
(assert (dzielniki $?reszta))
(assert (licznik (+ ?y 1))))

(defrule gdy_wiekszy_licznik
(kopia_liczba_dod ?kld)
(dzielniki)
?i <- (licznik ?y)
?j <- (max ?w ?l)
?k <- (kopia_liczba ?kl&~0)
?z <- (liczba 0)
(test (> ?y ?l))
=>
(retract ?i ?j ?k ?z)
(assert (max ?kl ?y))
(assert (kopia_liczba (- ?kl 1)))
(assert (liczba (- ?kl 1)))
(assert (licznik 0)))

(defrule gdy_mniejszy_licznik
(kopia_liczba_dod ?kld)
(dzielniki)
?i <- (licznik ?y)
?j <- (kopia_liczba ?kl&~0)
?z <- (liczba 0)
(max ?w ?l)
(test (< ?y ?l))
=>
(retract ?i ?j ?z)
(assert (kopia_liczba (- ?kl 1)))
(assert (liczba (- ?kl 1)))
(assert (licznik 0)))

(defrule jest_antypierwsza
(dzielniki)
(licznik 0)
(liczba 0)
(kopia_liczba 0)
(max ?w ?l)
(kopia_liczba_dod ?kld)
(test (= ?kld ?w))
=>
(printout t "Liczba jest antypierwsza" crlf))

(defrule nie_jest_antypierwsza
(dzielniki)
(licznik 0)
(liczba 0)
(kopia_liczba 0)
(max ?w ?l)
(kopia_liczba_dod ?kld)
(test (> ?kld ?w))
=>
(printout t "Liczba nie jest antypierwsza" crlf))