plotread <- function(){
power <- read.table("./household_power_consumption.txt",skip=21997,nrows=2880,
		sep=";",header=F,stringsAsFactors = FALSE,comment.char="", 
		na.strings="?", 
		colClasses=c("character","character","numeric","numeric",
			"numeric","numeric","numeric","numeric","numeric"))

names(power) <- c("Date","Time","active_power","reactive_power",
		"Voltage","intensity","Sub_metering_1","Sub_metering_2",
		"Sub_metering_3")

power$Date <- strptime(paste(power$Date,power$Time), format="%d/%m/%Y %H:%M:%S")
power <- subset(power, select=(-2))
power
}
