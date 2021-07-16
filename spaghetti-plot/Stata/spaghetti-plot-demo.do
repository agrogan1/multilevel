capture log close
log using "spaghetti-plot-demo", smcl replace
//_1
display c(current_date)
//_2
use https://stats.idre.ucla.edu/stat/examples/imm/imm23, clear
//_3
label variable ses "Socioeconomic Status" // correct spelling of variable label
//_4
spagplot math ses, id(schid) 
//_5
graph export graph1.png, width(500) replace
//_6
spagplot math ses, id(schid) ///
scheme(michigan) ///
title("Spaghetti Plot of Math Score By SES") ///
note(" ") // blank "note" since title explains this graph
//_7
graph export graph2.png, width(500) replace
//_8
twoway lfit math ses, scheme(michigan) title("Math Score By SES")
//_9
graph export graph3.png, width(500) replace
//_10
twoway lfit math ses, scheme(michigan) by(schid, title("Math Score By SES")) 
//_11
graph export graph4.png, width(1000) replace
//_12
twoway (lfit math ses) ///
(scatter math ses, mcolor(gs7%30)), /// color gs7 @ 30% transparency
scheme(michigan) by(schid, title("Math Score By SES"))
//_13
graph export graph5.png, width(1000) replace
//_14
mixed math ses meanses || schid: // multilevel model; random intercept; no random effects
//_15
predict yhat
//_16
spagplot yhat ses, id(schid) scheme(michigan)
//_17
graph export graph6A.png, width(500) replace
//_18
mixed math ses meanses || schid: // multilevel model; random intercept; no random effects
//_19
predict u0, reffects
//_20
summarize meanses
//_21
display %9.5f r(mean)
//_22
generate yhat2 = _b[_cons] + u0 + _b[ses] * ses + _b[ses] * -.0012717 
//_23
twoway scatter yhat2 ses, scheme(michigan)
//_24
graph export graph6B.png, width(500) replace
//_25
sort schid ses // sort on Level 2 units and x values
//_26
twoway connect yhat2 ses, ///
lcolor("0 39 76") /// Michigan blue for connecting lines
title("Model Based Spaghetti Plot") /// title
xtitle("Socioeconomic Status") /// title for x axis
ytitle("Model Predicted Values") /// title for y axis
c(L) /// connect only ascending values
msymbol(none) /// no marker symbol; only lines
scheme(michigan) // michigan scheme
//_27
graph export graph7.png, width(500) replace
//_^
log close
