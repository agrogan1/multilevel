* render document using markstat

clear all

cd "/Users/agrogan/Desktop/GitHub/multilevel/reshaping-data" // bilingual

doedit "reshaping-data.stmd"

markstat using "reshaping-data.stmd", mathjax // HTML

graph close _all

markstat using "reshaping-data.stmd", docx // Word

graph close _all

* markstat using "reshaping-data.stmd", pdf // PDF

* graph close _all

