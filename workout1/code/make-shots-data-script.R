# title: Make Shots Data
# Description: This R Script file will have the R code necessary to create a csv file shots-data.csv that will contain all the required variables to be used in the visualization phase.
# input(s): The script requires all the data files downloaded so far - the five data files of the players.
# output(s): The outputs of the script will be a csv files that has all of the data from the players in it.

data_types <- c('character', 'factor', 'factor', 'integer','integer', 'integer', 'character', 'character', 'character', 'real', 'character', 'real', 'real')
curry <- read.csv("../data/stephen-curry.csv", sep = ",", header = TRUE, quote = "", stringsAsFactors = FALSE)
green <- read.csv("../data/draymond-green.csv", sep = ",", header = TRUE, quote = "", stringsAsFactors = FALSE)
durant <- read.csv("../data/kevin-durant.csv", sep = ",", header = TRUE, quote = "", stringsAsFactors = FALSE)
thompson <- read.csv("../data/klay-thompson.csv", sep = ",", header = TRUE, quote = "", stringsAsFactors = FALSE)
iguodala <- read.csv("../data/andre-iguodala.csv", sep = ",", header = TRUE, quote = "", stringsAsFactors = FALSE)

library(dplyr)
curry$name = 'Stephen Curry'
green$name = 'Draymond Green'
thompson$name = 'Klay Thompson'
durant$name = 'Kevin Durant'
iguodala$name = 'Andre Iguodala'

curry$shot_made_flag[curry$shot_made_flag == 'y'] <- 'shot_yes'
curry$shot_made_flag[curry$shot_made_flag == 'n'] <- 'shot_no'

green$shot_made_flag[green$shot_made_flag == 'y'] <- 'shot_yes'
green$shot_made_flag[green$shot_made_flag == 'n'] <- 'shot_no'

thompson$shot_made_flag[thompson$shot_made_flag == 'y'] <- 'shot_yes'
thompson$shot_made_flag[thompson$shot_made_flag == 'n'] <- 'shot_no'

durant$shot_made_flag[durant$shot_made_flag == 'y'] <- 'shot_yes'
durant$shot_made_flag[durant$shot_made_flag == 'n'] <- 'shot_no'

iguodala$shot_made_flag[iguodala$shot_made_flag == 'y'] <- 'shot_yes'
iguodala$shot_made_flag[iguodala$shot_made_flag == 'n'] <- 'shot_no'


curry$minute =(12 * curry$period) - (curry$minutes_remaining)
green$minute =(12 * green$period) - (green$minutes_remaining)
thompson$minute =(12 * thompson$period) - (thompson$minutes_remaining)
durant$minute =(12 * durant$period) - (durant$minutes_remaining)
iguodala$minute =(12 * iguodala$period) - (iguodala$minutes_remaining)

sink(file = '../output/stephen-curry-summary.txt')
summary(curry)
sink()

sink(file = '../output/draymon-green-summary.txt')
summary(green)
sink()

sink(file = '../output/klay-thompson-summary.txt')
summary(thompson)
sink()

sink(file = '../output/kevin-durant-summary.txt')
summary(durant)
sink()

sink(file = '../output/andre-iguodala-summary.txt')
summary(iguodala)
sink()

shots_data <- rbind(curry, green, thompson, durant, iguodala)
write.csv(shots_data, file = '../data/shots_data.csv')

sink(file = '../output/shots-data-summary.txt')
summary(shots_data)
sink()



