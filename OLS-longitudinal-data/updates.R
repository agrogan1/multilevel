# sort bibliography

library(RefManageR)

mybib <- ReadBib("./OLS-longitudinal-data/MLM.bib")

mybib <- sort(mybib, sorting = "nyt") # sort by name - year - title

WriteBib(mybib, file = "./OLS-longitudinal-data/MLM.bib")
