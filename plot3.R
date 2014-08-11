data <- read.delim('./data/household_power_consumption.txt',sep=";",na.strings='?')
data1 <- rbind(subset(data,data$Date == '1/2/2007'),subset(data,data$Date == '2/2/2007'))
data1 <- data.frame(data1,stringsAsFactors=FALSE)
data1$"Date/Time" <- paste(data1$Date,data1$Time)
data1$"Date/Time" <- strptime(data1$"Date/Time","%d/%m/%Y %H:%M:%S")

plot(data1$"Date/Time",data1$Sub_metering_1,type='l',col='black',ylab='Energy sub metering',xlab='')
lines(data1$"Date/Time",data1$Sub_metering_2,type='l',col='red')
lines(data1$"Date/Time",data1$Sub_metering_3,type='l',col='blue')
