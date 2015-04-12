source("plotread.R")

plot3 <- function(Print=TRUE){
power = plotread()

ggplot() +  scale_x_datetime(labels = date_format("%A")) +
	geom_line(data=power, aes(x=Date, y=Sub_metering_1),color="black") +
	geom_line(data=power, aes(x=Date, y=Sub_metering_2),color="red") +
	geom_line(data=power, aes(x=Date, y=Sub_metering_3),color="blue") +
#	theme(legend.position=c(1,1),legend.title = element_blank()) +
#,legend.justification=c(1,1)) +
	ylab("Energy Sub Metering") 

if (Print==TRUE) {ggsave("plot3.png")}
}
