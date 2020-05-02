setwd("C:\\Users\\kas0070\\Desktop\\evolution\\tasks\\project\\data")
data <- read.csv("hertiability_height_weight_final.csv")
data1 <- na.omit(data)

install.packages("ggplot2")
install.packages("hrbrthemes")
install.packages("tidyverse")
install.packages("Hmisc")
library(ggplot2)
library(hrbrthemes)
library(tidyverse)
library(Hmisc)

hip <- as.numeric(data$Heritability.of.Hip.Score)
height <- data$height_high_inches
weight <- data$weight_high_lbs

## Simple linear regression for weight and hip
ggplot(data, aes(weight,hip)) +
  geom_point() +
  stat_smooth(method = lm)

cor(hip,weight)

model <- lm(hip~weight, data)
model

summary(model)
## Simple linear regression for weight and hip
ggplot(data, aes(height,hip)) +
  geom_point() +
  stat_smooth(method = lm)

cor(hip,height)

model <- lm(hip~height, data)
model

summary(model)




##--How well does model fit data?--##
#R-squared = 0.027
#F-statisitc = 2.512
#p-value = 0.1191

##--How significant are coefficients?--##

#Null hypothesis: slope = 0 (no relation between x and y)
#Alternative hypothesis: slope is not = 0 (some relation between x and y)
#Slope tells that a relationship exists. If no slope, line is straight and no relation
#Higher t-statistic = more significnat the predictor
#Lower the p-value = more signficiant the predictor
#assume alpha = 5% (this is custom unless you have specified one)
# alpha = level of confidence 
# low R^2, close to 0 = weak or no linear relationship

##--Hip and Weight--##
#intercept = 26.79272
#intercept t value = 8.494 
#intercept p value = 2.13 *10^-11 

#Slope = -0.06602
#slope t value = -1.585 (not significant)
#slope p value = 0.119 > 0.05 (not signficiant)

#R-squared = 0.027 (weak linar relation)

##--Conclude no relationship between hip and weight--##


##--Hip and Height--##
#slope = -0.2510
#slope t value = -0.914 (not signficiant)
#slope p value = 0.3647 (not significant)

#R-squared = -0.00 (No linear relationship)

##--Conclude no relationship between hip and height--##


