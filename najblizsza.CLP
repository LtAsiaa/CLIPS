(deffacts dane
(liczby 1 5 6 -2 4)
(liczba 7)
(najblizsza))


(defrule wsadz 
?i<-(liczby ?x $?cos)
?ii<-(najblizsza )
=>
(retract ?i ?ii)
(assert(liczby $?cos))
(assert(najblizsza ?x)))



(defrule porownaj1
?i<-(liczby ?x $?cos)
?ii<-(najblizsza ?y)
(liczba ?l)
(test(>=(abs(- ?l ?x)) (abs(- ?l ?y))))
=>
(retract ?i)
(assert(liczby $?cos)))


(defrule porownaj2
?i<-(liczby ?x $?cos)
?ii<-(najblizsza ?y)
(liczba ?l)
(test(<(abs(- ?l ?x)) (abs(- ?l ?y))))
=>
(retract ?i ?ii)
(assert(najblizsza ?x))
(assert(liczby $?cos)))


