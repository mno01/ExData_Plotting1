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

#plot2.png
FebSubset$DateTime <- as.POSIXct(paste(FebSubset$Date, FebSubset$Time)) #add DateTime field


png(file = 'plot2.png')

Plot2 <- plot(FebSubset$DateTime,FebSubset$Global_active_power, ylab= "Global Active Power (kilowatts)", 
              type = "l", xlab= " " )

dev.off()
