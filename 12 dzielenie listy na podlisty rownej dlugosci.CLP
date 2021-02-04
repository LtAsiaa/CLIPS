(deffacts dane
(lista a b c b a)
(licz 3 3)
(wynik)
(wynik1)
)

(defrule wej
?i<-(licz ?x&~0 ?y)
?ii<-(wynik $?reszta)  ;odkl a b c
?iii<-(lista ?z $?koniec)
=>
(assert (licz (- ?x 1) ?y))
(assert (wynik $?reszta ?z))
(assert (lista $?koniec))
(retract ?i ?ii ?iii))

(defrule wyj
?i<-(licz ?x ?y&~0)
?ii<-(wynik1 $?reszta)
?iii<-(lista $?koniec ?z)
=>
(assert (licz ?x (- ?y 1)))
(assert (wynik1 $?reszta ?z))
(assert (lista $?koniec))
(retract ?i ?ii ?iii))