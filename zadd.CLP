(deffacts dane
(lista 2 12 17 1 6 11))

(defrule start
(lista $?cos)
(not (bin $?))
(not (wynik $?))
(not (wynik_abs $?))
(not (bufor ?))
(not (przeniesione $?))
(not (licznik_liczb ?))
(not (licznik_bitow ?))
(not (potega ?))
=>
(assert (kopia_lista $?cos))
(assert (bin ))
(assert (wynik))
(assert (wynik_abs))
(assert (bufor 0))
(assert (przeniesione ))
(assert (licznik_liczb 0))
(assert (licznik_bitow 0))
(assert (potega 0)))

(defrule binarne
?i <- (lista $?reszta ?x)
?j <- (bin $?cos)
?k <- (licznik_bitow ?l)
(test (!= ?x 0))
=>
(retract ?i ?j ?k)
(assert (lista $?reszta (div ?x 2)))
(assert (licznik_bitow (+ ?l 1)))
(assert (bin (mod ?x 2) $?cos)))

(defrule usuwanie_zera
?i <- (lista $?reszta ?x)
?j <- (licznik_liczb ?l)
(test (= ?x 0))
=>
(retract ?i ?j)
(assert (lista $?reszta))
(assert (licznik_liczb (+ ?l 1))))

(defrule srednia_dlugosc
(lista)
?i <- (licznik_bitow ?lb)
?j <- (licznik_liczb ?ll)
=>
(retract ?i)
(assert (srednia (div ?lb ?ll)))
(assert (reszta (mod ?lb ?ll))))

(defrule przepisz
(lista)
?i <- (bin ?x $?reszta)
?j <- (reszta ?r)
?k <- (przeniesione $?cos)
(test (!= ?r 0))
=>
(retract ?i ?j ?k)
(assert (bin $?reszta))
(assert (reszta (- ?r 1)))
(assert (przeniesione $?cos ?x)))

(defrule zliczanie
(lista)
(srednia ?s)
?i <- (bin $?reszta ?x)
?j <- (bufor ?b)
?k <- (potega ?p)
(test (< ?p ?s))
=>
(retract ?i ?j ?k)
(assert (bin $?reszta))
(assert (bufor (div (+ ?b (* ?x (** 2 ?p))) 1)))
(assert (potega (+ ?p 1))))

(defrule na_liste_wynik
(lista)
(srednia ?s)
?i <- (bufor ?b)
?j <- (wynik $?cos)
?k <- (potega ?p)
(test (= ?s ?p))
=>
(retract ?i ?j ?k)
(assert (bufor 0))
(assert (wynik ?b $?cos))
(assert (potega 0)))

(defrule ostatnia
(lista)
(bin)
(bufor 0)
?i <- (wynik ?w $?reszta)
?j <- (srednia ?s)
?k <- (przeniesione $?cos ?x)
=>
(retract ?i ?j ?k)
(assert (wynik (div (+ ?w (* ?x (** 2 ?s))) 1) $?reszta))
(assert (srednia (+ ?s 1)))
(assert (przeniesione $?cos)))

(defrule koniec
(lista)
(wynik $?cos)
?i <- (licznik_liczb ?ll)
?j <- (reszta ?r)
?k <- (bin)
?m <- (bufor ?b)
?n <- (potega ?p)
?o <- (srednia ?s)
?t <- (przeniesione)
=>
(retract ?i ?j ?k ?m ?n ?o ?t))

(defrule z_absem
(lista)
(not (bin))
?i <- (kopia_lista $?reszta ?x)
?j <- (wynik $?reszta1 ?y)
?k <- (wynik_abs $?cos)
=>
(retract ?i ?j ?k)
(assert (wynik_abs (abs (- ?x ?y)) $?cos ))
(assert (kopia_lista $?reszta))
(assert (wynik $?reszta1))) 

(defrule wyznaczanie_minimalnego
(lista)
(not (bin))
(kopia_lista)
(wynik)
?i <- (wynik_abs ?x ?y $?reszta)
(test (> ?x ?y))
=>
(retract ?i)
(assert (wynik_abs ?y $?reszta)))

(defrule wyznaczanie_minimalnego1
(lista)
(not (bin))
(kopia_lista)
(wynik)
?i <- (wynik_abs ?x ?y $?reszta)
(test (< ?x ?y))
=>
(retract ?i)
(assert (wynik_abs ?x $?reszta)))