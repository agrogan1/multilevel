/*
* 
use alcohol1_pp, clear
use http://www.ats.ucla.edu/stat/stata/examples/alda/data/alcohol1_pp
spagplot alcuse age_14 , id( id )
spagplot alcuse age_14 in 1/30, id( id )
spagplot alcuse age_14 if id <= 9, id( id )
spagplot alcuse age_14 , id( id ) ytitle("Predicted Alcohol Use")
spagplot alcuse age_14 , id( id ) ytitle("Predicted Alcohol Use") scheme(sj)
spagplot alcuse age_14 , id( id ) ytitle("Predicted Alcohol Use") scheme(sj) note("My custom note")
spagplot alcuse age_14 , id( id ) ytitle("Predicted Alcohol Use") scheme(sj) note("")
*/

capture program drop spagplot
program define spagplot
  version 8
  syntax varlist(min=2 max=2) [if] [in] , id(varlist) [nofit] [noover] *
  marksample touse

  tokenize `varlist'
  if "`fit'" == "" {
    preserve
    tokenize `varlist'
    quietly xi: regress `1' i.`id'*`2' if `touse'
    tempvar yhat
    quietly predict `yhat' if e(sample)
    if "`over'" != "" {
      graph twoway scatter `yhat' `2' if `touse', connect(L) msymbol(i) sort(`id' `2') note("Spaghetti plot of `varlist' id `id'") `options'
    }
    else {
      graph twoway (scatter `yhat' `2' if `touse', connect(L) msymbol(i) sort(`id' `2') ) (lfit `1' `2', clwidth(vthick)), note("Spaghetti plot of `varlist' id `id'") legend(off) `options'
    }
  }
  else {
    graph twoway scatter `1' `2' if `touse', connect(L) msymbol(i) sort(`id' `2') note("Spaghetti plot of `varlist' id `id'") `options'
  }
end
