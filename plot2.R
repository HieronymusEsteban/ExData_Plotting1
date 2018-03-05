
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

# Create plot: 

png("plot2.png", width = 480, height = 480)
plot(x_points, NeededData$Global_active_power, type = "l", xaxt = 'n', xlab = '', ylab = "Global Active Power (kilowatts)")
axis(side = 1, at = c(1, (length(x_points)/2), length(x_points)), labels = c("Thu", "Fri", "Sat"))
dev.off()

