################################################################################
######## Data Scientist Series - Class 03 - Getting and Cleaning Data ##########
######## Data Scientist Series - Class 03 - Getting and Cleaning Data ##########
################################################################################
################################################################################

################################################################################
############################ Tidy Data Project #################################
############################ Tidy Data Project #################################
############################ Tidy Data Project #################################
############################ Tidy Data Project #################################
############################ Tidy Data Project #################################
################################################################################


library(stringr)

## read in activity lables (6) and features (561)

## read in activity labels to be used as factors in final data sets
activity_labels <- read.table("activity_labels.txt")

## read in sensor feature labels to be used as column names in the final data sets
features <- read.table("features.txt",
				col.names = c("featureNum", "featureDesc"))


## read in test subject id
test_subj_id <- read.table(	"subject_test.txt",
					col.names = "subject")

## add variable indicating subject is in the test group
test_subj_id["subjGroup"] <- 1



## read in acivity per test subject sample
test_act_id <- read.table(	"y_test.txt",
					col.names = "activity")


## read in main sensor data for test data
test_main_data <- read.table(	"X_test.txt",
					col.names = features$featureDesc)



## Define columns in main sensor data to keep - only mean and standard deviation measurements
keep <- c(	    1:6,
		  41:46,
		  81:86,
		121:126,
		161:166,
		201:202,
		214:215,
		227:228,
		240:241,
		253:254,
		266:271,
		294:296,
		345:350,
		373:375,
		424:429,
		452:454,
		503:504,
		513,
		516:517,
		526,
		529:530,
		539,
		542:543,
		552)

## create sensor test data set with only Mean and Std measurement data
test_sensor_data <- test_main_data[keep]


## combine the test data frames by column
final_test_data <- cbind(test_subj_id, test_act_id, test_sensor_data)








## read in training subject id
train_subj_id <- read.table(	"subject_train.txt",
					col.names = "subject")

# add variable indicating subject is in the training group
train_subj_id["subjGroup"] <- 0



## read in acivity per training subject sample
train_act_id <- read.table(	"y_train.txt",
					col.names = "activity")


## read in main sensor data for training data
train_main_data <- read.table("X_train.txt",
					col.names = features$featureDesc)

## create sensor test data set with only Mean and Std measurement data
train_sensor_data <- train_main_data[keep]


## combine the train data frames by column
final_train_data <- cbind(train_subj_id, train_act_id, train_sensor_data)


## combine training and test data by rows
final_train_test_data <- rbind(final_test_data, final_train_data)



## add factor label to activity
final_train_test_data$activity <- factor(	final_train_test_data$activity,
							levels = c(1,2,3,4,5,6),
							labels = c(	"WALKING",
									"WALKING_UPSTAIRS",
									"WALKING_DOWNSTAIRS",
									"SITTING",
									"STANDING",
									"LAYING")) 

## add factor label to subject group
final_train_test_data$subjGroup <- factor(final_train_test_data$subjGroup,
							levels = c(0,1),
							labels = c(	"train",
									"test")) 


## rename variables to remove extraneous characters
names(final_train_test_data) <- str_replace(names(final_train_test_data), "mean", "Mean")
names(final_train_test_data) <- str_replace(names(final_train_test_data), "std", "Std")
names(final_train_test_data) <- str_replace_all(names(final_train_test_data), "[.]", "")






## split the data by activity
s_activity <- split(	final_train_test_data,
				final_train_test_data$activity)

## split the data by subject
s_subject <- split(	final_train_test_data,
				final_train_test_data$subject)


## define columns to be manipulated by sapply
dtcols <-c( "tBodyAccMeanX",	  		  "tBodyAccMeanY",		    "tBodyAccMeanZ",               
		"tBodyAccStdX", 			  "tBodyAccStdY",                 "tBodyAccStdZ",                
		"tGravityAccMeanX",             "tGravityAccMeanY",             "tGravityAccMeanZ",            
		"tGravityAccStdX",              "tGravityAccStdY",              "tGravityAccStdZ",             
		"tBodyAccJerkMeanX",            "tBodyAccJerkMeanY",            "tBodyAccJerkMeanZ",           
		"tBodyAccJerkStdX",             "tBodyAccJerkStdY",             "tBodyAccJerkStdZ",            
		"tBodyGyroMeanX",               "tBodyGyroMeanY",               "tBodyGyroMeanZ",              
		"tBodyGyroStdX",                "tBodyGyroStdY",                "tBodyGyroStdZ",               
		"tBodyGyroJerkMeanX",           "tBodyGyroJerkMeanY",           "tBodyGyroJerkMeanZ",          
		"tBodyGyroJerkStdX",            "tBodyGyroJerkStdY",            "tBodyGyroJerkStdZ",           
		"tBodyAccMagMean",              "tBodyAccMagStd",               "tGravityAccMagMean",          
		"tGravityAccMagStd",            "tBodyAccJerkMagMean",          "tBodyAccJerkMagStd",          
		"tBodyGyroMagMean",             "tBodyGyroMagStd",              "tBodyGyroJerkMagMean",        
		"tBodyGyroJerkMagStd",          "fBodyAccMeanX",                "fBodyAccMeanY",               
		"fBodyAccMeanZ",                "fBodyAccStdX",                 "fBodyAccStdY",                
		"fBodyAccStdZ",                 "fBodyAccMeanFreqX",            "fBodyAccMeanFreqY",           
		"fBodyAccMeanFreqZ",            "fBodyAccJerkMeanX",            "fBodyAccJerkMeanY",           
		"fBodyAccJerkMeanZ",            "fBodyAccJerkStdX",             "fBodyAccJerkStdY",            
		"fBodyAccJerkStdZ",             "fBodyAccJerkMeanFreqX",        "fBodyAccJerkMeanFreqY",       
		"fBodyAccJerkMeanFreqZ",        "fBodyGyroMeanX",               "fBodyGyroMeanY",              
		"fBodyGyroMeanZ",               "fBodyGyroStdX",                "fBodyGyroStdY",               
		"fBodyGyroStdZ",                "fBodyGyroMeanFreqX",           "fBodyGyroMeanFreqY",          
		"fBodyGyroMeanFreqZ",           "fBodyAccMagMean",              "fBodyAccMagStd",              
		"fBodyAccMagMeanFreq",          "fBodyBodyAccJerkMagMean",      "fBodyBodyAccJerkMagStd",      
		"fBodyBodyAccJerkMagMeanFreq",  "fBodyBodyGyroMagMean",         "fBodyBodyGyroMagStd",         
		"fBodyBodyGyroMagMeanFreq",     "fBodyBodyGyroJerkMagMean",     "fBodyBodyGyroJerkMagStd",     
		"fBodyBodyGyroJerkMagMeanFreq")

## find the mean for each sensor data variable by activity 
mean_activity <- sapply(s_activity,
				function(x) colMeans( x[, dtcols],
				na.rm = TRUE))

## find the mean for each sensor data variable by subject 
mean_subject <- sapply(	s_subject,
				function(x) colMeans( x[, dtcols],
				na.rm = TRUE))

## combine the above mean-summation data into one data frame with 
## row either a single activity or a single subject
## each column is the average value for the sensor data point by 
## either subject or activity
mean_subj_activity <- rbind(	data.frame(t(mean_activity)),
					data.frame(t(mean_subject))   )



## write out the resulting data sets to the working directory
write.table(final_train_test_data, "train_test_data.txt")
write.table(mean_subj_activity, "mean_subj_activity.txt")
















