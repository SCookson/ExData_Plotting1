## Exploratory Data Analysis Exercise 1
## Plot 3

## Load electricity data
elec <- read.table("household_power_consumption.txt", sep=";", header=T, na.strings="?")

## Filter to 1st & 2nd Feb 2007
elec <- subset(elec, Date == "1/2/2007" | Date == "2/2/2007")

## Create date and time column
dateTime <- strptime(paste(elec$Date, elec$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

## Create line plot in png device
png(width=480, height=480, file = "plot3.png")
with(elec, plot(dateTime, elec$Sub_metering_1,type="n",ylab="Energy sub metering",xlab=""))
with(elec, lines(dateTime, elec$Sub_metering_1))
with(elec, lines(dateTime, elec$Sub_metering_2,col="red"))
with(elec, lines(dateTime, elec$Sub_metering_3,col="blue"))
legend("topright", lty=1, cex=0.8, pt.cex=0.3, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
