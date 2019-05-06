## Wisdom of Crowds guessing exercise
## 
## Fill a jar with jelly beans (or similar small items) 
## and ask as many people as possible to guess how many there are.
## Change the number of candies in the jar in line no. 11.

library("tidyverse")
library("plotly")

# the real value of jelly beans inside the jar
n <- 39

# read the file with guesses
data <- read_csv("wisdom_of_crowds.csv")

# remove NAs 
data <- data[!is.na(data[["guess"]]),]

# take the mean and median of all guesses
mean_guess <- mean(data[["guess"]])

min_guess <- min(data[["guess"]])

# make a plot to see how it differs from the real value
ggplot(data, aes(x = guess)) +
  stat_density(position="identity",geom="line") +
  geom_vline(xintercept = n, colour = "red") +
  geom_vline(xintercept = mean_guess, colour = "darkblue") +
  geom_text(aes(x = min_guess + 2, 
                label= paste0("mean guess = ", as.integer(mean_guess)), y = 0.007),
           colour = "darkblue", vjust = 1.2) +
  geom_text(aes(x = min_guess + 2, 
                label= paste0("real value = ", n), y = 0.005),
           colour = "red", vjust = 1.2) +
  labs(x = "Guessed value",
       y = "Density")

