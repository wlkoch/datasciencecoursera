##################################################################################
## Data Science Specialization, Coursera                                        ##
##                                                                              ##
## Exploratory Data Analysis, Roger Peng                                        ##
##                                                                              ##
## Project 1, Plot 3                                                            ##
##################################################################################


# Data used for the project come from the UC Irvine Machine Learning Repository #
# Specifically, the “Individual household electric power consumption Data Set”  #
# Measurements for the plots consist of a sample of electric power consumption  # 
# in one household with a one-minute sampling rate over a two day period.       #
# Different electrical quantities and some sub-metering values are available.   #
# Data and Time variables must be converted for plotting purposes along with    #
# the power readings.                                                           #


# set directory to R code files

setwd("C:/Research/Coursera/DataScientist_Series/Class_05_ExploratoryDataAnalysis/Project_1/")


# Read in main data file

file_name <- "UCI_HH_Pwr_Consumption_Uncompressed/household_power_consumption.txt"
main_data <- read.csv2(file_name, header = TRUE)


# Only look at two days worth of power readings

HH_Pwr <- subset(	main_data, 
			as.Date(Date, "%d/%m/%Y") == "2007-02-01" | as.Date(Date, "%d/%m/%Y") == "2007-02-02" )


############ Plot 3 ###########

# y-axis variables used in plot must be converted from factor to numeric class

HH_Pwr$Sub_metering_1 <- as.numeric(paste(HH_Pwr$Sub_metering_1))
HH_Pwr$Sub_metering_2 <- as.numeric(paste(HH_Pwr$Sub_metering_2))
HH_Pwr$Sub_metering_3 <- as.numeric(paste(HH_Pwr$Sub_metering_3))


# Set up plotting area and output device

par(mfrow = c(1, 1))
png("plot3.png", width = 480, height = 480)

# X-axis variable used in plot must be converted from time and date factor
# variables to POSIXct format for R to be able to use in plotting

datetime_string <- paste(	as.character(HH_Pwr$Date), 
					as.character(HH_Pwr$Time))

HH_Pwr$datetime <- strptime(datetime_string, "%d/%m/%Y %H:%M:%S")


# call plotting function to create plot in required format

plot(	HH_Pwr$datetime,
	HH_Pwr$Sub_metering_1,
	type = "l",
	xlab = "",
	ylab="Energy sub metering")

# overlay second variable on original plot

points(HH_Pwr$datetime,
	HH_Pwr$Sub_metering_2,
	type = "l",
	col="Red")

# overlay third variable on original plot

points(HH_Pwr$datetime,
	HH_Pwr$Sub_metering_3,
	type = "l",
	col="Blue")


# add legend to indicate name and color of each variable

legend(	"topright", 
		c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
		col = c("black", "red", "blue"),
		lty = c(1, 1, 1),
		cex = 0.75
)



# Label plot

mtext("Plot 3",
	side = 3,
	adj = 0,
	font = 2,
	line = 2,
	cex = 1.5)



# close plotting device

dev.off()

