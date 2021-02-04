(deffacts dane
(dana 33))

(defrule start 
(not (bin $?))
(not (jedynki $?))
(not (zera $?))
(not (ile1 $?))
(not (ile2 $?))
(not (nowa $?))
(not (dec $?))
(not (kopia $?))
=>
(assert (bin))
(assert (jedynki))
(assert (zera))
(assert (ile1 0))
(assert (ile2 0))
(assert (nowa))
(assert (dec 0))
(assert (kopia))
)
(defrule kopia
(bin)
(jedynki)
(zera)
(dana ?x)
?i <-(kopia)
=>
(retract ?i)
(assert(kopia ?x)))

(defrule binarny
(kopia ?p)
?i <- (dana ?x)
(test (!= ?x 0))
?j <- (bin $?reszta1)
=>
(retract ?i ?j)
(assert (dana (div ?x 2)))
(assert (bin (mod ?x 2) $?reszta1)))

(defrule podzial
?i <- (bin ?x $?reszta)
(test (= ?x 1))
?j <-(jedynki $?cos)
?k <- (ile1 ?z)
=>
(retract ?i ?j ?k)
(assert (bin $?reszta))
(assert (jedynki ?x $?cos))
(assert (ile1 (+ ?z 1))))

(defrule podzial2
?i <- (bin ?x $?reszta)
(test (= ?x 0))
?j <-(zera $?cos)
?k <- (ile2 ?z)
=>
(retract ?i ?j ?k)
(assert (bin $?reszta))
(assert (zera ?x $?cos))
(assert (ile2 (+ ?z 1))))

(defrule laczenie
(dana 0)
?i <-(jedynki $?calosc)
?j <-(zera $?calosc2)
?k <-(nowa)
=>
(retract ?i ?j ?k)
(assert(nowa $?calosc $?calosc2)))

(defrule wyrownanie
(dana 0)
?i <- (nowa ?x $?cos)
?j <-(ile1 ?z)
(ile2 ?c)
(test(< ?z ?c))
=>
(retract ?i ?j)
(assert (nowa ?x $?cos 1))
(assert (ile1 (+ ?z 1))))

(defrule wyrownanie2
(dana 0)
?i <- (nowa ?x $?cos)
(ile1 ?z)
?j <- (ile2 ?c)
(test(> ?z ?c))
=>
(retract ?i ?j)
(assert (nowa ?x $?cos 0))
(assert (ile2 (+ ?c 1))))

(defrule bintodec
(dana 0)
(ile1 ?x)
(ile2 ?x)
?i <- (nowa ?z $?reszta)
?j <- (dec ?l)
=>
(retract ?i ?j)
(assert (nowa $?reszta))
(assert (dec (+ (* ?l 2) ?z))))

(defrule bezwzgledna
?i <- (kopia ?x)
?j <- (dec ?z)
=>
(printout t abs(- ?x ?z) crlf))


