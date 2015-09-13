plot2 <- function(){
library(dplyr)
fileUrl <- 'https://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip'
download.file(fileUrl, destfile ="./HouseholdPower")
data <-read.table(unzip("./HouseholdPower"), header = TRUE, sep = ";", na.strings = "?")
data$Date <- as.Date(data$Date)
HH_data <- subset(data,Date=="2007-02-01"|Date=="2007-02-02")
HH_data$Time <- as.character(HH_data$Time)
HH_data <- mutate(HH_data,DateTime=as.POSIXct(paste(HH_data$Date, HH_data$Time), format="%Y-%m-%d %H:%M:%S"))
png("rplot2.png", width = 480, height = 480)
plot(HH_data$DateTime,HH_data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
}