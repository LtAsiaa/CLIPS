(deffacts dane
(lista -22 1 -27 -2 4 7 -93 16 24 -11 13 7 64 33 -7)
(bufor)
(wynik)
)

(defrule first-lower
?i<-(lista ?x ?y $?po)
(test (<= ?x ?y))      ; pierwsza na lis'cie liczba jest mniejsza
?ii<-(bufor $?r)
=>
(retract ?i ?ii)
(assert (lista ?y $?po)) ; skracamy liste'
(assert (bufor $?r ?x))  ; dopisujemy mniejsza'(pierwsza') do bufora
)

(defrule first-bigger
?i<-(lista ?x ?y $?po)
(test (> ?x ?y))       ; pierwsza na lis'cie liczba jest wie'ksza
?ii<-(bufor $?r)
=>
(retract ?i ?ii)
(assert (lista ?x $?po)) ; skracamy liste'
(assert (bufor $?r ?y))  ; dopisujemy mniejsza'(druga') do bufora
)


(defrule biggest-found
?i<-(lista ?x)   ; mamy teraz juz tylko najwie'ksza' na lis'cie
?ii<-(bufor $?r)
?iii<-(wynik $?w)
=>
(retract ?i ?ii ?iii)
(assert (lista $?r))    ; odtwarzamy liste z bufora bez jednego elementu
(assert (bufor))        ; zerowanie bufora
(assert (wynik ?x $?w)) ; najwieksza dopisujemy na poczatek wyniku
)