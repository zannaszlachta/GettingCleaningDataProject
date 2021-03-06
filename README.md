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

What the run_analysis.R script does:
 1. Step 0: Reads the files into R and assigns column names
 2. Step 1: Merges the training and the test sets to create one data set
 3. Step 2: Extracts only the measurements on the mean and standard deviation for each measurement. I inluded all variables that had 'mean' or 'std' in the name (in upper or lower case).
 4. Step 3: Uses descriptive activity names to name the activities in the data set. I used CamelCase to improve readability.
 5. Step 4: Appropriately labels the data set with descriptive variable names. I removed any special characters that might cause problems (e.g., commas, brackets, hyphens), and replaced abbreviations with full names to remove any ambiguity. I kept abbreviation FFT (Fast Fourier Transform) to avoid overly long names. I used CamelCase to improve readability.
 6. Step 5: Creates a second, independent tidy data set with the average of each variable for each activity and each subject. This second data set is tidy and wide. Each row has values for a unique combination of subject and activity.
 7. Optionally, writes the final data set into a text file



