#Importing data
my_dbset <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
#Subsetting
my_subset <- my_dbset[my_dbset$Date == "1/2/2007" | my_dbset$Date == "2/2/2007",]
#Re-formatting the subset
my_subset$Time <- strptime(paste(my_subset$Date, my_subset$Time), "%d/%m/%Y %H:%M:%S")
my_subset$Date <- as.Date(my_subset$Date, "%d/%m/%Y")
#Plotting
with(my_subset, hist(Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kW)"))
#Making the png
dev.copy(png, file="plot1.png", width=480, height=480)
#Closing the device
dev.off()