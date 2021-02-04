(deffacts dane
(liczba 24))

(defrule start 
(not (kopia_liczba ?))
(not (dzielniki $?))
(not (antypierwsze $?))
(not (bufor $?))
(not (kopia_dzielniki $?))
(not (podzielniki $?))
(not (licznik ?))
(not(licznik2 ?))
(not(ilosci $?))
(not (bufor2 $?))
(not (dosort $?))
(not (dosort2 $?))
=>
(assert (bufor))
(assert (antypierwsze ))
(assert (dzielniki))
(assert (kopia_liczba))
(assert (kopia_dzielniki))
(assert (podzielniki))
(assert (licznik 1))
(assert (licznik2 0))
(assert (ilosci))
(assert (bufor2 ))
(assert (dosort ))
(assert (dosort2)))

(defrule kopiowanie_liczby
(podzielniki)
(liczba ?x)
?i <- (kopia_liczba)
=>
(retract ?i)
(assert (kopia_liczba ?x)))

(defrule rowne_zero
(podzielniki)
(kopia_liczba ?x)
?i <- (liczba ?y&~0)
?j <- (dzielniki $?cos)
(test ( = (mod ?x ?y) 0))
=>
(retract ?i ?j)
(assert (dzielniki ?y $?cos))
(assert (liczba (- ?y 1))))

(defrule rozne_zero
(podzielniki)
(kopia_liczba ?x)
?i <- (liczba ?y&~0)
(test (!= (mod ?x ?y) 0))
=>
(retract ?i)
(assert (liczba (- ?y 1))))

(defrule dzielniki
(liczba 0)
(dzielniki $?reszta ?x)
?k <- (podzielniki $?nic)
?l <- (licznik ?z)
(test (< ?z ?x))
(test (= (mod ?x ?z) 0))
=>
(retract ?k ?l)
(assert(podzielniki ?z $?nic))
(assert(licznik (+ ?z 1))))

(defrule dzielniki2
(liczba 0)
(dzielniki $?reszta ?x)
?l <- (licznik ?z)
(test (< ?z ?x))
(test (!= (mod ?x ?z) 0))
=>
(retract ?l)
(assert(licznik (+ ?z 1))))

(defrule dzielniki3
(liczba 0)
?i <- (dzielniki $?reszta ?z)
?k <- (podzielniki $?nic)
?l <- (licznik ?z)
?j <- (kopia_dzielniki $?cos)
=>
(retract ?i ?k ?l ?j)
(assert(dzielniki $?reszta))
(assert(kopia_dzielniki ?z $?cos))
(assert(podzielniki # ?z $?nic))
(assert(licznik 1)))

(defrule zliczanie_ilosci
?i<-(podzielniki # $?cos ?x&~#)
?k<-(licznik2 ?z)
=>
(retract ?i ?k)
(assert(podzielniki # $?cos))
(assert(licznik2 (+ ?z 1))))

(defrule zliczanie_ilosci2
?i<-(podzielniki # $?cos #)
?k<-(licznik2 ?z)
?j<-(ilosci $?coss)
=>
(retract ?i ?j ?k)
(assert(podzielniki # $?cos))
(assert(ilosci # ?z $?coss))
(assert(licznik2 0)))


(defrule podlisty
(liczba 0)
?i <- (kopia_dzielniki $?reszta ?x)
?j <- (ilosci $?reszta2 # ?y)
?k <- (dosort $?cos)
=>
(retract ?i ?j ?k)
(assert (kopia_dzielniki $?reszta))
(assert (ilosci $?reszta2))
(assert (dosort # ?x ?y $?cos))) 

(defrule sorcik
(liczba 0)
(dzielniki)
(kopia_dzielniki ?m)
(ilosci)
?i <- (dosort # ?x ?y # ?z ?w $?reszta)
(test(< ?y ?w))
=>
(retract ?i)
(assert (dosort # ?z ?w $?reszta)))

(defrule sorcik1
(liczba 0)
(dzielniki)
(kopia_dzielniki ?m)
(ilosci)
?i <- (dosort # ?x ?y # ?z ?w $?reszta)
(test(> ?y ?w))
=>
(retract ?i )
(assert (dosort # ?x ?y  $?reszta)))

(defrule sorcik2
(liczba 0)
(dzielniki)
(kopia_dzielniki ?m)
(ilosci)
?i <- (dosort # ?x ?y # ?z ?w $?reszta)
(test(= ?y ?w))
=>
(retract ?i )
(assert (dosort # ?z ?w  $?reszta)))


(defrule koniec
(dosort # ?x ?y)
(kopia_liczba ?x)
=>
(printout t "Jest antypierwsza" crlf))

(defrule koniec2
(dosort # ?x ?y)
(kopia_liczba ?z)
(test (!= ?z ?x))
=>
(printout t " nie jest antypierwsza" crlf))


