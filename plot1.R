plot1 <- function() {
fileUrl <- 'https://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip'
download.file(fileUrl, destfile ="./Household_Power_data")
data <-read.table(unzip("./Household_Power_data"), header = TRUE, sep = ";", na.strings = "?")
data$Date <- as.Date(data$Date)
HH_data <- subset(data,Date=="2007-02-01"|Date=="2007-02-02")
png("rplot1.png", width = 480, height = 480)
hist(HH_data$Global_active_power, freq = TRUE, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()
}