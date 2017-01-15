# Reading the rellevant Data
header <- read.table("household_power_consumption.txt", 
                     header = FALSE, sep = ";", 
                     nrows = 1, stringsAsFactors = FALSE)
hpc <- read.table("household_power_consumption.txt", 
                  header = FALSE, sep = ";", 
                  stringsAsFactors = FALSE, skip = 66636, 
                  nrows = 2880)
names(hpc) <- header
rm(header)

# Creating the X Variable
DateTime <- strptime(paste(hpc$Date, hpc$Time, sep=" "), 
                     "%d/%m/%Y %H:%M:%S")

# Creating plot3.png
png("plot3.png", width = 480, height = 480)
plot(DateTime, hpc$Sub_metering_1, type = "l", 
     xlab = "", ylab = "Energy sub metering")
lines(DateTime, hpc$Sub_metering_2, col = "red")
lines(DateTime, hpc$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", 
                     "Sub_metering_3"), lty = 1, 
       col = c("black", "red", "blue"))
dev.off()