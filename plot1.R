#IMPORTANT NOTE: as this is the first plot, all commands must be run
# All loading/convert... codes are pasted in subsequent files (plot2.R, plot3 and plot4)
# So for the other files, you don't need to run the code again since libraries and data
# are already loaded

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

#PLOT 1 - CREATE HISTOGRAM AND SAVE TO PNG
png(file = "plot1.png")
hist(subset_data$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.off()
