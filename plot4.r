##########################################
# Reading the data and selecting a subset
##########################################

dataFileName <- "C:\\Devel\\R\\Exploratory\\Proj1\\ExData_Plotting1\\household_power_consumption.txt"
hpc <- read.delim(dataFileName, sep=";", na.strings=c("?"))

# We are only interested in data for two dates
hpcSubset <- subset(hpc, hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007")

# Convert the Date and Time variables to a combined DateTime variable 
hpcSubset$DateTime <- strptime(paste(hpcSubset$Date,hpcSubset$Time), "%d/%m/%Y %H:%M:%S")

########################################
# Construct the plot on the 480x480 png
# This avoids cut-offs with legends etc.
########################################

png("plot4.png", width = 480, height = 480)

# Grid of 2 x 2 plots
par(mfrow=c(2,2))

# Top left Plot
plot(hpcSubset$DateTime, hpcSubset$Global_active_power,  type="l", ylab="Global Active Power (kilowatts)", xlab="")

# Top right plot
plot(hpcSubset$DateTime, hpcSubset$Voltage,  type="l", ylab="Voltage", xlab="datetime")

# Bottom left plot
xlim <- range(c(hpcSubset$DateTime))
ylim <- range(c(hpcSubset$Sub_metering_1, hpcSubset$Sub_metering_2, hpcSubset$Sub_metering_3))

plot(hpcSubset$DateTime, hpcSubset$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="", ylim=ylim)
lines(hpcSubset$DateTime, hpcSubset$Sub_metering_2, col="red")
lines(hpcSubset$DateTime, hpcSubset$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty=c(1,1,1), cex=0.75)

# Bottom right plot
plot(hpcSubset$DateTime, hpcSubset$Global_reactive_power,  type="l", ylab="Global_reactive_power", xlab="datetime")

################# 
# Save PNG file 
#################

dev.off()