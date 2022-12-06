* Multilevel Moderated Mediation in Stata

* I draw heavily on an example from 
* https://stats.oarc.ucla.edu/stata/faq/how-can-i-do-moderated-mediation-in-stata/


* I build on this using gsem, to estimate a MULTILEVEL model, using ideas from
* https://www.stata.com/manuals/semexample42g.pdf

**********
* setup
**********

clear all // clear workspace

cd "/Users/agrogan/Desktop/GitHub/multilevel/multilevel-moderated-mediation"

pwd // check working directory

set seed 1234 // random seed

* get data

* use https://stats.idre.ucla.edu/stat/data/hsbdemo, clear 

use hsbdemo.dta, clear

* look at data

describe

* model

* I consider what seems to me to be the most general model,
* where one variable moderates the x -> m relationship
* while another variable moderates the m -> y relationship

*   female   schltype
*    ⬇️       ⬇️
*    ↗️ write ↘️
* math   ➡️  science

* x: math
* mediator: write
* y: science
* moderators: 
*  female moderates math -> write relationship
*  schltype moderates write -> science relationship

****************************************
* manually generate interaction terms
****************************************

generate femaleXmath = female * math

generate schtypXwrite = schtyp * write

********************
* estimate model
********************

gsem ///
(write <- math female femaleXmath M1[cid]) ///
(science <- write schtyp schtypXwrite math female M2[cid]), ///
difficult // option for difficult ML

* there is not evidence for mediation in either case

****************************************
* bootstrap confidence intervals
****************************************

* here, I adapt code from, and draw very heavily on:
* https://stats.oarc.ucla.edu/stata/faq/how-can-i-do-moderated-mediation-in-stata/

* data prep

summarize female // moderator 1

global m1=r(mean) // mean

global s1=r(sd) // standard deviation

summarize schtyp // moderator 2

global m2=r(mean) // mean

global s2=r(sd) // standard deviation

* run the model again

gsem ///
(write <- math female femaleXmath M1[cid]) ///
(science <- write schtyp schtypXwrite math female M2[cid]), ///
difficult // option for difficult ML

* bootstrap the CI's 

capture program drop bootm4
program bootm4, rclass
gsem (write <- math female femaleXmath M1[cid]) (science <- write schtyp schtypXwrite math female M2[cid]), difficult  
  return scalar ciell = (_b[write:math]+($m1-$s1)*_b[write:femaleXmath])*(_b[science:write]+($m2-$s2)*_b[science:schtypXwrite]) // low low
  return scalar cieml = (_b[write:math]+($m1)*_b[write:femaleXmath])*(_b[science:write]+($m2-$s2)*_b[science:schtypXwrite]) // mean low
  return scalar ciehl = (_b[write:math]+($m1+$s1)*_b[write:femaleXmath])*(_b[science:write]+($m2-$s2)*_b[science:schtypXwrite]) // high low
  return scalar cielm = (_b[write:math]+($m1-$s1)*_b[write:femaleXmath])*(_b[science:write]+($m2)*_b[science:schtypXwrite]) // low mean
  return scalar ciemm = (_b[write:math]+($m1)*_b[write:femaleXmath])*(_b[science:write]+($m2)*_b[science:schtypXwrite]) // mean mean
  return scalar ciehm = (_b[write:math]+($m1+$s1)*_b[write:femaleXmath])*(_b[science:write]+($m2)*_b[science:schtypXwrite]) // high mean
  return scalar cielh = (_b[write:math]+($m1-$s1)*_b[write:femaleXmath])*(_b[science:write]+($m2+$s2)*_b[science:schtypXwrite]) // low high
  return scalar ciemh = (_b[write:math]+($m1)*_b[write:femaleXmath])*(_b[science:write]+($m2+$s2)*_b[science:schtypXwrite]) // mean high
  return scalar ciehh = (_b[write:math]+($m1+$s1)*_b[write:femaleXmath])*(_b[science:write]+($m2+$s2)*_b[science:schtypXwrite]) // high high
end

bootstrap r(ciell) r(cieml) r(ciehl) /// 
r(cielm) r(ciemm) r(ciehm) /// 
r(cielh) r(ciemh) r(ciehh), ///
reps(100) /// number of replications
dots: /// show dots
bootm4  




