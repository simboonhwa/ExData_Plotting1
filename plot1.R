power <- read.table("./household_power_consumption.txt",skip=21997,nrows=525600,
		sep=";",header=F,stringsAsFactors = FALSE,comment.char="", 
		na.strings="?", 
		colClasses=c("character","character","numeric","numeric",
			"numeric","numeric","numeric","numeric","numeric"))

names(power) <- c("Date","Time","active_power","reactive_power",
		"Voltage","intensity","Sub_metering_1","Sub_metering_2",
		"Sub_metering_3")

power$Date <- strptime(paste(power$Date,power$Time), format="%d/%m/%Y %H:%M:%S")
power <- subset(power, select=(-2))
power1 <- melt(power[,c(1,6:8)], id=c("Date"))
#X11()
#hist(power$active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency",col="red")
#dev.copy(png,filename="plot1.png")

library(lubridate)
library(ggplot2)
library(scales)
ggplot() + geom_line(data=power, aes(x=Date, y=Sub_metering_1),color="black") + geom_point() + 
ggplot() +  scale_x_datetime(labels = date_format("%A")) +
	#geom_line(data=power1, aes(x=Date,y=value,color=variable)) +
	geom_line(data=power, aes(x=Date, y=Sub_metering_1),color="black") + 
	geom_line(data=power, aes(x=Date, y=Sub_metering_2),color="red") + 
	geom_line(data=power, aes(x=Date, y=Sub_metering_3),color="blue") + 
	ylab("Energy Sub Metering")+ 
	#guide_legend(title="Sub_metering_1") +
	theme(legend.position=c(1,1),legend.justification=c(1,1))
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
