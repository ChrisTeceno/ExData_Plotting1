# set file name
dataFile <- "household_power_consumption.txt"
# pull data into a table
data <- read.table(dataFile, header=TRUE, sep=";", dec=".")
# subset where Date is 1 or 2 feb 2007
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
# paste date and time together and convert to datetime object
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
# make variables numeric
globalActivePower <- as.numeric(subSetData$Global_active_power)
globalReactivePower <- as.numeric(subSetData$Global_reactive_power)
voltage <- as.numeric(subSetData$Voltage)
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)
# set name and size for plot using png graphics device
png("plot4.png", width=480, height=480)
# set into 2x2 subplots
par(mfrow = c(2, 2)) 
# plot 1,1
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power")
# plot 1, 2
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
# plot 2, 1
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, bty="n", col=c("black", "red", "blue"))
# plot 2, 2
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
# shut down the png graphics device
dev.off()