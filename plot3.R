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
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)
# set name and size for plot using png graphics device
png("plot3.png", width=480, height=480)
# create plot
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
# add lines
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
# add legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, bty="n", col=c("black", "red", "blue"))
# shut down the png graphics device
dev.off()
