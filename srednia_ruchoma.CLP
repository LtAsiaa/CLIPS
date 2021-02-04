(deffacts dane
(lista 7 -1 3 12 1)
(suma 0)
(krok 5)
(srednie)
(bufor)
(licznik 0))

(defrule bufora
?i <- (lista ?x $?reszta)
?j <- (krok ?w)
?m <- (licznik ?y&~?w)
?n <- (bufor $?cos)
?o <- (suma ?s)
=>
(retract ?i ?m ?n ?o)
(assert (lista $?reszta))
(assert (licznik (+ ?y 1)))
(assert (bufor $?cos ?x))
(assert (suma (+ ?s ?x))))

(defrule dodatkowy
?i <- (lista $?cos)
?j <- (licznik ?y)
?m <- (krok ?y)
?n <- (bufor ?b $?reszta)
?o <- (suma ?s)
?p <- (srednie $?wartosci)
=>
(retract ?i ?j ?m ?n ?o ?p)
(assert (lista $?cos))
(assert (licznik (- ?y 1)))
(assert (krok ?y))
(assert (bufor $?reszta))
(assert (suma (- ?s ?b)))
(assert (srednie $?wartosci (/ ?s ?y))))


