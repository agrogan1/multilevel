* Multilevel Mediation in Stata

* I start with data, and a single level sem example from
* https://stats.oarc.ucla.edu/stata/faq/how-can-i-do-mediation-analysis-with-the-sem-command/

* I build on this using gsem, to estimate a MULTILEVEL model, using ideas from
* https://www.stata.com/manuals/semexample42g.pdf

* setup

clear all // clear workspace

cd "/Users/agrogan/Desktop/GitHub/multilevel/multilevel-mediation"

pwd // check working directory

set seed 1234

* get data

use https://stats.idre.ucla.edu/stat/data/hsbdemo, clear 

* look at data

describe

* estimate model

*    ↗️ write ↘️
* math  ➡️  science

* x: math
* mediator: write
* y: science

* multilevel mediation model w/ random effects

* gsem (read <- math M1[cid]) (science <- read math M2[cid]) 

gsem (write <- math M1[cid]) (science <- write math M2[cid])

* think about setting covariance to 0: cov(M1[cid]*M2[cid]@0)

* total and indirect effects

nlcom _b[science:write]*_b[read:math] // indirect effect

nlcom _b[science:math] + _b[science:write]*_b[read:math] // total = direct + indirect
