# Getting-and-Cleaning-Data-Course-Project

This repository includes and R script named run_analysis.R which performs the following tasks:

1. It loads the training and test data sets from the local drive to data frames in R (to download the data sets visit https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). Both sets include data on the subject's id (subject text file), the activity performed (y text file) and the measurements (X text file).

2. It merges the training and the test sets into one set the "data" data frame

3. It extracts only the measurements on the mean and standard deviation for each measurement by using the grep() function with the appropriate regular expression

4. It uses descriptive activity names in place of numbers to name the activities in the data set. The information necessary to perform this is available in the activity_labels.txt file. To perform this it makes use of the dplyr package 

5. Appropriately labels the data set with descriptive variable names available in the features.txt file. For more information on the naming convention please read the features_info.txt file

6. It creates a second, independent tidy data set named data_avg with the average of each variable for each activity and each subject. To perform this it makes use of the dplyr package
