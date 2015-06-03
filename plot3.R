source("plotread.R")

power = plotread()

ggplot() +  scale_x_datetime(labels = date_format("%A")) +
	geom_line(data=power, aes(x=Date, y=Sub_metering_1),color="black") +
	geom_line(data=power, aes(x=Date, y=Sub_metering_2),color="red") +
	geom_line(data=power, aes(x=Date, y=Sub_metering_3),color="blue") +
	ylab("Energy Sub Metering") 

ggsave("plot3.png")
