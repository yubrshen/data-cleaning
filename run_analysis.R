## run_analysis.R
## procedure to tide up data per requirements below:

## 1 Merges the training and the test sets to create one data set.
## 2 Extracts only the measurements on the mean and standard deviation for each measurement.
## 3 Uses descriptive activity names to name the activities in the data set
## 4 Appropriately labels the data set with descriptive variable names.
## 5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## For more details, please see
## https://class.coursera.org/getdata-011/human_grading/view/courses/973498/assessments/3/submissions


library(dplyr)

## Get the zip file and extract the contents to current directory
## do it by hand for now
## url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
## destfile <- dataset.zip

## The following assumes the existence of ./UCI HAR Dataset/ and its contents
## costants setup
dataDir <- "./UCI HAR Dataset/"


## common data
features_column_map <- read.table(paste(dataDir, "features.txt", sep = ""), 
                                  col.names = c("colNumber", "feature"), stringsAsFactors=FALSE) # don't want the feature names to be factor
features_column_map_mean_std <- filter(features_column_map, grepl("mean|std", feature)) # find the columns of mean, and std

activity_labels <- read.table(paste(dataDir, "activity_labels.txt", sep = ""),
                              col.names = c("activity_code", "activity"), stringsAsFactors=FALSE)

## process the data in train and test directories

X_train  <- read.table(paste(dataDir, "train", "/", "X_", "train", ".txt", sep = ""), stringsAsFactors=FALSE
                      # , col.names = features_column_map$feature # Setting the column names here does not work, causing wrong column names
                       ) # Without sep = " ", this works
y_train <- read.table(paste(dataDir, "train", "/", "y_", "train", ".txt", sep = ""), stringsAsFactors=FALSE,
                      col.names = c("activity_code")) 
subject_train <- read.table(paste(dataDir, "train", "/", "subject_", "train", ".txt", sep = ""), stringsAsFactors=FALSE,
                            col.names = c("subject"))

colnames(X_train ) <- features_column_map$feature # rename the column names
X_train_extracted <- X_train[features_column_map_mean_std$feature] # extract those with mean and std
y_train_labeled <- merge(activity_labels, y_train, all = FALSE) %>% select(-activity_code) # translate activity code to activity name

cleaned_train <- cbind(subject_train, y_train_labeled, X_train_extracted)

X_test  <- read.table(paste(dataDir, "test", "/", "X_", "test", ".txt", sep = ""), stringsAsFactors=FALSE
                                        #, col.names = features_column_map$feature # Setting the column names here does not work, causing wrong column names
                      ) # Without sep = " ", this works
y_test <- read.table(paste(dataDir, "test", "/", "y_", "test", ".txt", sep = ""), stringsAsFactors=FALSE, col.names = c("activity_code")) 
subject_test <- read.table(paste(dataDir, "test", "/", "subject_", "test", ".txt", sep = ""), stringsAsFactors=FALSE, col.names = c("subject"))

colnames(X_test ) <- features_column_map$feature # rename the column names
X_test_extracted <- X_test[features_column_map_mean_std$feature] # extract those with mean and std
y_test_labeled <- merge(activity_labels, y_test, all = FALSE) %>% select(-activity_code) # translate activity code to activity name

cleaned_test <- cbind(subject_test, y_test_labeled, X_test_extracted)

## merge train and test data

sensor_observations <- rbind(cleaned_train, cleaned_test)

## the step 5 result:
## the average of each variable for each activity and each subject.

observations_mean_by_subject_and_activity <- sensor_observations %>% group_by(subject, activity) %>% summarise_each(funs(mean))

## output the step 5 result:
write.table(observations_mean_by_subject_and_activity, file = "./sensor_observation_mean_by_subject_and_activity.txt", row.names = FALSE)
