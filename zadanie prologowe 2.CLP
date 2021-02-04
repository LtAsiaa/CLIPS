(deffacts dane
(lista 537 153 123 162 141 115 524 789))

(defrule start
(not (bufor ?))
(not (licznik ?))
(not (rozbite $?))
(not (mono $?))
(not (polaczone $?))
(not (sort $?))
(not (dod_sort $?))
(not (kopia_lista $?))
(not (bufor2 $?))
=>
(assert (rozbite ))
(assert (bufor ))
(assert (mono ))
(assert (licznik 1))
(assert (polaczone ))
(assert (sort ))
(assert (dod_sort))
(assert (kopia_lista))
(assert (bufor2 )))

(defrule kopiuj_liste
(lista $?cala)
(rozbite)
(bufor)
(mono)
(polaczone)
(sort)
(licznik 1)
(dod_sort)
(kopia_lista)
(bufor2)
?i <- (kopia_lista)
=>
(retract ?i)
(assert(kopia_lista $?cala)))

(defrule do_bufora
(kopia_lista ?kl $?zawartosc)
?i <- (lista $?reszta ?x&~0)
?j <- (bufor $?cos)
=>
(retract ?i ?j)
(assert (lista $?reszta (div ?x 10)))
(assert (bufor (mod ?x 10) $?cos)))

(defrule usuwanie_zera
(kopia_lista ?kl $?zawartosc)
?i <- (lista $?reszta ?x)
?j <- (bufor $?cos)
(test (= ?x 0))
=>
(retract ?i ?j)
(assert (lista $?reszta))
(assert (bufor # $?cos)))

(defrule usun_separator
(kopia_lista ?kl $?zawartosc)
(lista)
?i <- (bufor # $?reszta)
?j <- (rozbite $?cos)
=>
(retract ?i ?j)
(assert (rozbite $?cos $?reszta))
(assert (bufor)))

(defrule mniejsze
(kopia_lista ?kl $?zawartosc)
(lista)
?i <- (rozbite ?x ?y&~# $?reszta)
?j <- (mono $?cos)
(test (<= ?x ?y))
=>
(retract ?i ?j)
(assert (rozbite ?y $?reszta))
(assert (mono $?cos ?x)))

(defrule wieksze
(kopia_lista ?kl $?zawartosc)
(lista)
?i <- (rozbite ?x ?y&~# $?reszta)
(test (> ?x ?y))
=>
(retract ?i)
(assert (rozbite ?x $?reszta)))

(defrule gdy_hash
(kopia_lista ?kl $?zawartosc)
(lista)
?i <- (rozbite ?x # $?reszta)
?j <- (mono $?cos)
=>
(retract ?i ?j)
(assert (rozbite $?reszta))
(assert (mono $?cos ?x #)))

(defrule gdy_jeden
(kopia_lista ?kl $?zawartosc)
(lista)
?i <- (rozbite ?x)
?j <- (mono $?cos)
=>
(retract ?i ?j)
(assert (rozbite))
(assert (mono $?cos ?x)))

(defrule laczenie
(kopia_lista ?kl $?zawartosc)
(rozbite)
(lista)
?i <- (mono ?x ?y&~# $?reszta)
=>
(retract ?i)
(assert (mono (+ (* ?x 10) ?y) $?reszta)))

(defrule na_liste_laczenie
(kopia_lista ?kl $?zawartosc)
(rozbite)
(lista)
?i <- (mono ?x # $?reszta)
?j <- (polaczone $?cos)
=>
(retract ?i ?j)
(assert (mono $?reszta))
(assert (polaczone $?cos ?x )))

(defrule gdy_jeden_laczone
(kopia_lista ?kl $?zawartosc)
(rozbite)
(lista)
?i <- (mono ?x)
?j <- (polaczone $?cos)
=>
(retract ?i ?j)
(assert (mono))
(assert (polaczone $?cos ?x )))

(defrule append
(lista)
?i <- (kopia_lista ?x $?reszta)
?j <- (polaczone ?y $?reszta1)
?k <- (sort $?cos)
=>
(retract ?i ?j ?k)
(assert (kopia_lista $?reszta))
(assert (polaczone $?reszta1))
(assert (sort $?cos ?x ?y #)))

(defrule sortuj_wieksze
(lista)
(kopia_lista)
(polaczone)
?i <- (sort ?x ?y # ?z ?w $?reszta)
(test (> ?y ?w))
=>
(retract ?i)
(assert (sort ?z ?w $?reszta ?x ?y #)))

(defrule sortuj_mniejsze
(lista)
(kopia_lista)
(polaczone)
?i <- (sort ?x ?y # ?z ?w $?reszta)
?j <- (bufor2 $?cos)
(test (< ?y ?w))
=>
(retract ?i ?j)
(assert (sort ?x ?y $?reszta))
(assert (bufor2 $?cos ?z ?w #)))

(defrule sortuj_gdy_jeden
(lista)
(kopia_lista)
(polaczone)
?i <- (sort ?x ?y #)
?j <- (dod_sort $?cos)
?k <- (bufor2 $?zawartosc)
=>
(retract ?i ?j ?k)
(assert (sort $?zawartosc))
(assert (bufor2))
(assert (dod_sort $?cos ?x)))

(defrule koniec
(kopia_lista)
?i <- (sort ?x ?y #)
?j <- (dod_sort $?cos)
(bufor2)
=>
(retract ?i ?j)
(assert (sort))
(assert (dod_sort $?cos ?x)))