* 'Simple' Spaghetti Plots in Stata

* Based upon combining syntax by Weiwen Ng at https://www.statalist.org/forums/forum/general-stata-discussion/general/1466533-graphing-individual-trajectories-over-time
* with ideas from the Stata `mixed` Reference Manual

* The general idea is to:
* run a mixed model
* generate predicted values that include the random effects
* use some sophisticated graphing syntax to graph fitted values and overall regression line
* use the c(L) option to connect ascending values

* with older versions of Stata we may want to `set scheme s1color`; with newer versions of Stata, we can use the new default scheme

* Example

use "https://github.com/agrogan1/multilevel/raw/master/mlm-R2-gutten/gutten.dta", clear // get data

mixed height age_base || tree_ID: // mixed model

predict yhat, fitted // predicted (fitted) values that use random effects

twoway /// twoway graph
(line yhat age_base, connect(L) lwidth(vthin)) /// fit lines for each group
(lfit yhat age_base, lwidth(thick)) // overall fit line






