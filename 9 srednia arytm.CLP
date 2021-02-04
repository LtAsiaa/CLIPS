(deffacts cos
(elem 1 2 -3 4 5 -6 7 8 -9 10)
(sum 0 0))


(defrule hej
?i<-(elem ?x $?reszta)
?ii<-(sum ?y ?z)
=>
(retract ?i ?ii)
(assert (elem $?reszta))
(assert (sum (+ ?y ?x) (+ ?z 1))))

(defrule koniec
(elem)
(sum ?x ?y)
=>
(assert (wynik (/ ?x ?y))))
