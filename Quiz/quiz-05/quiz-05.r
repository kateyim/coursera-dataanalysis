#Question 1
#Load the weaving data with the commands:
data(warpbreaks)
#Fit an ANOVA model where the outcome is the number of breaks. 
#Fit an ANOVA model including the wool and tension variables as covariates. 
#What are the dgrees of freedom for the tension variable 
#and what is the F-statistic for tension after accounting for the variation due to wool?
names(warpbreaks)
aovObject <- aov(warpbreaks$breaks ~ warpbreaks$tension)
aovObject
aovObjects2 <- aov(warpbreaks$breaks ~ warpbreaks$wool + warpbreaks$tension)
summary(aovObjects2)

#Question 3 (Wrong)
#Load the horseshoe crab data using the commands:
install.packages('glm2')
library(glm2)
data(crabs)
#Fit a Poisson regression model with the number of Satellites as the outcome and the width of the female as the covariate. 
#What is the multiplicative change in the expected number of crabs for each additional centimeter of width?
names(crabs)
plot(crabs$Width, crabs$Satellites, pch=19, col="darkgrey", xlab="width", ylab="satellites")
glm1 <- glm(crabs$Satellites ~ crabs$Width, family="poisson")
lines(crabs$Width, glm1$fitted, col="blue", lwd=3)

#Question 4 (I don't know)
#What is the expected number of Satellites for a female of width 22cm?
glm2 <- glm(crabs$Satellites ~ crabs$Width, offset=log(Width), family="poisson", data=crabs)
plot(crabs$Width, glm2$fitted, col="blue", pch=19, xlab="width", ylab="Fitted Counts")
names(glm2$fitted)

#Question 5 (TBA)
#Load the school absenteeism data set and fit a linear model relating the log of the number of days absent to the other variables with the commands:
library(MASS)
data(quine) 
lm1 = lm(log(Days + 2.5) ~.,data=quine)