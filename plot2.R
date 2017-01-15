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

# Creating plot2.png
png("plot2.png", width = 480, height = 480)
plot(DateTime, hpc$Global_active_power, type = "l", 
     xlab = "", ylab = "Global Active Power (Kilowatts)")
dev.off()