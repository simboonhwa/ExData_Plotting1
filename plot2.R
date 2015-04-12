source("plotread.R")

library(lubridate)
library(ggplot2)
library(scales)

plot2 <- function(Print=TRUE){
power = plotread()

ggplot() +  scale_x_datetime(labels = date_format("%A")) + geom_line(data=power, aes(x=Date, y=active_power),color="black") + ylab("Global Active Power(Kilowatts)") 
	
	
#	theme(panel.grid.major.x = element_blank()) + 
#	scale_x_discrete(name ="", limits=c("Thurs","Fri","Sat"))
#	label="Thurs, Fri, Sat"
#p2

if (Print==TRUE) {ggsave("plot2.png")}
}
