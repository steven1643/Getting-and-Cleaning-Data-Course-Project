#### 1. Merges the training and the test sets to create one data set.
# setwd("C:/Users/steven.aurousseau/Box Sync/Programming/Coursera - Data Science/3.0 Getting and Cleaning Data/Project")
library(dplyr)
library(reshape2)

trainData <- read.table("./UCI HAR Dataset/train/X_train.txt") # [7352 561]
trainLabel <- read.table("./UCI HAR Dataset/train/y_train.txt") # [7352 1]
trainSubject <- read.table("./UCI HAR Dataset/train/subject_train.txt") # [7352 1]
testData <- read.table("./UCI HAR Dataset/test/X_test.txt") # [2947 561]
testLabel <- read.table("./UCI HAR Dataset/test/y_test.txt") # [2947 1]
testSubject <- read.table("./UCI HAR Dataset/test/subject_test.txt") # [2947 1]

joinData <- rbind(trainData, testData) # [10299 561]
joinLabel <- rbind(trainLabel, testLabel) # [10299 1]
joinSubject <- rbind(trainSubject, testSubject) # [10299 1]

rm(trainData, trainLabel, trainSubject, testData, testLabel, testSubject) # clean-up

#### 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
features <- read.table("./UCI HAR Dataset/features.txt") # read in measurement names [561, 2]
meanStd <- filter(features, grepl("mean|std", V2)) # grab rows with "mean" or "std" [79 2]
joinData <- joinData[, meanStd$V1] # reshape on mean and std rows [10299 79]
names(joinData) <- features[meanStd$V1, 2] # add feature names to colnames of dataset

#### 3. Uses descriptive activity names to name the activities in the data set
activity <- read.table("./UCI HAR Dataset/activity_labels.txt") # [6, 2]
joinLabel[, 1] <- activity[joinLabel[, 1], 2] # assign labels based on activity number
names(joinLabel) <- "activity"

#### 4. Appropriately labels the data set with descriptive activity names. 
names(joinSubject) <- "subject"
cleanedData <- cbind(joinSubject, joinLabel, joinData)
# write.table(cleanedData, "merged_data.txt")
# View(cleanedData)

#### 5. From the data set in step 4, creates a second, independent tidy data set
####    with the average of each variable for each activity and each subject.
cleanedData.means <- cleanedData %>% 
        group_by(subject, activity) %>% 
        summarise_each(funs(mean))
# View(cleanedData.means)
write.table(cleanedData.means, "data_with_means.txt", row.name=FALSE)
