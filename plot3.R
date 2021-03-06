#IMPORTANT NOTE: if you already ran the script "plot1.R" you don't need to run all the commands here
#JUST RUN FROM LINE 24 (#PLOT3)

#SET WORKING DIRECTORY
setwd("~/DataScienceCourses/Data Science - Coursera/Course 4 - Exploratory Data Analysis")

#LOAD PACKAGES
library(httr); library(plyr); library(data.table); library(dplyr); library(Hmisc); library(stringr)
library(reshape2); library(tidyr);library(lubridate); library(lattice); library(ggplot2)

#LOAD DATA and SUBSET FOR REQUESTED DATES
general_data <- fread("household_power_consumption.txt", stringsAsFactors = FALSE, sep = ";", na.strings = "?")
subset_data <- filter(general_data, Date == "1/2/2007" | Date == "2/2/2007" )

#CONVERT COLUMNS TO NUMERIC
subset_data$Global_active_power <- as.numeric(subset_data$Global_active_power)
subset_data$Global_reactive_power <- as.numeric(subset_data$Global_reactive_power)
subset_data$Voltage <- as.numeric(subset_data$Voltage)
subset_data$Global_intensity <- as.numeric(subset_data$Global_intensity)
subset_data$Sub_metering_1 <- as.numeric(subset_data$Sub_metering_1)
subset_data$Sub_metering_2 <- as.numeric(subset_data$Sub_metering_2)
subset_data$Sub_metering_3 <- as.numeric(subset_data$Sub_metering_3)

#PLOT 3 - CREATE SUBMETERING PLOT
# create first plot, and add the two extra lines as well as legend
png(file = "plot3.png")
plot(strptime(subset_data$DateTime, "%d/%m/%Y %H:%M:%S"), 
     subset_data$Sub_metering_1, 
     xlab = "", ylab = "Energy sub metering",
     type = "l")
lines(strptime(subset_data$DateTime, "%d/%m/%Y %H:%M:%S"), 
      subset_data$Sub_metering_2, col = "red")
lines(strptime(subset_data$DateTime, "%d/%m/%Y %H:%M:%S"), 
      subset_data$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
