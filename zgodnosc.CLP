(deffacts zgodnosc 
	(fragment a b c)
	(lista a b c d e f g h)
	(kopia))

(defrule zgodnosc1
	?i <- (fragment ?x $?reszta)
	?k <- (kopia $?kreszta)
	?j <- (lista ?x $?rreszta)
=>
	(retract ?i ?j)
	(retract ?k)
	(assert (kopia $?kreszta ?x))
	(assert (fragment $?reszta))
	(assert (lista $?rreszta)))

(defrule zgodnosc2
	(fragment ?x $?reszta)
	(lista ~?x $?rreszta)
=>
	(printout t " nie ma zgodnosci" crlf))

(defrule zgodnosc3
	(fragment )
	(kopia $?kreszta)
=>
	(printout t "jest zgodna:" $?kreszta crlf)) 