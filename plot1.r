data<-read.table('household_power_consumption.txt',sep=';',header=T)
date <- as.Date(data$Date,format='%d/%m/%Y')
num <- as.character(date)
num <- as.numeric(strftime(strptime(num,'%Y-%m-%d'),'%Y%m%d'))
startDate <- as.numeric(strftime(strptime('2007-02-01','%Y-%m-%d'),'%Y%m%d'))
endDate <- as.numeric(strftime(strptime('2007-02-02','%Y-%m-%d'),'%Y%m%d'))
truth <- num==startDate | num==endDate

x_ <- data$Global_active_power[truth]

png(filename='plot1.png',width=480,height=480)

hist(as.numeric(as.character(x_)), xlab='Global Active Power (kilowatts)', main='Global Active Power', col='red')

dev.off()
