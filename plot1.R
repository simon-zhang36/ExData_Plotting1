unzip("./data/exdata-data-household_power_consumption.zip",files='./data',unzip = 'internal')
data <- read.table("./data/household_power_consumption.txt",head=TRUE,sep=";",na.strings="?",as.is=TRUE)
data1 <- subset(data,Date=="1/2/2007" | Date=="2/2/2007")
Date.Time <- strptime(paste(data1$Date,data1$Time),"%d/%m/%Y %H:%M:%S")
data1 <- cbind(Date.Time,data1)
names(data1)[1] <- "Date/Time"


png(filename="plot1.png",width=480,height=480,units="px")
hist(data1$Global_active_power,col="red",
     main="Global Active Power",
     xlab='Global Active Power(kilowatts)',
     breaks=16,  ylim=c(0,1200),xaxt="n")
axis(1,at=seq(0,6,2))
dev.off()

