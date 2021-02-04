(deffacts dane
(lista 3 12 34)
(bin)
(ileliczb 0)
(ilebitow 0)
(potega 0)
(wynik 0)


(defrule bit
?i <- (lista $?m ?n)
(test(!= 0 ?n))
?ii<-(bin $?r)
?iii<-(ilebitow ?b)
=>
(retract ?i ?ii ?iii)
(assert(lista $?m (div ?n 2)))
(assert (bin (mod ?n 2) $?R))
(assert (ilebitow (+ ?B 1))))

(derule bitkoniec
?i<-(lista $?m ?n)
(test (= 0 ?n))
?ii<- (ileliczb ?k)
=>
(retract ?i ?ii)
(assert (lista $?m))
(assert(ileliczb (+ ?k 1))))

(defrule srednia 
(lista)
(ileliczb ?l)
(ilebitow ?b)
=>
(assert (srednia(div ?b ?l))))


(defrule rekonwersja
(srednia ?s)
?i<-(potega ?p)
(test (< ?p ?s))
?ii<-(bin $?r ?b)
?iii<-(wynik $?y ?w)
=>
(retract ?i ?ii ?iii)
(assert (potega (+ ?p 1)))
(assert (bin $?r))
(bind ?h (* ?b (** 2 ?p)))
;(printout t ?h crlf)
(assert (wynik (+ ?w ?h))))

(defrule rekonwersja-dwa
(srednia ?s)
?i<-(potega ?p)
(test (= ?p ?s))
?ii<-(bin $?r ?b)
?iii<-(wynik ?w)
=>
(retract ?i ?ii ?iii)
(assert (potega (+ ?p 1)))
(assert (bin $?r))
(bind ?h (* ?b (** 2 ?p)))
(printout t ?h crlf)
(assert (wynik (+ ?w ?h))))
