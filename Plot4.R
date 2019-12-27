
#use sqldf packge to read data in and apply filter.

library(sqldf)

#set working directory
setwd("~/R Programming/R project/Course Project/Exploratory Data Analysis/Week 1")

#save txt file into a variable.
tempdata <-"household_power_consumption.txt"

#define connection
fi <-file(tempdata)

#read data into a data frame -df and filter only the required dataset.
df <-sqldf("select * from fi where Date in ('1/2/2007','2/2/2007')", file.format =list(header=TRUE, sep=";", na.strings="?"))


#add variable datetime
df$datetime <-strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")

#code to make plot4
#set up plot window for 4 plots, 4x4.
par(mfcol=c(2,2))

#make first plot
plot(df$datetime, df$Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)")

#make second plot

plot(df$datetime, df$Sub_metering_1, type = "l", xlab ="", ylab="Energy sub metering")
lines(df$datetime, df$Sub_metering_2, type="l", col="red")
lines(df$datetime, df$Sub_metering_3, type="l", col="blue")

#Add legend
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col =c("black", "red", "blue"), lty=1)

#make third plot
plot(df$datetime, df$Voltage, type="l", xlab = "datetime", ylab = "Voltage")

#make fourth plot
plot(df$datetime, df$Global_reactive_power, type="l", xlab = "datetime", ylab = "Global_reactive_power")


#write to file.
dev.copy(png, "plot4.png", width=480, height=480)
dev.off()