setwd("~/Downloads")

pokemon <- read.csv("Pokemon.csv")        # Question 1
View(pokemon)
str(pokemon)
summary(pokemon)

install.packages("ggplot2")
library(ggplot2)

g_pok <- ggplot(pokemon, aes(Type1)) + geom_bar(aes(color = "black", fill = Type1, binwidth = 1)) + 
  labs(title = 'Pokemon Type Frequency') + xlab('Primary Pokemon Type') + ylab('Frequency') + 
  theme(axis.line = element_line('black'))
g_pok


# Question 2
ggbar <- ggplot(pokemon, aes(as.factor(Generation), Total)) + 
  geom_point(aes(color = Generation), size = 0.9, alpha = 0.5) +
  geom_boxplot(aes(alpha = 0.3)) + xlab('Generagtion') + ylab('Total Base Power') + 
  labs(title = "Pokemon Base Power by Generation")
ggbar     

 # Question 3

pairs(~HP+Attack+Defence+Sp_Attk+Sp_Def+Speed, pokemon, pch = 19, cex = 0.65)


# Question 4

df <- data.frame(pokemon$HP, pokemon$Attack, pokemon$Defence,
                 pokemon$Sp_Attk, pokemon$Sp_Def, pokemon$Speed)
cor(df)

options(scipen = 999)
cor.test(pokemon$HP, pokemon$Attack)
cor.test(pokemon$Attack, pokemon$Defence, method = 'pearson')
cor.test(pokemon$Attack, pokemon$Defence, method = 'kendall')
