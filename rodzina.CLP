(deffacts kobiety
	(kobieta Maria)
	(kobieta Ewa)
	(kobieta Joanna)
	(kobieta Agata)
	(kobieta Anna)
	(kobieta Agnieszka)
	(kobieta Beata)
	(kobieta Iwona))
(deffacts mezczyzni
	(mezczyzna Piotr)
	(mezczyzna Adam)
	(mezczyzna Marek)
	(mezczyzna Robert)
	(mezczyzna Jan)
	(mezczyzna Krzysztof)
	(mezczyzna Radek)
	(mezczyzna Darek)
	(mezczyzna Tomek)
	(mezczyzna Jacek))
(deffacts rodzice
	(rodzic Maria Marek)
	(rodzic Piotr Marek)
	(rodzic Ewa Joanna)
	(rodzic Adam Joanna)
	(rodzic Robert Radek)
	(rodzic Robert Beata)
	(rodzic Agata Radek)
	(rodzic Agata Beata)
	(rodzic Jan Darek)
	(rodzic Jan Tomek)
	(rodzic Anna Darek)
	(rodzic Anna Tomek)
	(rodzic Krzysztof Jacek)
	(rodzic Krzysztof Iwona)
	(rodzic Agnieszka Jacek)
	(rodzic Agnieszka Iwona)
	(rodzic Maria Agata)
	(rodzic Piotr Agata)
	(rodzic	Maria Jan)
	(rodzic Piotr Jan)
	(rodzic Ewa Anna)
	(rodzic Ewa Krzysztof)
	(rodzic Adam Anna)
	(rodzic Adam Krzysztof))

(deffacts malzenstwo
	(malzenstwo Robert Agata)
	(malzenstwo Maria Piotr)	
	(malzenstwo Jan Anna)
	(malzenstwo Ewa Adam)
	(malzenstwo Krzysztof Agnieszka))

(defrule matka
		(kobieta ?x)
		(rodzic ?x ?y)
	=>
		(assert (matka ?x ?y)))

(defrule ojciec
		(mezczyzna ?x)
		(rodzic ?x ?y)
	=>
		(assert (ojciec ?x ?y)))

(defrule siostra
		(kobieta ?x)
		(kobieta ?y)
		(rodzic ?z ?x)
		(rodzic ?z ?y&~?x)
	=>
		(assert (siostra ?x ?y))
		(printout t ?x " i " ?y " sa siostrami" crlf))
(defrule brat
		(mezczyzna ?x)
		(mezczyzna ?y)
		(rodzic ?z ?x)
		(rodzic ?z ?y&~?x)
	=>
		(assert (brat ?x ?y))
		(printout t ?x " i " ?y " sa bracmi" crlf))
(defrule babcia
		(matka ?x ?z)
		(rodzic ?z ?y)
	=>
		(assert (babcia ?x ?y)))

(defrule dziadek
		(ojciec ?x ?z)
		(rodzic ?z ?y)
	=>
		(assert (dziadek ?x ?y)))

(defrule wuj
		(brat ?x ?z)
		(matka ?z ?y)
	=>
		(assert (wuj ?x ?y)))

(defrule stryj
		(brat ?x ?z)
		(ojciec ?z ?y)
	=>
		(assert (stryj ?x ?y)))
(defrule zona
		(malzenstwo ?x ?y)
		(kobieta ?x)
	=>
		(assert (zona ?x ?y)))
(defrule zona1
		(malzenstwo ?y ?x)
		(kobieta ?x)
	=>
		(assert (zona ?x ?y)))
(defrule maz
		(malzenstwo ?x ?y)
		(mezczyzna ?x)
	=>
		(assert (maz ?x ?y)))
(defrule maz1
		(malzenstwo ?y ?x)
		(mezczyzna ?x)
	=>
		(assert (maz ?x ?y)))


(defrule tesciowa
		(malzenstwo ?y ?z)
		(kobieta ?z)
		(matka ?x ?z)
	=>
		(assert (tesciowa ?x ?y)))

(defrule tesciowa1
		(malzenstwo ?y ?z)
		(mezczyzna ?z)
		(matka ?x ?z)
	=>
		(assert (tesciowa ?x ?y)))