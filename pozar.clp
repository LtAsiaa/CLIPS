(deffacts dane
(temp wysoka)
(ogien obecny)
)

(defrule alarm "Ratunku!!!"
(temp wysoka)
(ogien obecny)
=>
(assert (alarm wlaczony)))

(defrule straz "Pali sie!!!"
(alarm wlaczony)
=>
(assert (wezwanie straz)))

(defrule pogotowie
(alarm wlaczony)
=>
(assert (wezwanie pogotowie)))

(defrule media
(wezwanie straz)
=>
(assert (media TV)))

