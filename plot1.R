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

# Creating plot1.png
png("plot1.png", width = 480, height = 480)
hist(hpc$Global_active_power, col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (Kilowatts)")
dev.off()