##################################################################################
## Data Science Specialization, Coursera                                        ##
##                                                                              ##
## Exploratory Data Analysis, Roger Peng                                        ##
##                                                                              ##
## Project 1, Plot 2                                                            ##
##################################################################################


# Data used for the project come from the UC Irvine Machine Learning Repository #
# Specifically, the “Individual household electric power consumption Data Set”  #
# Measurements for the plots consist of a sample of electric power consumption  # 
# in one household with a one-minute sampling rate over a two day period.       #
# Different electrical quantities and some sub-metering values are available.   #
# Data and Time variables must be converted for plotting purposes along with    #
# the power readings.                                                           #


#  set directory to R code files

setwd("C:/Research/Coursera/DataScientist_Series/Class_05_ExploratoryDataAnalysis/Project_1/")


# Read in main data file

file_name <- "UCI_HH_Pwr_Consumption_Uncompressed/household_power_consumption.txt"
main_data <- read.csv2(file_name, header = TRUE)


# Only look at two days worth of power readings

HH_Pwr <- subset(	main_data, 
			as.Date(Date, "%d/%m/%Y") == "2007-02-01" | as.Date(Date, "%d/%m/%Y") == "2007-02-02" )



############ Plot 2 ###########


# y-axis variable used in plot must be converted from factor to numeric class

HH_Pwr$Global_active_power <- as.numeric(paste(HH_Pwr$Global_active_power))


# Set up plotting area and output device

par(mfrow = c(1, 1))
png("plot2.png", width = 480, height = 480)


# X-axis variable used in plot must be converted from time and date factor
# variables to POSIXct format for R to be able to use in plotting

datetime_string <- paste(	as.character(HH_Pwr$Date), 
					as.character(HH_Pwr$Time))

HH_Pwr$datetime <- strptime(datetime_string, "%d/%m/%Y %H:%M:%S")



# call plotting function to create plot in required format

plot(	HH_Pwr$datetime,
	HH_Pwr$Global_active_power,
	type = "l",
	xlab = "",
	ylab="Global Active Power (kilowatts)")


# Label plot

mtext("Plot 2",
	side = 3,
	adj = 0,
	font = 2,
	line = 2,
	cex = 1.5)


# close plotting device

dev.off()


