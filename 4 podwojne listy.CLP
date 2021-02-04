(deffacts listy
(lista a a b a a b c a a b a a b c)
(pomoc1)
(pomoc2)
)

(defrule wpisz
?i<-(pomoc1 $?pom)
?ii<-(pomoc2 $?pom1)
?iii<-(lista ?im1 $?reszta ?im2)
=>
(assert (pomoc1 $?pom ?im1))
(assert (pomoc2 ?im2 $?pom1))
(assert (lista $?reszta))
(retract ?i ?ii ?iii)
)

(defrule podwojna
(lista)
(pomoc1 $?pomoc1)
(pomoc2 $?pomoc1)
=>
(printout t "Lista jest podwojna" crlf)
)

(defrule niepodwojna
(lista)
(pomoc1 $?im2)
(pomoc2 ~$?im2)
=>
(printout t "To nie jest podwojna" crlf)
)

(defrule niepodwojna1
(lista ?im1)
=>
(printout t "To nie jest podwojna" crlf)
)