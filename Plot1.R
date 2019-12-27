
#use sqldf packge to read data in and apply filter.
install.packages("sqldf")
library(sqldf)

#set working directory
setwd("~/R Programming/R project/Course Project/Exploratory Data Analysis/Week 1")

#save txt file into a variable.
tempdata <-"household_power_consumption.txt"

#define connection
fi <-file(tempdata)

#read data into a data frame -df and filter only the required dataset.
df <-sqldf("select * from fi where Date in ('1/2/2007','2/2/2007')", file.format =list(header=TRUE, sep=";"))

#code to make plot1
hist(df$Global_active_power, xlab = "Global Active Power (kilowatts)", col = "red", main = "Global Active Power")

#write to file.
dev.copy(png, "plot1.png", width=480, height=480)
dev.off()