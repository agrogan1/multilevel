#' ---
#' title: "Spaghetti Plot Demo"
#' author: "Andy Grogan-Kaylor"
#' date: "`r format(Sys.Date())`"
#' output:  
#'   html_document:
#'     highlight: haddock
#'     fig_height: 5
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
           y = math)) + # y is math achievement
  geom_smooth(method = "lm", # linear model smoother for whole sample
              size = 2,
              color = "black",
              se = FALSE) + 
  geom_smooth(aes(color = factor(schid)), # school specific linear smoother
              method = "lm", 
              se = FALSE) +
  labs(title = "Spaghetti Plot",
       x = "socioeconomic status",
       y = "math score") +
  scale_color_discrete(name = "school") +
  theme_minimal()



