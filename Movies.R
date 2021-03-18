# A data analytics exam focused on analyzing movie data to interpret 
# possible relationships and running correlation tests

# Part A

movies <- read.csv('Movies.csv')
View(movies)
summary(movies)

movies$Rating <- as.factor(movies$Rating)
movies$Awards <- as.factor(movies$Awards)
movies$Distribution <- as.factor(movies$Distribution)

# Part C
# Task 1

install.packages("ggplot2")
library(ggplot2)


sct <- ggplot(movies, aes(Critic.Score, Box.Office)) +
  geom_point(aes(color = Rating)) + labs(title = 'Critic Score vs Earnings') + 
  xlab('Critic Score') + ylab('Box Office') + geom_smooth(method = 'lm', fill = NA) 
sct

# Task 2

dens <- ggplot(movies, aes(Runtime,fill = Awards)) + geom_density(alpha = 0.5) + 
  labs(title = 'Density of Awards to Runtime') + ylab('Density') + 
  theme(axis.line = element_line('black'))
dens

# Part D

df <- data.frame(movies$Runtime, movies$Critic.Score, movies$Box.Office)
cor(df)
options(scipen = 999)
cor.test(movies$Box.Office,movies$Critic.Score, method = 'pearson')
cor.test(movies$Box.Office,movies$Runtime, method = 'pearson')
cor.test(movies$Critic.Score,movies$Runtime, method = 'pearson')
cor.test(movies$Critic.Score,movies$Runtime, method = 'kendall')
