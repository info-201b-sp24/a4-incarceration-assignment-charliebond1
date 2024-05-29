library(tidyverse)
library(tinytex)
library(ggplot2)




us_prison_pop <- read.csv("https://raw.githubusercontent.com/melaniewalsh/Neat-Datasets/main/us-prison-pop.csv")
us_jail_pop <- read.csv("https://raw.githubusercontent.com/melaniewalsh/Neat-Datasets/main/us-jail-pop.csv")



chart_input <- us_prison_pop %>%
  na.omit %>%
  filter(urbanicity == "urban") %>%
  group_by(year) %>% 
  summarise(
    prison_pop_by_year = sum(total_prison_pop), 
    latinx_prison_pop_by_year = sum(latinx_prison_pop),
    black_prison_pop_by_year = sum(black_prison_pop),
    white_prison_pop_by_year = sum(white_prison_pop),
    asian_prison_pop_by_year = sum(aapi_prison_pop)
    ) %>%
  mutate(
    latinx_prison_rate = latinx_prison_pop_by_year/prison_pop_by_year,
    black_prison_rate = black_prison_pop_by_year/prison_pop_by_year, 
    white_prison_rate = white_prison_pop_by_year/prison_pop_by_year,
    asian_prison_rate = asian_prison_pop_by_year/prison_pop_by_year
    )
data.frame(chart_input)


prison_rates_over_time <- ggplot(data = chart_input, aes(x = year)) +
geom_line(aes(y = latinx_prison_rate, color = "latinx")) +
geom_line(aes(y = black_prison_rate, color = "black")) +
geom_line(aes(y = white_prison_rate, color = "white")) +
geom_line(aes(y = asian_prison_rate, color = "asian")) +
  labs(
    title = "Prison Rates Over Time by Race",
    x = "Year",
    y = "Prison Rate",
    color = "Race"
  ) +
  theme_minimal()
plot(prison_rates_over_time)

















