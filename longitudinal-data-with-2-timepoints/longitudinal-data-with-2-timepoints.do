* Longitudinal Data With 2 Timepoints

use "https://github.com/agrogan1/multilevel-thinking/raw/main/simulate-and-analyze-multilevel-data/simulated_multilevel_longitudinal_data.dta", clear // get the data

describe // describe the data

keep if t <= 2 // Hey! I only want 2 timepoints

tabulate t // make sure we only have 2 timepoints

mixed outcome t || id: // random intercept only; this works

mixed outcome t || id: t // random intercept + random slope for time; this works too



