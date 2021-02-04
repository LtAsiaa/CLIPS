(deffacts dane
(osoba Marcin blond niebieskie)
(osoba Ania rude niebieskie)
(osoba Jacek blond piwne)
(osoba Dorota czarne piwne)
(osoba Asia blond niebieskie)
)

; koniunkcja wartoœci pola
; -------------------------

; koniunkcja dla sta³ych

(defrule blond-rude
(osoba ?im blond&rude ?) ; UWAGA!!! B£¥D!!!
=>
(assert (pasemka ?im)))

; koniunkcja ze zmienn¹

(defrule para-blond
(osoba ?im1 blond ?ko)
(osoba ?im2 blond ?ko&~piwne)  ; blond w³osy ale kolor oczu ten i nie piwne!!!
=>
(assert (parka-blond ?im1 ?im2)))
/////////////////////////////////
(deffacts dane
(osoba Marcin blond niebieskie)
(osoba Ania rude niebieskie)
(osoba Jacek blond piwne)
(osoba Dorota czarne piwne)
(osoba Asia blond niebieskie)
)

; kilka ograniczników
; -------------------

(defrule para-blond
(osoba ?im1 blond ?ko)
(osoba ?im2&~?im1 blond ?ko)  ; osoba ?im2 NA PEWNO inna niz ?im1
=>
(assert (parka-blond ?im1 ?im2)))

/////////////////////////////////
(deffacts dane
(osoba Marcin blond niebieskie)
(osoba Ania rude niebieskie)
(osoba Jacek blond piwne)
(osoba Dorota czarne piwne)
(osoba Asia blond niebieskie)
)

; negacja wartoœci pola
; ---------------------

; negacja sta³ej
(defrule para-blond1
(osoba ?im1 blond ?)
(osoba ?im2 ~blond ?)  ; kolor w³osów inny ni¿ blond!
=>
(assert (parka-blond1 ?im1 ?im2)))

; negacja zmiennej
(defrule para-blond2
(osoba ?im1 blond ?ko)
(osoba ?im2 blond ~?ko)  ; blond w³osy ale kolor oczu ró¿ny!!!
=>
(assert (parka-blond2 ?im1 ?im2)))
//////////////////////////////////
(deffacts dane
(osoba Marcin blond niebieskie)
(osoba Ania rude niebieskie)
(osoba Jacek blond piwne)
(osoba Dorota czarne piwne)
(osoba Asia blond niebieskie)
)

; alternatywa wartoœci pola
; -------------------------

; alternatywa dla sta³ych

(defrule blond-lub-rude
(osoba ?im blond|rude ?)  ; kolor w³osów blond lub rude
=>
(assert (jasne-wlosy ?im)))

; alternatywa ze zmienn¹

(defrule para-blond
(osoba ?im1 blond ?ko)
(osoba ?im2 blond ?ko|piwne)  ; blond w³osy ale kolor oczu ten sam lub ktoœma piwne!!!
=>
(assert (parka-blond ?im1 ?im2)))
////////////////////////////////
