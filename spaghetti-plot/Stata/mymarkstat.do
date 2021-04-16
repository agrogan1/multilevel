clear all

cd "C:\Users\agrogan\Box Sync\Box Sync\GitHub\multilevel\spaghetti-plot\Stata"

doedit "spaghetti-plot-demo.stmd"

markstat using "spaghetti-plot-demo.stmd", mathjax

graph close _all

markstat using "spaghetti-plot-demo.stmd", pdf

graph close _all

