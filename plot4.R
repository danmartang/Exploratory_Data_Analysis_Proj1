plot3 <- function(){
  library(dplyr)
  ## Download and unzip file 
  fileUrl <- 'https://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip'
  download.file(fileUrl, destfile ="./Household_Power_data")
  ## Read into R
  data <-read.table(unzip("./Household_Power_data"), header = TRUE, sep = ";", na.strings = "?")
  ##Convert Date column to date format and subset only the 2 desired dates
  data$Date <- as.Date(data$Date)
  HH_data <- subset(data,Date=="2007-02-01"|Date=="2007-02-02")
  ## Convert Time to character
  HH_data$Time <- as.character(HH_data$Time)
  ##Merge date & time columns into one creating a new column
  HH_data <- mutate(HH_data,DateTime=as.POSIXct(paste(HH_data$Date, HH_data$Time), format="%Y-%m-%d %H:%M:%S"))
  ## Call PNG function and then plot data before closing graphics device
  png("rplot4.png", width = 480, height = 480)
  ## Set graph to be a 2 by 2 filling out rows first before columns
  par(mfrow=c(2,2))
  ## Plot all 4 graphs, the 3rd one is same as plot3
  plot(HH_data$DateTime,HH_data$Global_active_power,type="l", xlab="",ylab="Global Active Power")
  plot(HH_data$DateTime,HH_data$Voltage, type="l", xlab = "datetime", ylab="Voltage")
  plot(HH_data$DateTime,HH_data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
  lines(HH_data$DateTime,HH_data$Sub_metering_2, col = "red")
  lines(HH_data$DateTime,HH_data$Sub_metering_3, col = "blue")
  legend("topright", col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = c(1,1))
  plot(HH_data$DateTime,HH_data$Global_reactive_power, type="l", xlab="datetime",ylab="Global_reactive_power")
  dev.off()
}