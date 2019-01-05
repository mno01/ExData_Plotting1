#Exploratory Data Analysis: Course Project 1
#Data Source: UC Irvine Machine Learning Repository
#Data Set: "Individual household electric power consumption Data Set" 
#Description: Measurements of electric power consumption in one household with a one-minute sampling rate over a period of almost 4 years. 
##Different electrical quantities and some sub-metering values are available.


#Read text file
Household_Pwr_Consump <- read.csv("./household_power_consumption.txt", header= TRUE, sep= ';',
                                  na.strings = '?')

#Declare start (Date1) and end (Date2) dates
Date1 <- as.Date('2007-02-01')
Date2 <- as.Date('2007-02-02')


#Convert Date column from factor to characer to date
Household_Pwr_Consump$Date <- as.Date(as.character(Household_Pwr_Consump$Date),format = "%d/%m/%Y")

#Subset the date range (between Date1 and Date2) for plot1 analysis
FebSubset <- Household_Pwr_Consump[Household_Pwr_Consump$Date >= Date1 & Household_Pwr_Consump$Date <= Date2,]


#Add DateTime field
FebSubset$DateTime <- as.POSIXct(paste(FebSubset$Date, FebSubset$Time)) 



#plot4.png

png(file = 'plot4.png')

par(mfcol = c(2,2), mar = c(4.0, 4.5, 1.0, 2.1))
plot(FebSubset$DateTime,FebSubset$Global_active_power, ylab= "Global Active Power", 
     type = "l", xlab= " " )

plot(FebSubset$DateTime, FebSubset$Sub_metering_1, type = "l", ylab= "Energy sub metering", xlab = "")
lines(FebSubset$DateTime, FebSubset$Sub_metering_2, col= "red")
lines(FebSubset$DateTime, FebSubset$Sub_metering_3, col= "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = c(1,1,1), col= c("black", "red", "blue"))

plot(FebSubset$DateTime,FebSubset$Voltage, type = "l", ylab = "Voltage", xlab= "datetime")

plot(FebSubset$DateTime,FebSubset$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()

