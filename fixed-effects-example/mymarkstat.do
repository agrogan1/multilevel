* render document using markstat

clear all

cd "C:\Users\agrogan\Box Sync\Box Sync\GitHub\multilevel\fixed-effects-example" // Windows

cd "/Users/agrogan/Box Sync/GitHub/multilevel/fixed-effects-example" // Mac

doedit "fixed-effects-example.stmd"

markstat using "fixed-effects-example.stmd", mathjax // HTML

graph close _all

* markstat using "fixed-effects-example.stmd", docx // Word

* graph close _all

markstat using "fixed-effects-example.stmd", pdf // PDF

graph close _all

