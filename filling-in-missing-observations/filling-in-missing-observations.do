* filling in missing observations

use sample-data, clear // use the sample data

list // list out the observations; x is only present at t=1

* the below only works because the data are sorted by id and time!
* sort id t

bysort id: generate x_new = x[1] // make new x that is the first value of x for each id

list // list out the observations; x_new is present for all time points!



