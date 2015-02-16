# Copyright (C) 2015 by Stephen Makonin.
# to be used with EPA National Emissions Inventory web site the UCI dataset: https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

# load dataset
ds = read.table("household_power_consumption.txt", sep = ";", header = TRUE)

# keep only the specific days
subds = subset(ds, ds$Date == "1/2/2007" | ds$Date == "2/2/2007")
rownames(subds) <- NULL

# convert to date and time
#subds$Date <- as.Date(as.character(subds$Date), format="%d/%m/%Y")
#subds$Time <- strptime(as.character(subds$Time), format="%H:%M:%S")
subds$dt <- strptime(paste(as.character(subds$Date), as.character(subds$Time)), format="%d/%m/%Y %H:%M:%S")
subds$Global_active_power <- as.numeric(as.character(subds$Global_active_power))
subds$Global_reactive_power <- as.numeric(as.character(subds$Global_reactive_power))
subds$Voltage <- as.numeric(as.character(subds$Voltage))
subds$Global_intensity <- as.numeric(as.character(subds$Global_intensity))
subds$Sub_metering_1 <- as.numeric(as.character(subds$Sub_metering_1))
subds$Sub_metering_2 <- as.numeric(as.character(subds$Sub_metering_2))
subds$Sub_metering_3 <- as.numeric(as.character(subds$Sub_metering_3))

# create chart and save to png
png(file = "plot13.png", bg = "white")

plot(subds$dt, subds$Sub_metering_1, type="n", xlab="", ylab = "Energy sub metering") 
lines(subds$dt, subds$Sub_metering_1, col = "black") 
lines(subds$dt, subds$Sub_metering_2, col = "red") 
lines(subds$dt, subds$Sub_metering_3, col = "blue") 
legend("topright", legend = names(subds)[7:9], col = c("black", "red", "blue"), lty=1, lwd=1.0)

#save to png
dev.off()
