data <- read.table("household_power_consumption.txt", comment.char = "", nrows=207526, na.strings="?", sep=";", header=T)

data$Time <- paste(data$Date, data$Time) #as.Date(data$Date, "%d/%m/%Y")
data$Time <- strptime(data$Time, format="%d/%m/%Y %H:%M:%S")
data$Date <- NULL
Sys.setlocale("LC_TIME", "C") # necessary to have weekdays in English

subdata <- data[as.Date(data$Time) == as.Date("2007-02-01") | as.Date(data$Time) == as.Date("2007-02-02"),]

png(filename="plot4.png")
#plot.new()
par(mfrow=c(2,2))

plot(subdata$Global_active_power, type="l", ylab="Global Active Power", xlab="", xaxt="n")
axis(1, labels=c("Thu", "Fri", "Sat"), at=c(1, nrow(subdata)/2+1, nrow(subdata)))

plot(subdata$Voltage, type="l", ylab="Voltage", xaxt="n", xlab="datetime")
axis(1, labels=c("Thu", "Fri", "Sat"), at=c(1, nrow(subdata)/2+1, nrow(subdata)))

plot(subdata$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="", xaxt="n")
lines(subdata$Sub_metering_2, type="l", col="red")
lines(subdata$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lwd=1, bty="n")

axis(1, labels=c("Thu", "Fri", "Sat"), at=c(1, nrow(subdata)/2+1, nrow(subdata)))
plot(subdata$Global_reactive_power, ylab="Global_reactive_power", type="l", xaxt="n", xlab="datetime")
axis(1, labels=c("Thu", "Fri", "Sat"), at=c(1, nrow(subdata)/2+1, nrow(subdata)))

dev.off()

