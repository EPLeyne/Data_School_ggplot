library(tidyverse)

gapminder <- read_csv('raw_data/gapminder_data.csv')

ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point()

# Exercise 1 

ggplot(data = gapminder, aes(x = year, y = lifeExp)) + 
  geom_point()

# Exercise 2

ggplot(data = gapminder, aes(x = year, y = lifeExp, colour = continent)) + 
  geom_point()

yearly_mean <- gapminder %>% group_by()

ggplot(data = gapminder, aes(x = year, y = lifeExp, colour = continent, by = country)) + 
  geom_line() +
  geom_point()

ggplot(data = gapminder, aes(x = year, y = lifeExp, by = country)) + 
  geom_line(aes(colour = continent)) +  #Keeps the colour lines. arguments still have to be inside the aes()
  geom_point()

ggplot(data = gapminder, aes(x = year, y = lifeExp, colour = continent, by = country)) + 
  geom_line() +
  geom_point(colour = 'black')

ggplot(gapminder, aes(x = gdpPercap, y = lifeExp, colour = continent)) +
  geom_point() +
  scale_x_log10() #Changes x-axis to log10

ggplot(gapminder, aes(x = gdpPercap, y = lifeExp, colour = continent)) +
  geom_point() +
  scale_x_log10() +
  geom_smooth(method = 'lm') #Adds the smoothed line, inherits the grouping (colour = ) from the intial aes()

ggplot(gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(aes(colour = continent)) +  # Removes the colour from being inherited
  scale_x_log10() +
  geom_smooth(method = 'lm') 

ggplot(gapminder, aes(x = gdpPercap, y = lifeExp, colour = continent)) +
  geom_point() +
  scale_x_log10() +
  geom_smooth(method = 'lm', colour = 'red') # Replaces the colour aestetic from being inherited

ggplot(gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(size = 0.5, colour = 'blue') + # change the size and colour inside geom_point)()
  scale_x_log10() +
  geom_smooth(method = 'lm', colour = 'red')


#Multi-panel figures

gapminder_sub <- gapminder %>% 
  filter(continent == "Americas")

ggplot(gapminder_sub, aes(x = year, y = lifeExp, group = country)) +
  geom_line() +
  facet_wrap(~country)  # Creates a multi-panel figure, dividing by country


#Saving the plot
# first assign the plot
lifeExp_americas <- ggplot(gapminder_sub, aes(x = year, y = lifeExp, group = country)) +
  geom_line() +
  facet_wrap(~country)
# save the plot
ggsave('figures/lifeExp_americas.png', lifeExp_americas) # This saves the plot at the size of the screen by default
# To adjust the size us size, width, dpi etc. in the ggsave argument



## Literate Programming
# R-Markdown

# knitr package knits together the code and language together to produce a report

