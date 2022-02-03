clear all

cd "C:\Users\agrogan\Desktop\GitHub\multilevel\spaghetti-plot\Stata" // Windows

cd "/Users/agrogan/Desktop/GitHub/multilevel/spaghetti-plot/Stata" // Mac

doedit "spaghetti-plot-demo.stmd"

markstat using "spaghetti-plot-demo.stmd", mathjax

graph close _all

markstat using "spaghetti-plot-demo.stmd", pdf

graph close _all

