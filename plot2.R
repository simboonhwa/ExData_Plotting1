source("plotread.R")

library(lubridate)
library(ggplot2)
library(scales)

power = plotread()

ggplot() +  scale_x_datetime(labels = date_format("%A")) + geom_line(data=power, aes(x=Date, y=active_power),color="black") + ylab("Global Active Power(Kilowatts)") 
	
ggsave("plot2.png")
