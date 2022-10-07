* render document using markstat

clear all

cd "/Users/agrogan/Desktop/GitHub/multilevel/fixed-effects-example" 

doedit "fixed-effects-example.stmd"

markstat using "fixed-effects-example.stmd", mathjax // HTML

graph close _all

* markstat using "fixed-effects-example.stmd", docx // Word

* graph close _all

markstat using "fixed-effects-example.stmd", pdf // PDF

graph close _all

