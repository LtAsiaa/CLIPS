(deffacts w_poza
(lista -11 -16 9 -4 8 13)
(zakres -10 8)
(ilew 0)(ilepo 0)
)
(defrule www
?i<-(lista ?x $?reszta)
(zakres ?kon ?poc)
?ii<-(ilew ?wyn)
(test (<= ?kon ?x))
(test (>= ?poc ?x))
=>
(retract ?i ?ii)
(assert (lista $?reszta))
(assert (ilew (+ ?wyn 1)))
)
(defrule poza
?i<-(lista ?x $?reszta)
(zakres ?kon ?poc)
?ii<-(ilepo ?wyn)
(test (> ?kon ?x))
=>
(retract ?i ?ii)
(assert (lista $?reszta))
(assert (ilepo (+ ?wyn 1)))
)
(defrule poza1
?i<-(lista ?x $?reszta)
(zakres ?kn ?poc)
?ii<-(ilepo ?wyn)
(test (< ?poc ?x))
=>
(retract ?i ?ii)
(assert (lista $?reszta))
(assert (ilepo (+ ?wyn 1))))



(deffacts dane
(lista -11 6 -9 3 8 24 -5)
(zakres -6 7 )
(ilew 0 )
(ilepo 0 ))

(defrule poza1 
?i<-(lista ?x $?reszta)
?ii<-(ilepo ?n)
(zakres ?a ?b)
(test(> ?a ?x))
=>
(retract ?i ?ii)
(assert(lista $?reszta))
(assert(ilepo (+ ?n 1))))

(defrule poza2
?i<-(lista ?x $?reszta)
?ii<-(ilepo ?n)
(zakres ?a ?b)
(test(< ?b ?x))
=>
(retract ?i ?ii)
(assert(lista $?reszta))
(assert(ilepo (+ ?n 1))))

(defrule ilew
?i<-(lista ?x $?reszta)
?ii<-(ilew ?n)
(zakres ?a ?b )
(test(<= ?a ?x))
(test(>= ?b ?x))
=>
(retract ?i ?ii)
(assert(lista $?reszta))
(assert (ilew (+ ?n 1))))