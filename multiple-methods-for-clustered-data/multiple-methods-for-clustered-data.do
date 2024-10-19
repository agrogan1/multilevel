* comparing methods for clustered data

clear all

cd "/Users/agrogan/Desktop/GitHub/multilevel/multiple-methods-for-clustered-data"

set seed 3846 // random seed

* simulate data

set obs 500 // 50 clusters

generate id = _n // cluster id

generate u0 = rnormal(0, 10) // random intercept (L2 error)

generate n = runiformint(1, 3) // 1 to 3 observations per cluster

generate x = rnormal(100, 10) // independent variable

expand n // n observations per cluster

replace x = x + rnormal(0, 10) // add some random noise to each x

generate e = rnormal(0, 1) // individual error

generate y = 3 * x + u0 + e

save simulated-clustered-data.dta, replace

* explore graphically

spagplot y x, id(id) // spaghetti plot

graph export "spaghetti-plot.png", as(png) name("Graph") replace // export to png

* regression models

regress y x // OLS

est store OLS

regress y x, cluster(id) // OLS w clustered standard errors

est store OLS_clustered

mixed y x || id: // multilevel model

est store MLM 

xtreg y x, i(id) // random effects

est store RE 

xtreg y x, i(id) fe // fixed effects

est store FE

xtgee y x, i(id) // GEE

est store GEE 

* bayes: mixed y x || id: // Bayesian MLM

* nice table of estimates exported as PDF

etable, estimates(OLS OLS_clustered MLM RE FE GEE) ///
cstat(_r_b) /// beta's only
showstars showstarsnote /// show stars and note
column(estimate) /// column is modelname
export("multiple-methods-for-clustered-data.pdf", replace)






