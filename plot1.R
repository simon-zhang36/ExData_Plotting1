data <- read.delim('./data/household_power_consumption.txt',sep=";",na.strings='?')
data1 <- rbind(subset(data,data$Date == '1/2/2007'),subset(data,data$Date == '2/2/2007'))
data1 <- data.frame(data1,stringsAsFactors=FALSE)
data1$"Date/Time" <- paste(data1$Date,data1$Time)
data1$"Date/Time" <- strptime(data1$"Date/Time","%d/%m/%Y %H:%M:%S")

hist(data1$Global_active_power,col="red",main="Global Active Power",xlab='Global Active Power(kilowatts)',breaks=12,xlim=c(0,6), ylim=c(0,1200))
