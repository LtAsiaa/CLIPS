(deffacts dane 
(lista 21 32 43 54 65 76 12 23 34 45 56 67))

(defrule start
(not (bufor $?))
(not (rozbite $?))
(not (lustrzane $?))
=>
(assert (bufor))
(assert (rozbite))
(assert (lustrzane)))

(defrule do_bufora
?i <- (lista $?przod ?x&~0)
?j <- (bufor $?cos)
=>
(retract ?i ?j)
(assert (lista $?przod (div ?x 10)))
(assert (bufor (mod ?x 10) $?cos)))

(defrule usuwanie_zera
?i <- (lista $?przod ?x)
?j <- (bufor $?cos)
(test (= ?x 0))
=>
(retract ?i ?j)
(assert (lista $?przod))
(assert (bufor # $?cos)))

(defrule usun_separator
(lista)
?i <- (bufor # $?tyl)
?j <- (rozbite $?cos)
=>
(retract ?i ?j)
(assert (rozbite $?cos $?tyl))
(assert (bufor)))

(defrule pary
(lista)
(bufor)
?i <- (rozbite $?przod # ?x ?y # $?srodek # ?y ?x # $?tyl)
=>
(retract ?i)
(assert (lustrzane ?x ?y # ?y ?x))
(assert (rozbite $?przod # $?srodek # $?tyl)))

(defrule pary_bez_tyl
(lista)
(bufor)
?i <- (rozbite $?przod # ?x ?y # $?srodek # ?y ?x)
=>
(retract ?i)
(assert (lustrzane ?x ?y # ?y ?x))
(assert (rozbite $?przod # $?srodek)))

(defrule pary_bez_przod
(lista)
(bufor)
?i <- (rozbite ?x ?y # $?srodek # ?y ?x # $?tyl)
=>
(retract ?i)
(assert (lustrzane ?x ?y # ?y ?x))
(assert (rozbite $?srodek # $?tyl)))

(defrule pary_bez_srodek
(lista)
(bufor)
?i <- (rozbite $?przod # ?x ?y # ?y ?x # $?tyl)
=>
(retract ?i)
(assert (lustrzane ?x ?y # ?y ?x))
(assert (rozbite $?przod # $?tyl)))

(defrule pary_same
(lista)
(bufor)
?i <- (rozbite ?x ?y # ?y ?x )
=>
(retract ?i)
(assert (lustrzane ?x ?y # ?y ?x))
(assert (rozbite)))

(defrule laczenie
(lista)
(bufor)
(rozbite)
?i <- (lustrzane ?x ?y # ?z ?w )
=>
(retract ?i)
(assert (lustrzane (+ (* ?x 10) ?y) # (+ (* ?z 10) ?w))))