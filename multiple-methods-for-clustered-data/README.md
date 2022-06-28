# Multiple Methods for Analyzing Clustered Data

An evolving folder examining multiple methods for analyzing clustered data.

1. `regress y x` // OLS
2. `regress y x, cluster(id)` // OLS w clustered standard errors
3. `mixed y x || id:` // multilevel model
4. `xtreg y x, i(id)` // random effects
5. `xtgee y x, i(id)` // GEE

The `do` file is the script. The do file generates simulated data with a $\beta$ for $x$ of 3.0. The variance of $u_0$ is 100.

The `dta` file is a data file of the simulated data.

The `pdf` is a summary table of results. `Bayes.txt` is a separate text file of Bayesian results.

The `png` is a spaghetti plot of the data. 

Under development. Comments, questions, and corrections are most welcome.
