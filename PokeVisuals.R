#These are some visualizions

setwd("~/Downloads")

pokemon <- read.csv("Pokemon.csv")        #1
View(pokemon)
str(pokemon)
summary(pokemon)

install.packages("ggplot2")
library(ggplot2)

# Bar chart representing number of pokemon per Type1
   
g_pok <- ggplot(pokemon, aes(Type1)) + 
  geom_bar(aes(color = "black",fill = Type1, binwidth = 1)) +               
  labs(title = 'Pokemon Type Frequency') + xlab('Primary Pokemon Type') +   
  ylab('Frequency') + theme(axis.line = element_line('black'))
g_pok


#  2
# Box Plot showing average base power of pokemon by generation
ggbar <- ggplot(pokemon, aes(as.factor(Generation), Total)) +                 
  geom_point(aes(color = Generation), size = 0.9, alpha = 0.5) +
  geom_boxplot(aes(alpha = 0.3)) + xlab('Generagtion') + 
  ylab('Total Base Power') + labs(title = "Pokemon Base Power by Generation")
ggbar     

# 3
# Scatterplot matrix

pairs(~HP+Attack+Defence+Sp_Attk+Sp_Def+Speed, pokemon, pch = 19, cex = 0.65)


# 4

 # Correlation tests
df <- data.frame(pokemon$HP, pokemon$Attack, pokemon$Defence,
                 pokemon$Sp_Attk, pokemon$Sp_Def, pokemon$Speed)
cor(df)

options(scipen = 999)
cor.test(pokemon$HP, pokemon$Attack)
cor.test(pokemon$Attack, pokemon$Defence, method = 'pearson')
cor.test(pokemon$Attack, pokemon$Defence, method = 'kendall')
