unzip("./data/exdata-data-household_power_consumption.zip",files='./data',unzip = 'internal')
data <- read.table('./household_power_consumption.txt',head=TRUE,sep=";",na.strings='?',as.is=TRUE)
data1 <- subset(data,Date=="1/2/2007" | Date=="2/2/2007")
Date.Time <- strptime(paste(data1$Date,data1$Time),"%d/%m/%Y %H:%M:%S")
data1 <- cbind(Date.Time,data1)
names(data1)[1] <- "Data/Time"

png(filename="plot3.png",width=480,height=480,units="px")
plot(data1$"Date/Time",data1$Sub_metering_1,type='l',col='black',ylab='Energy sub metering',xlab='')
lines(data1$"Date/Time",data1$Sub_metering_2,type='l',col='red')
lines(data1$"Date/Time",data1$Sub_metering_3,type='l',col='blue')
legend("topright",lty=1,col=c('black','red','blue'),
       legend=names(data1)[8:10])
dev.off()