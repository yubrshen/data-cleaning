# code-book for human activity sensor feature data

## Introduction

This dataset is observations of sensor variables of huamn subjects' activities. Each observation records a subject, his/her activity at the moment of sensor signal recording, and a vector of features extracted from sensor data.

## How the dataset is produced

Here is the overal procedure to produce the dataset

1. Download the raw human activity sensor data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

2. Obtain the script run_analysis.R from the Github repository: place the script at a directory.

3. Extract the directory UCI HAR Dataset to the direcotry where you have the script run_analysis.R

4. In R session, source("./run_analysis.R"), assuming you have set the R session's working directory to the directory of run_analysis.R

5. The resulted dataset will be contained in file sensor_observation_mean_by_subject_and_activity.txt

More detailed information about the precedure of producing the data can be found in the script run_analysis.R

## Variable definition

* "subject"

The identification of human subject being observed and recorded in the observation.
It's numeric value from 1 to 30.

* "activity"

The activity label of the subject's activity being observed.
It's the following values

- WALKING

- WALKING_UPSTAIRS

- WALKING_DOWNSTAIRS

- SITTING

- STANDING

- LAYING

The following are features that may characterize subject's activity.
The features are the average of the corresponding features from the original observatios per subject and per activity

* "tBodyAcc-mean()-X"

* "tBodyAcc-mean()-Y"

* "tBodyAcc-mean()-Z"

* "tBodyAcc-std()-X"

* "tBodyAcc-std()-Y"

* "tBodyAcc-std()-Z"

* "tGravityAcc-mean()-X"

* "tGravityAcc-mean()-Y"

* "tGravityAcc-mean()-Z"

* "tGravityAcc-std()-X"

* "tGravityAcc-std()-Y"

* "tGravityAcc-std()-Z"

* "tBodyAccJerk-mean()-X"

* "tBodyAccJerk-mean()-Y"

* "tBodyAccJerk-mean()-Z"

* "tBodyAccJerk-std()-X"

* "tBodyAccJerk-std()-Y"

* "tBodyAccJerk-std()-Z"

* "tBodyGyro-mean()-X"

* "tBodyGyro-mean()-Y"

* "tBodyGyro-mean()-Z"

* "tBodyGyro-std()-X"

* "tBodyGyro-std()-Y"

* "tBodyGyro-std()-Z"

* "tBodyGyroJerk-mean()-X"

* "tBodyGyroJerk-mean()-Y"

* "tBodyGyroJerk-mean()-Z"

* "tBodyGyroJerk-std()-X"

* "tBodyGyroJerk-std()-Y"

* "tBodyGyroJerk-std()-Z"

* "tBodyAccMag-mean()"

* "tBodyAccMag-std()"

* "tGravityAccMag-mean()"

* "tGravityAccMag-std()"

* "tBodyAccJerkMag-mean()"

* "tBodyAccJerkMag-std()"

* "tBodyGyroMag-mean()"

* "tBodyGyroMag-std()"

* "tBodyGyroJerkMag-mean()"

* "tBodyGyroJerkMag-std()"

* "fBodyAcc-mean()-X"

* "fBodyAcc-mean()-Y"

* "fBodyAcc-mean()-Z"

* "fBodyAcc-std()-X"

* "fBodyAcc-std()-Y"

* "fBodyAcc-std()-Z"

* "fBodyAcc-meanFreq()-X"

* "fBodyAcc-meanFreq()-Y"

* "fBodyAcc-meanFreq()-Z"

* "fBodyAccJerk-mean()-X"

* "fBodyAccJerk-mean()-Y"

* "fBodyAccJerk-mean()-Z"

* "fBodyAccJerk-std()-X"

* "fBodyAccJerk-std()-Y"

* "fBodyAccJerk-std()-Z"

* "fBodyAccJerk-meanFreq()-X"

* "fBodyAccJerk-meanFreq()-Y"

* "fBodyAccJerk-meanFreq()-Z"

* "fBodyGyro-mean()-X"

* "fBodyGyro-mean()-Y"

* "fBodyGyro-mean()-Z"

* "fBodyGyro-std()-X"

* "fBodyGyro-std()-Y"

* "fBodyGyro-std()-Z"

* "fBodyGyro-meanFreq()-X"

* "fBodyGyro-meanFreq()-Y"

* "fBodyGyro-meanFreq()-Z"

* "fBodyAccMag-mean()"

* "fBodyAccMag-std()"

* "fBodyAccMag-meanFreq()"

* "fBodyBodyAccJerkMag-mean()"

* "fBodyBodyAccJerkMag-std()"

* "fBodyBodyAccJerkMag-meanFreq()"

* "fBodyBodyGyroMag-mean()"

* "fBodyBodyGyroMag-std()"

* "fBodyBodyGyroMag-meanFreq()"

* "fBodyBodyGyroJerkMag-mean()"

* "fBodyBodyGyroJerkMag-std()"

* "fBodyBodyGyroJerkMag-meanFreq()"

The original observations are collected from sensors ( accelerometer and gyroscope) attached to human subjects while observing their activities over a period of time, in terms of 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz
The collected signals are further processed in both time domain, and frequency domain, some averaged over observation time period, some are the standard derivation over the observation period.

For further understanding of the meaning of the original observations, please refer to ./UCI HAR Dataset/features_info.txt,
or at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#

## Mixed of Training and Testing Set

The original observations were splitted 70% for training, and 30% for testing.
In this dataset, the training and testing observations are combined.
