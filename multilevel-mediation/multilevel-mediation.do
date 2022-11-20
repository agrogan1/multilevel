* Multilevel Mediation in Stata

* I start with data, and a single level sem example from
* https://stats.oarc.ucla.edu/stata/faq/how-can-i-do-mediation-analysis-with-the-sem-command/

* I build on this using gsem, to estimate a MULTILEVEL model, using ideas from
* https://www.stata.com/manuals/semexample42g.pdf

**********
* setup
**********

clear all // clear workspace

cd "/Users/agrogan/Desktop/GitHub/multilevel/multilevel-mediation"

pwd // check working directory

set seed 1234 // random seed

* get data

* use https://stats.idre.ucla.edu/stat/data/hsbdemo, clear 

use hsbdemo.dta, clear

* look at data

describe

* estimate model

*    ↗️ write ↘️
* math   ➡️  science

* x: math
* mediator: write
* y: science

******************************
OLS (no mediation analysis)
******************************

regress science write math

est store OLS

******************************
* no clustering
******************************

gsem (write <- math) (science <- write math)

est store noclustering

************************************************************
* multilevel mediation model w/ random effects (MLM)
************************************************************

* gsem (y <- m x z) (m <- x)

* gsem (read <- math M1[cid]) (science <- read math M2[cid]) 

gsem (write <- math M1[cid]) (science <- write math M2[cid])

est store MLM // store MLM estimates

* think about setting covariance to 0: cov(M1[cid]*M2[cid]@0)

* total and indirect effects

nlcom _b[science:write]*_b[write:math] // indirect effect

nlcom _b[science:math] + _b[science:write]*_b[write:math] // total = direct + indirect

******************************
* clustered standard errors
******************************

* https://www.stata.com/manuals13/semintro8.pdf#semintro8

gsem (write <- math) (science <- write math), vce(cluster cid)

est store clusteredSEs // store clustered standard error estimates

******************************
* nice table of estimates
******************************

est table OLS noclustering MLM clusteredSEs, star

**********************************************************************
* graphical analysis of why MLM might differ from other approaches
**********************************************************************
* https://agrogan1.github.io/multilevel/multilevel-structure/multilevel-structure.html

twoway (scatter science write) /// scatterplot
(lfit science write), /// linear fit
title("Science Score by Writing Score") ///
subtitle("by Classroom") /// 
scheme(s1color) /// nice graph scheme
name(science_by_writing, replace)

graph export "science_by_writing.png", ///
as(png) ///
name("science_by_writing") width(1000) replace

twoway (scatter science write) /// scatterplot
(lfit science write), /// linear fit
by(cid, /// by classroom
title("Science Score by Writing Score") ///
subtitle("by Classroom")) /// 
scheme(s1color) /// nice graph scheme
name(science_by_writing_by_classroom, replace)

graph export "science_by_writing_by_classroom.png", ///
as(png) ///
name("science_by_writing_by_classroom") width(1000) replace





