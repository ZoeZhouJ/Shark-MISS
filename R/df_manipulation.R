# Data frame manipulation 
# Read in data
gapminder <- read.csv("data/gapminder_data.csv", header = TRUE)

# Find the mean GDP per continent (maybe not the best way)
mean(gapminder[gapminder$continent == "Africa", "gdpPercap"])

# load dplyr
library(dplyr)

# Select variables
yr_country_gdp <- select(gapminder, year, country, gdpPercap)
yr_country_gdp <- gapminder %>% select(year, country, gdpPercap)
# Pipe shortcut: command+shift+M

# Filtering variables
year_country_gdp_euro <- gapminder %>% 
  filter(continent == "Europe") %>% 
  select(year, country, gdpPercap)

# Get the African values for lifeExp, country, and year 
# but not for other continents
year_country_lifeExp_afr <- gapminder %>% 
  filter(continent == "Africa") %>% 
  select(year, lifeExp, country)

# Summarize variables by group
str(gapminder)
gapminder %>% 
  group_by(continent) %>% 
  str()

gdp_byconti <- gapminder %>% 
  group_by(continent) %>% 
  summarize(mean_gdpPercap = mean(gdpPercap)) %>% 
  ungroup() #remember to ungroup so the structure remains the same

gdp_byconti

# Find the lowest and highest life_exp 
lifeE_bycountry <- gapminder %>% 
  group_by(country) %>% 
  summarize(mean_lifeE = mean(lifeExp)) %>% 
  ungroup

lifeE_bycountry <- lifeE_bycountry %>% 
  filter(mean_lifeE == min(mean_lifeE) | mean_lifeE == max(mean_lifeE))

lifeE_bycountry

gapminder %>% 
  group_by(continent, year) %>% 
  summarize(mean_gdpPercap = mean(gdpPercap),
            sd_gdpPercap = sd(gdpPercap)) %>% 
  ungroup()

# count the number of observations 

gapminder %>% 
  filter(year == 2002) %>% 
  count(continent, sort = TRUE)

gapminder %>% 
  group_by(continent) %>% 
  summarize(sd_le = sd(lifeExp), # st. dev
            n_le = n(), #number of obs
            se_le = sd_le/sqrt(n_le)) %>% 
  ungroup()
