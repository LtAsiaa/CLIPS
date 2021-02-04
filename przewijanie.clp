(deffacts dane
(lista a b c d e f g h i j k l m n o p q r s t u v w x y z)
)

(defrule przewijaj
?i<-(lista ?x $?reszta)
=>
(retract ?i)
(assert (lista $?reszta ?x))
)