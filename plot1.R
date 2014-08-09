plot1 <- function(file = "household_power_consumption.txt"){
    ## Read the data file and store in hpc
    hpc <- read.table(file, header=TRUE, sep=";", na.strings="?")
    
    ## Store the data for February 1st and 2nd on 2007
    analysisData <- subset(hpc, hpc$Date=="1/2/2007"| hpc$Date=="2/2/2007")
     
    ## Open a PNG graphic device, output the plot to it and then close the device
    png("plot1.png", width = 480, height = 480)
    hist(analysisData$Global_active_power,col = "red", 
         main = "Global Active Power", xlab = "Global Active Power (kilowatts)", 
         ylab = "Frequency")
    dev.off()
}