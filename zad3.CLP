(deffacts dane
(lista -4 -1 2 4 5 7 8 9)
(przedzialy -3 5 0 7 2 10 3 8 -2 2))

(defrule stworz 
(lista $?cos)
(przedzialy $?cos1)
(not(bufor $?))
(not(kopiaprzedzialow $?))
(not(kopiaprzedzialow1 $?))
(not(srodki $?))
(not(kopialisty $?))
(not(przynalezne $?))
(not(listaprzynaleznych $?))
=>
(assert (bufor)(kopialisty $?cos)(kopiaprzedzialow $?cos1)(kopiaprzedzialow1 $?cos1) (srodki) (listaprzynaleznych)(przynalezne)))


(defrule policzsrodki1
?i<-(kopiaprzedzialow ?x ?y $?cos)
?ii<-(srodki $?cos1)
=>
(retract ?i ?ii)
(assert(kopiaprzedzialow $?cos))
(assert(srodki $?cos1 (/(+ ?x ?y) 2) ))))


(defrule przynalezne1
(kopiaprzedzialow)
?i<-(przedzialy ?x ?y $?cos)
?ii<-(kopialisty ?h $?cos1)
?iii<-(przynalezne $?cos2)
?iiii<-(bufor $?cos3)
(test( >= ?h ?x))
(test(<= ?h ?y))
=>
(retract ?i ?ii ?iii ?iiii)
(assert(bufor $?cos3 ?h))
(assert(przedzialy ?x ?y $?cos))
(assert(kopialisty $?cos1))
(assert(przynalezne $?cos2 ?h)))

(defrule przynalezne2
(kopiaprzedzialow)
?i<-(przedzialy ?x ?y $?cos)
?ii<-(kopialisty ?h $?cos1)
?iii<-(przynalezne $?cos2)
?iiii<-(bufor $?cos3)
(test( < ?h ?x))
=>
(retract ?i ?ii ?iiii)
(assert(bufor $?cos3 ?h))
(assert(przedzialy ?x ?y $?cos))
(assert(kopialisty $?cos1)))

(defrule przynalezne3
(kopiaprzedzialow)
?i<-(przedzialy ?x ?y $?cos)
?ii<-(kopialisty ?h $?cos1)
?iii<-(przynalezne $?cos2)
?iiii<-(bufor $?cos3)
(test( > ?h ?y))
=>
(retract ?i  ?ii ?iiii)
(assert(bufor $?cos3 ?h))
(assert(przedzialy ?x ?y $?cos))
(assert(kopialisty $?cos1)))


(defrule przynalezne4
(kopiaprzedzialow)
?i<-(przedzialy ?x ?y $?cos)
?ii<-(kopialisty)
?iii<-(przynalezne $?cos2)
?iiii<-(bufor $?cos3)
?iiiii<-(listaprzynaleznych $?cos4 )
=>
(retract ?i  ?ii ?iii ?iiii ?iiiii)
(assert(bufor ))
(assert(kopialisty $?cos3))
(assert(przedzialy  $?cos))
(assert(przynalezne ))
(assert(listaprzynaleznych $?cos4 $?cos2 n)))

(defrule usun
?i<-(przedzialy)
?ii<-(bufor)
?iii<-(przynalezne)
?iiii<-(kopiaprzedzialow)
=>
(retract ?i ?ii ?iii ?iiii))

(defrule stworz2 
(not(przedzialy $?))
(not(suma $?))
(not(licznik $?))
(not(srodek $?))
(not(separator $?))
(not(srodkiprzynaleznych $?))
=>
(assert(suma 0)(licznik 0)  (srodkiprzynaleznych ) (srodek  )))

(defrule srodkiprzynaleznych1
(not(przedzialy $?))
?i<-(listaprzynaleznych ?x&~n $?cos)
?ii<-(suma ?s)
?iii<-(licznik ?l)
=>
(retract ?i ?ii ?iii)
(assert(listaprzynaleznych $?cos))
(assert(suma(+ ?s ?x)))
(assert(licznik(+ ?l 1))))


(defrule srodkiprzynaleznych2
(not(przedzialy $?))
?i<-(listaprzynaleznych n $?cos)
?ii<-(suma ?s)
?iii<-(licznik ?l)
?iiii<-(srodek $?cos1)
=>
(retract ?i ?ii ?iii ?iiii)
(assert(listaprzynaleznych  $?cos))
(assert(suma 0 ))
(assert(licznik 0))
(assert(srodek $?cos1 (/ ?s ?l))))) 

(defrule stworz3
(not(przedzialy $?))
(listaprzynaleznych)
(not(najmniejszy $?))
(not(zlicz $?))
=>
(assert(najmniejszy) (zlicz 0)))


(defrule roznice1
(not(przedzialy $?))
(listaprzynaleznych)
?i<-(srodek ?x $?cos)
?iiii<-(srodki ?y $?cos1)
?ii<-(najmniejszy)
?iii<-(zlicz ?z)
=>
(retract ?i ?iiii ?ii ?iii)
(assert(srodek $?cos))
(assert(srodki $?cos1))
(assert(najmniejszy(abs(- ?x ?y))))
(assert(zlicz (+ ?z 1))))


(defrule roznice2
(not(przedzialy $?))
(listaprzynaleznych)
?i<-(srodek ?x $?cos)
?iiii<-(srodki ?y $?cos1)
(najmniejszy ?n)
?iii<-(zlicz ?z)
(test(< ?n (abs(- ?x ?y))))
=>
(retract ?i ?iiii)
(assert(srodek $?cos))
(assert(srodki $?cos1))
)

(defrule roznice3
(not(przedzialy $?))
(listaprzynaleznych)
?i<-(srodek ?x $?cos)
?iiii<-(srodki ?y $?cos1)
?ii<-(najmniejszy ?n )
?iii<-(zlicz ?z)
(test(> ?n (abs(- ?x ?y))))
=>
(retract ?i ?iiii ?ii ?iii)
(assert(srodek $?cos))
(assert(srodki $?cos1))
(assert(najmniejszy(abs(- ?x ?y))))
(assert(zlicz (+ ?z 1))))









