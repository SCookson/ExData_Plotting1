## Exploratory Data Analysis Exercise 1
## Plot 4

## Load electricity data
elec <- read.table("household_power_consumption.txt", sep=";", header=T, na.strings="?")

## Filter to 1st & 2nd Feb 2007
elec <- subset(elec, Date == "1/2/2007" | Date == "2/2/2007")

## Create date and time column
dateTime <- strptime(paste(elec$Date, elec$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

## Setup so we have a 2x2 grid of charts
par(mfrow = c(2,2))

## Create chart 1
plot(dateTime, elec$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="",cex.lab=0.75)
axis

## Create chart 2
plot(dateTime, elec$Voltage,type="l",ylab="Voltage",xlab="datetime",cex.lab=0.75)

## Create chart 3
with(elec, plot(dateTime, elec$Sub_metering_1,type="n",ylab="Energy sub metering",xlab="",cex.lab=0.75))
with(elec, lines(dateTime, elec$Sub_metering_1))
with(elec, lines(dateTime, elec$Sub_metering_2,col="red"))
with(elec, lines(dateTime, elec$Sub_metering_3,col="blue"))
legend("topright", lty=1, cex=0.3,col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##Create chart 4
plot(dateTime, elec$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime",cex.lab=0.75)

## Save as png
dev.copy(png, file="plot4.png")
dev.off()