source("plotread.R")

power = plotread()

X11()
hist(power$active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency",col="red")


dev.copy(png,filename="plot1.png")
dev.off()

