(deffacts dane
(macierz 1 2 3 4 5 # 1 2 3 4 5 # 1 2 3 4 5 # 1 2 3 4 5 # 1 2 3 4 5))

(defrule start
(not (macierz_kopia $?))
(not (macierz_licznik $?))
(not (licznik_wie ?))
(not (bufor $?))
(not (suma ?))
=>
(assert (macierz_kopia))
(assert (macierz_licznik 0))
(assert (licznik_wie 1))
(assert (bufor))
(assert (suma 0)))

(defrule kopiowanie
(macierz ?m $?cala)
?i <- (macierz_kopia)
=>
(retract ?i)
(assert (macierz_kopia ?m $?cala)))

(defrule zlicz_macierz_elementy
(macierz_kopia ?mk $?zawartosc)
?i <- (macierz ?x&~# $?reszta)
?j <- (macierz_licznik $?przod ?ml)
=>
(retract ?i ?j)
(assert (macierz $?reszta))
(assert (macierz_licznik $?przod (+ ?ml 1))))

(defrule zlicz_macierz_wiersze
(macierz_kopia ?mk $?zawartosc)
?i <- (macierz # $?reszta)
?j <- (macierz_licznik $?przod ?ml)
?k <- (licznik_wie ?lw)
=>
(retract ?i ?j ?k)
(assert (macierz $?reszta))
(assert (macierz_licznik $?przod ?ml # 0))
(assert (licznik_wie (+ ?lw 1))))

(defrule sprawdzanie_elementow_macierzy_rowne
(macierz_kopia ?mk $?zawartosc)
(macierz)
(licznik_wie ?)
?i <- (macierz_licznik ?x # ?y $?reszta)
?j <- (bufor $?cos)
(test (= ?x ?y))
=>
(retract ?i ?j)
(assert (macierz_licznik ?y $?reszta))
(assert (bufor $?cos ?x)))

(defrule sprawdzanie_elementow_macierzy_gdy_jeden
(macierz_kopia ?mk $?zawartosc)
(macierz)
(licznik_wie ?)
?i <- (macierz_licznik ?ml)
?j <- (bufor $?cos)
=>
(retract ?i ?j)
(assert (macierz_licznik))
(assert (bufor $?cos ?ml)))

(defrule sprawdzanie_elementow_macierzy_roz
(macierz_kopia ?mk $?zawartosc)
(macierz)
(licznik_wie ?)
?i <- (macierz_licznik ?x # ?y $?reszta)
?j <- (bufor $?cos)
(test (!= ?x ?y))
=>
(printout t "Macierz nie jest kwadratowa" crlf))

(defrule sprawdzanie_elementow_wier_row
(macierz_kopia ?mk $?zawartosc)
(macierz)
(macierz_licznik)
(licznik_wie ?lw)
?i <- (bufor ?x $?reszta)
(test (= ?lw ?x))
=>
(retract ?i)
(assert (bufor $?reszta)))


(defrule obliczanie_gdy_rozne
(macierz)
(macierz_licznik)
(bufor)
(suma ?)
?i <- (macierz_kopia ?mk&~# $?reszta)
?j <- (licznik_wie ?lw)
(test (!= ?mk ?lw))
=>
(retract ?i ?j)
(assert (macierz_kopia $?reszta))
(assert (licznik_wie ?lw)))

(defrule obliczanie_gdy_rowne
(macierz)
(macierz_licznik)
(bufor)
?i <- (macierz_kopia ?mk&~# $?reszta)
?j <- (suma ?s)
(licznik_wie ?lw)
(test (= ?mk ?lw))
=>
(retract ?i ?j)
(assert (macierz_kopia $?reszta))
(assert (suma (+ ?s ?mk))))

(defrule obliczanie_gdy_hash
(macierz)
(macierz_licznik)
(bufor)
?i <- (macierz_kopia # $?reszta)
?j <- (licznik_wie ?lw&~0)
=>
(retract ?i ?j)
(assert (macierz_kopia $?reszta))
(assert (licznik_wie (- ?lw 1))))