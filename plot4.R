unzip("./data/exdata-data-household_power_consumption.zip",files='./data',unzip = 'internal')
data <- read.delim('./household_power_consumption.txt',sep=";",na.strings='?')
data1 <- rbind(subset(data,data$Date == '1/2/2007'),subset(data,data$Date == '2/2/2007'))
data1 <- data.frame(data1,stringsAsFactors=FALSE)
data1$"Date/Time" <- paste(data1$Date,data1$Time)
data1$"Date/Time" <- strptime(data1$"Date/Time","%d/%m/%Y %H:%M:%S")

par(mfrow=c(2,2))
{
  plot(data1$"Date/Time",data1$Global_active_power,type='l',main='',xlab='',ylab = 'Global Active Power(kilowatts)')
  plot(data1$"Date/Time",data1$Voltage,type='l',main='',xlab='datatime',ylab='Voltage')
  {plot(data1$"Date/Time",data1$Sub_metering_1,type='l',col='black',ylab='Energy sub metering',xlab='')
    lines(data1$"Date/Time",data1$Sub_metering_2,type='l',col='red')
    lines(data1$"Date/Time",data1$Sub_metering_3,type='l',col='blue')
  }
  plot(data1$"Date/Time",data1$Global_reactive_power,type='l',xlab='datatime',ylab="Global_reactive_power")
  
}
