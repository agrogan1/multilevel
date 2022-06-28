* comparing methods for clustered data

clear all

cd "/Users/agrogan/Desktop/GitHub/multilevel/multiple-methods-for-clustered-data"

set seed 3846 // random seed

set scheme s1color // graph scheme

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

xtgee y x, i(id) // GEE

est store GEE 

* bayes: mixed y x || id: // Bayesian MLM

* nice table of estimates

est table OLS OLS_clustered MLM RE GEE, ///
b(%9.3f) star stats(N r2 r2_a) ///
equations(1) ///
title("Simulated Data: 1 to 3 obs per cluster; regression slope of 3.0")

* write out pdf

putpdf begin, landscape // open PDF

putpdf paragraph // new paragraph

putpdf text ("Simulated Data: 1 to 3 obs per cluster; regression slope of 3.0.")

putpdf paragraph // new paragraph

putpdf text ("Results from summary table below suggest each model does well in estimating regression slope.  ")

putpdf text ("These results suggest good estimation of within cluster variances.")

putpdf paragraph // new paragraph

putpdf text ("Results from individual commands suggest each model does well in estimating between cluster variances.")

putpdf paragraph // new paragraph

putpdf text ("Bayesian results, which cannot be included in this PDF, are similarly effective in recovering model parameters.")

putpdf table tbl1 = etable // add results from table of estimates

putpdf save multiple-methods-for-clustered-data.pdf, replace // close PDF


