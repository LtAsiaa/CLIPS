(deffacts fakty
(lista a b c d e f g h i j)
(ile 2 5 3)
(bufor)
)


(defrule in
?i<-(ile ?licznik&~0 $?costam)
?ii<-(lista ?x $?reszta)
?iii<-(bufor $?cos)
=>
(retract ?i ?ii ?iii)
(assert (ile (- ?licznik 1) $?costam))
(assert (lista $?reszta))
(assert (bufor $?cos ?x))
)

(defrule out
?i<-(ile ?licznik&0 $?costam)
?ii<-(bufor $?zawartosc)
=>
(retract ?i ?ii)
(assert (bufor))
(assert (podlista $?zawartosc))
(assert (ile $?costam))
)
