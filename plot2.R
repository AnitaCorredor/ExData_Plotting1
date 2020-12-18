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
png(filename = "plot2.png", width=480, height=480, units="px")
plot(data$DateTime, data$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
