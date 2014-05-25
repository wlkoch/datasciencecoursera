## Codebook for The datasets "train_test_data.txt"
## and "mean_subj_activity.txt"

# Sample observation description

Observations for the dataset were collected from 30 subjects divided into a "training" and "test" groups for statistical prediction analysis. Each subject had sample observations characterized by 6 physical movement activities consisting of: 

WALKING
WALKING_UPSTAIRS
WALKING_DOWNSTAIRS
SITTING
STANDING
LAYING

# Accelerometer and gyroscope sensor data variables

* Variables included in these datasets come from the HAR dataset (ver 1.0) that include data collected by a smartphone accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. The time domain signals variables begin with 't' and filtered with a median filter,  a 3rd order low pass Butterworth filter with a to remove noise. The acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter. 

* Body linear acceleration and angular velocity were then derived in time to obtain Jerk signals (tBodyAccJerk(XYZ) and tBodyGyroJerk(XYZ). 
* The magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

* a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc(XYZ), fBodyAccJerk(XYZ), fBodyGyro(XYZ), fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. Variables beginning with 'f' indicate frequency domain signals. 

* These signals were used to estimate variables of the feature vector for each pattern:  
'XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc(XYZ)
tGravityAcc(XYZ)
tBodyAccJerk(XYZ)
tBodyGyro(XYZ)
tBodyGyroJerk(XYZ)
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc(XYZ)
fBodyAccJerk(XYZ)
fBodyGyro(XYZ)
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

* The set of variables that were estimated from these signals and included in this modified dataset are: 

Mean: Mean value
Std: Standard deviation



The complete list of original variables of each feature vector from the original datatset from which these data files are derived, is available in the 'features.txt' for the HAR dataset at at www.smartlab.ws under "HAR Dataset"
