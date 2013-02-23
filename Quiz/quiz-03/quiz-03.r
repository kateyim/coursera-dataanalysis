#Question 1
install.packages('ElemStatLearn')

library(ElemStatLearn)
data(bone)
plot(bone$age,bone$spnbmd,pch=19,col=((bone$gender=="male")+1))

#Question 2
library(ElemStatLearn)
data(marketing)
plot(bone$age,bone$spnbmd,pch=19,col=((bone$gender=="male")+1))
boxplot(marketing$Income ~ marketing$Marital,col="grey",xaxt="n",ylab="Income",xlab="")
axis(side=1,at=1:5,labels=c("Married","Living together/not married","Divorced or separated","Widowed","Nevermarried"),las=2)

#Question 3
#Load the iris data into R using the following commands:
library(datasets)
data(iris)
#Subset the iris data to the first four columns and call this matrix irisSubset. Apply hierarchical clustering to the irisSubset data frame to cluster the rows. If I cut the dendrogram at a height of 3 how many clusters result?
irisSubset <- iris[1:4]
dist1234 <- dist(irisSubset)
hClustering <- hclust(dist1234)
plot(hClustering)

#Question 4
#Load the following data set into R using either the .rda or .csv file:  
#https://spark-public.s3.amazonaws.com/dataanalysis/quiz3question4.rda 
#https://spark-public.s3.amazonaws.com/dataanalysis/quiz3question4.csv 
fileUrl <- "https://spark-public.s3.amazonaws.com/dataanalysis/quiz3question4.csv"
getwd()
dir <- "/home/kate/workspace/coursera-dataanalysis/Quiz/quiz-03"
setwd(dir)
download.file(fileUrl, destfile="./data/quiz3question4.csv", method="wget")
con <- file("./data/quiz3question4.csv")
data <- read.csv(con)
#Make a scatterplot of the x versus y values. How many clusters do you observe? 
plot(data$x, data$y, col="blue", pch=19, cex=2)
#Perform k-means clustering using your estimate as to the number of clusters. 
#Color the scatterplot of the x, y values by what cluster they appear in. 
#Is there anything wrong with the resulting cluster estimates?
kmeansObj <- kmeans(data, centers=2)
plot(data$x, data$y, col=kmeansObj$cluster, pch=19, cex=2)
points(kmeansObj$centers, col=1:3, pch=3, cex=3, lwd=3)

#Question 5. There are errors in the following solution. 
#Load the hand-written digits data using the following commands:
library(ElemStatLearn)
data(zip.train)
#Each row of the zip.train data set corresponds to a hand written digit. 
#The first column of the zip.train data is the actual digit. 
#The next 256 columns are the intensity values for an image of the digit. 
#To visualize the adigit we can use the zip2image() function to convert a row into a 16 x 16 matrix:
# Create an image matrix for the 3rd row, which is a 4
im = zip2image(zip.train,3)
image(im)
#Using the zip2image file, create an image matrix for the 8th and 18th rows. 
#For each image matrix calculate the svd of the matrix (with no scaling). 
#What is the percent variance explained by the first singular vector for the image from the 8th row? 
#What is the percent variance explained for the image from the 18th row? 
#Why is the percent variance lower for the image from the 18th row?
row8 <- zip2image(zip.train, 9)
row18 <- zip2image(zip.train, 19)
par(mfrow=c(1,2))
image(row8)
image(row18)
svd8 <- svd(row8)
svd18 <- svd(row18)
par(mfrow=c(1,3))
plot(svd8$u[,1], pch=19, xlab="1", ylab="First Singular Vector 1")
abline(c(.98,0),col="red")
abline(c(.99,0),col="blue") 
plot(svd8$d, xlab="Column", ylab="Singlular Value", pch=19)
plot(svd8$d^2/sum(svd8$d^2), xlab="Column", ylab="Percent of Variance explained", pch=19)
plot(svd18$d^2/sum(svd18$d^2), xlab="Column", ylab="Percent of Variance explained", pch=19)
