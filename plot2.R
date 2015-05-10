## Exploratory Data Analysis Exercise 1
## Plot 2

## Load electricity data
elec <- read.table("household_power_consumption.txt", sep=";", header=T, na.strings="?")

## Filter to 1st & 2nd Feb 2007
elec <- subset(elec, Date == "1/2/2007" | Date == "2/2/2007")

## Create date and time column
dateTime <- strptime(paste(elec$Date, elec$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

## Create line plot
plot(dateTime, elec$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")

## Save as png
dev.copy(png, file="plot2.png")
dev.off()