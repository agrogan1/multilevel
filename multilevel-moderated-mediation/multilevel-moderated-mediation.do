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



