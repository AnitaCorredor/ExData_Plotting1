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
png(filename = "plot3.png", width=480, height=480, units="px")
plot(data$DateTime, data$Sub_metering_1, type = "l",
     xlab = "", ylab = "Energy sub metering")
lines(data$DateTime, data$Sub_metering_2, col= "red")
lines(data$DateTime, data$Sub_metering_3, col= "blue")
legend("topright", 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=c(1,1,1), col=c("black", "red", "blue"))
dev.off()
