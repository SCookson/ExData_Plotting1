## Exploratory Data Analysis Exercise 1
## Plot 1

## Load electricity data
elec <- read.table("household_power_consumption.txt", sep=";", header=T)

## Convert date, time, GAP KW
elec$Date <- as.Date(elec$Date, format="%d/%m/%Y")
elec$Time <- strptime(elec$Time, format="%H:%M:%S")
elec$Global_active_power <- as.numeric(levels(elec$Global_active_power))[elec$Global_active_power]

## Filter to 1st & 2nd Feb 2007
elec <- subset(elec, Date == "1/2/2007" | Date == "2/2/2007")

## Create histogram
with(elec, hist(Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)"))

## Save as png
dev.copy(png, file="plot1.png")
dev.off()