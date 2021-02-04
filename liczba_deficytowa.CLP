(deffacts dane
(lista 7 11 6 24 42 81))

(defrule start
(not (kopia_listy $?))
(not (kopia_listy_dod $?))
(not (dzielniki $?))
(not (suma_dzielniki $?))
(not (deficytowe $?))
=>
(assert (kopia_listy ))
(assert (kopia_listy_dod ))
(assert (dzielniki))
(assert (suma_dzielniki 0))
(assert (deficytowe)))

(defrule kopiuj_liste
(lista ?x $?liczby)
?i <- (kopia_listy)
?j <- (kopia_listy_dod)
=>
(retract ?i ?j)
(assert (kopia_listy ?x $?liczby))
(assert (kopia_listy_dod ?x $?liczby)))

(defrule rowne_zero
(kopia_listy $?przod1 ?kl)
(kopia_listy_dod $?przod2 ?kld)
?i <- (lista $?przod ?x&~0)
?j <- (dzielniki $?cos)
(test (= (mod ?kl ?x) 0))
(test (!= ?x ?kl))
=>
(retract ?i ?j)
(assert (dzielniki ?x $?cos))
(assert (lista $?przod (- ?x 1))))

(defrule rowne_zero_dod
(kopia_listy $?przod1 ?kl)
(kopia_listy_dod $?przod2 ?kld)
?i <- (lista $?przod ?x&~0)
(dzielniki $?cos)
(test (= (mod ?kl ?x) 0))
(test (= ?x ?kl))
=>
(retract ?i)
(assert (lista $?przod (- ?x 1))))

(defrule rozne_zero
(kopia_listy $?przod1 ?kl)
(kopia_listy_dod $?przod2 ?kld)
?i <- (lista $?przod ?x&~0)
(test (!= (mod ?kl ?x) 0))
=>
(retract ?i)
(assert (lista $?przod (- ?x 1))))

(defrule usuwanie_zera
(kopia_listy_dod $?przod2 ?kld)
?i <- (lista $?przod 0)
?j <- (dzielniki $?cos)
?k <- (kopia_listy $?przod1 ?kl)
=>
(retract ?i ?j ?k)
(assert (lista $?przod))
(assert (dzielniki # $?cos))
(assert (kopia_listy $?przod1)))

(defrule usun_separator
(kopia_listy_dod $?przod2 ?kld)
(lista)
(kopia_listy)
?i <- (dzielniki # $?reszta)
=>
(retract ?i)
(assert (dzielniki $?reszta)))

(defrule zsumuj
(kopia_listy_dod $?przod2 ?kld)
(lista)
(kopia_listy)
?i <- (dzielniki $?przod ?x&~#)
?j <- (suma_dzielniki ?l $?cos)
=>
(retract ?i ?j)
(assert (dzielniki $?przod))
(assert (suma_dzielniki (+ ?l ?x) $?cos)))

(defrule usun_separator_dzielniki
(kopia_listy_dod $?przod2 ?kld)
(lista)
(kopia_listy)
?i <- (dzielniki $?przod #)
?j <- (suma_dzielniki $?cos)
=>
(retract ?i ?j)
(assert (dzielniki $?przod))
(assert (suma_dzielniki 0 $?cos)))

(defrule jest_deficytowa
(lista)
(kopia_listy)
(dzielniki)
?i <- (kopia_listy_dod ?x $?tyl)
?j <- (suma_dzielniki ?y $?reszta)
?k <- (deficytowe $?cos)
(test (< ?y ?x))
=>
(retract ?i ?j ?k)
(assert (kopia_listy_dod $?tyl))
(assert (suma_dzielniki $?reszta))
(assert (deficytowe $?cos ?x)))

(defrule nie_jest_deficytowa
(lista)
(kopia_listy)
(dzielniki)
?i <- (kopia_listy_dod ?x $?tyl)
?j <- (suma_dzielniki ?y $?reszta)
?k <- (deficytowe $?cos)
(test (>= ?y ?x))
=>
(retract ?i ?j ?k)
(assert (kopia_listy_dod $?tyl))
(assert (suma_dzielniki $?reszta))
(assert (deficytowe $?cos)))