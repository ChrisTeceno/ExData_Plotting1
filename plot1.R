# set file name
dataFile <- "household_power_consumption.txt"
# pull data into a table
data <- read.table(dataFile, header=TRUE, sep=";", dec=".")
# subset where Date is 1 or 2 feb 2007
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
# convert from chr to numeric ("0.326" to 0.326)
globalActivePower <- as.numeric(subSetData$Global_active_power)
# set name and size for plot using png graphics device
png("plot1.png", width=480, height=480)
#make histogram
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
# shut down the png graphics device
dev.off()
