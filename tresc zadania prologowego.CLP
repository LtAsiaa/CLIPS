(deffacts dane
(lista 123 # 537 # 153 # 162)
(separator #)
(listacyfr)
(listapolacz )
(potega 0)
(liczba 0)
)

(defrule rozbij
(separator ?s)
?i<-(lista $?cos ?x&~?s)
?ii<-(listacyfr $?cos1)
(test(!= ?x 0))
=>
(retract ?i ?ii)
(assert(lista $?cos (div ?x 10)))
(assert(listacyfr (mod ?x 10) $?cos1))))



(defrule rozbij1
(separator ?s)
?i<-(lista $?cos ?s)
?ii<-(listacyfr $?cos1)
=>
(retract ?i ?ii)
(assert(lista $?cos))
(assert(listacyfr ?s $?cos1))))

(defrule rozbij2
(separator ?s)
?i<-(lista $?cos ?x&~?s)
?ii<-(listacyfr $?cos1)
(test(= ?x 0))
=>
(retract ?i )
(assert(lista $?cos)))


(defrule listabezmono
(lista)
(not(listabezmono $?))
=>
(assert(listabezmono)))


(defrule usunmon
(lista)
(separator ?s)
?i<-(listacyfr ?x&~?s ?y&~?s ?b&~?s $?cos)
?ii<-(listabezmono $?cos1)
(test(< ?x ?b))
(test(> ?b ?y))
(test(> ?y ?x))
=>
(retract ?i ?ii)
(assert(listacyfr $?cos))
(assert(listabezmono $?cos1 ?x ?y ?b )))


(defrule usunmon1
(lista)
(separator ?s)
?i<-(listacyfr ?s $?cos)
?ii<-(listabezmono $?cos1)
=>
(retract ?i ?ii)
(assert(listacyfr $?cos))
(assert(listabezmono  $?cos1 ?s)))


(defrule usunmon2
(lista)
(separator ?s)
?i<-(listacyfr ?x&~?s ?y&~?s ?b&~?s $?cos)
?ii<-(listabezmono $?cos1)
(test(< ?x ?b))
(test(> ?b ?y))
(test(< ?y ?x))
=>
(retract ?i ?ii)
(assert(listacyfr $?cos))
(assert(listabezmono $?cos1 ?x  ?b )))


(defrule usunmon3
(lista)
(separator ?s)
?i<-(listacyfr ?x&~?s ?y&~?s ?b&~?s $?cos)
?ii<-(listabezmono $?cos1)
(test(< ?x ?b))
(test(< ?b ?y))
(test(> ?y ?x))
=>
(retract ?i ?ii)
(assert(listacyfr $?cos))
(assert(listabezmono $?cos1 ?x  ?y )))

(defrule polacz
(listacyfr)
(separator ?s)
?i<-(listabezmono $?cos ?x&~?s)
?ii<-(listapolacz $?cos1)
?iii<-(potega ?z)
?iiii<-(liczba ?l)
=>
(retract ?i ?iii ?iiii)
(assert(listabezmono $?cos))
(assert(potega (+ ?z 1)))
(assert(liczba(+ ?l (* ?x(** 10 ?z))) )))


(defrule polacz1
(listacyfr)
(separator ?s)
?i<-(listabezmono $?cos ?s)
?ii<-(listapolacz $?cos1)
?iii<-(potega ?z)
?iiii<-(liczba ?l)
=>
(retract ?i ?ii ?iii ?iiii)
(assert(listabezmono $?cos))
(assert(listapolacz ?l $?cos1  ))
(assert(potega 0))
(assert(liczba 0 )))




(defrule polacz2
(listacyfr)
(listabezmono)
?ii<-(listapolacz $?cos1)
?iii<-(potega ?z)
?iiii<-(liczba ?l)
=>
(retract ?ii ?iii ?iiii)
(assert(listapolacz ?l $?cos1  )))





