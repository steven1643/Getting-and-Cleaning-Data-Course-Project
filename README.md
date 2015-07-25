# Getting-and-Cleaning-Data-Course-Project

There is one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set. The names were taken out of the provided text file “activity_labels”
1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING
4. Appropriately labels the data set with descriptive variable names. The variable names were grabbed from the provided text file “features”. The first six rows show below
1 tBodyAcc-mean()-X
2 tBodyAcc-mean()-Y
3 tBodyAcc-mean()-Z
4 tBodyAcc-std()-X
5 tBodyAcc-std()-Y
6 tBodyAcc-std()-Z
 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
