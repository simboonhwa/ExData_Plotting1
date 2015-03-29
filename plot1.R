power <- read.table("./household_power_consumption.txt",skip=21997,nrows=525600,
		sep=";",header=F,stringsAsFactors = FALSE,comment.char="",
		colClasses=c("character","character",NA,NA,NA,NA,NA,NA,NA))

#strptime(x, format="%y-%m-%d, %I:%M%p")
#x[x %in% c(98,99)] = NA
#Library  (dataset)


#X11 ()
#plot (x,y)
#dev.copy(jpeg,filename="plot.jpg");
#dev.off ();

#ggplot(...)
#ggsave("plot.png")
