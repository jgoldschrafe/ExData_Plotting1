# Read the data
data <- read.table('household_power_consumption.txt', header = TRUE, sep = ';', stringsAsFactors = FALSE)
sub <- subset(data, Date == '1/2/2007' | Date == '2/2/2007')
datetimeStrs <- paste(sub$Date, sub$Time, sep = ' ')
Datetime <- strptime(datetimeStrs, "%d/%m/%Y %H:%M:%S")
sub <- cbind(sub, Datetime)
sub$Global_active_power <- as.numeric(sub$Global_active_power)

# Create the plot
png("plot2.png", width = 504, height = 504)
plot(sub$Datetime, sub$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power")
dev.off()