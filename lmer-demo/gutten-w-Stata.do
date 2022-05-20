* Gutten data with Stata

use gutten.dta

mixed height age_base || tree_ID: age_base, cov(uns) reml





