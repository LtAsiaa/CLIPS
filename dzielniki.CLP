(deffacts dane
(lista 60 30 45 70)
(dzielnik 2)
)

(defrule stworz 
(not(dzielniki $?))
(not(listadzielnikow $?))
(not(separator $?))
=>
(assert(dzielniki))
(assert(listadzielnikow))
(assert(separator #)))


(defrule rozbij1
?i<-(lista ?x $?cos)
?ii<-(dzielnik ?d)
?iii<-(dzielniki $?cos1)
(listadzielnikow $?cos2)
(test(!= ?x 1))
(test(= (mod ?x ?d ) 0))
=>
(retract ?i ?ii ?iii)
(assert(lista (div ?x ?d) $?cos))
(assert(dzielnik ?d))
(assert(dzielniki $?cos1 ?d)))


(defrule rozbij2
?i<-(lista ?x $?cos)
?ii<-(dzielnik ?d)
?iii<-(dzielniki $?cos1)
(listadzielnikow $?cos2)
(test(!= ?x 1))
(test(!= (mod ?x ?d ) 0))
=>
(retract  ?ii )
(assert(dzielnik (+ ?d 1))))

(defrule rozbij3
(separator ?s)
?i<-(lista ?x $?cos)
?ii<-(dzielnik ?d)
?iii<-(dzielniki $?cos1)
?iiii<-(listadzielnikow $?cos2)
(test(= ?x 1))
=>
(retract ?i ?ii ?iii ?iiii)
(assert(listadzielnikow $?cos2 $?cos1 ?s))
(assert(lista $?cos))
(assert(dzielniki))
(assert(dzielnik 2)))

(defrule usungdylistapusta
(lista)
?i<-(dzielniki)
?ii<-(dzielnik ?d)
=>
(retract ?i ?ii))


(defrule stworz1 
(lista)
(not(dzielniki $?))
(not(listaunikalne $?))
(not(listawznow $?))
=>
(assert(listawznow ))
(assert(listaunikalne)))

(defrule usunmon1
(lista)
(not(dzielniki $?))
(separator ?s)
?i<-(listadzielnikow ?x&~?s ?y&~?s $?cos)
?ii<-(listawznow $?cos1)
(test(!= ?x ?y))
=>
(retract ?i ?ii)
(assert(listadzielnikow ?x $?cos))
(assert(listawznow $?cos1 ?y)))



(defrule usunmon2
(lista)
(not(dzielniki $?))
(separator ?s)
?i<-(listadzielnikow ?x&~?s ?y&~?s $?cos)
?ii<-(listawznow $?cos1)
(test(= ?x ?y))
=>
(retract ?i ?ii)
(assert(listadzielnikow ?x $?cos))
(assert(listawznow $?cos1)))



(defrule usunmon3
(lista)
(not(dzielniki $?))
(separator ?s)
?i<-(listadzielnikow ?x&~?s ?s $?cos)
?ii<-(listawznow $?cos1)
?iii<-(listaunikalne $?cos2)
=>
(retract ?i ?ii ?iii)
(assert(listaunikalne $?cos2 ?x))
(assert(listadzielnikow $?cos1 ?s $?cos  ))
(assert(listawznow )))


(defrule usunmon4
(lista)
(not(dzielniki $?))
(separator ?s)
?i<-(listadzielnikow ?s $?cos)
(listawznow )
?ii<-(listaunikalne $?cos2)
=>
(retract ?i ?ii )
(assert(listaunikalne $?cos2 ?s))
(assert(listadzielnikow  $?cos  )))








