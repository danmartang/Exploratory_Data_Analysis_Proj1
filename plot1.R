plot1 <- function() {
## Download and unzip file 
fileUrl <- 'https://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip'
download.file(fileUrl, destfile ="./Household_Power_data")
## Read into R
data <-read.table(unzip("./Household_Power_data"), header = TRUE, sep = ";", na.strings = "?")
##Convert Date column to date format and subset only the 2 desired dates
data$Date <- as.Date(data$Date)
HH_data <- subset(data,Date=="2007-02-01"|Date=="2007-02-02")
## Call PNG function and then plot a histrogram before closing graphics device
png("rplot1.png", width = 480, height = 480)
hist(HH_data$Global_active_power, freq = TRUE, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()
}