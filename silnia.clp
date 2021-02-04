(deffacts dane
(silnia 0 1)
(silnia 7)   ; wartosc argumentu, dla ktorego chcemy obliczyc silnie
)

(defrule licz-w-przod
(silnia ?koniec)
?i<-(silnia ?x&~?koniec ?y)
=>
(retract ?i)
(assert (silnia (+ ?x 1) (* ?y (+ ?x 1))))
)

(defrule wynik
(silnia ?x)
(silnia ?x ?y)
=>
(printout t "Silnia dla " ?x " wynosi " ?y crlf)
)