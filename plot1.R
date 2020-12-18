#-------------------------------------------------------------------#
# read data
#-------------------------------------------------------------------#
library(sqldf) # in order to query data by dates
query <- "select * from file WHERE Date ='1/2/2007' OR  Date='2/2/2007'"
data <- read.csv.sql("household_power_consumption.txt", sql= query, sep = ";") 

#-------------------------------------------------------------------#
# plot
#-------------------------------------------------------------------#
png(filename = "plot1.png", width=480, height=480, units="px")
hist(data$Global_active_power, main='Global Active Power', xlab="Global Active Power (kilowatts)",col='red')
dev.off()
