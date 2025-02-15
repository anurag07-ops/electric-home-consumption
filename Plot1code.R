power_file<-"household_power_consumption.txt"
power_data<-read.table(power_file, header = TRUE, sep = ";", dec = ".", na.strings = "?")
power_data <- power_data[data$Date %in% c("1/2/2007","2/2/2007"), ]
power_data <- power_data[power_data$Date %in% c("1/2/2007","2/2/2007"), ]
hist(power_data[, 3], col = "red", main = "Global Active Power",xlab = "Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()