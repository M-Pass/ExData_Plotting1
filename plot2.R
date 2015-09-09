data <- read.table("household_power_consumption.txt", comment.char = "", nrows=207526, na.strings="?", sep=";", header=T)

data$Time <- paste(data$Date, data$Time) #as.Date(data$Date, "%d/%m/%Y")
data$Time <- strptime(data$Time, format="%d/%m/%Y %H:%M:%S")
data$Date <- NULL
Sys.setlocale("LC_TIME", "C") # necessary to have weekdays in English

subdata <- data[as.Date(data$Time) == as.Date("2007-02-01") | as.Date(data$Time) == as.Date("2007-02-02"),]
png(filename="plot2.png")
plot(subdata$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="", xaxt="n")
axis(1, labels=c("Thu", "Fri", "Sat"), at=c(1, nrow(subdata)/2+1, nrow(subdata)))
dev.off()
