file_name <- "household_power_consumption.txt"
# Load data
power_data <- read.csv(file, header=TRUE, sep=';', 
                       na.strings="?", nrows=2075259, check.names=FALSE, 
                       stringsAsFactors=FALSE, comment.char="", quote='\"')

# Convert Date column to Date format
power_data$Date <- as.Date(power_data$Date, format="%d/%m/%Y")

# Filter data for the required date range
filtered_data <- subset(power_data, Date >= "2007-02-01" & Date <= "2007-02-02")

# Remove full dataset from memory to save space
rm(power_data)

# Create a datetime column
filtered_data$Datetime <- as.POSIXct(paste(filtered_data$Date, filtered_data$Time))

# Generate plot
plot(filtered_data$Datetime, filtered_data$Global_active_power, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

# Save plot as PNG
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()