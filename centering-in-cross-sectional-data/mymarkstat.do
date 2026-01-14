* render document using markstat

clear all

* cd "C:\Users\agrogan\Box Sync\Box Sync\GitHub\multilevel\centering-in-cross-sectional-data" // Windows

cd "/Users/agrogan/Desktop/GitHub/multilevel/centering-in-cross-sectional-data" // Mac

doedit "centering-in-cross-sectional-data.stmd"

markstat using "centering-in-cross-sectional-data.stmd", mathjax // HTML

graph close _all

markstat using "centering-in-cross-sectional-data.stmd", docx // Word

graph close _all

* markstat using "centering-in-cross-sectional-data.stmd", pdf // PDF

* graph close _all

