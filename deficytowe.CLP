(deffacts dane
(liczby 6 4 5 2 49 125 )
(deficytowe)
)

(defrule stworz 
(liczby $?cos)
(not(kopialiczby $?))
(not(dzielniki $?))
(not(listakoniec $?))
(not(dzielnik $?))
=>
(assert(kopialiczby $?cos)(dzielniki 0) (dzielnik 1)(listakoniec)))





(defrule policzdzielniki1
?i<-(liczby ?x $?cos)
?ii<-(dzielnik ?d)
?iii<-(dzielniki ?k)
(test(!= ?x ?d))
(test(= (mod ?x ?d) 0))
=>
(retract ?ii ?iii)
(assert(dzielnik (+ ?d 1)))
(assert(dzielniki (+ ?k ?d))))

(defrule policzdzielniki2
?i<-(liczby ?x $?cos)
?ii<-(dzielnik ?d)
(dzielniki ?k)
(test(!= ?x ?d))
(test(!= (mod ?x ?d) 0))
=>
(retract ?ii )
(assert(dzielnik (+ ?d 1))))

(defrule policzdzielniki3
?i<-(liczby ?x $?cos)
?ii<-(dzielnik ?d)
?iii<-(dzielniki ?k)
?iiii<-(listakoniec $?cos1)
(test(= ?x ?d))
=>
(retract ?i ?ii ?iii ?iiii   )
(assert(liczby $?cos))
(assert(dzielnik 1))
(assert(dzielniki 0))
(assert(listakoniec $?cos1 ?k)))

(defrule porownaj1 
(liczby)
?i<-(kopialiczby ?x $?cos)
?ii<-(listakoniec ?y $?cos1)
?iii<-(deficytowe $?cos2)
(test(> ?x ?y))
=>
(retract ?i ?ii ?iii)
(assert(deficytowe $?cos2 ?x))
(assert(listakoniec $?cos1))
(assert(kopialiczby $?cos)))


(defrule porownaj2
(liczby)
?i<-(kopialiczby ?x $?cos)
?ii<-(listakoniec ?y $?cos1)
(deficytowe $?cos2)
(test(<= ?x ?y))
=>
(retract ?i ?ii )
(assert(listakoniec $?cos1))
(assert(kopialiczby $?cos)))

(defrule usun2
?i<-(kopialiczby )
?ii<-(listakoniec )
?iii<-(liczby)
?iiii<-(dzielnik ?d)
?iiiii<-(dzielniki ?p)
=>
(retract ?i ?ii ?iii ?iiii ?iiiii))



