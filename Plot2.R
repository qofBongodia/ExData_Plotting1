
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

#code to make plot2
plot(df$datetime, df$Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)")
#write to file.
dev.copy(png, "plot2.png", width=480, height=480)
dev.off()