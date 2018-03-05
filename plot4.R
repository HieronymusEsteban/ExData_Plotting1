# Set working directory: 
setwd("/Documents/Coursera_DataScience_Exploratory/ExData_Plotting1-master")



# Load first three rows of data set to get in impression of its structure: 
SelectData <- read.csv("household_power_consumption.txt", sep = ";", nrows = 3)


# Calculating the row number that are needed: 
BeginningDataFrameTime <- as.POSIXlt(as.character(paste(SelectData$Date[1], SelectData$Time[1])), format = "%d/%m/%Y %H:%M:%S")

StartAnalysisTime <- as.POSIXlt("2007-02-01 00:00:00")

TimeDifference <- difftime(StartAnalysisTime, BeginningDataFrameTime, units='mins')

MinutesTwoDays <- 2*60*24

# Load the needed data: 

NeededData <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE, skip = as.numeric(TimeDifference), nrows = MinutesTwoDays)

colnames(NeededData) <- colnames(SelectData)

# NeededData$Time is a factor. This creates problems when plotting. So, instead of using NeededData$Time for the x data points, I create an integer vector of the same length: 
x_points <- 1:length(NeededData$Time)

class(x_points)


# Checking for missing values: 

sum(NeededData$Global_active_power == "?")

sum(NeededData$Global_reactive_power == "?")

sum(NeededData$NeededData$Sub_metering_1 == "?")
sum(NeededData$NeededData$Sub_metering_2 == "?")
sum(NeededData$NeededData$Sub_metering_3 == "?")

sum(NeededData$Voltage == "?")





#Create plot: 

png("plot4.png")
par(mfrow = c(2, 2))

plot(x_points, NeededData$Global_active_power, type = "l", xaxt = 'n', xlab = '', ylab = "Global Active Power (kilowatts)")
axis(side = 1, at = c(1, (length(x_points)/2), length(x_points)), labels = c("Thu", "Fri", "Sat"))

plot(x_points, NeededData$Voltage, type = "l", xaxt = 'n', xlab = 'datatime', ylab = "Voltage")
axis(side = 1, at = c(1, (length(x_points)/2), length(x_points)), labels = c("Thu", "Fri", "Sat"))

plot(x_points, NeededData$Sub_metering_1, type = "l", lwd = 1, xaxt = 'n', xlab = '', ylab = "Energy sub metering")
axis(side = 1, at = c(1, (length(x_points)/2), length(x_points)), labels = c("Thu", "Fri", "Sat"))
lines(x_points, NeededData$Sub_metering_2, type = "l", col = "red")
lines(x_points, NeededData$Sub_metering_3, type = "l", col = "blue")

plot(x_points, NeededData$Global_reactive_power, type = "l", xaxt = 'n', xlab = 'datatime', ylab = "Global Active Power (kilowatts)")
axis(side = 1, at = c(1, (length(x_points)/2), length(x_points)), labels = c("Thu", "Fri", "Sat"))
dev.off()




