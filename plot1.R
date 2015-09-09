data <- read.table("household_power_consumption.txt", comment.char = "", nrows=207526, na.strings="?", sep=";", header=T)

data$Time <- paste(data$Date, data$Time) #as.Date(data$Date, "%d/%m/%Y")
data$Time <- strptime(data$Time, format="%d/%m/%Y %H:%M:%S")
data$Date <- NULL

subdata <- data[as.Date(data$Time) == as.Date("2007-02-01") | as.Date(data$Time) == as.Date("2007-02-02"),]
png(filename="plot1.png")
hist(subdata$Global_active_power, col="red", main="Global Active Power", ylab="Frequency", xlab="Global Active Power (kilowatts)")
dev.off()
