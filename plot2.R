unzip("./data/exdata-data-household_power_consumption.zip",files='./data',unzip = 'internal')
data <- read.table('./household_power_consumption.txt',head=TRUE,sep=";",na.strings='?',as.is=TRUE)
data1 <- subset(data,Date=="1/2/2007" | Date=="2/2/2007")
Date.Time <- strptime(paste(data1$Date,data1$Time),"%d/%m/%Y %H:%M:%S")
data1 <- cbind(Date.Time,data1)
names(data1)[1] <- "Data/Time"

png(filename="plot2.png",width=480,height=480,units="px")
plot(data1[,"Date/Time"],data1$Global_active_power,
     type='l',main='',xlab='',ylab = 'Global Active Power(kilowatts)')
dev.off()
