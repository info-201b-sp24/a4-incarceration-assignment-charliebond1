library(tidyverse)
library(tinytex)


#Loading Datasets

us_prison_pop <- read.csv("https://raw.githubusercontent.com/melaniewalsh/Neat-Datasets/main/us-prison-pop.csv")
us_jail_pop <- read.csv("https://raw.githubusercontent.com/melaniewalsh/Neat-Datasets/main/us-jail-pop.csv")



summary_us_prison_pop <- us_prison_pop %>%
  na.omit %>%
  summarize(
    timespan = max(year)-min(year), 
    average_pop = mean(total_pop),
    average_prison_pop = mean(total_prison_pop),
    average_prison_age_pop = mean(total_pop_15to64),
    average_male_prison_pop = mean(male_prison_pop),
    average_female_prison_pop = mean(female_prison_pop),
    average_black_prison_pop = mean(black_prison_pop),
    average_white_prison_pop = mean(white_prison_pop),
    average_latinx_prison_pop = mean(latinx_prison_pop),
    white_prison_rate = sum(white_prison_pop)/sum(white_pop_15to64),
    black_prison_rate = sum(black_prison_pop)/sum(black_pop_15to64),
    latinx_prison_rate = sum(latinx_prison_pop)/sum(latinx_pop_15to64)  
  )




