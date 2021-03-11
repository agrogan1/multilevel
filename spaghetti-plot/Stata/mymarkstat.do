clear all

cd "C:\Users\agrogan\Box Sync\Box Sync\GitHub\multilevel\spaghetti-plot\Stata"

doedit "spaghetti-plot-demo.stmd"

markstat using "spaghetti-plot-demo.stmd"

graph close _all
