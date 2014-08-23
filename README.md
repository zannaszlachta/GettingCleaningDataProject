GettingCleaningDataProject
==========================

Repo for course project for Getting and Cleaning Data

==========================

This repository contains the following files:

  1. README.md - this file, explaining what is what
  2. run_analysis.R - R script to create the tidy data set from Samsung data
  3. codebook.txt - codebook describing the variables in the tidy data set

==========================

The data used in this project is "Human Activity Recognition Using Smartphones Data Set"
from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data can be downloaded from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


==========================


This script assumes that the original file (Dataset.zip) has been
downloaded and unzipped in the working directory.
The required files are:
- YourWorkingDirectory/UCI HAR Dataset/features.txt
- YourWorkingDirectory/UCI HAR Dataset/activity_labels.txt
- YourWorkingDirectory/UCI HAR Dataset/test/subject_test.txt
- YourWorkingDirectory/UCI HAR Dataset/test/X_test.txt
- YourWorkingDirectory/UCI HAR Dataset/test/y_test.txt
- YourWorkingDirectory/UCI HAR Dataset/train/subject_test.txt
- YourWorkingDirectory/UCI HAR Dataset/train/X_test.txt
- YourWorkingDirectory/UCI HAR Dataset/train/y_test.txt


Package reshape or reshape2 will be required


==========================

ORIGINAL INSTRUCTIONS

You should create one R script called run_analysis.R that does the following:
 1. Merges the training and the test sets to create one data set.
 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
 3. Uses descriptive activity names to name the activities in the data set
 4. Appropriately labels the data set with descriptive variable names. 
 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 


