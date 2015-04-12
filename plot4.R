plot4 <- function(){
p1=source("plot2.R")
source("plot3.R")
library("gridExtra")

power = plotread()
x11()
#p1 = plot2(FALSE)
p1 = ggplot() +  scale_x_datetime(labels = date_format("%A")) + 
	geom_line(data=power, aes(x=Date, y=active_power),color="black") + 
	ylab("Global Active Power(Kilowatts)")


p2 = ggplot() +  scale_x_datetime(labels = date_format("%A")) +
	geom_line(data=power, aes(x=Date, y=Voltage),color="black") +
	ylab("voltage") 

#p3 = plot3(FALSE)
p3 = ggplot() +  scale_x_datetime(labels = date_format("%A")) +
        geom_line(data=power, aes(x=Date, y=Sub_metering_1),color="black") +
        geom_line(data=power, aes(x=Date, y=Sub_metering_2),color="red") +
        geom_line(data=power, aes(x=Date, y=Sub_metering_3),color="blue") +
        theme(legend.position=c(1,1),legend.title = element_blank()) +
        ylab("Energy Sub Metering")


p4 = ggplot() +  scale_x_datetime(labels = date_format("%A")) +
	geom_line(data=power, aes(x=Date, y=reactive_power),color="black") +
	ylab("Global_reactive_power") 

grid.arrange(p1,p2,p3,p4)	

dev.copy(png,filename="plot4.png")
dev.off()
}
