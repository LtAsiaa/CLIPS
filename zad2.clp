(deffacts dane
(lista 2 12 17 1 6 11)
(licznik1 0)
(licznik2 0)
(srednia)
)

(defrule stworzlistedobin
(not(listabin $?))
=>
(assert(listabin )))

(defrule kopialisty
(not(kopialista $?))
(lista $?cos)
=>
(assert(kopialista $?cos)))


(defrule zamianalistynabin
?i<-(kopialista $?cos ?x)
?ii<-(licznik1 ?z)
?iii<-(licznik2 ?s)
?iiii<-(listabin $?cos1)
(test(!= ?x 0))
=>
(retract ?i ?ii ?iiii)
(assert(kopialista $?cos (div ?x 2)))
(assert(licznik1(+ ?z 1)))
(assert(listabin (mod ?x 2) $?cos1 )))


(defrule zamianalistynabin1
?i<-(kopialista $?cos ?x)
?ii<-(licznik1 ?z)
?iii<-(licznik2 ?s)
?iiii<-(listabin $?cos1)
(test(= ?x 0))
=>
(retract ?i  ?iii ?iiii)
(assert(kopialista $?cos ))
(assert(licznik2(+ ?s 1)))
(assert(listabin $?cos1 )))


(defrule srednia 
(kopialista)
?i<-(srednia)
?ii<-(licznik1 ?z)
?iii<-(licznik2 ?s)
=>
(assert(srednia(div ?z ?s)))
(retract ?ii ?iii))






















