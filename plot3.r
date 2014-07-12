data<-read.table('household_power_consumption.txt',sep=';',header=T)
date <- as.Date(data$Date,format='%d/%m/%Y')
num <- as.character(date)
num <- as.numeric(strftime(strptime(num,'%Y-%m-%d'),'%Y%m%d'))
startDate <- as.numeric(strftime(strptime('2007-02-01','%Y-%m-%d'),'%Y%m%d'))
endDate <- as.numeric(strftime(strptime('2007-02-02','%Y-%m-%d'),'%Y%m%d'))
thurs <- num==startDate
fri <- num==endDate

##########################################################################################

x1.1<- data$Time[thurs]
y1.1<- data$Sub_metering_1[thurs]
day1.1 <- data$Date[thurs]
dateTime1.1 <- paste(day1.1,x1.1)


x1.2<- data$Time[fri]
y1.2<- data$Sub_metering_1[fri]
day1.2 <- data$Date[fri]
dateTime1.2 <- paste(day1.2,x1.2)

Sub_metering_1_X <- c(dateTime1.1,dateTime1.2)
Sub_metering_1_Y <- c(as.numeric(as.character(y1.1)),as.numeric(as.character(y1.2)))

##########################################################################################

x2.1<- data$Time[thurs]
y2.1<- data$Sub_metering_2[thurs]
day2.1 <- data$Date[thurs]
dateTime2.1 <- paste(day2.1,x2.1)


x2.2<- data$Time[fri]
y2.2<- data$Sub_metering_2[fri]
day2.2 <- data$Date[fri]
dateTime2.2 <- paste(day2.2,x2.2)

Sub_metering_2_X <- c(dateTime2.1,dateTime2.2)
Sub_metering_2_Y <- c(as.numeric(as.character(y2.1)),as.numeric(as.character(y2.2)))


##########################################################################################

x3.1<- data$Time[thurs]
y3.1<- data$Sub_metering_3[thurs]
day3.1 <- data$Date[thurs]
dateTime3.1 <- paste(day3.1,x3.1)


x3.2<- data$Time[fri]
y3.2<- data$Sub_metering_3[fri]
day3.2 <- data$Date[fri]
dateTime3.2 <- paste(day3.2,x3.2)

Sub_metering_3_X <- c(dateTime3.1,dateTime3.2)
Sub_metering_3_Y <- c(as.numeric(as.character(y3.1)),as.numeric(as.character(y3.2)))

png(filename='plot3.png',width=480,height=480)

plot(strptime(Sub_metering_1_X,format='%d/%m/%Y %H:%M:%S'),Sub_metering_1_Y,type='l',xlab='',ylab='Energy sub metering')
points(strptime(Sub_metering_2_X,format='%d/%m/%Y %H:%M:%S'),Sub_metering_2_Y, type='l',col='red')
points(strptime(Sub_metering_3_X,format='%d/%m/%Y %H:%M:%S'),Sub_metering_3_Y, type='l',col='blue')
legend('topright',c('Sub_metering_1','Sub_metering_2', 'Sub_metering_3'),col=c('black','red','blue') ,lty=c(1,1,1))

dev.off()