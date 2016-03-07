#Importing data
my_dbset <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
#Subsetting
my_subset <- my_dbset[my_dbset$Date == "1/2/2007" | my_dbset$Date == "2/2/2007",]
#Re-formatting the subset
my_subset$Time <- strptime(paste(my_subset$Date, my_subset$Time), "%d/%m/%Y %H:%M:%S")
my_subset$Date <- as.Date(my_subset$Date, "%d/%m/%Y")
#Plotting
with(my_subset,plot(Time,Sub_metering_1,type="l",col = "black", xlab = "", ylab="Energy Sub Metering"))
with(my_subset,lines(Time,Sub_metering_2, col = "red"))
with(my_subset,lines(Time,Sub_metering_3, col = "blue"))
legend("topright", col=c("black","red","blue"), c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),lty=c(1,1), lwd=c(1,1))
#Making the png
dev.copy(png, file="plot3.png", width=480, height=480)
#Closing the device
dev.off()