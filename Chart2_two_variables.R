library(tidyverse)
library(ggplot2)



us_prison_pop <- read.csv("https://raw.githubusercontent.com/melaniewalsh/Neat-Datasets/main/us-prison-pop.csv")



chart2_inputs <- us_prison_pop %>%
  na.omit %>%
  filter(year > 2010, urbanicity == "urban") %>%
  mutate(
    black_male_percentage = black_male_prison_pop*100/male_prison_pop,
    population_in_thousands = total_pop/1000) 

black_male_prop_versus_population <- ggplot(chart2_inputs, aes(x = population_in_thousands, y = black_male_percentage)) +geom_point() +
  labs(
    title = "Black Male Percentage of Total Prison Population by Urban County",
    x = "County Population in thousands",
    y = "Percent of Male Prisoners that are Black"
  )
plot(black_male_prop_versus_population)
