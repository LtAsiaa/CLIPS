(deffacts dane
(liczby 20 42 6 5 4)
(proniczna)
)


(defrule stworz
(liczby $?cos)
(not(separator $?))
(not(kopialiczby $?))
(not(dzielniki $?))
(not(dzielnik $?))
(not(dzielodp $?))
=>
(assert (separator #)(kopialiczby $?cos)(dzielniki)(dzielnik 1) (dzielodp )))

(defrule dzielnikszuk1
?i<-(kopialiczby ?x $?cos)
?ii<-(dzielnik ?d)
?iii<-(dzielniki $?cos1)
(test(!= ?x ?d))
(test(= (mod ?x ?d) 0))
=>
(retract ?ii ?iii)
(assert(dzielnik(+ ?d 1)))
(assert(dzielniki $?cos1 ?d)))

(defrule dzielnikszuk2
?i<-(kopialiczby ?x $?cos)
?ii<-(dzielnik ?d)
?iii<-(dzielniki $?cos1)
(test(!= ?x ?d))
(test(!= (mod ?x ?d) 0))
=>
(retract ?ii )
(assert(dzielnik(+ ?d 1))))


(defrule dzielnikszuk3
(separator ?s)
?i<-(kopialiczby ?x $?cos)
?ii<-(dzielnik ?d)
?iii<-(dzielniki $?cos1)
(test(= ?x ?d))
(test(= (mod ?x ?d) 0))
=>
(retract ?i ?ii ?iii)
(assert(kopialiczby $?cos))
(assert(dzielnik 1))
(assert(dzielniki $?cos1 ?d ?s)))

(defrule szukajdzielnikowodpowiednich1
(kopialiczby)
(separator ?s)

?i<-(dzielniki ?x&~?s  ?y&~?s $?cos)
?ii<-(liczby ?l $?cos1)
?iii<-(proniczna $?cos2)
(test(= ( + ?x 1 ) ?y))
(test(= (* ?x ?y) ?l))
=>
(retract ?i ?ii ?iii)
(assert(dzielniki  $?cos))
(assert(liczby $?cos1))
(assert(proniczna $?cos2 ?l)))

(defrule szukajdzielnikowodpowiednich2
(kopialiczby)
(separator ?s)
?i<-(dzielniki ?s $?cos)
?ii<-(liczby ?l $?cos1)
?iii<-(proniczna $?cos2)
=>

(retract ?i )
(assert(dzielniki $?cos)))


(defrule szukajdzielnikowodpowiednich3
(kopialiczby)
(separator ?s)
?i<-(dzielniki ?x&~?s ?y&~?s $?cos)
?ii<-(liczby ?l $?cos1)
?iii<-(proniczna $?cos2)
(test(= ( + ?x 1 ) ?y))
(test(!= (* ?x ?y) ?l))
=>
(retract ?i ?ii)
(assert(dzielniki ?y $?cos))
(assert(liczby ?l $?cos1)))


(defrule szukajdzielnikowodpowiednich4
(kopialiczby)
(separator ?s)
?i<-(dzielniki  ?y&~?s  $?cos)
?ii<-(liczby ?l $?cos1)
?iii<-(proniczna $?cos2)
=>
(retract ?i )
(assert(dzielniki  $?cos)))


