#-------------------------------------------------------------------#
# read data
#-------------------------------------------------------------------#
library(sqldf) # in order to query data by dates
query <- "select * from file WHERE Date ='1/2/2007' OR  Date='2/2/2007'"
data <- read.csv.sql("household_power_consumption.txt", sql= query, sep = ";") 
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

#-------------------------------------------------------------------#
# plot
#-------------------------------------------------------------------#
png(filename = "plot4.png", width=480, height=480, units="px")

# Configure multiplot
par(mfrow=c(2,2))

# plot 1
plot(data$DateTime, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
# plot 2
plot(data$DateTime, data$Voltage, type="l", xlab= "datetime", ylab= "Voltage")
# plot 3
plot(data$DateTime, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(data$DateTime, data$Sub_metering_2, col= "red")
lines(data$DateTime, data$Sub_metering_3, col= "blue")
legend ('topright', legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_2'),
        lwd=c(1,1,1),col=c('black','red','blue'),bty='n',pt.cex=.5)
# plot 4
plot(data$DateTime, data$Global_reactive_power,type= "l" ,xlab= "datetime")

dev.off()
