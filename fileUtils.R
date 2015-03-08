ensureDataDir <- function() {
  if(!file.exists("./data")) {
    dir.create("./data")
  }
}

ensureDatafile <- function(aFilename,aURL,doUnzip=FALSE) {
  ensureDataDir()
  lDestDir <- "./data/"
  lDestFilename <- paste(lDestDir,aFilename, sep="")
  if(!file.exists(lDestFilename)) {
    download.file(
      url=aURL,
      destfile=lDestFilename,
      method="curl"
    )
  }  
  if(file.exists(lDestFilename) && doUnzip){
    lZippedFile <- unzip(lDestFilename, list=TRUE)$Name[1] 
    lZippedFilename <- paste(lDestDir,lZippedFile, sep="")
    if(!file.exists(lZippedFilename)){
      unzip(lDestFilename, files=lZippedFile, exdir=lDestDir, overwrite=TRUE)
    }    
  }   
}

getDataFiles <- function(){
  ensureDatafile(
    "household_power_consumption.zip",
    "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
    doUnzip=TRUE
  )
}
 
loadData <- function(){
  # 66638 first row of 2007-02-01, so skip 66637 (first is header)
  # 2880 rows with date 2007-02-01 and 2007-02-02 
  
  data <<- fread("./data/household_power_consumption.txt", skip=66637,nrow=2880)
  data[,V2:=as.POSIXct(paste(V1,V2), format="%d/%m/%Y %H:%M:%S")]
  data[,V1:=as.Date(V1,format="%d/%m/%Y")]
}
