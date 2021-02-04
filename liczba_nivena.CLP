(deffacts dane
(liczba 12))

(defrule start 
(not (kopia_liczba ?))
(not (cyfry $?))
(not (suma ?))
=>
(assert (kopia_liczba))
(assert (cyfry))
(assert (suma 0)))

(defrule kopiowanie
(liczba ?x)
(cyfry)
(suma 0)
?i <- (kopia_liczba)
=>
(retract ?i)
(assert (kopia_liczba ?x)))

(defrule na_cyfry
(liczba ?)
?i <- (kopia_liczba ?kl&~0)
?j <- (cyfry $?cos)
=>
(retract ?i ?j)
(assert (kopia_liczba (div ?kl 10)))
(assert (cyfry (mod ?kl 10) $?cos )))

(defrule usuwanie_zera
(liczba ?)
?i <- (kopia_liczba 0)
=>
(retract ?i)
(assert (kopia_liczba)))

(defrule zsumuj
(liczba ?)
(kopia_liczba)
?i <- (cyfry ?x $?reszta)
?j <- (suma ?s)
=>
(retract ?i ?j)
(assert (cyfry $?reszta))
(assert (suma (+ ?s ?x))))

(defrule rowne_zero
(kopia_liczba)
(cyfry)
(liczba ?l)
?i <- (suma ?s&~0)
(test (= (mod ?l ?s) 0))
=>
(printout t "Jest to liczba Nivena" crlf))

(defrule rozne_zero
(kopia_liczba)
(cyfry)
(liczba ?l)
?i <- (suma ?s&~0)
(test (!= (mod ?l ?s) 0))
=>
(printout t "Nie jest to liczba Nivena" crlf))