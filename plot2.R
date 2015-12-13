setwd('/Users/North_Point/Dropbox/MOOC/Data_Science/Exploratory_Analysis/week1/ExData_Plotting1')
library(data.table)
dat <- fread('household_power_consumption.txt')
subdat <- dat[dat$Date == '1/2/2007' |dat$Date == '2/2/2007',]
subdat[, date_time:= paste(subdat$Date,subdat$Time)]
glb = subdat$Global_active_power
glb_num = sapply(glb,as.numeric)
z = strptime(subdat$date_time, format = "%d/%m/%Y %H:%M:%S")
plot(z,glb_num,type = 'l',ylab = 'Global Active Power (kilowatts)', xlab = '')
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()
