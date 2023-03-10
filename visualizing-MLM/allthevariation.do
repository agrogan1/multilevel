set scheme michigan

twoway (scatter outcome warmth) (lfit outcome warmth), ///
title("Outcome by Warmth") ///
name(mynewscatter, replace)

twoway histogram warmth, ///
title("") xtitle("") /// no titles
discrete /// this variable is discrete
percent /// show percentages
yscale(reverse) /// reverse the y scale
ysize(1) /// ysize is 1 inch
name(myxhistogram, replace)

twoway histogram outcome, ///
horizontal /// horizontal bars ///
xscale(reverse) /// reverse the xscale ///
xsize(1) /// x size is 1 inch 
name(myyhistogram, replace)


twoway (scatter outcome warmth) ///
(lfit outcome warmth) ///
(histogram warmth, percent, ///
title("Outcome by Warmth") ///
name(mynewscatter, replace)
