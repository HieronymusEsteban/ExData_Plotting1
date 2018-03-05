
install.packages("sqldf")
library(sqldf)

setwd("/Documents/Coursera_DataScience_Exploratory/ExData_Plotting1-master")


# This works: 
SelectData <- read.csv("household_power_consumption.txt", sep = ";", nrows = 3)


SelectData2 <- read.csv.sql("household_power_consumption.txt", sql = "select * from file where Global_active_power =  4.216", header = TRUE, sep = ";")


# This does not work for unknown reasons (the command is executed but no rows are selected): 

SelectData3 <- read.csv2.sql("household_power_consumption.txt", sql = "select * from file where Date = 01/02/2007", header = TRUE, sep = ";", colClasses = )


# Identifying column classes: 

length(colnames(SelectData))

col_classes <- rep(0, length(colnames(SelectData)))

for(i in 1:length(colnames(SelectData))){
	col_classes[i] <- class(SelectData[,i])
}

col_classes

# Date is a factor. Maybe this poses problems. 




