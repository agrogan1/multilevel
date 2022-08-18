library(RefManageR)

mybib <- ReadBib("./Bayesian-and-frequentist-MLM/Bayesian-and-frequentist-MLM.bib")

mybib <- sort(mybib, sorting = "nyt") # sort by name - year - title

WriteBib(mybib, 
         file = "./Bayesian-and-frequentist-MLM/Bayesian-and-frequentist-MLM.bib")