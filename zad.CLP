(deffacts generowanie
(lista)
(liczba 24)
(kwadraty)
(rozklad)
(rrozklad))

(defrule stworz
(liczba ?x)
(not(kopialiczby $?))
(not(kopia $?))
=>
(assert(kopialiczby ?x)(kopia)))

(defrule generowanie
?i<-(liczba ?x)
?ii<-(lista $?cos)
(test(>= ?x 1))
=>
(retract ?i ?ii)
(assert(liczba (- ?x 1)))
(assert(lista  ?x $?cos)))


(defrule kwadrat1
?i<-(lista $?cos ?x)
?ii<-(kopia $?cos1 )
?iii<-(kwadraty $?cos2)
=>
(retract ?i ?ii ?iii)
(assert(kopia ?x $?cos1))
(assert(lista $?cos))
(assert(kwadraty (* ?x ?x) $?cos2 )))

(defrule rozklad1
(lista)
(liczba 0)
(kopialiczby ?k)
?i<-(kwadraty $?cos ?x)
(test(> ?x ?k))
=>
(retract ?i)
(assert(kwadraty $?cos)))



(defrule rozklad2
(lista)
(liczba 0)
?ii<-(kopialiczby ?k)
?i<-(kwadraty $?cos ?x)
?iii<-(rozklad $?cos1)
(test(<= ?x ?k))
=>
(retract ?i ?ii ?iii)
(assert(kwadraty $?cos ?x))
(assert(rozklad ?x $?cos1))
(assert(kopialiczby(- ?k ?x))))

(defrule rozklad3
?i<-(lista)
(liczba 0)
?ii<-(kopialiczby 0)
=>
(retract ?i ?ii ))


(defrule rrozklad1
(kwadraty)
(liczba 0)
?i<-(rozklad $?cos ?y)
?ii<-(kopia $?cos1 ?x)
?iii<-(rrozklad $?cos2 )
(test(= (* ?x ?x ) ?y))
=>
(retract ?i ?ii ?iii)
(assert(rozklad $?cos ))
(assert(kopia $?cos1 ?x))
(assert(rrozklad ?x $?cos2)))

(defrule rrozklad2
(kwadraty)
(liczba 0)
?i<-(rozklad $?cos ?y)
?ii<-(kopia $?cos1 ?x)
?iii<-(rrozklad $?cos2 )
(test(!= (* ?x ?x ) ?y))
=>
(retract  ?ii )
(assert(kopia $?cos1 )))

(defrule rrozklad3
(kwadraty)
(liczba 0)
?i<-(rozklad  ?y)
?ii<-(kopia $?cos1 ?x)
?iii<-(rrozklad $?cos2 )
(test(= (* ?x ?x ) ?y))
=>
(retract ?i ?ii ?iii)
(assert(kopia $?cos1 ?x))
(assert(rrozklad ?x $?cos2)))




