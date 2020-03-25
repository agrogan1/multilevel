* render file with markstat

cd "C:\Users\agrogan\Box Sync\Box Sync\GitHub\multilevel\logistic-interactions\" // Office Windows

cd "/Users/agrogan/Box Sync/GitHub/multilevel/logistic-interactions" // Mac Laptop

markstat using "logistic-interactions.stmd", mathjax // html

* markstat using "logistic-interactions.stmd", docx // Word

markstat using "logistic-interactions.stmd", pdf keep(tex) // pdf

* markstat using "logistic-interactions.stmd", slides(santiago+) mathjax /* bundle */  // slides

graph close _all



