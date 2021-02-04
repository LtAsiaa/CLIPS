(deffacts persony
	(osoba Basia rude niebieskie)
	(osoba Jan blond zielone)
	(osoba Ania rude niebieskie)
	(osoba Piotr blond niebieskie)
	(osoba Brajan rude piwne))

(defrule komunikat
		(osoba ?im blond ?)
	=>
		(printout t ?im " jest blondynem" crlf))

(defrule farbowanierudych
	?i<-(osoba ?im rude ?ko)
	=>
		(retract ?i)
		(assert(osoba ?im blond ?