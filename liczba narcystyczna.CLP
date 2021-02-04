(deffacts dane
(liczba 153))

(defrule start
(not (kopia_liczba ?))
(not (kopia_liczba_dod ?))
(not (bufor $?))
(not (bufor_dod $?))
(not (licznik ?))
(not (wynik ?))
=>
(assert (licznik 0))
(assert (kopia_liczba))
(assert (bufor ))
(assert (bufor_dod ))
(assert (kopia_liczba_dod ))
(assert (wynik 0)))

(defrule kopiuj_liczbe
(liczba ?l)
?i <- (kopia_liczba)
?j <- (kopia_liczba_dod)
=>
(retract ?i ?j)
(assert (kopia_liczba ?l))
(assert (kopia_liczba_dod ?l)))

(defrule do_bufora
(kopia_liczba_dod ?kld)
?i <- (kopia_liczba ?x&~0)
?j <- (bufor $?cos)
=>
(retract ?i ?j)
(assert (kopia_liczba (div ?x 10)))
(assert (bufor (mod ?x 10) $?cos)))

(defrule usuwanie_zera
(kopia_liczba_dod ?kld)
?i <- (kopia_liczba ?x)
?j <- (bufor $?cos)
(test ( = ?x 0))
=>
(retract ?i ?j)
(assert (kopia_liczba))
(assert (bufor $?cos)))

(defrule zliczanie
(kopia_liczba)
?i <- (licznik ?l)
?j <- (bufor ?x $?reszta)
?k <- (kopia_liczba_dod ?kld&~0)
?m <- (bufor_dod $?cos)
=>
(retract ?i ?j ?k ?m)
(assert (bufor $?reszta))
(assert (licznik (+ ?l 1)))
(assert (kopia_liczba_dod (div ?kld 10)))
(assert (bufor_dod (mod ?kld 10) $?cos)))

(defrule usuwanie_zera1
(kopia_liczba)
(bufor)
(kopia_liczba_dod 0)
(licznik ?l)
?i <-(wynik ?w) 
?j <- (bufor_dod ?x $?cos)
=>
(retract ?i ?j)
(assert (bufor_dod $?cos))
(assert (wynik (div (+ ?w (** ?x ?l)) 1))))

(defrule jest_narcystyczna
(kopia_liczba)
(bufor)
(bufor_dod)
(licznik ?l)
(kopia_liczba_dod 0)
(liczba ?x)
(wynik ?w)
(test ( = ?x ?w))
=>
(printout t "Liczba jest narcystyczna" crlf))

(defrule nie_jest_narcystyczna
(kopia_liczba)
(bufor)
(bufor_dod)
(licznik ?l)
(kopia_liczba_dod 0)
(liczba ?x)
(wynik ?w)
(test (!= ?x ?w))
=>
(printout t "Liczba nie jest narcystyczna" crlf))