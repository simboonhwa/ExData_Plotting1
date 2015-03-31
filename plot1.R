power <- read.table("./household_power_consumption.txt",skip=21997,nrows=525600,
		sep=";",header=F,stringsAsFactors = FALSE,comment.char="", 
		na.strings="?", 
		colClasses=c("character","character","numeric","numeric",
			"numeric","numeric","numeric","numeric","numeric"))

names(power) <- c("Date","Time","active_power","reactive_power",
		"Voltage","intensity","Sub_metering_1","Sub_metering_2",
		"Sub_metering_3")

#X11()
hist(power$active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency",col="red")
#dev.copy(png,filename="plot1.png")

library(lubridate)
library(ggplot2)
#strptime(power$Date, format="%y-%m-%d")
power$Date <- wday(power$Date,label=T) 
qplot(paste(Date,Time), active_power, data=power, ylab="Global Active Power (kilowatts)", geom="line")

ggplot(power, aes(paste(Date,Time)),Sub_metering_1) + geom_density() + 
	color="grey0" + ylab("Energg Sub Metering")+ 
	guide_legend(title="Sub_metering_1")
qplot(paste(Date,Time), Sub_metering_1, data=power, ylab="Energy Sub Metering",
 geom="line", color="grey0")#,label="Sub_metering_1")
qplot(paste(Date,Time), Sub_metering_2, data=power, ylab="Energy Sub Metering",
 geom="line", color="red")#,label="Sub_metering_2")

strptime(paste(power$Date,power$Time), format="%y-%m-%d, %I:%M%p")
#qplot(wday(power$Date,label=T),power$active_power,data=power,xlab="x",ylab="y",
#extract <- within(power,{Date<-wday(Date,label=T)
#rm(reactive_power,Voltage,intensity,Sub_metering_1,Sub_metering_2,Sub_metering_3)})
#dev.off()
#cut2(as.double(power$active_power),g=12)
#strptime(x, format="%y-%m-%d, %I:%M%p")
#x[x %in% c(98,99)] = NA
#Library  (dataset)


#ggplot(...)
#ggsave("plot.png")
