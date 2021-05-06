getwd()
setwd('~/Downloads')

avc <- read.csv('avocado.csv')
str(avc1)
View(avc1)

avc1 <- data.frame("AveragePrice" = avc$AveragePrice, 
                   "TotalVolume" = avc$Total.Volume,
                   "Type" = avc$type, "Region" = avc$region,
                   "Year" = avc$year)

avc1$Region <- as.factor(avc1$Region)
avc1$Type <- as.factor(avc1$Type)
avc1$Year <- as.factor(avc1$Year)
avc1$TotalVolume <- as.factor(avc1$TotalVolume)


set.seed('123')
index <- sort(sample(nrow(avc1), nrow(avc1) * 0.8))

avtrain <- avc1[index,]
avtest <- avc1[-index,]
View(avtest)

avc1 <-na.omit(avc1) 
anov <- aov(AveragePrice ~., avc1)
summary(anov)
TukeyHSD(anov)


avlm <- lm(AveragePrice ~., avtrain)
options(scipen = 999)

summary(avlm)



avpred <- predict(avlm, newdata = avtest, type = 'response')
df1 <- data.frame("Actual" = avtest$AveragePrice, "Predicted" = avpred)
View(df1)
sd(avtest$AveragePrice)
