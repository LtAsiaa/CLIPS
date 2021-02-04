(deffacts dane
(lista 1 2 3 4 5 6 7)
(roznica)
)

(defrule pierwsza-roznica
(lista ?x ?y $?reszta)
?i<-(roznica)
=>
(retract ?i)
(assert (roznica (- ?y ?x)))
)

(defrule roznica-zgodna
?i<-(lista ?x ?y $?reszta)
(roznica =(- ?y ?x))         ; najpierw ewaluacja, potem dopasowanie
=>
(retract ?i)
(assert (lista ?y $?reszta))
)

(defrule roznica-niezgodna
(lista ?x ?y $?reszta)
(roznica ~=(- ?y ?x))
=>
(printout t "To nie jest ciag arytmetyczny!!!" crlf)
)

(defrule koniec
(lista ?)
(roznica ?)
=>
(printout t "Sukces! Ciag arytmetyczny!!!" crlf)
)