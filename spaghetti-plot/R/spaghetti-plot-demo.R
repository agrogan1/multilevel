#' ---
#' title: "Spaghetti Plot Demo"
#' author: "Andy Grogan-Kaylor"
#' date: "`r format(Sys.Date())`"
#' output:  
#'   html_document:
#'     highlight: haddock
#'     fig_height: 3
#' ---
#' 

# get data

# using data from
# https://stats.idre.ucla.edu/stata/examples/mlm-imm/introduction-to-multilevel-modeling-by-kreft-and-de-# get data

library(haven) # read Stata

imm23 <- read_dta("https://stats.idre.ucla.edu/stat/examples/imm/imm23.dta")

# graph

library(ggplot2)

ggplot(imm23, # data I am using
       aes(x = ses, # x is ses
           y = math, # y is math achievement
           color = factor(schid))) + # color is school id
  geom_smooth(method = "lm", se = FALSE)



