# R script for data structure
nordic <- read.csv("data/nordic-data.csv")
gapminder <- read.csv("data/gapminder_data.csv")
head(gapminder[3])
head(gapminder[["pop"]]) #output as vector
head(gapminder$pop) #output as vector

# When indexing a data frame, we use [row, column]
# First three rows, all columns
gapminder[1:3,]
# First three rows, first two columns
gapminder[1:3, 1:2]
# All rows, first two columns 
head(gapminder[, 1:2])
