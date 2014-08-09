plot2 <- function(file = "household_power_consumption.txt"){
    ## Read the data file and store in hpc
    hpc <- read.table(file, header=TRUE, sep=";", na.strings="?")
    
    ## Store the data for February 1st and 2nd on 2007
    analyData <- subset(hpc, hpc$Date=="1/2/2007"| hpc$Date=="2/2/2007")
    
    ## Modify data for datetime
    analyData$Date <- as.Date(analyData$Date, "%d/%m/%Y" )
    analyData$dt <- paste(analyData$Date, analyData$Time)
    analyData$datetime <- as.POSIXct(analyData$dt)
    
    
    ## Open a PNG graphic device, output the plot to it and then close the device
    png("plot2.png", width = 480, height = 480)
   
    plot(analyData$datetime, analyData$Global_active_power, type="l",
         ylab="Global Active Power (kilowatts)", xlab="")
    
    dev.off()

}

