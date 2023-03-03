* Visualizing MLM's

* setup

clear all

cd "/Users/agrogan/Desktop/GitHub/multilevel/visualizing-MLM" // bilingual

doedit visualizing-MLM.stmd

* render

markstat using visualizing-MLM.stmd // HTML

graph close _all

markstat using visualizing-MLM.stmd, pdf // PDF

graph close _all

* slidy

! /Applications/quarto/bin/tools/pandoc -s --mathjax -i -t slidy --css "UMslidy.css" --slide-level=2 "/Users/agrogan/Desktop/GitHub/multilevel/visualizing-MLM/visualizing-MLM.html" -o "/Users/agrogan/Desktop/GitHub/multilevel/visualizing-MLM/visualizing-MLM-slidy.html" 

* revealjs

* ! /Applications/quarto/bin/tools/pandoc -s --mathjax -i -t revealjs --css "UMrevealjs.css" --slide-level=3 -V theme=serif "/Users/agrogan/Desktop/GitHub/multilevel/visualizing-MLM/visualizing-MLM.md" -o "/Users/agrogan/Desktop/GitHub/multilevel/visualizing-MLM/visualizing-MLM-revealjs.html" 






