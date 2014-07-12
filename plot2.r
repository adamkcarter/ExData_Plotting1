data<-read.table('household_power_consumption.txt',sep=';',header=T)
date <- as.Date(data$Date,format='%d/%m/%Y')
num <- as.character(date)
num <- as.numeric(strftime(strptime(num,'%Y-%m-%d'),'%Y%m%d'))
startDate <- as.numeric(strftime(strptime('2007-02-01','%Y-%m-%d'),'%Y%m%d'))
endDate <- as.numeric(strftime(strptime('2007-02-02','%Y-%m-%d'),'%Y%m%d'))
thurs <- num==startDate
fri <- num==endDate

x<- data$Time[thurs]
y<- data$Global_active_power[thurs]
day1 <- data$Date[thurs]
dateTime <- paste(day1,x)


x2<- data$Time[fri]
y2<- data$Global_active_power[fri]
day2 <- data$Date[fri]
dateTime2 <- paste(day2,x2)


totalData <- c(dateTime,dateTime2)

totalY <- c(as.numeric(as.character(y)),as.numeric(as.character(y2)))

png(filename='plot2.png',width=480,height=480)

plot(strptime(totalData,format='%d/%m/%Y %H:%M:%S'),totalY,type='l',xlab='',ylab='Global Active Power (kilowatts)')


dev.off()