library(data.table)
source("fileUtils.R")

# Code on fileUtils.R
# Ensure Data relative path, download and unzip household_power_consumption file if neccesary.
getDataFiles() 

# Read files for 2007-02-01 and 2007-02-02 dates only
loadData()

# plotCode
png(file = "plot3.png",width = 480, height = 480)
plot(data$V2,data$V7, type="l",ylab = "Energy sub metering",xlab="")
points(data$V2,data$V8, type="l",col="red")
points(data$V2,data$V9, type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"), lty=1)
dev.off() 