#Question 3
#Run the following commands to create a data frame in R with measurements for 30 men describing their height in centimeters, weight in kilograms, and a logical indicator for whether they have a daughter or not.
set.seed(31);
heightsCM <- rnorm(30,mean=188, sd=5);
weightsK <- rnorm(30,mean=84,sd=3); 
hasDaughter <- sample(c(TRUE,FALSE),size=30,replace=T); 
dataFrame <- data.frame(heightsCM,weightsK,hasDaughter); 
#Subset the data frame to only the individuals that are greater than 188 centimeters tall. Assign this subset to a data frame called dataFrameSubset. Then run this command: mean(dataFrameSubset$weightsK) to get the average weight among this subset of men in the data. What is the value that is produced?
dataFrameSubset <- subset(dataFrame, dataFrame$heightsCM > 188)
m <- mean(dataFrameSubset$weightsK)
m

#Question 4
#Run a command to generate 100 Cauchy random variables with default parameters and assign them to a vector cauchyValues immediately after running the command
set.seed(41)
cauchyValues <- rcauchy(100)
#Then run a command to sample 10 values with replacement from cauchyValues immediately after running the command
set.seed(415)
#What are the first three values of the resulting sample? Note: It is critical that you run the set.seed commands immediately before the commands to perform the data generation and sampling or you will get the wrong answer.
s <- sample(cauchyValues, size=10, replace=TRUE)
s[1:3]


