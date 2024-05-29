library(usmap)
library(ggplot2)




us_jail_pop <- read.csv("https://raw.githubusercontent.com/melaniewalsh/Neat-Datasets/main/us-jail-pop.csv")


map_input <- us_jail_pop %>%
  na.omit %>%
  mutate(black_jail_increase = black_jail_pop - lag(black_jail_pop))
  


themap <- plot_usmap(data = map_input, values = "black_jail_increase") +
  scale_fill_continuous(low = "white", high = "orange", name = "Black Jail Population Increase") +
  labs(title = "Highest increase in Jailings of Black People") +
  theme_minimal()


plot(themap)




