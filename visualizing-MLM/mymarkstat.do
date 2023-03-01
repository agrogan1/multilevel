* Visualizing MLM's

clear all

cd "/Users/agrogan/Desktop/GitHub/multilevel/visualizing-MLM" // bilingual

doedit visualizing-MLM.stmd

markstat using visualizing-MLM.stmd // HTML

graph close _all

markstat using visualizing-MLM.stmd, pdf // PDF

graph close _all






