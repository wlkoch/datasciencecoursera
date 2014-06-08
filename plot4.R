##################################################################################
## Data Science Specialization, Coursera                                        ##
##                                                                              ##
## Exploratory Data Analysis, Roger Peng                                        ##
##                                                                              ##
## Project 1, Plot 4                                                            ##
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




############ Plot 4 ###########

# y-axis variables used in plots must be converted from factor to numeric class

HH_Pwr$Global_active_power <- as.numeric(paste(HH_Pwr$Global_active_power))
HH_Pwr$Global_reactive_power <- as.numeric(paste(HH_Pwr$Global_reactive_power))
HH_Pwr$Voltage <- as.numeric(paste(HH_Pwr$Voltage))
HH_Pwr$Sub_metering_1 <- as.numeric(paste(HH_Pwr$Sub_metering_1))
HH_Pwr$Sub_metering_2 <- as.numeric(paste(HH_Pwr$Sub_metering_2))
HH_Pwr$Sub_metering_3 <- as.numeric(paste(HH_Pwr$Sub_metering_3))


# X-axis variable used in plot must be converted from time and date factor
# variables to POSIXct format for R to be able to use in plotting

datetime_string <- paste(	as.character(HH_Pwr$Date), 
					as.character(HH_Pwr$Time))

HH_Pwr$datetime <- strptime(datetime_string, "%d/%m/%Y %H:%M:%S")


# Set up plotting area and output device

png("plot4.png", width = 480, height = 480)
par(mfcol = c(2, 2))


# Entire plotting output consists of four plots in the same space


# Call plotting function to create plot for Column 1, Row 1

plot(	HH_Pwr$datetime,
	HH_Pwr$Global_active_power,
	type = "l",
	xlab = "",
	ylab="Global Active Power",
	cex.lab = 0.75)

# Label entire plot

mtext("Plot 4",
	side = 3,
	adj = 0,
	font = 2,
	line = 3)



# Call plotting function to create plot for Column 1, Row 2

plot(	HH_Pwr$datetime,
	HH_Pwr$Sub_metering_1,
	type = "l",
	xlab = "",
	ylab="Energy sub metering",
	cex.lab = 0.75)

points(HH_Pwr$datetime,
	HH_Pwr$Sub_metering_2,
	type = "l",
	col="Red")

points(HH_Pwr$datetime,
	HH_Pwr$Sub_metering_3,
	type = "l",
	col="Blue")

legend(	"topright", 
		c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
		col = c("black", "red", "blue"),
		lty = c(1, 1, 1),
		cex = 0.75,
		bty = "n"
)


# Call plotting function to create plot for Column 2, Row 1

plot(	HH_Pwr$datetime,
	HH_Pwr$Voltage,
	type = "l",
	xlab = "datetime",
	ylab="Voltage",
	cex.lab = 0.8)



# Call plotting function to create plot for Column 2, Row 2

plot(	HH_Pwr$datetime,
	HH_Pwr$Global_reactive_power,
	type = "l",
	xlab = "datetime",
	ylab="Global_reactive_power",
	cex.lab = 0.8)



# tick mark lables need to be modified - labels added and resized

ticks <- c(0.0, 0.1, 0.2, 0.3, 0.4, 0.5)
lbls <- c("0.0", "0.1", "0.2", "0.3", "0.4", "0.5")
axis(side = 2, at = ticks, labels = lbls, cex.axis = 1.0, col.axis = "white")


ticks <- c(0.0, 0.1, 0.2, 0.3, 0.4, 0.5)
lbls <- c("0.0", "0.1", "0.2", "0.3", "0.4", "0.5")
axis(side = 2, at = ticks, labels = lbls, cex.axis = .85, col.axis = "black")


# close plotting device

dev.off()



