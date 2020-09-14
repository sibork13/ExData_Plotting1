library(data.table)#
# library(lubridate) # To better date variables manipulate
library(dplyr)


df<-fread("D:/Oscar/Documents/R/DATASETS/household_power_consumption.txt")
# df$Date<-dmy(df$Date) # This if we use lubridate library
df$Date<-as.Date(df$Date,format="%d/%m/%Y")
df<-filter(df,Date>="2007-02-01" & Date<="2007-02-02")
df$Global_active_power<-as.numeric(df$Global_active_power,na.rm=TRUE)
png("Plot1.png", width = 480, height = 480, units = "px")
hist(df$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.off()
