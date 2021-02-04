(deffacts dane
(lista 2 12 17 1 6 11)
(licznik1 0)
(licznik2 0)
(dziesietne)
(potega 0)
(liczbaktualna 0)
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

(defrule kopialicznika
(kopialista)
(not(kopialicznika $?))
(licznik2 ?s)
=>
(assert(kopialicznika ?s)))



(defrule srednia 
(kopialista)
?ii<-(licznik1 ?z)
?iii<-(licznik2 ?s)
=>
(assert(srednia(div ?z ?s)))
(retract ?ii ))










(defrule konwersja1 
(not(licznik1 $?))
?i<-(liczbaktualna ?z)
?ii<-(listabin $?cos1 ?x)
?iii<-(potega ?p)
(srednia ?s)
?iiii<-(kopialicznika ?l)
?iiiii<-(dziesietne $?cos)
(test(!= ?x 0))
(test(!= ?p 3))
(test(!= ?l 1))
=>
(retract ?i ?ii ?iii)
(assert(potega(+ ?p 1)))
(assert(listabin $?cos1))
(assert(liczbaktualna(+ ?z(* ?x(** 2 ?p))))))


(defrule konwersjazero
(not(licznik1 $?))
?i<-(liczbaktualna ?z)
?ii<-(listabin $?cos1 ?x)
?iii<-(potega ?p)
(srednia ?s)
?iiii<-(kopialicznika ?l)
?iiiii<-(dziesietne $?cos)
(test(= ?x 0))
(test(!= ?p 3))
(test(!= ?l 1))
=>
(retract ?i ?ii ?iii)
(assert(potega(+ ?p 1)))
(assert(listabin $?cos1))
(assert(liczbaktualna (+ ?z ?x)))))



(defrule konwersja2 
?i<-(liczbaktualna ?z)
?ii<-(listabin $?cos1 ?x)
?iii<-(potega ?p)
(srednia ?s)
?iiiii<-(kopialicznika ?l)
?iiii<-(dziesietne $?cos)
(test(= ?p 3))
(test(!= ?l 1))
=>
(retract ?i ?ii ?iii ?iiii ?iiiii)
(assert(potega 0 ))
(assert(kopialicznika(- ?l 1)))
(assert(listabin $?cos1 ?x))
(assert(dziesietne ?z $?cos ))
(assert(liczbaktualna  0)))

(defrule konieckonwersja
?i<-(liczbaktualna ?z)
?ii<-(listabin $?cos1 ?x)
?iii<-(potega ?p)
?iiii<-(kopialicznika 1)
(dziesietne $?cos)
=>
(retract ?i ?ii ?iii)
(assert(potega(+ ?p 1)))
(assert(listabin $?cos1))
(assert(liczbaktualna(+ ?z (* ?x (** 2 ?p))))))


(defrule konieckonwersja1
(listabin)
(kopialicznika 1)
(liczbaktualna ?z)
?iii<-(potega ?p)
?ii<-(dziesietne $?cos)
=>
(retract ?iii ?ii)
(assert(dziesietne ?z $?cos)))










