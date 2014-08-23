
# This script assumes that the original file (Dataset.zip) has been
# downloaded and unzipped in the working directory.
# The required files are:
# - YourWorkingDirectory/UCI HAR Dataset/features.txt
# - YourWorkingDirectory/UCI HAR Dataset/activity_labels.txt
# - YourWorkingDirectory/UCI HAR Dataset/test/subject_test.txt
# - YourWorkingDirectory/UCI HAR Dataset/test/X_test.txt
# - YourWorkingDirectory/UCI HAR Dataset/test/y_test.txt
# - YourWorkingDirectory/UCI HAR Dataset/train/subject_test.txt
# - YourWorkingDirectory/UCI HAR Dataset/train/X_test.txt
# - YourWorkingDirectory/UCI HAR Dataset/train/y_test.txt


# Package reshape or reshape2 will be required


# INSTRUCTIONS
# You should create one R script called run_analysis.R that does the following:
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation 
#    for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. Creates a second, independent tidy data set with the average of each 
#    variable for each activity and each subject. 



# Step 0: First read the files in

# Names of variables and activities
Features <- as.matrix(read.table("UCI HAR Dataset/features.txt",row.names=1))
ActivityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")

# Test data: subject IDs, values, and activity IDs
SubjectTest <- read.table("UCI HAR Dataset/test/subject_test.txt")
names(SubjectTest) <- "Subject"
XTest <- read.table("UCI HAR Dataset/test/X_test.txt")
names(XTest) <- Features
YTest <- read.table("UCI HAR Dataset/test/y_test.txt")
names(YTest) <- "Activity"

# Training data: subject IDs, values, and activity IDs
SubjectTrain <- read.table("UCI HAR Dataset/train/subject_train.txt")
names(SubjectTrain) <- "Subject"
XTrain <- read.table("UCI HAR Dataset/train/X_train.txt")
names(XTrain) <- Features
YTrain <- read.table("UCI HAR Dataset/train/y_train.txt")
names(YTrain) <- "Activity"



# Step 1: Merge test and training data together

Subject <- rbind(SubjectTest,SubjectTrain)
Activity <- rbind(YTest,YTrain)
Data <- rbind(XTest,XTrain)

DataFull <- cbind(Subject,Activity,Data)



# Step 2: Extract only the measurements on the mean and standard deviation

DataFullMeanStd <- DataFull[,grep("Subject|Activity|mean|std",names(DataFull))]



# Step 3: Use descriptive activity names
#         (from file ActivityLabels)

DataFullMeanStd[,2] <- gsub("1","Walking",DataFullMeanStd[,2])
DataFullMeanStd[,2] <- gsub("2","WalkingUpstairs",DataFullMeanStd[,2])
DataFullMeanStd[,2] <- gsub("3","WalkingDownstairs",DataFullMeanStd[,2])
DataFullMeanStd[,2] <- gsub("4","Sitting",DataFullMeanStd[,2])
DataFullMeanStd[,2] <- gsub("5","Standing",DataFullMeanStd[,2])
DataFullMeanStd[,2] <- gsub("6","Laying",DataFullMeanStd[,2])



# Step 4: Use descriptive variable names

names(DataFullMeanStd) <- gsub("\\(|\\)|-","",names(DataFullMeanStd))
names(DataFullMeanStd) <- gsub("BodyBody","Body",names(DataFullMeanStd))
names(DataFullMeanStd) <- gsub("mean","Mean",names(DataFullMeanStd))
names(DataFullMeanStd) <- gsub("std","StandardDeviation",names(DataFullMeanStd))
names(DataFullMeanStd) <- gsub("Freq","Frequency",names(DataFullMeanStd))
names(DataFullMeanStd) <- gsub("tBody","TimeBody",names(DataFullMeanStd))
names(DataFullMeanStd) <- gsub("tGravity","TimeGravity",names(DataFullMeanStd))
names(DataFullMeanStd) <- gsub("fBody","FFTBody",names(DataFullMeanStd))
names(DataFullMeanStd) <- gsub("Acc","Acceleration",names(DataFullMeanStd))
names(DataFullMeanStd) <- gsub("Gyro","Gyroscope",names(DataFullMeanStd))
names(DataFullMeanStd) <- gsub("Mag","Magnitude",names(DataFullMeanStd))



# Step 5: Create a second data set with the average of each variable
#         for each activity and each subject

DataMelt <- melt(DataFullMeanStd,id.vars=c("Subject","Activity"))
FinalDataset <- cast(DataMelt,Subject + Activity ~ variable, mean)



# Write the final data set into a txt file
# (uncomment the next line if necessary)
# write.table(FinalDataset,"FinalDataset.txt",row.name=F)

