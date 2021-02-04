; sprawdzenie czy lista jest ciagiem arytemtycznym
; (lista -5 -3 -1 1 3)
; (roznica) <- zmienna pomocnicza
; wynik : tak lub nie

(deffacts start
(lista -5 -3 -1 1 3)
(roznica a))

(defrule lenght
?i<-(lista $?r1 ?x $?r)
?ii<-(szukane ?x)
?iii<-(ile ?b)
=>
(retract ?i ?ii ?iii)
(assert (lista $?r1 $?r))
(assert (roznica (- ?b ))))