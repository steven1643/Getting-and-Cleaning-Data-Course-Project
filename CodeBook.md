CodeBook - Getting and Cleaning Data Course Project 

This file describes the variables, the data, and any transformations or work performed to clean up the data.

The site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


Step 1:

Reading in the data…
- Read in the text files X_train.txt, y_train.txt and subject_train.txt from the "./UCI HAR Dataset/train" folder and store them in data frames (dimensions shown in brackets) trainData([7352 561]), trainLabel([7352 1]) and trainSubject([7352 1]) variables respectively.
- Read in the text files X_test.txt, y_test.txt and subject_test.txt from the "./UCI HAR Dataset/test" folder and store them in data frames (dimensions shown in brackets) testData([2947 561]), testLabel([2947 1]) and testSubject([2947 1]) variables respectively.

Join the train and test data…
- Concatenate by row testData to trainData to create data frame joinData([10299 561])
- Concatenate by row testLabel to trainLabel to create data frame joinLabel([10299 1])
- Concatenate by row testSubject to trainSubject to generate data frame, joinSubject with dims [10299 1].

Do some memory/data clean-up by removing the six original text files read in.


Step 2:

Read the features.txt file from the "/UCI HAR Dataset" folder and store the data in a variable called features with dims [561 2]. 

Extract the column names with “std” or “mean” in them from the features data frame. I chose to not throw out the data that has a format similar to “meanFreq()”, as opposed to only keeping columns that have the stricter format of “mean()” or “std()”. This creates data frame meanStd with dim [79 2].

Reshape, thin out, the joinData data frame with only the meanStd columns, this makes joinData 79 variables wide now [10299 79].

Finally, using the “feature” data modify to the column names of joinData so we have a descriptive name for each column of the data set.  


Step 3:

Grab the activity names from the text file activity_labels. There are six different activities. 

Match the activity row numbers in joinLabel with the six different activities of the “activity” data set. Finally, name this column in joinLabel “activity”.


Step 4:

Add the subject and activity labels to the first two columns of the joinData data frame and make a new data frame cleanedData with dims [10299 81].

Step 5:

Using the dplyr package group the cleanedData by subject then activity and take the mean of each column. I chose to group the data by subject then activity (instead of activity first) because it was easier to quickly look at the data and see the different means each subject had in the different activities.

Write the result out to "data_with_means.txt" file in current working directory.