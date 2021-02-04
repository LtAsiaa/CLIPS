(deffacts dane
(liczba 30))

(defrule stworz
(not(lista $?))
(not(listapierwsze $?))
(not(licznik $?))
(not(licznikdzielnikow $?))
(not(dzielnik $?))
=>
(assert(lista) (listapierwsze) (licznik 2)(licznikdzielnikow 1)(dzielnik 1)))


(defrule generuj 
?i<-(liczba ?l)
?ii<-(lista $?cos)
(test(> ?l 1))
=>
(retract ?i ?ii)
(assert(liczba (- ?l 1)))
(assert(lista ?l $?cos)))


(defrule liczdzielniki1
(liczba 1)
?i<-(lista ?x $?cos) 
?ii<-(licznikdzielnikow ?d)
?iii<-(dzielnik ?r)
(test(< ?r ?x))
(test(= (mod ?x ?r)0))
=>
(retract ?ii ?iii)
(assert(licznikdzielnikow (+ ?d 1)))
(assert(dzielnik (+ ?r 1))))

(defrule liczdzielniki2
(liczba 1)
?i<-(lista ?x $?cos) 
?ii<-(licznikdzielnikow ?d)
?iii<-(dzielnik ?r)
(test(< ?r ?x))
(test(!= (mod ?x ?r)0))
=>
(retract ?iii)
(assert(dzielnik (+ ?r 1))))

(defrule pierwsza 
(liczba 1)
?i<-(lista ?x $?cos)
(licznik ?l)
?ii<-(listapierwsze $?cos1)
?iii<-(dzielnik ?r)
?iiii<-(licznikdzielnikow ?h)
(test(= ?r ?x))
(test(= ?h 2))
=>
(retract ?i ?ii ?iii ?iiii)
(assert(lista $?cos))
(assert(listapierwsze $?cos1 ?x))
(assert(dzielnik 1))
(assert(licznikdzielnikow 1)))



(defrule niepierwsza 
(liczba 1)
(licznik ?l)
?i<-(lista ?x $?cos)
?iii<-(dzielnik ?r)
?iiii<-(licznikdzielnikow ?h)
(test(= ?r ?x))
(test(> ?h ?l))
=>
(retract ?i  ?iii ?iiii)
(assert(lista $?cos))
(assert(dzielnik 1))
(assert(licznikdzielnikow 1)))



