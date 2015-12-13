setwd('/Users/North_Point/Dropbox/MOOC/Data_Science/Exploratory_Analysis/week1/ExData_Plotting1')
library(data.table)
dat <- fread('household_power_consumption.txt')
subdat <- dat[dat$Date == '1/2/2007' |dat$Date == '2/2/2007',]
subdat[, date_time:= paste(subdat$Date,subdat$Time)]
z = strptime(subdat$date_time, format = "%d/%m/%Y %H:%M:%S")
sm_1 = subdat$Sub_metering_1
sm_2 = subdat$Sub_metering_2
sm_3 = subdat$Sub_metering_3
png(filename = 'plot3.png',width = 480, height = 480)
plot(z,sm_1,type = 'l',ylab = 'Energy Sub Metering',xlab = ' ')
lines(z,sm_2,col = 'red')
lines(z,sm_3, col = 'blue')
legend("topright", legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),pch = '-',lwd = 2,col = c('black','red','blue'))
dev.off()
