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

png("plot1.png", width = 480, height = 480)

hist(hpcSubset$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")

################# 
# Save PNG file 
#################

dev.off()
