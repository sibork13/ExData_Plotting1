# Importing libraries
library(data.table)#
library(dplyr)

# Reading file
df<-fread("D:/Oscar/Documents/R/DATASETS/household_power_consumption.txt")

df$Date<-as.Date(df$Date,format="%d/%m/%Y")
# Selecting only special data
df<-filter(df,Date>="2007-02-01" & Date<="2007-02-02")
# Concatenate two columns in one
NewCol<-paste(df$Date,df$Time)
# Eliminate these columns
df<-select(df,-(c("Date","Time")))
# Merge new column
df<-cbind(NewCol,df)
names(df)[1]<-c("Date_Time")
# Change class
df$Date_Time<-as.POSIXct(df$Date_Time)
#Creane PNG file
png("plot4.png", width = 480, height = 480, units = "px")


par(mfrow=c(2,2))

with(df,{
          plot(Global_active_power~Date_Time,type="l",ylab="Global Active Power (kilowatts)",xlab="")


          plot(Voltage~Date_Time,type="l",ylab="Voltage",xlab="datetime")

          plot(Sub_metering_1~Date_Time,type="l",ylab="Energy Sub Meeting",xlab="",col="black")
        lines(Sub_metering_2~Date_Time,type="l",col="red")
        lines(Sub_metering_3~Date_Time,type="l",col="blue")
        legend("topright",legend=c("Sub_metering_1","Sub_metering_2","sub_meterong_3"),col=c("black","red","blue"),lwd=c(1,1,1))



          plot(Global_reactive_power~Date_Time,type="l",xlab="datetime")
})


dev.off()
