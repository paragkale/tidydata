#Information about the run_analysis.R script


##Project Instructions
You should create one R script called run_analysis.R that does the following. 

1. Merges the training and the test sets to create one data set.
1. Extracts only the measurements on the mean and standard deviation for each measurement. 
1. Uses descriptive activity names to name the activities in the data set
1. Appropriately labels the data set with descriptive variable names. 
1. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##My Impementation

My implementation is heavily influenced by David's Course Project FAQ
[https://class.coursera.org/getdata-011/forum/thread?thread_id=69](https://class.coursera.org/getdata-011/forum/thread?thread_id=69) 

1. Sanitize the data
	1. Remove punctuation characters from the variable names in the data files
	2. Select only those variable names (measurements) that have a 'mean' or 'std' in them
	3. Convert activity types for strings to levels(factors)
2. Put together the relevant data for training and test
	1. For training data, begin with the subject information(subject_train.txt)
	2. Add the activity(y_train.txt) column to the right of the above data
	3. Later add the relevant variables (x_train.txt) identified in 1.3 to the right of the table in step 2
	4. Repeat the steps for test data (subject_test.txt, y_test.txt, x_test.txt)
	5. Now create the overall data set by putting the test data underneath the train data
3. Now compute the means of each measurement (79 of them) for each subject and activity type
4. Save the file. To read the file back into R, use the following command

         dt <- read.table("tidydata.txt", header=TRUE)
         View(dt)


### Note ###
**There are specific code related comments in the run_analysis.R file**

The script runs correctly in R version 3.1.1, on a 64bit Windows 7 machine.