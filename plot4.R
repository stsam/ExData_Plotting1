plot4 <- function(file = "household_power_consumption.txt"){
    ## Read the data file and store in hpc
    hpc <- read.table(file, header=TRUE, sep=";", na.strings="?")
    
    ## Store the data for February 1st and 2nd on 2007
    analyData <- subset(hpc, hpc$Date=="1/2/2007"| hpc$Date=="2/2/2007")
    
    ## Modify data for datetime
    analyData$Date <- as.Date(analyData$Date, "%d/%m/%Y" )
    analyData$dt <- paste(analyData$Date, analyData$Time)
    analyData$datetime <- as.POSIXct(analyData$dt)
    
    
    ## Open a PNG graphic device, output the plot to it and then close the device
    png("plot4.png", width = 480, height = 480)
    par(mfrow=c(2,2), mar=c(4,4,1,1))
    
    ##Plot the 4 plots
    with(analyData, {
       plot(datetime, Global_active_power, type="l",
            ylab="Global Active Power (kilowatts)", xlab="")
       plot(datetime, Voltage, type="l",
            ylab="Voltage", xlab="datetime")
       plot(datetime, Sub_metering_1, type="l",
             ylab="Energy Sub metering", xlab="")
        lines(datetime,Sub_metering_2, col='Red')
        lines(datetime,Sub_metering_3, col='Blue')
       legend("topright",col=c("Black","Red","Blue"), 
              legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
              lty=1, lwd=2, bty="n")
       plot(datetime, Global_reactive_power, type="l", xlab="datetime")
    })
    
    dev.off()
    
}
