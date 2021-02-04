(deffacts dane
(lista 271 5420 14))

(defrule start
(not (kopiuj_lista $?))
(not (kopiuj_lista_dod $?))
(not (cyfry $?))
(not (cyferki $?))
(not (podmiana $?))
(not (licznik_el ?))
(not (suma ?))
=>
(assert (kopiuj_lista))
(assert (kopiuj_lista_dod))
(assert (cyfry))
(assert (cyferki))
(assert (podmiana))
(assert (licznik_el 0))
(assert (suma 0)))

(defrule kopiowanie
(cyfry)
(lista ?x $?cala)
?i <- (kopiuj_lista)
?j <- (kopiuj_lista_dod)
=>
(retract ?i ?j)
(assert (kopiuj_lista ?x $?cala))
(assert (kopiuj_lista_dod ?x $?cala)))

(defrule rozbijanie
(kopiuj_lista ?kl $?zawartosc)
(kopiuj_lista_dod ?kld $?zawartosc1)
(licznik_el 0)
(cyferki)
?i <- (lista $?przod ?x&~0)
?j <- (cyfry $?cos)
=>
(retract ?i ?j)
(assert (lista $?przod (div ?x 10)))
(assert (cyfry (mod ?x 10) $?cos)))

(defrule usuwanie_zera
(kopiuj_lista ?kl $?zawartosc)
(kopiuj_lista_dod ?kld $?zawartosc1)
(licznik_el 0)
(cyferki)
?i <- (lista $?przod 0)
?j <- (cyfry $?cos)
=>
(retract ?i ?j)
(assert (lista $?przod))
(assert (cyfry $?cos)))

(defrule nowy_licznik
(kopiuj_lista ?kl $?zawartosc)
(kopiuj_lista_dod ?kld $?zawartosc1)
(lista)
(licznik_el 0)
(cyferki)
?i <- (cyfry ?x $?reszta)
(not (licznik ?x ?))
=>
(retract ?i)
(assert (cyfry $?reszta))
(assert (licznik ?x 1)))

(defrule nastepne_elementy_zlicz
(kopiuj_lista ?kl $?zawartosc)
(kopiuj_lista_dod ?kld $?zawartosc1)
(lista)
(licznik_el 0)
(cyferki)
?i <- (cyfry ?x $?reszta)
?j <- (licznik ?x ?l)
=>
(retract ?i ?j)
(assert (cyfry $?reszta))
(assert (licznik ?x (+ ?l 1))))

(defrule rozbij
(kopiuj_lista ?kl $?zawartosc)
(lista)
(cyfry)
(licznik_el 0)
?i <- (kopiuj_lista_dod $?przod ?x&~0)
?j <- (cyferki $?cos)
=>
(retract ?i ?j)
(assert (kopiuj_lista_dod $?przod (div ?x 10)))
(assert (cyferki (mod ?x 10) $?cos)))

(defrule usun_zero
(kopiuj_lista ?kl $?zawartosc)
(lista)
(cyfry)
(licznik_el 0)
?i <- (kopiuj_lista_dod $?przod 0)
?j <- (cyferki $?cos)
=>
(retract ?i ?j)
(assert (kopiuj_lista_dod $?przod))
(assert (cyferki # $?cos)))

(defrule usun_separator
(kopiuj_lista ?kl $?zawartosc)
(kopiuj_lista_dod)
(lista)
(cyfry)
(licznik_el 0)
(podmiana)
?i <- (cyferki # $?reszta)
=>
(retract ?i)
(assert (cyferki $?reszta)))

(defrule zamiana
(kopiuj_lista ?kl $?zawartosc)
(kopiuj_lista_dod)
(lista)
(cyfry)
(licznik_el 0)
?i <- (cyferki ?x&~# $?reszta)
?j <- (licznik ?x ?l)
?k <- (podmiana $?cos)
=>
(retract ?i ?j ?k)
(assert (podmiana $?cos ?l))
(assert (licznik ?x ?l))
(assert (cyferki $?reszta)))

(defrule wstaw_separator_w_zamiane
(kopiuj_lista ?kl $?zawartosc)
(kopiuj_lista_dod)
(lista)
(cyfry)
(licznik_el 0)
?i <- (cyferki # $?reszta)
?j <- (podmiana $?cos)
=>
(retract ?i ?j)
(assert (cyferki $?reszta))
(assert (podmiana $?cos #)))

(defrule usun_separator_w_zamiane
(kopiuj_lista ?kl $?zawartosc)
(kopiuj_lista_dod)
(lista)
(cyfry)
(licznik_el 0)
(cyferki)
(suma 0)
?i <- (podmiana # $?reszta)
=>
(retract ?i)
(assert (podmiana $?reszta)))

(defrule zsumuj 
(kopiuj_lista ?kl $?zawartosc)
(kopiuj_lista_dod)
(lista)
(cyfry)
(cyferki)
?i <- (podmiana ?x&~# $?reszta)
?j <- (suma $?przod ?s)
?k <- (licznik_el $?przod1 ?l)
=>
(retract ?i ?j ?k)
(assert (suma $?przod (+ ?s ?x)))
(assert (podmiana $?reszta))
(assert (licznik_el $?przod1 (+ ?l 1))))

(defrule jezeli_seperator_licz_nowa
(kopiuj_lista ?kl $?zawartosc)
(kopiuj_lista_dod)
(lista)
(cyfry)
(cyferki)
?i <- (podmiana # $?reszta)
?j <- (suma $?przod ?s&~0)
?k <- (licznik_el $?przod1 ?l)
=>
(retract ?i ?j ?k)
(assert (podmiana $?reszta))
(assert (suma $?przod ?s # 0))
(assert (licznik_el $?przod1 ?l # 0)))

(defrule podziel
(kopiuj_lista_dod)
(lista)
(cyfry)
(cyferki)
(podmiana)
?i <- (suma ?x&~# $?reszta)
?j <- (licznik_el ?l&~# $?tyl)
?k <- (kopiuj_lista ?kl $?zawartosc)
=>
(retract ?i ?j ?k)
(assert (uniq ?kl (/ ?x ?l)))
(assert (suma $?reszta))
(assert (licznik_el $?tyl))
(assert (kopiuj_lista $?zawartosc)))

(defrule podziel2
(kopiuj_lista_dod)
(lista)
(cyfry)
(cyferki)
(podmiana)
?i <- (suma # $?reszta)
?j <- (licznik_el # $?tyl)
=>
(retract ?i ?j)
(assert (suma $?reszta))
(assert (licznik_el $?tyl)))