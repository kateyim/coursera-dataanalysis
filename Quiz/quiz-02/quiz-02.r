#Question 2
con <- url("http://simplystatistics.tumblr.com/")
simplyStats <- readLines(con, 150)
close(con)
long <- nchar(simplyStats)
long[2]
long[45]
long[122]

#Question 3
fileUrl <- "https://dl.dropbox.com/u/7710864/data/csv_hid/ss06hid.csv"
download.file(fileUrl, destfile="./data/survey.csv", method="wget")
con <- file("./data/survey.csv")
survey <- read.csv(con)
head(survey)
#VAL        2      
#Property value
#bb .N/A (GQ/rental unit/vacant, not for sale only)
#24 .$1000000+
length(which(survey$VAL==24))
close(con)

#4
survey$FES

#5
#BDS        1      
#Bedrooms
#RMS        1      
#Rooms
length(which(survey$BDS==3 & survey$RMS==4))
length(which(survey$BDS==2 & survey$RMS==5))

#6
#ACR        1      
#Lot size
#3 .House on ten or more acres
#AGS        1         
#Sales of Agriculture Products
# 6 .$10000+ 
agricultureLogical <- logical(length=nrow(survey))
i <- 1
while(i<=nrow(survey)){
  if(!is.na(survey[i,"ACR"]) & !is.na(survey[i,"AGS"]) & survey[i,"ACR"] == 3 & survey[i,"AGS"] == 6){
    agricultureLogical[i] <- TRUE
  }
  i <- i+1
}
which(agricultureLogical)

#Questing 7
indexes <-  which(agricultureLogical) 
subsetDataFrame  = survey[indexes,] 
length(which(is.na(subsetDataFrame[,"MRGX"])))

#Question 8
s <- strsplit(names(survey), "wgtp")
s[123]

#Question 9
quantile(survey$YBL, na.rm=TRUE)

#Question 10
fileUrl <- "https://dl.dropbox.com/u/7710864/data/csv_hid/ss06pid.csv"
download.file(fileUrl, destfile="./data/american.csv", method="wget")
con <- file("./data/american.csv")
populationData <- read.csv(con)
close(con)
housingData <- survey
mergeData <- merge(housingData, populationData, by.x="SERIALNO", by.y="SERIALNO", all=TRUE)
dim(mergeData)