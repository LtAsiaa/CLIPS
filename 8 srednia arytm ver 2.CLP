(deffacts cos
(elem 1 2 -3 4 5 -6 7 8 -9 10)
(sum 0)
(licz 0))

(defrule hej
?i<-(elem ?x $?reszta)
?ii<-(sum ?y)
?iii<-(licz ?z)
=>
(retract ?i ?ii ?iii)
(assert (elem $?reszta))
(assert (sum (+ ?y ?x))) 
(assert (licz (+ ?z 1))))

(defrule koniec
(elem)
(sum ?x)
(licz ?y)
=>
(assert (wynik (/ ?x ?y))))
