library(data.table)
source("fileUtils.R")
 
# Code on fileUtils.R
# Ensure Data relative path, download and unzip household_power_consumption file if neccesary.
getDataFiles() 

# Read files for 2007-02-01 and 2007-02-02 dates only
loadData()

# plotCode
png(file = "plot1.png",width = 480, height = 480,bg="transparent") 
hist(data$V3, xlab = "Global Active Power (kilowatts)", main="Global Active Power", col="red")
dev.off() 