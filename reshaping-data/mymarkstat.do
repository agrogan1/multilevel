* render document using markstat

clear all

cd "C:\Users\agrogan\Box Sync\Box Sync\GitHub\multilevel\reshaping-data" // Windows

doedit "reshaping-data.stmd"

markstat using "reshaping-data.stmd", mathjax // HTML

graph close _all

markstat using "reshaping-data.stmd", docx // Word

graph close _all

* markstat using "reshaping-data.stmd", pdf // PDF

* graph close _all

