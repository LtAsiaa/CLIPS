(deffacts listy
(lista k a j a k)
)

(defrule palindrom1
(lista ?im1)
=>
(printout t "to jest palindrom" crlf)
)

(defrule palindrom2
(lista ?im1 $?wielowartosciowa ?im2&~?im1)
=>
(printout t "To nie jest palindrom" crlf)
)

(defrule palindrom3
(lista)
=>
(printout t "To jest palindrom" crlf)
)

(defrule palindrom4
?i<-(lista ?im1 $?reszta ?im1)
=>
(assert (lista $?reszta))
(retract ?i)
)

