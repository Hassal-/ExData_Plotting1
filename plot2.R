library(data.table)
source("fileUtils.R")

# Code on fileUtils.R
# Ensure Data relative path, download and unzip household_power_consumption file if neccesary.
getDataFiles() 

# Read files for 2007-02-01 and 2007-02-02 dates only
loadData()

# plotCode
png(file = "plot2.png",width = 480, height = 480)
plot(data$V2,data$V3, type="l",ylab = "Global Active Power (kilowatts)",xlab="")
dev.off() 