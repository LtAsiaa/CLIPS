(deffacts dane
(lista -22 1 -27 -2 4 7 -93 16 24 -11 13 7 64 33 -7)
(bufor)
)

(defrule notsorted
?i<-(lista ?x ?y $?po)
(test (< ?y ?x)) ; pierwsza napotkana para ustawiona niewl'as'ciwie (maleja'co)
?ii<-(bufor $?r)
=>
(retract ?i ?ii)
(assert (lista $?r ?y ?x $?po)) ; l'aczenie cal'ej zawartos'ci bufora z przestawiona' para' liczb i reszta' listy
(assert (bufor))                ; zerowanie bufora
)

(defrule sorted
?i<-(lista ?x ?y $?po)
(test (<= ?x ?y))   ; pierwsza napotkana para ustawiona wl'asciwie (rosna'co)
?ii<-(bufor $?r)
=>
(retract ?i ?ii)
(assert (lista ?y $?po))  ; skrócenie listy
(assert (bufor $?r ?x))   ; przepisane pierwszego elementu do bufora
)

(defrule koniec
?i<-(lista ?x)        ; dotarlis'my na koniec listy (bo nie ma juz pary tylko jeden element)
?ii<-(bufor $?r)      ; bufor zawiera prawie cal'a liste' (oprócz jednego elementu)
=>
(retract ?i ?ii)      ; skasowanie bufora niepotrzebnego (dzie'ki temu nie uruchomi siê juz zadna regul'a)
(assert (lista $?r ?x)) ; pol'aczenie zawartos'ci bufora i listy w cal'os'c'
)
