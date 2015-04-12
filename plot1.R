source("plotread.R")

plot1 <- function(){
power = plotread()

X11()
hist(power$active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency",col="red")

#p1 = ggplot() +  geom_histogram(data=power, aes(x=active_power),color="red") +
#        xlab("Frequency") + ylab("Global Active Power(Kilowatts)")

dev.copy(png,filename="plot1.png")
dev.off()
}
