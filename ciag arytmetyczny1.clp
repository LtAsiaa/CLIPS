(deffacts dane
(lista 1 2 3 4 5 6 7)
)

(defrule niezgodne
(lista $?przed ?x ?y ?z&~=(+ ?y (- ?y ?x)) $?po)
=>
(printout t "To nie jest ciag arytmetyczny!!!" crlf)
)
(defrule zgodne
(not (lista $?przed ?x ?y ?z&~=(+ ?y (- ?y ?x)) $?po))
=>
(printout t "Sukces! Ciag arytmetyczny!!!" crlf)
)