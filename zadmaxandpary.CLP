(deffacts dane
(lista -6 1 7 -5 2 9 11 -2 3))

(defrule stworz 
(not(kopialisty $?))
(not(liczniksum $?))
(not(replika $?))
(not(suma $?))
(not(max $?))
(lista $?cos)
=>
(assert(max))
(assert(suma 0))
(assert(replika))
(assert(liczniksum 1))
(assert(kopialisty $?cos)))

(defrule sumuj
?i<-(kopialisty ?x $?cos)
?ii<-(replika $?cos1)
(liczniksum ?l)
?iii<-(suma ?s)
=>
(retract ?i ?ii ?iii)
(assert(kopialisty $?cos))
(assert(replika $?cos1 ?x))
(assert(suma(+ ?s ?x))))

(defrule sumuj1
?i<-(kopialisty)
?ii<-(replika ?x $?cos1 ?y)
?iii<-(liczniksum ?l)
?iiii<-(suma ?s)
=>
(retract ?i ?ii ?iii ?iiii)
(assert(kopialisty $?cos1))
(assert(replika))
(assert(suma 0))
(assert(liczniksum(+ ?l 1)))
(assert(sumy ?l ?s))))


(defrule sumuj2
(kopialisty)
?ii<-(replika ?x)
?iii<-(liczniksum ?l)
?iiii<-(suma ?s)
=>
(retract  ?ii ?iii ?iiii)
(assert(sumy ?l ?s))))


(defrule wsadzmax
(kopialisty)
(not(replika $?))
?i<-(sumy ?l ?x)
?ii<-(max)
=>
(retract ?i ?ii)
(assert(max ?l ?x)))

(defrule porownaj 
(kopialisty)
(not(replika $?))
?i<-(max ?l ?x)
?ii<-(sumy ?n ?y)
(test(< ?x ?y))
=>
(retract ?i ?ii)
(assert(max ?n ?y)))

(defrule porownaj1 
(kopialisty)
(not(replika $?))
?i<-(max ?l ?x)
?ii<-(sumy ?n ?y)
(test(> ?x ?y))
=>
(retract  ?ii))


(defrule stworz2
(kopialisty)
(not(sumy $?))
(not(replika $?))
(not(licznikpar $?))
=>
(assert(licznikpar 1)))

(defrule pary
?i<-(lista ?x $?srodek ?y)
?ii<-(licznikpar ?l)
=>
(retract ?i ?ii )
(assert(lista $?srodek))
(assert(licznikpar (+ ?l 1 )))
(assert(para ?l (+ ?x ?y))))

(defrule pary1
?i<-(lista ?x)
?ii<-(licznikpar ?l)
=>
(retract ?i ?ii)
(assert(para ?l ?x)))




